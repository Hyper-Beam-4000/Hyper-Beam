"""Create DynamoDB table and SQS queues for Hyper Beam (idempotent)."""

import argparse
import os
import sys

import boto3
from botocore.exceptions import ClientError

# Ensure repo root on path when run as `python scripts/bootstrap_infra.py`
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))

from config import (  # type: ignore
    AWS_REGION,
    AWS_PROFILE,
    AWS_ACCESS_KEY_ID,
    AWS_SECRET_ACCESS_KEY,
    DDB_TABLE,
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


def ensure_table(session):
    dynamo = session.client("dynamodb")
    try:
        dynamo.describe_table(TableName=DDB_TABLE)
        print(f"[dynamo] table exists: {DDB_TABLE}")
        return
    except ClientError as e:
        if e.response["Error"]["Code"] != "ResourceNotFoundException":
            raise

    print(f"[dynamo] creating table {DDB_TABLE} ...")
    dynamo.create_table(
        TableName=DDB_TABLE,
        AttributeDefinitions=[
            {"AttributeName": "pk", "AttributeType": "S"},
            {"AttributeName": "sk", "AttributeType": "S"},
        ],
        KeySchema=[
            {"AttributeName": "pk", "KeyType": "HASH"},
            {"AttributeName": "sk", "KeyType": "RANGE"},
        ],
        BillingMode="PAY_PER_REQUEST",
    )
    dynamo.get_waiter("table_exists").wait(TableName=DDB_TABLE)
    print(f"[dynamo] created {DDB_TABLE}")


def ensure_queue(session, name):
    sqs = session.client("sqs")
    try:
        resp = sqs.get_queue_url(QueueName=name)
        print(f"[sqs] queue exists: {name} -> {resp['QueueUrl']}")
        return resp["QueueUrl"]
    except ClientError as e:
        if e.response["Error"]["Code"] != "AWS.SimpleQueueService.NonExistentQueue":
            raise
    resp = sqs.create_queue(QueueName=name)
    url = resp["QueueUrl"]
    print(f"[sqs] created queue {name} -> {url}")
    return url


def main():
    session = _session()
    ensure_table(session)
    ensure_queue(session, SQS_SCRAPE_QUEUE)
    ensure_queue(session, SQS_SCORE_QUEUE)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Bootstrap DynamoDB table and SQS queues for Hyper Beam.")
    parser.parse_args()
    main()
