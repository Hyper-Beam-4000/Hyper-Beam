"""AWS SageMaker JumpStart chat wrapper (invoke_endpoint)."""

import json
import boto3
from typing import List, Dict

from backend.config import (
    AWS_REGION,
    AWS_PROFILE,
    AWS_ACCESS_KEY_ID,
    AWS_SECRET_ACCESS_KEY,
    SAGEMAKER_ENDPOINT_NAME,
)

_client = None


def _get_client():
    global _client
    if _client:
        return _client
    kwargs = {"region_name": AWS_REGION}
    if AWS_PROFILE:
        session = boto3.Session(profile_name=AWS_PROFILE, **kwargs)
        _client = session.client("sagemaker-runtime")
    elif AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY:
        _client = boto3.client(
            "sagemaker-runtime",
            region_name=AWS_REGION,
            aws_access_key_id=AWS_ACCESS_KEY_ID,
            aws_secret_access_key=AWS_SECRET_ACCESS_KEY,
        )
    else:
        _client = boto3.client("sagemaker-runtime", **kwargs)
    return _client


def sagemaker_chat(
    prompt: str,
    max_tokens: int = 512,
    temperature: float = 0.3,
) -> str:
    """
    Invoke a text-generation endpoint with a simple prompt.
    Assumes endpoint expects a JSON body with "inputs" and "parameters".
    Tested with JumpStart Llama/Mistral instruct models.
    """
    if not SAGEMAKER_ENDPOINT_NAME:
        raise RuntimeError("SAGEMAKER_ENDPOINT_NAME not set")

    client = _get_client()
    payload = {
        "inputs": prompt,
        "parameters": {
            "max_new_tokens": max_tokens,
            "temperature": temperature,
        },
    }
    response = client.invoke_endpoint(
        EndpointName=SAGEMAKER_ENDPOINT_NAME,
        ContentType="application/json",
        Body=json.dumps(payload).encode("utf-8"),
    )
    body = response["Body"].read().decode("utf-8")
    data = json.loads(body)

    # JumpStart TGI-style responses: list with generated_text
    if isinstance(data, list) and data and "generated_text" in data[0]:
        return data[0]["generated_text"]
    # HF text-generation-inference compatible
    if isinstance(data, dict) and "generated_text" in data:
        return data["generated_text"]
    # Raw string
    if isinstance(data, str):
        return data

    raise ValueError(f"Unexpected SageMaker response format: {data}")
