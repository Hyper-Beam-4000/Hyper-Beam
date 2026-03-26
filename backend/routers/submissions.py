"""Submissions API — create, list, and trigger evaluation."""

import uuid
from typing import Optional
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel

try:
    from backend.services import dynamo_repository as ddb
except Exception:
    ddb = None

try:
    from backend.services import queue_client as sqs
except Exception:
    sqs = None

router = APIRouter(tags=["submissions"])

CONTEST_ID = "demo-contest"


class SubmissionCreate(BaseModel):
    model_name: str
    api_endpoint: str
    training_cutoff_date: Optional[str] = None
    description: Optional[str] = None


@router.post("/submissions")
async def create_submission(body: SubmissionCreate):
    """Create a new submission record."""
    if not ddb:
        raise HTTPException(status_code=503, detail="DynamoDB not available")

    submission_id = str(uuid.uuid4())
    ddb.create_submission(
        submission_id=submission_id,
        model_name=body.model_name,
        api_endpoint=body.api_endpoint,
        contest_id=CONTEST_ID,
        training_cutoff_date=body.training_cutoff_date,
        description=body.description,
    )
    return {"submission_id": submission_id, "status": "pending"}


@router.get("/submissions")
async def list_submissions():
    """List all submissions."""
    if not ddb:
        return {"submissions": []}
    items = ddb.list_all_submissions()
    return {"submissions": items}


@router.post("/submissions/{submission_id}/evaluate")
async def trigger_evaluation(submission_id: str):
    """Trigger (or restart) evaluation for a submission via SQS."""
    if not ddb:
        raise HTTPException(status_code=503, detail="DynamoDB not available")
    if not sqs:
        raise HTTPException(status_code=503, detail="SQS not available")

    submission = ddb.get_submission(submission_id)
    if not submission:
        raise HTTPException(status_code=404, detail="Submission not found")

    status = submission.get("evaluation_status")
    if status in ("running", "queued"):
        raise HTTPException(status_code=409, detail="Evaluation already in progress")

    contest_id = submission.get("contest_id", CONTEST_ID)
    ddb.update_submission_status(submission_id, "queued")

    sqs.enqueue_score_job({
        "type": "evaluate",
        "submission_id": submission_id,
        "contest_id": contest_id,
    })
    return {"status": "queued", "submission_id": submission_id}


@router.get("/submissions/{submission_id}/progress")
async def get_progress(submission_id: str):
    """Return how many problems have been scored so far for a submission."""
    if not ddb:
        return {"scored": 0, "total": 0, "pct": 0}

    from datetime import date

    scored = len(ddb.list_evaluations(submission_id))

    submission = ddb.get_submission(submission_id)
    training_cutoff = submission.get("training_cutoff_date") if submission else None

    problems, _ = ddb.list_problems(limit=500)
    if training_cutoff:
        try:
            cutoff_date = date.fromisoformat(training_cutoff)
            problems = [
                p for p in problems
                if not p.get("year")
                or date(int(p["year"]), 1, 1) > cutoff_date
            ]
        except ValueError:
            pass  # malformed cutoff — fall back to all problems

    total = sum(1 for p in problems if p.get("problem_text"))
    pct = round(scored / total * 100) if total else 0
    return {"scored": scored, "total": total, "pct": pct}


@router.post("/submissions/{submission_id}/cancel")
async def cancel_evaluation(submission_id: str):
    """Cancel a running or queued evaluation."""
    if not ddb:
        raise HTTPException(status_code=503, detail="DynamoDB not available")

    submission = ddb.get_submission(submission_id)
    if not submission:
        raise HTTPException(status_code=404, detail="Submission not found")

    ddb.update_submission_status(submission_id, "cancelled")
    return {"status": "cancelled", "submission_id": submission_id}


@router.delete("/submissions/{submission_id}")
async def delete_submission(submission_id: str):
    """Delete a submission record."""
    if not ddb:
        raise HTTPException(status_code=503, detail="DynamoDB not available")

    submission = ddb.get_submission(submission_id)
    if not submission:
        raise HTTPException(status_code=404, detail="Submission not found")

    ddb.delete_submission(submission_id)
    return {"status": "deleted", "submission_id": submission_id}
