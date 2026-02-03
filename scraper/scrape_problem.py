#!/usr/bin/env python3
"""
Competition Math Scraper (Fixed for AoPS Images)
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
# CONFIG
# ----------------------------
USER_AGENT = "compmath-scraper/1.0 (+https://example.org)"
DEFAULT_DELAY = 1.0
SESSION = requests.Session()
SESSION.headers.update({"User-Agent": USER_AGENT})

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
    path = urlparse(url).path.strip("/")
    # Clean up the path to make it filesystem friendly
    slug = re.sub(r"[^\w]+", "_", path)
    if not slug:
        slug = "root"
    return f"{slug}_{h}"

# ----------------------------
# LaTeX extraction (THE FIX)
# ----------------------------
def extract_latex_from_html(html: str) -> str:
    soup = BeautifulSoup(html, "html.parser")

    # 1. AoPS Wiki specific: Math is in <img> tags with class "latex" or "latexcenter"
    # Example: <img alt="$f(n)$" class="latex" ... />
    for img in soup.find_all("img", class_=re.compile(r"latex(center)?")):
        latex = img.get("alt")
        if latex:
            # Replace the <img> tag with the LaTeX text string
            img.replace_with(latex)

    # 2. Generic MathJax: <script type="math/tex">
    for s in soup.find_all("script", {"type": re.compile(r"math/tex")}):
        latex = s.get_text(strip=True)
        if latex:
            # If the script tag content isn't wrapped in $, wrapping usually helps readability
            # though some parsers might prefer raw. We'll wrap for consistency.
            s.replace_with(f"${latex}$")

    # 3. Clean up generic HTML to get the full text
    # separator=" " prevents words from gluing together when tags are removed
    text = soup.get_text(separator="\n", strip=True)
    
    return text

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

    # Simple heuristic to split content by headers
    for elem in content.find_all():
        if elem.name and elem.name.startswith("h") and elem.name != "h1": # Skip h1 if it's main title
             # h2, h3, etc. are section headers
            header = elem.get_text(strip=True).lower()
            current = header
            sections[current] = []
        elif elem.name in ["p", "ul", "ol", "div", "table", "dl"]:
             # Add content to current section
             # We use str(elem) because we need the HTML tags for the extractor
             sections.setdefault(current, []).append(str(elem))

    def sec_text(keys: List[str]) -> str:
        for key in sections:
            if any(k in key for k in keys):
                html_block = "".join(sections[key])
                return extract_latex_from_html(html_block)
        return ""

    problem = sec_text(["problem", "statement", "question"])
    solution = sec_text(["solution", "proof"])
    answer = sec_text(["answer"])

    # Fallback: if 'intro' has content but no 'problem' header found
    if not problem and sections["intro"]:
        problem = extract_latex_from_html("".join(sections["intro"]))

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
    title = h1.get_text(strip=True) if h1 else "Untitled"
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
\section*{{{title}}}
Source: {source}

\subsection*{Problem}
{problem}

\subsection*{Solution / Answer}
{solution}

\end{document}
"""

# ----------------------------
# File writing
# ----------------------------
def save_problem(metadata: Dict[str, Any], outdir: str) -> Dict[str, str]:
    pid = make_id_from_url(metadata["url"])
    problem_dir = os.path.join(outdir, pid)
    ensure_dir(problem_dir)
    base = os.path.join(problem_dir, pid)

    json_path = base + ".json"
    tex_path = base + ".tex"
    lean_path = base + ".lean"

    # JSON
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(metadata, f, indent=2, ensure_ascii=False)

    # TEX
    # Basic escaping for LaTeX special chars in the *content* would be needed for a perfect compiler,
    # but raw string injection is fine for a scraper skeleton.
    tex = TEX_TEMPLATE.replace("{title}", metadata["title"]) \
                      .replace("{source}", metadata["source"]) \
                      .replace("{problem}", metadata.get("problem", "")) \
                      .replace("{solution}", metadata.get("solution") or metadata.get("answer", ""))
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
        
        print(f"[parsed] title='{data.get('title')}'")
        print(f"[stats] Problem length: {len(data.get('problem', ''))} chars")
        print(f"[stats] Solution length: {len(data.get('solution', ''))} chars")
        
        paths = save_problem(data, outdir)
        print(f"[saved] {paths['json']}")
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
        print("No URLs provided. Use --url or --list.")
        return

    results = []
    for url in tqdm(urls, desc="Scraping"):
        try:
            r = scrape_url(url, args.delay, args.out)
            if r:
                results.append(r)
        except Exception as e:
            print(f"[ERROR] {url}: {e}")

    print(f"Done. Scraped {len(results)} pages.")

if __name__ == "__main__":
    main()