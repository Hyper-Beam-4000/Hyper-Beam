"""Problems API — browse and retrieve problems (Dynamo-first, Supabase fallback)."""

from typing import Optional
from fastapi import APIRouter, HTTPException, Query

from backend.db import get_client

try:
    from backend.services import dynamo_repository as ddb
except Exception:
    ddb = None

def _strip_trailing_solution(text: Optional[str]) -> Optional[str]:
    if not text:
        return text
    trimmed = text.rstrip()
    for token in ("Solution", "solution"):
        if trimmed.endswith(token):
            trimmed = trimmed[: -len(token)].rstrip()  # remove trailing whitespace only
            break
    return trimmed

router = APIRouter(tags=["problems"])


@router.get("/problems")
async def list_problems(
    limit: int = Query(200, ge=1, le=500),
    last_key: Optional[str] = Query(None, description="Opaque pagination key"),
    competition: Optional[str] = Query(None, description="Filter by competition (e.g. USAMO)"),
    year: Optional[int] = Query(None, description="Filter by year"),
):
    """List problems. Dynamo scan (paginated); Supabase fallback with offset if Dynamo absent."""
    if ddb:
        lek = None
        if last_key:
            import json
            lek = json.loads(last_key)
        items, next_key = ddb.list_problems(limit=limit, last_evaluated_key=lek)

        # Filter in-memory (small dataset)
        if competition and competition.upper() != "ALL":
            items = [i for i in items if competition.upper() in (i.get("title") or "").upper()]
        if year:
            items = [i for i in items if i.get("year") == year]

        problems = [
            {
                "id": item.get("id"),
                "title": item.get("title"),
                "source": item.get("source"),
                "url": item.get("url"),
                "year": item.get("year"),
                "problem_text": _strip_trailing_solution(item.get("problem_text")),
                "solution_text": item.get("solution_text"),
                "problem_latex": _strip_trailing_solution(item.get("problem_text")),
                "solution_latex": item.get("solution_text"),
                "lean_code": item.get("lean_code"),
                "scraped_at": item.get("scraped_at"),
                "published_at": item.get("published_at"),
                "tags": item.get("tags", []),
                "content_hash": item.get("content_hash"),
            }
            for item in items
        ]
        return {"problems": problems, "next_key": next_key}

    # Fallback: Supabase
    db = get_client()
    query = db.table("problems").select("*").order("created_at", desc=True).range(0, limit - 1)
    result = query.execute()
    return {"problems": result.data, "count": len(result.data)}


@router.get("/problems/{problem_id}")
async def get_problem(problem_id: str):
    """Get a single problem by ID."""
    if ddb:
        item = ddb.get_problem(problem_id)
        if not item:
            raise HTTPException(status_code=404, detail="Problem not found")
        return {
            "id": item.get("id"),
            "title": item.get("title"),
            "source": item.get("source"),
            "url": item.get("url"),
            "problem_text": _strip_trailing_solution(item.get("problem_text")),
            "solution_text": item.get("solution_text"),
            "problem_latex": _strip_trailing_solution(item.get("problem_text")),
            "solution_latex": item.get("solution_text"),
            "lean_code": item.get("lean_code"),
            "scraped_at": item.get("scraped_at"),
            "published_at": item.get("published_at"),
            "tags": item.get("tags", []),
            "content_hash": item.get("content_hash"),
        }

    db = get_client()
    result = db.table("problems").select("*").eq("id", problem_id).execute()
    if not result.data:
        raise HTTPException(status_code=404, detail="Problem not found")
    return result.data[0]
