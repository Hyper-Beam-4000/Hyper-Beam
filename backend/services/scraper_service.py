"""Scraper-to-DB service — wraps existing scraper and stores results in Supabase."""

import os
import re
import sys

# Ensure project root is on path
_project_root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
if _project_root not in sys.path:
    sys.path.insert(0, _project_root)

from scraper.scrape_problem import scrape_url, make_id_from_url
from scraper.scrape_competition import get_problem_links
from backend.db import get_client

# Competitions to scrape daily (configurable)
DAILY_SCRAPE_URLS: list[str] = []

# Difficulty classification by competition name patterns
DIFFICULTY_MAP = {
    r"AMC\s*(8|10)": "AMC",
    r"AMC\s*12": "AMC",
    r"AIME": "AIME",
    r"USAMO": "USAMO",
    r"USA\s*TST": "USAMO",
    r"IMO": "IMO",
    r"Putnam": "Putnam",
    r"USAJMO": "AIME",
    r"MATHCOUNTS": "AMC",
}


def _classify_difficulty(title: str) -> str | None:
    """Classify difficulty based on competition name in title."""
    for pattern, difficulty in DIFFICULTY_MAP.items():
        if re.search(pattern, title, re.IGNORECASE):
            return difficulty
    return None


def _extract_year(title: str) -> str | None:
    """Extract 4-digit year from title."""
    match = re.search(r"\b(19|20)\d{2}\b", title)
    return match.group(0) if match else None


def _extract_competition(title: str) -> str | None:
    """Extract competition name (e.g. '2019 USAMO') from title."""
    # Try "YYYY CompetitionName" pattern
    match = re.match(r"^(\d{4}\s+[\w\s]+?)(?:\s*Problems?|\s*/|\s*$)", title)
    if match:
        return match.group(1).strip()
    return title.split("/")[0].strip() if "/" in title else title


def _extract_problem_number(title: str) -> int | None:
    """Extract problem number from title."""
    match = re.search(r"Problem\s*(\d+)", title, re.IGNORECASE)
    return int(match.group(1)) if match else None


def scrape_and_store_problem(url: str, use_lean: bool = False) -> dict:
    """
    Scrape a single problem URL and store in the problems table.
    Returns the inserted/updated problem row.
    """
    import tempfile

    db = get_client()
    external_id = make_id_from_url(url)

    # Check if already exists
    existing = db.table("problems").select("id").eq("external_id", external_id).execute()
    if existing.data:
        return existing.data[0]

    # Scrape to a temp directory
    with tempfile.TemporaryDirectory() as tmpdir:
        data = scrape_url(url, delay=1.0, outdir=tmpdir, use_lean=use_lean)

    if not data:
        raise ValueError(f"Failed to scrape {url}")

    title = data.get("title", "")
    year = _extract_year(title)
    published_date = f"{year}-01-01" if year else None

    # Read lean file if it was generated
    lean_code = None
    if use_lean and data.get("lean_code"):
        lean_code = data["lean_code"]

    row = {
        "external_id": external_id,
        "source": data.get("source", "AoPS Wiki"),
        "source_url": url,
        "title": title,
        "competition": _extract_competition(title),
        "problem_number": _extract_problem_number(title),
        "problem_latex": data.get("problem", ""),
        "solution_latex": data.get("solution", ""),
        "answer": data.get("answer", ""),
        "lean_code": lean_code,
        "difficulty": _classify_difficulty(title),
        "published_date": published_date,
    }

    result = db.table("problems").upsert(
        row, on_conflict="external_id"
    ).execute()

    return result.data[0] if result.data else row


def scrape_and_store_competition(competition_url: str, use_lean: bool = False) -> list[dict]:
    """Scrape all problems from a competition index page and store them."""
    links = get_problem_links(competition_url, delay=1.0)
    results = []

    for link in links:
        try:
            result = scrape_and_store_problem(link, use_lean=use_lean)
            results.append(result)
        except Exception as e:
            print(f"[scraper_service] Error scraping {link}: {e}")

    return results


def scheduled_scrape():
    """Called daily by APScheduler — iterates configured competition URLs."""
    for url in DAILY_SCRAPE_URLS:
        try:
            scrape_and_store_competition(url)
        except Exception as e:
            print(f"[scheduled_scrape] Error with {url}: {e}")
