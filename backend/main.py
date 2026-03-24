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

from fastapi import Request  # noqa: E402


@app.post("/api/mock-model")
async def mock_model(request: Request):
    """
    Dummy model that always returns a fixed response.
    Use http://localhost:8000/api/mock-model as the API endpoint to test
    the full submission → evaluation pipeline without a real model.
    """
    return {"choices": [{"message": {"content": "The answer is 42. This is a mock response for pipeline testing."}}]}


@app.post("/api/openai-proxy")
async def openai_proxy(request: Request):
    """
    Forwards the prompt to OpenAI gpt-4o-mini and returns an OpenAI-compatible response.
    Use http://localhost:8000/api/openai-proxy as the API endpoint to test with a real model.
    """
    import os
    from openai import AsyncOpenAI

    body = await request.json()
    messages = body.get("messages") or [{"role": "user", "content": body.get("prompt", "")}]

    client = AsyncOpenAI(api_key=os.environ.get("OPENAI_API_KEY", ""))
    completion = await client.chat.completions.create(
        model="gpt-4o-mini",
        messages=messages,
        temperature=0,
    )
    return {
        "choices": [
            {"message": {"content": completion.choices[0].message.content}}
        ]
    }
