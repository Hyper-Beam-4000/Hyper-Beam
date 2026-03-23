"""Thin DynamoDB data-access helpers (single-table design)."""

import hashlib
import os
from datetime import datetime, timezone
from typing import Any, Dict, Optional, List, Tuple

import boto3

from backend.config import AWS_REGION, AWS_PROFILE, AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, DDB_PROBLEM, DDB_SCORE, DDB_SUBMISSION, DDB_USER

dynamo_tables = None

def _get_table(table: str):
    global dynamo_resource
    if dynamo_resource is None:
        session_kwargs = {"region_name": AWS_REGION}
        if AWS_PROFILE:
            session = boto3.Session(profile_name=AWS_PROFILE, **session_kwargs)
            dynamo = session.resource("dynamodb")
        else:
            resource_kwargs = session_kwargs.copy()
            if AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY:
                resource_kwargs["aws_access_key_id"] = AWS_ACCESS_KEY_ID
                resource_kwargs["aws_secret_access_key"] = AWS_SECRET_ACCESS_KEY
            dynamo = boto3.resource("dynamodb", **resource_kwargs)

        dynamo_tables[DDB_PROBLEM] = dynamo.Table(DDB_PROBLEM)
        dynamo_tables[DDB_SCORE] = dynamo.Table(DDB_SCORE)
        dynamo_tables[DDB_SUBMISSION] = dynamo.Table(DDB_SUBMISSION)
        dynamo_tables[DDB_USER] = dynamo.Table(DDB_USER)

    return dynamo_tables[table]


def _sha1(text: str) -> str:
    return hashlib.sha1(text.encode("utf-8")).hexdigest()


def save_problem_record(
    problem_id: str,
    metadata: Dict[str, Any],
    lean_code: Optional[str],
) -> None:
    """Persist a scraped problem + artifacts."""
    table = _get_table(DDB_PROBLEM)
    now = datetime.now(timezone.utc).isoformat()

    problem_text = metadata.get("problem", "") or ""
    solution_text = metadata.get("solution") or metadata.get("answer") or ""
    content_hash = _sha1(problem_text + "\n" + solution_text)

    item = {
        "id": problem_id,
        "title": metadata.get("title"),
        "source": metadata.get("source"),
        "url": metadata.get("url"),
        "year": metadata.get("year"),
        "published_at": metadata.get("published_at"),
        "scraped_at": now,
        "problem_text": problem_text,
        "solution_text": solution_text,
        "lean_code": lean_code or "",
        "content_hash": content_hash,
        "tags": metadata.get("tags", []),
    }

    table.put_item(Item=item)


def get_problem(problem_id: str) -> Optional[Dict[str, Any]]:
    table = _get_table(DDB_PROBLEM)
    resp = table.get_item(Key={"pk": f"PROBLEM#{problem_id}", "sk": "META"})
    return resp.get("Item")


def list_problems(limit: int = 50, last_evaluated_key: Optional[Dict[str, Any]] = None) -> Tuple[List[Dict[str, Any]], Optional[Dict[str, Any]]]:
    """Scan problems; for larger data sets consider adding a GSI later."""
    table = _get_table(DDB_PROBLEM)
    scan_kwargs = {
        "FilterExpression": "begins_with(#pk, :p)",
        "ExpressionAttributeNames": {"#pk": "pk"},
        "ExpressionAttributeValues": {":p": "PROBLEM#"},
        "Limit": limit,
    }
    if last_evaluated_key:
        scan_kwargs["ExclusiveStartKey"] = last_evaluated_key
    resp = table.scan(**scan_kwargs)
    return resp.get("Items", []), resp.get("LastEvaluatedKey")


def save_evaluation_result(
    submission_id: str,
    problem_id: str,
    model_name: str,
    model_response: str,
    q_score: Dict[str, Any],
    per_metric: Dict[str, Any],
) -> None:
    table = _get_table(DDB_SCORE)
    now = datetime.now(timezone.utc).isoformat()
    item = {
        "id": _sha1(f"{problem_id}{submission_id}"),
        "problem_id": problem_id,
        "submission_id": submission_id,
        # "problem_id": problem_id,
        "model_name": model_name,
        "model_response": model_response,
        "evaluated_at": now,
        "overall_score": q_score.get("overall_score"),
        "metric_values": per_metric,
        "errors": q_score.get("errors"),
    }
    table.put_item(Item=item)


def save_submission_summary(
    submission_id: str,
    model_name: str,
    overall_score: Optional[float],
    per_metric_means: Dict[str, Any],
    status: str,
) -> None:
    table = _get_table(DDB_SUBMISSION)
    now = datetime.now(timezone.utc).isoformat()
    item = {
        "id": submission_id,
        # "sk": "META",
        "model_name": model_name,
        "overall_score": overall_score,
        "per_metric_means": per_metric_means,
        "status": status,
        "updated_at": now,
    }
    table.put_item(Item=item)


def list_evaluations(submission_id: str) -> List[Dict[str, Any]]:
    table = _get_table(DDB_SCORE)
    resp = table.query(
        KeyConditionExpression="pk = :p",
        ExpressionAttributeValues={":p": f"EVAL#{submission_id}"},
    )
    return resp.get("Items", [])


def get_submission(submission_id: str) -> Optional[Dict[str, Any]]:
    table = _get_table(DDB_SUBMISSION)
    resp = table.get_item(Key={"pk": f"SUBMISSION#{submission_id}", "sk": "META"})
    return resp.get("Item")


# -------- Users --------
def get_user(email: str) -> Optional[Dict[str, Any]]:
    table = _get_table(DDB_USER)
    resp = table.get_item(Key={"pk": f"USER#{email.lower()}", "sk": "META"})
    return resp.get("Item")


def save_user(email: str, password_hash: str, team_name: str = "") -> None:
    table = _get_table(DDB_USER)
    now = datetime.now(timezone.utc).isoformat()
    item = {
        "email": email.lower(),
        "password_hash": password_hash,
        "team_name": team_name,
        "created_at": now,
    }
    table.put_item(Item=item)
