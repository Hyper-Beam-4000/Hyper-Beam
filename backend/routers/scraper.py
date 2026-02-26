"""Scraper API — trigger scraping jobs (admin only)."""

from fastapi import APIRouter, HTTPException, Query, Header
from typing import Optional

from backend.config import API_SECRET_KEY
from backend.services.scraper_service import scrape_and_store_problem, scrape_and_store_competition

router = APIRouter(tags=["scraper"])


def _verify_admin(authorization: Optional[str]):
    if not authorization or authorization != f"Bearer {API_SECRET_KEY}":
        raise HTTPException(status_code=403, detail="Admin access required")


@router.post("/scraper/run")
async def run_scraper(
    url: str = Query(..., description="AoPS Wiki URL to scrape"),
    competition: bool = Query(False, description="If true, treat as competition index page"),
    authorization: Optional[str] = Header(None),
):
    """Trigger a scrape job. Requires admin API key."""
    _verify_admin(authorization)

    try:
        if competition:
            results = scrape_and_store_competition(url)
            return {"status": "ok", "problems_scraped": len(results)}
        else:
            result = scrape_and_store_problem(url)
            return {"status": "ok", "problem": result}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
