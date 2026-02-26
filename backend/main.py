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
