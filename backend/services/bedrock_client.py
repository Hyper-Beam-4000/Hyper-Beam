"""AWS Bedrock LLM wrapper — replaces OpenAI for all LLM calls."""

import json
import os
import boto3

from backend.config import AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION, AWS_PROFILE

_client = None


def _get_client():
    global _client
    if _client is None:
        kwargs = {"region_name": AWS_REGION}

        # Profile-based auth (preferred if provided)
        if AWS_PROFILE:
            session = boto3.Session(profile_name=AWS_PROFILE, region_name=AWS_REGION)
            _client = session.client("bedrock-runtime")
            return _client

        # Explicit key auth
        if AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY:
            kwargs["aws_access_key_id"] = AWS_ACCESS_KEY_ID
            kwargs["aws_secret_access_key"] = AWS_SECRET_ACCESS_KEY

        _client = boto3.client("bedrock-runtime", **kwargs)
    return _client


def bedrock_chat(
    prompt: str,
    model_id: str = "anthropic.claude-sonnet-4-5-20250929-v1:0",
    max_tokens: int = 4096,
    temperature: float = 0.3,
) -> str:
    """
    Send a chat prompt to AWS Bedrock and return the text response.

    Uses the Anthropic Messages API format for Claude models on Bedrock.
    """
    client = _get_client()

    body = json.dumps({
        "anthropic_version": "bedrock-2023-05-31",
        "max_tokens": max_tokens,
        "temperature": temperature,
        "messages": [{"role": "user", "content": prompt}],
    })

    response = client.invoke_model(
        modelId=model_id,
        contentType="application/json",
        accept="application/json",
        body=body,
    )

    response_body = json.loads(response["body"].read())

    # Claude response format
    if "content" in response_body:
        return response_body["content"][0]["text"]

    raise ValueError(f"Unexpected Bedrock response format: {list(response_body.keys())}")
