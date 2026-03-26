"""FastAPI application — Hyper Beam backend."""

from contextlib import asynccontextmanager

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from backend.config import CORS_ORIGINS
from backend.routers import (
    problems,
    auth,
    contests,
    submissions,
    evaluations,
    leaderboard,
    scraper,
    upload,
)


@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup: initialize scheduler for daily scraping
    try:
        from apscheduler.schedulers.background import BackgroundScheduler
        from backend.services.scraper_service import scheduled_scrape

        scheduler = BackgroundScheduler()
        scheduler.add_job(scheduled_scrape, "cron", hour=3, minute=0)
        scheduler.start()
        app.state.scheduler = scheduler
    except Exception:
        pass  # Scheduler is optional — don't block startup

    yield

    # Shutdown
    if hasattr(app.state, "scheduler"):
        app.state.scheduler.shutdown(wait=False)


app = FastAPI(
    title="Hyper Beam API",
    description="Backend for the Hyper Beam competition math benchmarking platform",
    version="0.1.0",
    lifespan=lifespan,
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=CORS_ORIGINS,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(problems.router, prefix="/api")
app.include_router(auth.router, prefix="/api")
app.include_router(contests.router, prefix="/api")
app.include_router(submissions.router, prefix="/api")
app.include_router(evaluations.router, prefix="/api")
app.include_router(leaderboard.router, prefix="/api")
app.include_router(scraper.router, prefix="/api")
app.include_router(upload.router, prefix="/api")


@app.get("/api/health")
async def health_check():
    return {"status": "ok"}


# ---------------------------------------------------------------------------
# Mock model endpoints — for testing the evaluation pipeline locally
# ---------------------------------------------------------------------------

from fastapi import Request, HTTPException  # noqa: E402


@app.post("/api/mock-model")
async def mock_model(request: Request):
    """
    Dummy model that always returns a fixed response.
    Use http://localhost:8000/api/mock-model as the API endpoint to test
    the full submission → evaluation pipeline without a real model.
    """
    return {"choices": [{"message": {"content": "The answer is 42. This is a mock response for pipeline testing."}}]}


async def _openai_proxy(request: Request, model: str):
    """Shared helper: forwards to any OpenAI chat model."""
    import os
    from openai import AsyncOpenAI

    body = await request.json()
    messages = body.get("messages") or [{"role": "user", "content": body.get("prompt", "")}]

    # Reasoning models (o-series) can take 5+ minutes per USAMO problem
    proxy_timeout = 600.0 if model.startswith("o") else 120.0
    client = AsyncOpenAI(api_key=os.environ.get("OPENAI_API_KEY", ""), timeout=proxy_timeout)
    kwargs = dict(model=model, messages=messages)
    # o-series reasoning models don't support temperature
    if not model.startswith("o"):
        kwargs["temperature"] = 0
    completion = await client.chat.completions.create(**kwargs)
    return {"choices": [{"message": {"content": completion.choices[0].message.content}}]}


@app.post("/api/openai-proxy")
async def openai_proxy_4o_mini(request: Request):
    """gpt-4o-mini — fast and cheap. Use http://localhost:8000/api/openai-proxy"""
    return await _openai_proxy(request, "gpt-4o-mini")


@app.post("/api/openai-proxy/gpt-4o")
async def openai_proxy_4o(request: Request):
    """gpt-4o — strongest OpenAI non-reasoning model. Use http://localhost:8000/api/openai-proxy/gpt-4o"""
    return await _openai_proxy(request, "gpt-4o")


@app.post("/api/openai-proxy/o3-mini")
async def openai_proxy_o3_mini(request: Request):
    """o3-mini — OpenAI reasoning model, good at math. Use http://localhost:8000/api/openai-proxy/o3-mini"""
    return await _openai_proxy(request, "o3-mini")


@app.post("/api/openai-proxy/o4-mini")
async def openai_proxy_o4_mini(request: Request):
    """o4-mini — latest OpenAI reasoning model. Use http://localhost:8000/api/openai-proxy/o4-mini"""
    return await _openai_proxy(request, "o4-mini")


@app.post("/api/gemini-proxy")
async def gemini_proxy(request: Request):
    """
    Gemini 2.5 Flash — free tier via Google AI Studio (GEMINI_API_KEY).
    Use http://localhost:8000/api/gemini-proxy
    """
    import os
    import httpx

    api_key = os.environ.get("GEMINI_API_KEY", "")
    if not api_key:
        raise HTTPException(status_code=503, detail="GEMINI_API_KEY is not set in backend/.env")

    body = await request.json()
    messages = body.get("messages") or [{"role": "user", "content": body.get("prompt", "")}]
    prompt = next((m["content"] for m in reversed(messages) if m.get("role") == "user"), "")

    import asyncio

    url = f"https://generativelanguage.googleapis.com/v1/models/gemini-2.5-flash:generateContent?key={api_key}"
    payload = {"contents": [{"parts": [{"text": prompt}]}]}

    # Retry up to 4 times on 429 with exponential backoff (free tier: 10 RPM)
    delays = [10, 20, 40, 60]
    async with httpx.AsyncClient(timeout=300) as client:
        for attempt, delay in enumerate(delays + [None]):
            resp = await client.post(url, json=payload)
            if resp.status_code != 429 or delay is None:
                break
            print(f"[gemini-proxy] 429 rate limit — retrying in {delay}s (attempt {attempt + 1})")
            await asyncio.sleep(delay)
        resp.raise_for_status()
        data = resp.json()

    text = data["candidates"][0]["content"]["parts"][0]["text"]
    return {"choices": [{"message": {"content": text}}]}


@app.post("/api/anthropic-proxy")
async def anthropic_proxy(request: Request):
    """
    Claude 3.5 Haiku — fast and cheap Anthropic model (ANTHROPIC_API_KEY).
    Use http://localhost:8000/api/anthropic-proxy
    """
    import os
    import httpx

    api_key = os.environ.get("ANTHROPIC_API_KEY", "")
    if not api_key:
        raise HTTPException(status_code=503, detail="ANTHROPIC_API_KEY is not set in backend/.env")

    body = await request.json()
    messages = body.get("messages") or [{"role": "user", "content": body.get("prompt", "")}]
    anthropic_messages = [{"role": m["role"], "content": m["content"]} for m in messages if m.get("role") in ("user", "assistant")]
    if not anthropic_messages or anthropic_messages[0]["role"] != "user":
        anthropic_messages = [{"role": "user", "content": body.get("prompt", "")}]

    async with httpx.AsyncClient(timeout=120) as client:
        resp = await client.post(
            "https://api.anthropic.com/v1/messages",
            headers={"x-api-key": api_key, "anthropic-version": "2023-06-01", "content-type": "application/json"},
            json={"model": "claude-haiku-4-5-20251001", "max_tokens": 4096, "messages": anthropic_messages},
        )
        resp.raise_for_status()
        data = resp.json()

    text = data["content"][0]["text"]
    return {"choices": [{"message": {"content": text}}]}


@app.post("/api/groq-proxy/{model_id:path}")
async def groq_proxy(model_id: str, request: Request):
    """
    Groq free-tier inference for open-source models (GROQ_API_KEY).
    model_id examples: llama-3.3-70b-versatile, deepseek-r1-distill-llama-70b, mixtral-8x7b-32768
    Use e.g. http://localhost:8000/api/groq-proxy/deepseek-r1-distill-llama-70b
    """
    import os
    from openai import AsyncOpenAI

    api_key = os.environ.get("GROQ_API_KEY", "")
    if not api_key:
        raise HTTPException(status_code=503, detail="GROQ_API_KEY is not set in backend/.env")

    body = await request.json()
    messages = body.get("messages") or [{"role": "user", "content": body.get("prompt", "")}]

    client = AsyncOpenAI(
        api_key=api_key,
        base_url="https://api.groq.com/openai/v1",
    )
    completion = await client.chat.completions.create(model=model_id, messages=messages, temperature=0)
    return {"choices": [{"message": {"content": completion.choices[0].message.content}}]}
