#!/usr/bin/env python3
"""
One-time migration script: imports existing scraped problems from the
scraper/scraped_problems/ and scraper/scraped_problems_lean/ directories
into the Supabase `problems` table.

Usage:
    python -m backend.scripts.migrate_existing_problems
"""

import json
import os
import re
import sys
import glob

# Ensure project root is on path
project_root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
if project_root not in sys.path:
    sys.path.insert(0, project_root)

from backend.db import get_client


DIFFICULTY_MAP = {
    r"AMC\s*(8|10)": "AMC",
    r"AMC\s*12": "AMC",
    r"AIME": "AIME",
    r"USAMO": "USAMO",
    r"IMO": "IMO",
    r"Putnam": "Putnam",
}


def classify_difficulty(title: str) -> str | None:
    for pattern, difficulty in DIFFICULTY_MAP.items():
        if re.search(pattern, title, re.IGNORECASE):
            return difficulty
    return None


def extract_year(title: str) -> str | None:
    match = re.search(r"\b(19|20)\d{2}\b", title)
    return match.group(0) if match else None


def extract_problem_number(title: str) -> int | None:
    match = re.search(r"Problem\s*(\d+)", title, re.IGNORECASE)
    return int(match.group(1)) if match else None


def main():
    db = get_client()

    scraped_dirs = [
        os.path.join(project_root, "scraper", "scraped_problems"),
        os.path.join(project_root, "scraper", "scraped_problems_lean"),
    ]

    count = 0
    for scraped_dir in scraped_dirs:
        if not os.path.isdir(scraped_dir):
            print(f"Skipping {scraped_dir} (not found)")
            continue

        json_files = glob.glob(os.path.join(scraped_dir, "**", "*.json"), recursive=True)

        for json_path in json_files:
            with open(json_path, "r") as f:
                data = json.load(f)

            # Look for matching .lean file
            lean_path = json_path.replace(".json", ".lean")
            lean_code = None
            if os.path.exists(lean_path):
                with open(lean_path, "r") as f:
                    lean_code = f.read()

            url = data.get("url", "")
            title = data.get("title", "")
            year = extract_year(title)

            # Generate external_id from URL
            from scraper.scrape_problem import make_id_from_url
            external_id = make_id_from_url(url) if url else os.path.basename(os.path.dirname(json_path))

            row = {
                "external_id": external_id,
                "source": data.get("source", "AoPS Wiki"),
                "source_url": url,
                "title": title,
                "competition": title.split("/")[0].strip() if "/" in title else title,
                "problem_number": extract_problem_number(title),
                "problem_latex": data.get("problem", ""),
                "solution_latex": data.get("solution", ""),
                "answer": data.get("answer", ""),
                "lean_code": lean_code,
                "difficulty": classify_difficulty(title),
                "published_date": f"{year}-01-01" if year else None,
            }

            result = db.table("problems").upsert(
                row, on_conflict="external_id"
            ).execute()
            count += 1
            print(f"  Imported: {title or external_id}")

    print(f"\nDone. Imported {count} problems.")


if __name__ == "__main__":
    main()
