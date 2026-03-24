"""Contests API — list and detail views."""

from typing import Optional
from fastapi import APIRouter, HTTPException, Query

router = APIRouter(tags=["contests"])

try:
    from backend.services import dynamo_repository as ddb
except Exception:
    ddb = None


DEMO_CONTEST_META = {
    "id": "demo-contest",
    "name": "Hyper Beam — USAMO Benchmark",
    "description": "54 USAMO problems (2017–2025) evaluated across 9 multi-dimensional metrics.",
    "start_date": "2026-02-24",
    "end_date": "2026-04-18T23:59:00-12:00",
    "is_active": True,
}


def _demo_contest_full():
    """Full contest with problem list — only used for the detail endpoint."""
    if not ddb:
        return None
    problems, _ = ddb.list_problems(limit=1000)
    return {
        **DEMO_CONTEST_META,
        "problems": [
            {
                "id": p.get("id"),
                "title": p.get("title"),
                "competition": p.get("source"),
                "problem_number": None,
                "difficulty": None,
                "problem_text": p.get("problem_text"),
                "solution_text": p.get("solution_text"),
            }
            for p in problems
        ],
    }


@router.get("/contests")
async def list_contests(active: Optional[bool] = Query(None)):
    """List contests — returns lightweight metadata only (no problem scan)."""
    # Always return the demo contest metadata without hitting DynamoDB
    if active is None or active:
        return {"contests": [DEMO_CONTEST_META]}
    return {"contests": []}


@router.get("/contests/{contest_id}")
async def get_contest(contest_id: str):
    """Get contest detail including its problem list."""
    if contest_id == "demo-contest":
        full = _demo_contest_full()
        return full if full else DEMO_CONTEST_META

    from backend.db import get_client
    db = get_client()

    contest = db.table("contests").select("*").eq("id", contest_id).execute()
    if not contest.data:
        raise HTTPException(status_code=404, detail="Contest not found")

    cp = (
        db.table("contest_problems")
        .select("problem_id, problems(*)")
        .eq("contest_id", contest_id)
        .execute()
    )

    problems = [row["problems"] for row in (cp.data or []) if row.get("problems")]

    return {**contest.data[0], "problems": problems}
