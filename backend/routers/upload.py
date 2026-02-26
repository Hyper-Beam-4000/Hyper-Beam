"""Upload API — upload local evaluation results JSON."""

import json
from fastapi import APIRouter, HTTPException, UploadFile, File, Form

from backend.services.upload_service import process_uploaded_results

router = APIRouter(tags=["upload"])


@router.post("/upload-results")
async def upload_results(
    submission_id: str = Form(...),
    file: UploadFile = File(...),
):
    """
    Upload local evaluation results.
    Expects a JSON file: [{"problem_id": "...", "model_response": "..."}, ...]
    """
    if not file.filename or not file.filename.endswith(".json"):
        raise HTTPException(status_code=400, detail="File must be a .json file")

    try:
        content = await file.read()
        data = json.loads(content)
    except (json.JSONDecodeError, UnicodeDecodeError):
        raise HTTPException(status_code=400, detail="Invalid JSON file")

    if not isinstance(data, list):
        raise HTTPException(status_code=400, detail="JSON must be an array of results")

    try:
        result = process_uploaded_results(submission_id, data)
        return result
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
