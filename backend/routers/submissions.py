"""Submissions API — trigger evaluation on a submission."""

from fastapi import APIRouter, HTTPException, BackgroundTasks

from backend.db import get_client
from backend.services.evaluation import evaluate_submission

router = APIRouter(tags=["submissions"])


@router.post("/submissions/{submission_id}/evaluate")
async def trigger_evaluation(submission_id: str, background_tasks: BackgroundTasks):
    """
    Trigger evaluation for a submission.
    Sets status to 'queued' and runs evaluation in background.
    """
    db = get_client()

    sub = db.table("submissions").select("*").eq("id", submission_id).execute()
    if not sub.data:
        raise HTTPException(status_code=404, detail="Submission not found")

    submission = sub.data[0]

    if submission.get("evaluation_status") == "running":
        raise HTTPException(status_code=409, detail="Evaluation already running")

    if not submission.get("contest_id"):
        raise HTTPException(status_code=400, detail="Submission has no contest_id assigned")

    # Set status to queued
    db.table("submissions").update(
        {"evaluation_status": "queued"}
    ).eq("id", submission_id).execute()

    # Run evaluation in background
    background_tasks.add_task(evaluate_submission, submission_id, submission["contest_id"])

    return {"status": "queued", "submission_id": submission_id}
