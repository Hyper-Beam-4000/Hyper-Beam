#!/usr/bin/env python3
"""Simple SQS worker for scrape and score jobs."""

import argparse
import json
import os
import sys
import time
from typing import Any, Dict

import boto3
from botocore.exceptions import ClientError

# Add both backend/ (for `from config import ...`) and project root (for `from backend.* import ...`)
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "../..")))

from config import (  # type: ignore
    AWS_REGION,
    AWS_PROFILE,
    AWS_ACCESS_KEY_ID,
    AWS_SECRET_ACCESS_KEY,
    SQS_SCRAPE_QUEUE,
    SQS_SCORE_QUEUE,
)


def _session():
    kwargs = {"region_name": AWS_REGION}
    if AWS_PROFILE:
        return boto3.Session(profile_name=AWS_PROFILE, **kwargs)
    if AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY:
        kwargs["aws_access_key_id"] = AWS_ACCESS_KEY_ID
        kwargs["aws_secret_access_key"] = AWS_SECRET_ACCESS_KEY
    return boto3.Session(**kwargs)


def _queue_url(sqs, name: str) -> str:
    return sqs.get_queue_url(QueueName=name)["QueueUrl"]


def handle_scrape(payload: Dict[str, Any]):
    """Process a scrape job: expects {'type':'scrape','url':..., 'lean': bool, 'out': str}"""
    from scraper import scrape_problem

    url = payload.get("url")
    if not url:
        print("[scrape] missing url")
        return
    lean = bool(payload.get("lean", False))
    out = payload.get("out", "scraped_problems")
    delay = float(payload.get("delay", 1.0))
    print(f"[scrape] url={url} lean={lean} out={out}")
    scrape_problem.scrape_url(url, delay=delay, outdir=out, use_lean=lean)


def handle_evaluate(payload: Dict[str, Any]):
    """
    Process an evaluate job: runs the full evaluation pipeline for a submission.
    Expected payload: {"type": "evaluate", "submission_id": "...", "contest_id": "..."}
    """
    from backend.services.evaluation import evaluate_submission

    submission_id = payload.get("submission_id")
    contest_id = payload.get("contest_id", "demo-contest")
    if not submission_id:
        print("[evaluate] missing submission_id")
        return
    print(f"[evaluate] submission={submission_id} contest={contest_id}")
    evaluate_submission(submission_id, contest_id)


def handle_score(payload: Dict[str, Any]):
    """
    Process a score job.
    Expected payload:
      {
        "type": "score",
        "submission_id": "...",
        "data": [ { "problem_id": "...", "model_response": "..." }, ... ]
      }
    """
    from backend.services import upload_service

    submission_id = payload.get("submission_id")
    data = payload.get("data", [])
    if not submission_id or not isinstance(data, list):
        print("[score] missing submission_id or data")
        return
    print(f"[score] submission={submission_id} entries={len(data)}")
    upload_service.process_uploaded_results(submission_id, data)


def main(queue: str, poll_seconds: int):
    session = _session()
    sqs = session.client("sqs")
    queue_name = SQS_SCRAPE_QUEUE if queue == "scrape" else SQS_SCORE_QUEUE
    qurl = _queue_url(sqs, queue_name)
    print(f"[worker] listening on {queue_name}")

    while True:
        resp = sqs.receive_message(
            QueueUrl=qurl,
            MaxNumberOfMessages=5,
            WaitTimeSeconds=20,
        )
        msgs = resp.get("Messages", [])
        if not msgs:
            time.sleep(poll_seconds)
            continue
        for m in msgs:
            receipt = m["ReceiptHandle"]
            try:
                payload = json.loads(m["Body"])
                job_type = payload.get("type")
                if job_type == "scrape":
                    handle_scrape(payload)
                elif job_type == "evaluate":
                    handle_evaluate(payload)
                elif job_type == "score":
                    handle_score(payload)
                else:
                    print(f"[worker] unknown job type: {job_type}")
                sqs.delete_message(QueueUrl=qurl, ReceiptHandle=receipt)
            except Exception as e:
                print(f"[worker] error processing message: {e}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Hyper Beam SQS worker")
    parser.add_argument("--queue", choices=["scrape", "score"], required=True, help="Queue to consume")
    parser.add_argument("--poll-seconds", type=int, default=2, help="Sleep between empty polls")
    args = parser.parse_args()
    main(args.queue, args.poll_seconds)
