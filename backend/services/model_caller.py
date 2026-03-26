"""HTTP client for calling model API endpoints."""

import httpx


_REASONING_MODELS = ("o3", "o4", "o1")  # prefixes that identify slow reasoning models
_SLOW_MODELS = ("gemini",)  # models that are slow on long math problems


def _pick_timeout(endpoint: str) -> float:
    """Return a generous timeout for reasoning/slow models, default otherwise."""
    lower = endpoint.lower()
    if any(m in lower for m in _REASONING_MODELS):
        return 600.0  # 10 min — reasoning models can take 3-5+ min per problem
    if any(m in lower for m in _SLOW_MODELS):
        return 300.0  # 5 min — Gemini 2.5 Flash is slow on complex USAMO problems
    return 120.0


async def call_model_api(endpoint: str, prompt: str, timeout: float | None = None) -> str:
    """
    Send a prompt to a model's API endpoint and return the text response.

    Tries OpenAI-compatible format first, then falls back to simple prompt format.
    """
    if timeout is None:
        timeout = _pick_timeout(endpoint)

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
