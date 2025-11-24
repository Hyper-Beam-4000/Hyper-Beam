#!/usr/bin/env python3
"""
Competition Math Scraper
Scrapes AoPS Wiki pages and outputs:
 - JSON metadata
 - LaTeX .tex file
 - Lean .lean skeleton
"""

import argparse
import os
import re
import time
import json
import hashlib
from urllib.parse import urlparse
import urllib.robotparser as robotparser
from typing import Optional, Dict, Any, List

import requests
from bs4 import BeautifulSoup
from tqdm import tqdm

# ----------------------------
# CONFIG (constants only)
# ----------------------------
USER_AGENT = "compmath-scraper/1.0 (+https://example.org)"
DEFAULT_DELAY = 1.0  # seconds between requests
SESSION = requests.Session()
SESSION.headers.update({"User-Agent": USER_AGENT})

LATEX_PATTERNS = [
    re.compile(r"\$(.+?)\$", re.DOTALL),
    re.compile(r"\$\$(.+?)\$\$", re.DOTALL),
    re.compile(r"\\\((.+?)\\\)", re.DOTALL),
    re.compile(r"\\\[(.+?)\\\]", re.DOTALL),
]


# ----------------------------
# Politeness
# ----------------------------
def allowed_by_robots(url: str) -> bool:
    parsed = urlparse(url)
    robots_url = f"{parsed.scheme}://{parsed.netloc}/robots.txt"

    rp = robotparser.RobotFileParser()
    try:
        rp.set_url(robots_url)
        rp.read()
        return rp.can_fetch(USER_AGENT, url)
    except:
        return True


# ----------------------------
# Utilities
# ----------------------------
def safe_request(url: str, delay: float) -> Optional[requests.Response]:
    if not allowed_by_robots(url):
        print(f"[robots.txt] Not allowed: {url}")
        return None

    try:
        resp = SESSION.get(url, timeout=20)
        time.sleep(delay)
        if resp.status_code == 200:
            return resp
        print(f"[HTTP {resp.status_code}] {url}")
        return None
    except Exception as e:
        print(f"[ERROR] requesting {url}: {e}")
        return None


def ensure_dir(path: str):
    os.makedirs(path, exist_ok=True)


def make_id_from_url(url: str) -> str:
    h = hashlib.sha1(url.encode("utf-8")).hexdigest()[:10]
    slug = re.sub(r"[^\w]+", "_", urlparse(url).path.strip("/"))
    if not slug:
        slug = "root"
    return f"{slug}_{h}"


# ----------------------------
# LaTeX extraction
# ----------------------------
def extract_latex_from_html(html: str) -> str:
    soup = BeautifulSoup(html, "html.parser")
    latex_parts = []

    # MathJax script tags
    for s in soup.find_all("script", {"type": re.compile(r"math/tex")}):
        txt = s.get_text(strip=True)
        if txt:
            latex_parts.append(txt)

    # mw-tex & tex2jax spans
    for span in soup.find_all(["span", "div"], {"class": re.compile(r".*(tex|mw-tex|tex2jax).*", re.I)}):
        txt = span.get_text(" ", strip=True)
        if txt:
            latex_parts.append(txt)

    # look for inline LaTeX patterns in RAW HTML (before text extraction)
    for pat in LATEX_PATTERNS:
        for m in pat.finditer(html):
            inside = m.group(1).strip()
            if len(inside) > 3:
                latex_parts.append(inside)

    if latex_parts:
        return "\n\n".join(dict.fromkeys(latex_parts))

    # fallback: plain text
    text = soup.get_text("\n")
    lines = [ln.strip() for ln in text.splitlines() if ln.strip()]
    return "\n\n".join(lines[:400])


# ----------------------------
# AoPS Wiki parser
# ----------------------------
def parse_aops_wiki_problem(url: str, html: str) -> Dict[str, Any]:
    soup = BeautifulSoup(html, "html.parser")
    title_tag = soup.find(id="firstHeading") or soup.find("h1")
    title = title_tag.get_text(strip=True) if title_tag else url

    content = soup.find(id="mw-content-text") or soup

    sections = {}
    current = "intro"
    sections[current] = []

    # gather content blocks under headings
    for elem in content.find_all():
        if elem.name and elem.name.startswith("h"):
            header = elem.get_text(strip=True).lower()
            current = header
            sections[current] = []
        elif elem.name in ["p", "ul", "ol", "div", "table"]:
            sections.setdefault(current, []).append(str(elem))

    def sec_text(keys: List[str]) -> str:
        for key in sections:
            if any(k in key for k in keys):
                html_block = "\n\n".join(sections[key])
                return extract_latex_from_html(html_block)
        return ""

    problem = sec_text(["problem", "statement", "question"])
    solution = sec_text(["solution", "proof"])
    answer = sec_text(["answer"])

    if not problem:
        first_p = content.find("p")
        if first_p:
            problem = extract_latex_from_html(str(first_p))

    return {
        "source": "AoPS Wiki",
        "url": url,
        "title": title,
        "problem": problem.strip(),
        "solution": solution.strip(),
        "answer": answer.strip(),
    }


# ----------------------------
# Generic fallback parser
# ----------------------------
def parse_generic(url: str, html: str) -> Dict[str, Any]:
    soup = BeautifulSoup(html, "html.parser")
    h1 = soup.find("h1")
    title_tag = soup.find("title")
    title = (h1.get_text(strip=True) if h1 else None) or (title_tag.get_text(strip=True) if title_tag else "Untitled")
    text = extract_latex_from_html(str(soup))
    return {
        "source": "generic",
        "url": url,
        "title": title,
        "problem": text,
        "solution": "",
        "answer": "",
    }


# ----------------------------
# Output templates
# ----------------------------
LEAN_TEMPLATE = """-- {title}
-- Source: {source}
-- URL: {url}

-- Problem (LaTeX):
/-
{problem}
-/

-- Solution/Answer (LaTeX):
/-
{solution}
-/

import Mathlib.Tactic

theorem {lean_name} : Prop := by
  -- TODO: translate LaTeX statement into Lean and complete proof
  sorry
"""

TEX_TEMPLATE = r"""\documentclass[12pt]{article}
\usepackage{amsmath,amssymb}

\begin{document}
\section*{TITLE_PLACEHOLDER}
Source: SOURCE_PLACEHOLDER

\subsection*{Problem}
PROBLEM_PLACEHOLDER

\subsection*{Solution / Answer}
SOLUTION_PLACEHOLDER

\end{document}
"""


# ----------------------------
# File writing
# ----------------------------
def save_problem(metadata: Dict[str, Any], outdir: str) -> Dict[str, str]:
    ensure_dir(outdir)
    pid = make_id_from_url(metadata["url"])
    base = os.path.join(outdir, pid)

    json_path = base + ".json"
    tex_path = base + ".tex"
    lean_path = base + ".lean"

    # JSON
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(metadata, f, indent=2, ensure_ascii=False)

    # TEX
    tex = TEX_TEMPLATE.replace("TITLE_PLACEHOLDER", metadata["title"]) \
                      .replace("SOURCE_PLACEHOLDER", metadata["source"]) \
                      .replace("PROBLEM_PLACEHOLDER", metadata.get("problem", "")) \
                      .replace("SOLUTION_PLACEHOLDER", metadata.get("solution") or metadata.get("answer", ""))
    with open(tex_path, "w", encoding="utf-8") as f:
        f.write(tex)

    # LEAN
    lean = LEAN_TEMPLATE.format(
        title=metadata["title"],
        source=metadata["source"],
        url=metadata["url"],
        problem=metadata.get("problem", ""),
        solution=metadata.get("solution") or metadata.get("answer", ""),
        lean_name=re.sub(r"[^\w]+", "_", pid)
    )
    with open(lean_path, "w", encoding="utf-8") as f:
        f.write(lean)

    return {"json": json_path, "tex": tex_path, "lean": lean_path}


# ----------------------------
# Scraper wrapper
# ----------------------------
def scrape_url(url: str, delay: float, outdir: str) -> Optional[Dict[str, Any]]:
    print(f"[scraping] {url}")
    resp = safe_request(url, delay)
    if not resp:
        return None

    html = resp.text
    domain = urlparse(url).netloc.lower()

    try:
        if "artofproblemsolving.com" in domain:
            data = parse_aops_wiki_problem(url, html)
        else:
            data = parse_generic(url, html)
        
        print(f"[parsed] title={data.get('title')}, problem_len={len(data.get('problem', ''))}")
        
        paths = save_problem(data, outdir)
        data["saved_files"] = paths

        print(f"[saved] {paths}")
        return data
    except Exception as e:
        print(f"[ERROR during processing] {e}")
        import traceback
        traceback.print_exc()
        raise


# ----------------------------
# Main
# ----------------------------
def main():
    parser = argparse.ArgumentParser(description="Competition Math Scraper")
    parser.add_argument("--url", type=str, help="Single page to scrape")
    parser.add_argument("--list", type=str, help="File containing URLs")
    parser.add_argument("--out", type=str, default="scraped_problems")
    parser.add_argument("--delay", type=float, default=DEFAULT_DELAY)

    args = parser.parse_args()

    urls = []
    if args.url:
        urls.append(args.url.strip())
    if args.list:
        with open(args.list, "r", encoding="utf-8") as f:
            for line in f:
                line = line.strip()
                if line and not line.startswith("#"):
                    urls.append(line)

    if not urls:
        print("No URLs provided.")
        return

    results = []
    for url in tqdm(urls, desc="Scraping"):
        try:
            r = scrape_url(url, args.delay, args.out)
            if r:
                results.append(r)
        except Exception as e:
            print(f"[ERROR] {url}: {e} {type(e)}")

    print(f"Done. Scraped {len(results)} pages.")


if __name__ == "__main__":
    main()