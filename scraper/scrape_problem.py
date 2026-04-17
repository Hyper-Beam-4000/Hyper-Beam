#!/usr/bin/env python3
"""
Competition Math Scraper (Split Files)
Scrapes AoPS Wiki pages and outputs clean JSON, separate LaTeX files (Problem/Solution), and Lean.
"""

import argparse
import os
import re
import time
import json
import hashlib
import sys
from urllib.parse import urlparse
import urllib.robotparser as robotparser
from typing import Optional, Dict, Any, List

from datetime import datetime, timezone

import requests
from bs4 import BeautifulSoup
from tqdm import tqdm

# Ensure project root on sys.path so we can import backend.* when run from scraper/
PROJECT_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
if PROJECT_ROOT not in sys.path:
    sys.path.insert(0, PROJECT_ROOT)

try:
    from backend.services.dynamo_repository import save_problem_record
except Exception:
    save_problem_record = None

try:
    from dotenv import load_dotenv
    load_dotenv(os.path.join(os.path.dirname(__file__), '.env'))
except ImportError:
    pass

# ----------------------------
# CONFIG
# ----------------------------
USER_AGENT = "compmath-scraper/1.1 (+https://example.org)"
DEFAULT_DELAY = 1.0
SESSION = requests.Session()
SESSION.headers.update({"User-Agent": USER_AGENT})
PERSIST_TO_DDB = os.getenv("SCRAPER_PERSIST_TO_DDB", "false").lower() == "true"

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
    slug = re.sub(r"[^\w]+", "_", path)
    if not slug:
        slug = "root"
    return f"{slug}_{h}"


def parse_competition_meta(url: str) -> Dict[str, Any]:
    """Extract competition name, problem number, and difficulty tier from an AoPS URL.

    Examples
    --------
    2017_USAMO_Problems/Problem_1    → competition="USAMO",   problem_number=1
    2017_AMC_12A_Problems/Problem_5  → competition="AMC 12A", problem_number=5
    2025_AIME_II_Problems/Problem_15 → competition="AIME II", problem_number=15
    """
    from urllib.parse import parse_qs
    qs = parse_qs(urlparse(url).query)
    title_param = qs.get("title", [""])[0]           # e.g. "2017_USAMO_Problems/Problem_1"

    # ── year ────────────────────────────────────────────────────────────────
    # title_param looks like "2017_USAMO_Problems/Problem_1"; use lookahead/lookbehind
    # to match exactly 4 digits (not part of a longer number).
    year_m = re.search(r'(?<!\d)(\d{4})(?!\d)', title_param)
    year = int(year_m.group(1)) if year_m else None

    # ── competition ──────────────────────────────────────────────────────────
    competition = "Unknown"
    if re.search(r'USAMO', title_param, re.IGNORECASE):
        competition = "USAMO"
    elif re.search(r'AMC_12A|AMC 12A', title_param, re.IGNORECASE):
        competition = "AMC 12A"
    elif re.search(r'AMC_12B|AMC 12B', title_param, re.IGNORECASE):
        competition = "AMC 12B"
    elif re.search(r'AIME_II|AIME II', title_param, re.IGNORECASE):
        competition = "AIME II"
    elif re.search(r'AIME_I|AIME I', title_param, re.IGNORECASE):
        competition = "AIME I"

    # ── problem number ───────────────────────────────────────────────────────
    prob_m = re.search(r'Problem_(\d+)', title_param, re.IGNORECASE)
    problem_number = int(prob_m.group(1)) if prob_m else None

    # ── difficulty tier (based on training-data era) ─────────────────────────
    if year is None:
        difficulty_tier = "unknown"
    elif year <= 2017:
        difficulty_tier = "pre_gpt"
    elif year == 2018:
        difficulty_tier = "early_gpt"
    elif year <= 2023:
        difficulty_tier = "training_data"
    else:
        difficulty_tier = "post_cutoff"

    tags = []
    if competition != "Unknown":
        tags.append(competition)
    if year:
        tags.append(str(year))
    if difficulty_tier != "unknown":
        tags.append(difficulty_tier)

    return {
        "competition": competition,
        "problem_number": problem_number,
        "difficulty_tier": difficulty_tier,
        "tags": tags,
    }

# ----------------------------
# LaTeX extraction
# ----------------------------
def extract_latex_from_html(html: str) -> str:
    soup = BeautifulSoup(html, "html.parser")

    # 0. Pre-process explicit line breaks
    for br in soup.find_all("br"):
        br.replace_with("\n\n") # Double newline for paragraph break in LaTeX
    for p in soup.find_all("p"):
        p.append("\n\n")

    # 1. AoPS Wiki specific: Math is in <img> tags
    for img in soup.find_all("img", class_=re.compile(r"latex(center)?")):
        latex = img.get("alt")
        if latex:
            img.replace_with(latex)

    # 2. Generic MathJax: <script type="math/tex">
    for s in soup.find_all("script", {"type": re.compile(r"math/tex")}):
        latex = s.get_text(strip=True)
        if latex:
            s.replace_with(f"${latex}$")

    # 3. Clean up HTML to get text
    text = soup.get_text(separator=" ", strip=True)

    # 4. Post-process to fix excess whitespace
    text = re.sub(r'[ \t]+', ' ', text)
    text = re.sub(r'\s*\n\s*', '\n', text)
    text = re.sub(r'\n{3,}', '\n\n', text)
    
    return text.strip()

# ----------------------------
# Text Cleaning
# ----------------------------
def clean_junk(text: str) -> str:
    if not text:
        return ""
    
    stop_phrases = [
        r"These problems are copyrighted",
        r"See also\s+20\d\d",
        r"See also\s+AMC",
        r"Mathematical Association of America",
        r"Supported by"
    ]
    
    for pat in stop_phrases:
        match = re.search(pat, text, re.IGNORECASE)
        if match:
            text = text[:match.start()]
    
    return text.strip()

# ----------------------------
# LLM Translation
# ----------------------------
def strip_markdown_fences(code: str) -> str:
    """Remove markdown code fences from LLM output if present."""
    code = code.strip()
    if code.startswith("```"):
        lines = code.split("\n")
        # Remove first line if it's ```lean or ```
        if lines[0].startswith("```"):
            lines = lines[1:]
        # Remove last line if it's ```
        if lines and lines[-1].strip() == "```":
            lines = lines[:-1]
        code = "\n".join(lines)
    return code.strip()

def translate_to_lean(problem: str, solution: str, title: str) -> Optional[str]:
    """Translate LaTeX problem/solution to Lean 4 using OpenAI."""
    prompt = f"""You are an expert in formal mathematics and the Lean 4 theorem prover with deep knowledge of Mathlib.

TASK: Translate this competition math problem into valid, compilable Lean 4 code.

PROBLEM INFORMATION:
Title: {title}
Problem Statement: {problem}
Solution Sketch: {solution}

REQUIREMENTS:
1. Output ONLY raw Lean 4 code - NO markdown code fences, NO backticks, NO explanatory text
2. Start directly with "import" statements
3. Use ONLY Lean 4 syntax (not Lean 3)
4. Use "by" for proofs, NOT "begin...end"
5. Import only from Mathlib (e.g., import Mathlib.Data.Nat.Basic)
6. Write a well-formed theorem statement with proper types
7. Use standard Mathlib tactics: intro, apply, rw, simp, ring, norm_num, constructor, exact, have, obtain
8. Add comments explaining the proof strategy
9. Use "sorry" for steps that are too complex, but structure the proof outline
10. Ensure all syntax is valid - no hallucinated tactics or types

EXAMPLE FORMAT:
import Mathlib.Data.Nat.Prime
import Mathlib.Tactic

open Nat

-- Problem: Prove that for all n, n + 0 = n
theorem example_theorem (n : ℕ) : n + 0 = n := by
  -- Use reflexivity since this is definitional
  rfl

YOUR LEAN 4 CODE (start directly with imports):"""

    try:
        from backend.services.openai_client import openai_chat
        lean_code = openai_chat(prompt, model="gpt-4o", max_tokens=4096, temperature=0.3)
        return strip_markdown_fences(lean_code)
    except Exception as e:
        print(f"[LLM Error] OpenAI call failed: {e}")
        return None

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

    for elem in content.find_all():
        if elem.name and elem.name.startswith("h") and elem.name != "h1":
            header = elem.get_text(strip=True).lower()
            current = header
            sections[current] = []
        elif elem.name in ["p", "ul", "ol", "div", "table", "dl"]:
             sections.setdefault(current, []).append(str(elem))

    def sec_text(keys: List[str]) -> str:
        for key in sections:
            if any(k in key for k in keys):
                html_block = "".join(sections[key])
                raw_text = extract_latex_from_html(html_block)
                return clean_junk(raw_text)
        return ""

    def get_solution() -> str:
        """Return Solution 1 for pages with numbered solutions (AMC/AIME),
        or the lone solution/proof section for USAMO-style pages."""
        # Pass 1: explicit "solution 1" or bare "solution" (exact)
        for key in sections:
            if re.search(r'\bsolution\s+1\b', key) or key.strip() in ("solution", "proof"):
                html_block = "".join(sections[key])
                raw_text = extract_latex_from_html(html_block)
                return clean_junk(raw_text)
        # Pass 2: any solution/proof section that isn't numbered > 1
        for key in sections:
            if "solution" in key or "proof" in key:
                num = re.search(r'solution\s+(\d+)', key)
                if num and int(num.group(1)) > 1:
                    continue
                html_block = "".join(sections[key])
                raw_text = extract_latex_from_html(html_block)
                return clean_junk(raw_text)
        return ""

    problem = sec_text(["problem", "statement", "question"])
    solution = get_solution()
    answer = sec_text(["answer"])

    if not problem and sections["intro"]:
        problem = clean_junk(extract_latex_from_html("".join(sections["intro"])))

    # Extract year from title
    year_match = re.search(r'\b(19|20)\d{2}\b', title)
    year = int(year_match.group(0)) if year_match else None

    comp_meta = parse_competition_meta(url)

    return {
        "source": "AoPS Wiki",
        "url": url,
        "title": title,
        "problem": problem,
        "solution": solution,
        "answer": answer,
        "year": year,
        "competition": comp_meta["competition"],
        "problem_number": comp_meta["problem_number"],
        "difficulty_tier": comp_meta["difficulty_tier"],
        "tags": comp_meta["tags"],
        "scraped_at": datetime.now(timezone.utc).isoformat(),
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
  sorry
"""

PROBLEM_TEX_TEMPLATE = r"""\documentclass[12pt]{article}
\usepackage{amsmath,amssymb}

\begin{document}
\section*{{{title}}}
Source: {source}

\subsection*{Problem}
{problem}

\end{document}
"""

SOLUTION_TEX_TEMPLATE = r"""\documentclass[12pt]{article}
\usepackage{amsmath,amssymb}

\begin{document}
\section*{{{title}}}
Source: {source}

\subsection*{Solution}
{solution}

\end{document}
"""

# ----------------------------
# File writing
# ----------------------------
def save_problem(metadata: Dict[str, Any], outdir: str, lean_code: Optional[str] = None) -> Dict[str, str]:
    pid = make_id_from_url(metadata["url"])
    problem_dir = os.path.join(outdir, pid)
    ensure_dir(problem_dir)
    base = os.path.join(problem_dir, pid)

    json_path = base + ".json"
    lean_path = base + ".lean"
    prob_tex_path = base + "_problem.tex"
    sol_tex_path = base + "_solution.tex"

    # JSON
    with open(json_path, "w", encoding="utf-8") as f:
        json.dump(metadata, f, indent=2, ensure_ascii=False)

    # Problem TeX
    prob_tex = PROBLEM_TEX_TEMPLATE.replace("{title}", metadata["title"]) \
                                   .replace("{source}", metadata["source"]) \
                                   .replace("{problem}", metadata.get("problem", ""))
    with open(prob_tex_path, "w", encoding="utf-8") as f:
        f.write(prob_tex)

    # Solution TeX
    sol_content = metadata.get("solution") or metadata.get("answer") or "No solution found."
    sol_tex = SOLUTION_TEX_TEMPLATE.replace("{title}", metadata["title"]) \
                                   .replace("{source}", metadata["source"]) \
                                   .replace("{solution}", sol_content)
    with open(sol_tex_path, "w", encoding="utf-8") as f:
        f.write(sol_tex)

    # Lean - use LLM code if provided, otherwise template
    if lean_code:
        with open(lean_path, "w", encoding="utf-8") as f:
            f.write(lean_code)
    else:
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

    return {
        "json": json_path,
        "problem_tex": prob_tex_path,
        "solution_tex": sol_tex_path,
        "lean": lean_path
    }

# ----------------------------
# Scraper wrapper
# ----------------------------
def scrape_url(url: str, delay: float, outdir: str, use_lean: bool = False) -> Optional[Dict[str, Any]]:
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
        print(f"[stats] Problem len: {len(data.get('problem', ''))}, Solution len: {len(data.get('solution', ''))}")
        
        lean_code = None
        if use_lean:
            print("[LLM] Translating to Lean...")
            lean_code = translate_to_lean(data.get("problem", ""), data.get("solution", ""), data.get("title", ""))

        if lean_code:
            data["lean_code"] = lean_code

        paths = save_problem(data, outdir, lean_code)
        print(f"[saved] {paths['problem_tex']}")
        print(f"[saved] {paths['solution_tex']}")

        # Optional: persist to DynamoDB
        if PERSIST_TO_DDB and save_problem_record:
            try:
                pid = make_id_from_url(data["url"])
                save_problem_record(pid, data, lean_code)
                print(f"[dynamo] stored PROBLEM#{pid}")
            except Exception as db_exc:
                print(f"[dynamo] failed to store problem: {db_exc}")

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
    parser.add_argument("urls_file", nargs="?", help="Text file with one URL per line")
    parser.add_argument("--url", type=str, help="Single page to scrape")
    parser.add_argument("--list", type=str, help="File containing URLs (same as positional)")
    parser.add_argument("--out", type=str, default="scraped_problems")
    parser.add_argument("--delay", type=float, default=DEFAULT_DELAY)
    parser.add_argument("--lean", action="store_true", help="Use OpenAI to translate to Lean 4 (requires OPENAI_API_KEY in backend/.env)")

    args = parser.parse_args()

    urls = []
    list_path = args.list or args.urls_file

    if args.url:
        urls.append(args.url.strip())
    if list_path:
        with open(list_path, "r", encoding="utf-8") as f:
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
            r = scrape_url(url, args.delay, args.out, args.lean)
            if r:
                results.append(r)
        except Exception as e:
            print(f"[ERROR] {url}: {e}")

    print(f"Done. Scraped {len(results)} pages.")

if __name__ == "__main__":
    main()
