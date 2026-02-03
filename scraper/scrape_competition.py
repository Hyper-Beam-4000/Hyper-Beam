#!/usr/bin/env python3
"""
Competition Page Scraper
Scrapes a main competition page (e.g., "2019 USAMO Problems") 
to find links to dedicated problem pages (e.g. ".../Problem_1"), 
then feeds them to the logic in scrape_problem.py.
"""

import argparse
import re
from urllib.parse import urljoin, urlparse
from bs4 import BeautifulSoup
from tqdm import tqdm

# UPDATED IMPORT: Now imports from your renamed file 'scrape_problem.py'
import scrape_problem 

def get_problem_links(comp_url: str, delay: float) -> list[str]:
    """
    Fetches a competition page and extracts links to dedicated problem subpages.
    Ignores anchor links (e.g. #Problem_1) that point to the current page.
    """
    print(f"[indexing] Fetching competition page: {comp_url}")
    
    # Use the safe_request from scrape_problem.py
    resp = scrape_problem.safe_request(comp_url, delay)
    if not resp:
        print("[error] Could not fetch competition page.")
        return []

    soup = BeautifulSoup(resp.text, "html.parser")
    
    problem_links = set()
    
    # Get the path of the current competition page (e.g. /wiki/index.php/2019_USAMO)
    comp_path = urlparse(comp_url).path

    for a_tag in soup.find_all("a", href=True):
        href = a_tag["href"]
        
        # 1. CLEANUP: skip empty, javascript, or pure anchor links
        if not href or href.startswith("javascript:") or href.startswith("#"):
            continue

        # 2. RESOLVE: Make absolute URL
        full_url = urljoin(comp_url, href)
        parsed_url = urlparse(full_url)

        # 3. FILTER:
        # a) Must not have a query string or fragment (anchors) that confuse the scraper
        if "#" in href: 
            continue

        # b) STRICT PATTERN MATCHING:
        # We are looking for URLs that end in "/Problem_X"
        if re.search(r"/Problem_\d+$", parsed_url.path):
            
            # c) Ensure it is not the competition page itself
            if parsed_url.path != comp_path:
                problem_links.add(full_url)

    # Sort based on the integer value of the problem number
    def get_prob_num(u):
        try:
            return int(u.split("Problem_")[-1])
        except:
            return 9999

    sorted_links = sorted(list(problem_links), key=get_prob_num)

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
        print("No dedicated problem sub-pages found.")
        print("Check if this competition page lists problems inline (anchors) or has subpages.")
        return

    print(f"Found {len(links)} dedicated problem pages. Starting scrape...")
    print("-" * 40)

    # 2. Iterate and use scrape_problem.py logic
    successful = 0
    for link in tqdm(links, desc="Processing Problems"):
        try:
            # Re-use the scrape_problem logic directly
            result = scrape_problem.scrape_url(link, args.delay, args.out)
            if result:
                successful += 1
        except Exception as e:
            print(f"[ERROR] Failed on {link}: {e}")

    print("-" * 40)
    print(f"Completed. Successfully scraped {successful}/{len(links)} problems.")

if __name__ == "__main__":
    main()