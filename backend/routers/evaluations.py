"""Evaluations API — per-problem score breakdowns (Dynamo-first)."""

from fastapi import APIRouter, HTTPException

from backend.db import get_client

try:
    from backend.services import dynamo_repository as ddb
except Exception:
    ddb = None

router = APIRouter(tags=["evaluations"])


@router.get("/evaluations/{submission_id}")
async def get_evaluations(submission_id: str):
    """Get per-problem evaluation results for a submission."""
    if ddb:
        results = ddb.list_evaluations(submission_id)
        if not results:
            sub = ddb.get_submission(submission_id) if hasattr(ddb, "get_submission") else None
            if not sub:
                raise HTTPException(status_code=404, detail="Submission not found")
        # Normalize response
        normalized = []
        for idx, r in enumerate(results):
            normalized.append({
                "id": f"{submission_id}-{idx}",
                "submission_id": submission_id,
                "problem_id": r.get("problem_id"),
                "model_response": r.get("model_response"),
                "overall_score": r.get("overall_score"),
                "metric_values": r.get("metric_values"),
                "errors": r.get("errors"),
                "evaluated_at": r.get("evaluated_at"),
            })
        return {"submission_id": submission_id, "results": normalized}

    # Fallback: Supabase
    db = get_client()

    sub = db.table("submissions").select("id").eq("id", submission_id).execute()
    if not sub.data:
        raise HTTPException(status_code=404, detail="Submission not found")

    results = (
        db.table("evaluation_results")
        .select("*, problems(title, competition, problem_number, difficulty)")
        .eq("submission_id", submission_id)
        .order("evaluated_at", desc=True)
        .execute()
    )

    return {"submission_id": submission_id, "results": results.data}
