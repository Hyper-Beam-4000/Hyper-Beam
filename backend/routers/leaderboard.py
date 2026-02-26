"""Leaderboard API — aggregated rankings per contest."""

from datetime import datetime, timezone
from fastapi import APIRouter, HTTPException

router = APIRouter(tags=["leaderboard"])


@router.get("/leaderboard/{contest_id}")
async def get_leaderboard(contest_id: str):
    """
    Get leaderboard for a contest.
    During active contest: rank + team + model name only (scores hidden).
    After contest ends: full metric breakdown.
    """
    try:
        from backend.db import get_client
        db = get_client()
    except Exception:
        # Supabase not configured; return empty leaderboard
        return {"contest_id": contest_id, "contest_name": "", "contest_ended": True, "entries": []}

    contest = db.table("contests").select("*").eq("id", contest_id).execute()
    if not contest.data:
        raise HTTPException(status_code=404, detail="Contest not found")

    contest_data = contest.data[0]
    end_date = contest_data.get("end_date")
    contest_ended = False
    if end_date:
        contest_ended = datetime.fromisoformat(end_date.replace("Z", "+00:00")) < datetime.now(timezone.utc)

    # Fetch active submissions for this contest with profiles
    subs = (
        db.table("submissions")
        .select("id, model_name, user_id, overall_score, evaluation_status, "
                "answer_correctness, rubric_score, reasoning_alignment, "
                "embedding_similarity, proof_technique_match, concept_coverage, "
                "created_at, is_active")
        .eq("contest_id", contest_id)
        .eq("is_active", True)
        .order("overall_score", desc=True)
        .execute()
    )

    entries = []
    for rank, sub in enumerate(subs.data or [], start=1):
        # Fetch team name
        profile = (
            db.table("profiles")
            .select("team_name, email")
            .eq("id", sub["user_id"])
            .execute()
        )
        team = (profile.data[0]["team_name"] if profile.data else None) or "Anonymous"

        entry = {
            "rank": rank,
            "team": team,
            "model_name": sub["model_name"],
            "evaluation_status": sub["evaluation_status"],
            "submitted_at": sub["created_at"],
        }

        if contest_ended:
            entry.update({
                "overall_score": sub["overall_score"],
                "answer_correctness": sub["answer_correctness"],
                "rubric_score": sub["rubric_score"],
                "reasoning_alignment": sub["reasoning_alignment"],
                "embedding_similarity": sub["embedding_similarity"],
                "proof_technique_match": sub["proof_technique_match"],
                "concept_coverage": sub["concept_coverage"],
            })

        entries.append(entry)

    return {
        "contest_id": contest_id,
        "contest_name": contest_data["name"],
        "contest_ended": contest_ended,
        "entries": entries,
    }
