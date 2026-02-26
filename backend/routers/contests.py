"""Contests API — list and detail views."""

from typing import Optional
from fastapi import APIRouter, HTTPException, Query

router = APIRouter(tags=["contests"])

try:
    from backend.services import dynamo_repository as ddb
except Exception:
    ddb = None


def _demo_contest():
    if not ddb:
        return None
    problems, _ = ddb.list_problems(limit=1000)
    return {
        "id": "demo-contest",
        "name": "Hyper Beam Demo Contest",
        "description": "All scraped USAMO problems (2019-2023).",
        "start_date": "2026-02-24",
        "end_date": "2026-03-03",
        "is_active": True,
        "problems": [
            {
                "id": p.get("problem_id"),
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
    """List contests; if Supabase missing, return a demo contest covering all problems."""
    demo = _demo_contest()
    if demo:
        if active is None or active:
            return {"contests": [demo]}
        return {"contests": []}

    from backend.db import get_client
    db = get_client()
    query = db.table("contests").select("*")

    if active is not None:
        query = query.eq("is_active", active)

    query = query.order("created_at", desc=True)
    result = query.execute()
    return {"contests": result.data}


@router.get("/contests/{contest_id}")
async def get_contest(contest_id: str):
    """Get contest detail including its problem list."""
    demo = _demo_contest()
    if demo and contest_id == "demo-contest":
        return demo

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
