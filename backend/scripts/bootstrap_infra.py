"""Create DynamoDB tables and SQS queues for Hyper Beam (idempotent).

Actual schemas (matches existing tables in AWS):
  hyperbeam-problem    pk=id
  hyperbeam-score      pk=id, sk=submission_id
  hyperbeam-submission pk=id
  hyperbeam-user       pk=email
  hyperbeam-main       pk=pk, sk=sk  (legacy)
"""

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
    DDB_TABLE_PROBLEM,
    DDB_TABLE_SCORE,
    DDB_TABLE_SUBMISSION,
    DDB_TABLE_USER,
    SQS_SCRAPE_QUEUE,
    SQS_SCORE_QUEUE,
)

# Table definitions: (table_name, hash_key, range_key_or_None)
# hyperbeam-score needs a range key so we can query all scores for a submission.
TABLE_DEFINITIONS = [
    (DDB_TABLE_PROBLEM,    "id",    None),
    (DDB_TABLE_SCORE,      "id",    "submission_id"),
    (DDB_TABLE_SUBMISSION, "id",    None),
    (DDB_TABLE_USER,       "email", None),
    # Legacy single-table kept for backward compat
    (DDB_TABLE,            "pk",    "sk"),
]


def _session():
    kwargs = {"region_name": AWS_REGION}
    if AWS_PROFILE:
        return boto3.Session(profile_name=AWS_PROFILE, **kwargs)
    if AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY:
        kwargs["aws_access_key_id"] = AWS_ACCESS_KEY_ID
        kwargs["aws_secret_access_key"] = AWS_SECRET_ACCESS_KEY
    return boto3.Session(**kwargs)


def ensure_table(dynamo, table_name: str, hash_key: str, range_key: str = None):
    try:
        dynamo.describe_table(TableName=table_name)
        print(f"[dynamo] exists:  {table_name}")
        return
    except ClientError as e:
        if e.response["Error"]["Code"] != "ResourceNotFoundException":
            raise

    attr_defs = [{"AttributeName": hash_key, "AttributeType": "S"}]
    key_schema = [{"AttributeName": hash_key, "KeyType": "HASH"}]

    if range_key:
        attr_defs.append({"AttributeName": range_key, "AttributeType": "S"})
        key_schema.append({"AttributeName": range_key, "KeyType": "RANGE"})

    print(f"[dynamo] creating: {table_name} (pk={hash_key}" +
          (f", sk={range_key}" if range_key else "") + ") ...")
    dynamo.create_table(
        TableName=table_name,
        AttributeDefinitions=attr_defs,
        KeySchema=key_schema,
        BillingMode="PAY_PER_REQUEST",
    )
    dynamo.get_waiter("table_exists").wait(TableName=table_name)
    print(f"[dynamo] created:  {table_name}")


def ensure_queue(sqs, name: str) -> str:
    try:
        resp = sqs.get_queue_url(QueueName=name)
        print(f"[sqs]    exists:  {name}")
        return resp["QueueUrl"]
    except ClientError as e:
        if e.response["Error"]["Code"] != "AWS.SimpleQueueService.NonExistentQueue":
            raise
    resp = sqs.create_queue(QueueName=name)
    url = resp["QueueUrl"]
    print(f"[sqs]    created: {name} -> {url}")
    return url


def main():
    session = _session()
    dynamo = session.client("dynamodb")
    sqs = session.client("sqs")

    print("=== DynamoDB tables ===")
    for table_name, hash_key, range_key in TABLE_DEFINITIONS:
        ensure_table(dynamo, table_name, hash_key, range_key)

    print("\n=== SQS queues ===")
    ensure_queue(sqs, SQS_SCRAPE_QUEUE)
    ensure_queue(sqs, SQS_SCORE_QUEUE)

    print("\nDone.")


if __name__ == "__main__":
    main()
