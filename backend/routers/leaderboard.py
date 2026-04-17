"""Leaderboard API — aggregated rankings from DynamoDB submissions."""

from fastapi import APIRouter

router = APIRouter(tags=["leaderboard"])

try:
    from backend.services import dynamo_repository as ddb
except Exception:
    ddb = None


@router.get("/leaderboard/{contest_id}")
async def get_leaderboard(contest_id: str):
    """
    Get leaderboard for a contest from DynamoDB.
    Returns all completed submissions ranked by overall_score.
    """
    if not ddb:
        return {"contest_id": contest_id, "contest_name": "Hyper Beam", "contest_ended": True, "entries": []}

    submissions = ddb.list_all_submissions(limit=500)

    completed = [
        s for s in submissions
        if s.get("evaluation_status") == "completed" and s.get("overall_score") is not None
    ]
    completed.sort(key=lambda s: float(s.get("overall_score") or 0), reverse=True)

    entries = []
    for rank, sub in enumerate(completed, start=1):
        pm = sub.get("per_metric_means") or {}
        entries.append({
            "rank": rank,
            "team": sub.get("model_name", "Unknown"),
            "model_name": sub.get("model_name", "Unknown"),
            "evaluation_status": sub.get("evaluation_status"),
            "submitted_at": sub.get("created_at", ""),
            "overall_score": float(sub.get("overall_score") or 0),
            "answer_correctness": pm.get("answer_correctness"),
            "rubric_score": pm.get("rubric_score"),
            "reasoning_alignment": pm.get("reasoning_alignment"),
            "embedding_similarity": pm.get("embedding_similarity"),
            "proof_technique_match": pm.get("proof_technique_match"),
            "concept_coverage": pm.get("concept_coverage"),
            "semantic_structure": pm.get("semantic_structure"),
            "lean_compiles": pm.get("lean_compiles"),
            "lean_comparison": pm.get("lean_comparison"),
        })

    return {
        "contest_id": contest_id,
        "contest_name": "Hyper Beam — Math Benchmark",
        "contest_ended": True,
        "entries": entries,
    }
