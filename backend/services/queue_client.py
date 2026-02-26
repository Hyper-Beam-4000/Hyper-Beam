"""SQS helpers for scrape/score job dispatch (thin wrapper)."""

import json
import boto3
from typing import Any, Dict

from backend.config import (
    AWS_REGION,
    AWS_PROFILE,
    AWS_ACCESS_KEY_ID,
    AWS_SECRET_ACCESS_KEY,
    SQS_SCRAPE_QUEUE,
    SQS_SCORE_QUEUE,
)

_sqs = None


def _client():
    global _sqs
    if _sqs:
        return _sqs
    kwargs = {"region_name": AWS_REGION}
    if AWS_PROFILE:
        _sqs = boto3.client("sqs", region_name=AWS_REGION)
        return _sqs
    if AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY:
        kwargs["aws_access_key_id"] = AWS_ACCESS_KEY_ID
        kwargs["aws_secret_access_key"] = AWS_SECRET_ACCESS_KEY
    _sqs = boto3.client("sqs", **kwargs)
    return _sqs


def _queue_url(name: str) -> str:
    resp = _client().get_queue_url(QueueName=name)
    return resp["QueueUrl"]


def enqueue_scrape_job(payload: Dict[str, Any]) -> None:
    url = _queue_url(SQS_SCRAPE_QUEUE)
    _client().send_message(QueueUrl=url, MessageBody=json.dumps(payload))


def enqueue_score_job(payload: Dict[str, Any]) -> None:
    url = _queue_url(SQS_SCORE_QUEUE)
    _client().send_message(QueueUrl=url, MessageBody=json.dumps(payload))
