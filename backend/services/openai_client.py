"""OpenAI chat wrapper (fallback when SageMaker is unavailable)."""

from typing import List, Dict

from backend.config import OPENAI_API_KEY

try:
    from openai import OpenAI
except Exception:
    OpenAI = None


def openai_chat(prompt: str, model: str = "gpt-4o-mini", max_tokens: int = 512, temperature: float = 0.3) -> str:
    if not OPENAI_API_KEY:
        raise RuntimeError("OPENAI_API_KEY not set")
    if OpenAI is None:
        raise RuntimeError("openai package not installed")

    client = OpenAI(api_key=OPENAI_API_KEY)
    resp = client.chat.completions.create(
        model=model,
        messages=[{"role": "user", "content": prompt}],
        max_tokens=max_tokens,
        temperature=temperature,
    )
    return resp.choices[0].message.content
