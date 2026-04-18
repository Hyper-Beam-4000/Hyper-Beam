#!/usr/bin/env python3
"""
Backfill Lean 4 code for problems already in DynamoDB that have no lean_code.

Usage:
    python backend/scripts/backfill_lean.py              # all competitions
    python backend/scripts/backfill_lean.py --source "AMC 12A"
    python backend/scripts/backfill_lean.py --dry-run    # print counts only
    python backend/scripts/backfill_lean.py --limit 10   # process at most N problems
"""

import argparse
import os
import sys
import time

# Add project root so backend.* and scraper imports resolve
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))

from dotenv import load_dotenv
load_dotenv(os.path.join(os.path.dirname(__file__), "../.env"))

from backend.services import dynamo_repository as ddb
from scraper.scrape_problem import translate_to_lean


def backfill(source_filter: str | None, dry_run: bool, limit: int | None, delay: float):
    print("[backfill] fetching all problems from DynamoDB...")
    problems = ddb.list_all_problems()
    print(f"[backfill] total problems in table: {len(problems)}")

    # Filter to problems missing lean_code, 2024–2025 only
    missing = [
        p for p in problems
        if not p.get("lean_code")
        and p.get("problem_text")
        and p.get("year") in (2024, 2025)
    ]

    if source_filter:
        missing = [p for p in missing if p.get("source") == source_filter]

    print(f"[backfill] problems missing lean_code (2024–2025): {len(missing)}")
    if source_filter:
        print(f"[backfill] filtered to source='{source_filter}': {len(missing)}")

    if limit:
        missing = missing[:limit]
        print(f"[backfill] limiting to {limit} problems")

    if dry_run:
        print("[backfill] dry-run — no changes will be written")
        for p in missing[:20]:
            print(f"  {p.get('id')}  source={p.get('source')}  title={p.get('title')}")
        return

    success = 0
    failed = 0
    for i, problem in enumerate(missing):
        pid = problem["id"]
        title = problem.get("title", "")
        source = problem.get("source", "")
        problem_text = problem.get("problem_text", "")
        solution_text = problem.get("solution_text", "")

        print(f"[{i+1}/{len(missing)}] {title} ({source})")

        lean_code = translate_to_lean(problem_text, solution_text, title)

        if lean_code:
            # Update DynamoDB record — only the lean_code field
            table = ddb._get_table(ddb.DDB_TABLE_PROBLEM())
            table.update_item(
                Key={"id": pid},
                UpdateExpression="SET lean_code = :lc",
                ExpressionAttributeValues={":lc": lean_code},
            )
            print(f"  -> saved ({len(lean_code)} chars)")
            success += 1
        else:
            print(f"  -> translation failed, skipping")
            failed += 1

        if delay > 0 and i < len(missing) - 1:
            time.sleep(delay)

    print(f"\n[backfill] done: {success} updated, {failed} failed")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Backfill Lean code for existing DynamoDB problems")
    parser.add_argument("--source", help="Filter by source name (e.g. 'AMC 12A', 'AIME I', 'USAMO')")
    parser.add_argument("--dry-run", action="store_true", help="Print what would be updated without writing")
    parser.add_argument("--limit", type=int, help="Process at most N problems")
    parser.add_argument("--delay", type=float, default=1.0, help="Seconds between OpenAI calls (default: 1.0)")
    args = parser.parse_args()

    backfill(
        source_filter=args.source,
        dry_run=args.dry_run,
        limit=args.limit,
        delay=args.delay,
    )
