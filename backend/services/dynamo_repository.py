"""DynamoDB data-access helpers — matches actual table schemas in AWS.

Actual table schemas (as created in the AWS console):
  hyperbeam-problem    pk=id (S, HASH only)
  hyperbeam-score      pk=id (S, HASH), sk=submission_id (S, RANGE)
  hyperbeam-submission pk=id (S, HASH only)
  hyperbeam-user       pk=email (S, HASH only)
  hyperbeam-main       pk=pk (S, HASH), sk=sk (S, RANGE)  — legacy
"""

import hashlib
import os
from decimal import Decimal
from datetime import datetime, timezone
from typing import Any, Dict, Optional, List, Tuple

import boto3
from boto3.dynamodb.conditions import Attr, Key

# Table name defaults — can be overridden via env vars.
# Read at call time (not import time) so load_dotenv() in scraper scripts works correctly.
def _env(key: str, default: str) -> str:
    return os.environ.get(key, default)

DDB_TABLE_PROBLEM   = lambda: _env("DDB_TABLE_PROBLEM",   "hyperbeam-problem")
DDB_TABLE_SCORE     = lambda: _env("DDB_TABLE_SCORE",      "hyperbeam-score")
DDB_TABLE_SUBMISSION= lambda: _env("DDB_TABLE_SUBMISSION", "hyperbeam-submission")
DDB_TABLE_USER      = lambda: _env("DDB_TABLE_USER",       "hyperbeam-user")
DDB_TABLE           = lambda: _env("DDB_TABLE",            "hyperbeam-main")

_tables: Dict[str, Any] = {}


def _get_table(table_name: str):
    if table_name in _tables:
        return _tables[table_name]
    region   = _env("AWS_REGION", "us-east-1")
    profile  = _env("AWS_PROFILE", "")
    key_id   = _env("AWS_ACCESS_KEY_ID", "")
    secret   = _env("AWS_SECRET_ACCESS_KEY", "")
    if profile:
        session = boto3.Session(profile_name=profile, region_name=region)
        dynamo = session.resource("dynamodb")
    else:
        kwargs: Dict[str, Any] = {"region_name": region}
        if key_id and secret:
            kwargs["aws_access_key_id"] = key_id
            kwargs["aws_secret_access_key"] = secret
        dynamo = boto3.resource("dynamodb", **kwargs)
    _tables[table_name] = dynamo.Table(table_name)
    return _tables[table_name]


def _sha1(text: str) -> str:
    return hashlib.sha1(text.encode("utf-8")).hexdigest()


def _to_decimal(obj: Any) -> Any:
    """Recursively convert floats to Decimal for DynamoDB compatibility."""
    if isinstance(obj, float):
        return Decimal(str(obj))
    if isinstance(obj, dict):
        return {k: _to_decimal(v) for k, v in obj.items()}
    if isinstance(obj, list):
        return [_to_decimal(v) for v in obj]
    return obj


# ---------------------------------------------------------------------------
# hyperbeam-problem  (pk=id)
# ---------------------------------------------------------------------------

def save_problem_record(
    problem_id: str,
    metadata: Dict[str, Any],
    lean_code: Optional[str],
) -> None:
    """Persist a scraped problem to hyperbeam-problem."""
    table = _get_table(DDB_TABLE_PROBLEM())
    now = datetime.now(timezone.utc).isoformat()
    problem_text = metadata.get("problem", "") or ""
    solution_text = metadata.get("solution") or metadata.get("answer") or ""
    content_hash = _sha1(problem_text + "\n" + solution_text)

    item: Dict[str, Any] = {
        "id": problem_id,               # pk
        "title": metadata.get("title"),
        "source": metadata.get("source"),
        "url": metadata.get("url"),
        "year": metadata.get("year"),
        "scraped_at": now,
        "problem_text": problem_text,
        "solution_text": solution_text,
        "lean_code": lean_code or "",
        "content_hash": content_hash,
        "tags": metadata.get("tags", []),
    }
    # Structured labels — present when scraped from a known competition URL
    for field in ("competition", "problem_number", "difficulty_tier"):
        value = metadata.get(field)
        if value is not None:
            item[field] = value
    table.put_item(Item=item)


def list_all_problems() -> List[Dict[str, Any]]:
    """Paginate through the entire hyperbeam-problem table and return every item."""
    table = _get_table(DDB_TABLE_PROBLEM())
    items: List[Dict[str, Any]] = []
    scan_kwargs: Dict[str, Any] = {}
    while True:
        resp = table.scan(**scan_kwargs)
        items.extend(resp.get("Items", []))
        last_key = resp.get("LastEvaluatedKey")
        if not last_key:
            break
        scan_kwargs["ExclusiveStartKey"] = last_key
    return items


def get_problem(problem_id: str) -> Optional[Dict[str, Any]]:
    table = _get_table(DDB_TABLE_PROBLEM())
    resp = table.get_item(Key={"id": problem_id})
    return resp.get("Item")


def list_problems(
    limit: int = 50,
    last_evaluated_key: Optional[Dict[str, Any]] = None,
) -> Tuple[List[Dict[str, Any]], Optional[Dict[str, Any]]]:
    table = _get_table(DDB_TABLE_PROBLEM())
    scan_kwargs: Dict[str, Any] = {"Limit": limit}
    if last_evaluated_key:
        scan_kwargs["ExclusiveStartKey"] = last_evaluated_key
    resp = table.scan(**scan_kwargs)
    return resp.get("Items", []), resp.get("LastEvaluatedKey")


# ---------------------------------------------------------------------------
# hyperbeam-score  (pk=id, sk=submission_id)
# ---------------------------------------------------------------------------

def save_evaluation_result(
    submission_id: str,
    problem_id: str,
    model_name: str,
    model_response: str,
    q_score: Dict[str, Any],
    per_metric: Dict[str, Any],
) -> None:
    """Persist a per-problem score to hyperbeam-score."""
    table = _get_table(DDB_TABLE_SCORE())
    now = datetime.now(timezone.utc).isoformat()
    score_id = _sha1(f"{submission_id}:{problem_id}")   # deterministic unique id

    table.put_item(Item=_to_decimal({
        "id": score_id,                 # pk
        "submission_id": submission_id, # sk
        "problem_id": problem_id,
        "model_name": model_name,
        "model_response": model_response,
        "evaluated_at": now,
        "overall_score": q_score.get("overall_score"),
        "metric_values": per_metric,
        "errors": q_score.get("errors"),
    }))


def list_evaluations(submission_id: str) -> List[Dict[str, Any]]:
    """Return all score records for a given submission (scan + filter)."""
    table = _get_table(DDB_TABLE_SCORE())
    resp = table.scan(FilterExpression=Attr("submission_id").eq(submission_id))
    return resp.get("Items", [])


# ---------------------------------------------------------------------------
# hyperbeam-submission  (pk=id)
# ---------------------------------------------------------------------------

def save_submission_summary(
    submission_id: str,
    model_name: str,
    overall_score: Optional[float],
    per_metric_means: Dict[str, Any],
    status: str,
) -> None:
    """Update scores and status on an existing submission (preserves all other fields)."""
    table = _get_table(DDB_TABLE_SUBMISSION())
    now = datetime.now(timezone.utc).isoformat()
    # Use update_item so we don't overwrite api_endpoint, contest_id, etc.
    table.update_item(
        Key={"id": submission_id},
        UpdateExpression=(
            "SET model_name = :mn, overall_score = :os, per_metric_means = :pm,"
            " evaluation_status = :st, updated_at = :t"
        ),
        ExpressionAttributeValues=_to_decimal({
            ":mn": model_name,
            ":os": overall_score,
            ":pm": per_metric_means,
            ":st": status,
            ":t": now,
        }),
    )


def get_submission(submission_id: str) -> Optional[Dict[str, Any]]:
    table = _get_table(DDB_TABLE_SUBMISSION())
    resp = table.get_item(Key={"id": submission_id})
    return resp.get("Item")


def list_submissions(
    limit: int = 50,
    last_evaluated_key: Optional[Dict[str, Any]] = None,
) -> Tuple[List[Dict[str, Any]], Optional[Dict[str, Any]]]:
    table = _get_table(DDB_TABLE_SUBMISSION())
    scan_kwargs: Dict[str, Any] = {"Limit": limit}
    if last_evaluated_key:
        scan_kwargs["ExclusiveStartKey"] = last_evaluated_key
    resp = table.scan(**scan_kwargs)
    return resp.get("Items", []), resp.get("LastEvaluatedKey")


# ---------------------------------------------------------------------------
# hyperbeam-user  (pk=email)  — schema was already correct
# ---------------------------------------------------------------------------

def save_user(email: str, password_hash: str, team_name: str = "") -> None:
    table = _get_table(DDB_TABLE_USER())
    now = datetime.now(timezone.utc).isoformat()
    table.put_item(Item={
        "email": email.lower(),
        "password_hash": password_hash,
        "team_name": team_name,
        "created_at": now,
    })


def get_user(email: str) -> Optional[Dict[str, Any]]:
    table = _get_table(DDB_TABLE_USER())
    resp = table.get_item(Key={"email": email.lower()})
    return resp.get("Item")


# ---------------------------------------------------------------------------
# hyperbeam-submission — additional helpers for creating/listing submissions
# ---------------------------------------------------------------------------

def create_submission(
    submission_id: str,
    model_name: str,
    api_endpoint: str,
    contest_id: str = "demo-contest",
    training_cutoff_date: Optional[str] = None,
    description: Optional[str] = None,
) -> None:
    """Create a new submission record before evaluation begins."""
    table = _get_table(DDB_TABLE_SUBMISSION())
    now = datetime.now(timezone.utc).isoformat()
    item: Dict[str, Any] = {
        "id": submission_id,
        "model_name": model_name,
        "api_endpoint": api_endpoint,
        "contest_id": contest_id,
        "evaluation_status": "pending",
        "created_at": now,
        "updated_at": now,
    }
    if training_cutoff_date:
        item["training_cutoff_date"] = training_cutoff_date
    if description:
        item["description"] = description
    table.put_item(Item=item)


def update_submission_status(submission_id: str, status: str) -> None:
    """Update only the evaluation_status of a submission."""
    table = _get_table(DDB_TABLE_SUBMISSION())
    now = datetime.now(timezone.utc).isoformat()
    table.update_item(
        Key={"id": submission_id},
        UpdateExpression="SET evaluation_status = :s, updated_at = :t",
        ExpressionAttributeValues={":s": status, ":t": now},
    )


def list_all_submissions(limit: int = 100) -> List[Dict[str, Any]]:
    """Return all submissions, newest first."""
    table = _get_table(DDB_TABLE_SUBMISSION())
    resp = table.scan(Limit=limit)
    items = resp.get("Items", [])
    items.sort(key=lambda x: x.get("created_at", ""), reverse=True)
    return items


def delete_submission(submission_id: str) -> None:
    """Delete a submission record from hyperbeam-submission."""
    table = _get_table(DDB_TABLE_SUBMISSION())
    table.delete_item(Key={"id": submission_id})
