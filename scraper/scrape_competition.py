#!/usr/bin/env python3
"""
Competition Page Scraper
Scrapes a main competition page (e.g., "2019 USAMO Problems") 
to find all individual problem links, then feeds them to the 
logic in scraper.py.
"""

import argparse
import time
import re
from urllib.parse import urljoin
import requests
from bs4 import BeautifulSoup
from tqdm import tqdm

# Import functionality from your existing script
# This assumes your original file is named 'scraper.py' and is in the same folder.
import scrape_problem 

def get_problem_links(comp_url: str, delay: float) -> list[str]:
    """
    Fetches a competition page and extracts links that look like problem pages.
    Target format: .../Problem_1, .../Problem_2, etc.
    """
    print(f"[indexing] Fetching competition page: {comp_url}")
    
    # Use the safe_request from scraper.py to respect robots.txt
    resp = scrape_problem.safe_request(comp_url, delay)
    if not resp:
        print("[error] Could not fetch competition page.")
        return []

    soup = BeautifulSoup(resp.text, "html.parser")
    
    # Set to avoid duplicates
    problem_links = set()
    
    # Logic: Find all links that end in /Problem_X
    # This is specific to the AoPS Wiki naming convention
    for a_tag in soup.find_all("a", href=True):
        href = a_tag["href"]
        
        # Regex to match standard AoPS problem URLs (e.g., "Problem_1", "Problem_14")
        # We verify it ends with digit to avoid "Problem_Distribution" or similar meta pages
        if re.search(r"Problem_\d+$", href):
            full_url = urljoin(comp_url, href)
            problem_links.add(full_url)

    # Sort them so they process in order (Problem 1, 2, 3...)
    # We sort based on the integer value of the problem number
    try:
        sorted_links = sorted(list(problem_links), key=lambda x: int(x.split("_")[-1]))
    except:
        # Fallback if naming is weird
        sorted_links = sorted(list(problem_links))

    return sorted_links

def main():
    parser = argparse.ArgumentParser(description="Scrape an entire AoPS competition.")
    parser.add_argument("--url", type=str, required=True, help="URL of the competition main page")
    parser.add_argument("--out", type=str, default="scraped_problems", help="Output directory")
    parser.add_argument("--delay", type=float, default=1.0, help="Delay between requests")
    
    args = parser.parse_args()

    # 1. Get all links
    links = get_problem_links(args.url, args.delay)
    
    if not links:
        print("No problem links found. Check the URL or the site structure.")
        return

    print(f"Found {len(links)} problems. Starting scrape...")
    print("-" * 40)

    # 2. Iterate and use scraper.py logic
    successful = 0
    for link in tqdm(links, desc="Processing Problems"):
        try:
            # Re-use the scraper logic directly
            result = scrape_problem.scrape_url(link, args.delay, args.out)
            if result:
                successful += 1
        except Exception as e:
            print(f"[ERROR] Failed on {link}: {e}")

    print("-" * 40)
    print(f"Completed. Successfully scraped {successful}/{len(links)} problems.")

if __name__ == "__main__":
    main()