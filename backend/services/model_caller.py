"""HTTP client for calling model API endpoints."""

import httpx


async def call_model_api(endpoint: str, prompt: str, timeout: float = 120.0) -> str:
    """
    Send a prompt to a model's API endpoint and return the text response.

    Tries OpenAI-compatible format first, then falls back to simple prompt format.
    """
    headers = {"Content-Type": "application/json"}

    # Chat-compatible payload (OpenAI-style; works with Bedrock-compatible gateways too)
    openai_payload = {
        "messages": [{"role": "user", "content": prompt}],
        "temperature": 0,
    }

    async with httpx.AsyncClient(timeout=timeout) as client:
        try:
            resp = await client.post(endpoint, json=openai_payload, headers=headers)
            resp.raise_for_status()
            data = resp.json()

            # OpenAI-compatible response
            if "choices" in data:
                return data["choices"][0]["message"]["content"]

            # Direct text response
            if "text" in data:
                return data["text"]
            if "response" in data:
                return data["response"]
            if "output" in data:
                return data["output"]

            return str(data)

        except (httpx.HTTPStatusError, KeyError):
            # Fallback: simple prompt format
            fallback_payload = {"prompt": prompt, "temperature": 0}
            resp = await client.post(endpoint, json=fallback_payload, headers=headers)
            resp.raise_for_status()
            data = resp.json()

            if isinstance(data, str):
                return data
            if "text" in data:
                return data["text"]
            if "response" in data:
                return data["response"]
            if "output" in data:
                return data["output"]

            return str(data)
