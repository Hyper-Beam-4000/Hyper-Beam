# Hyper Beam – Competition Math Benchmarking

Backend + frontend + scraper for benchmarking competition‑math problem solving and Lean 4 translations using AWS Bedrock (Claude models).

## Project layout
- `backend/` — FastAPI API (uvicorn), Bedrock client, Supabase integration.
- `frontend/` — Vite + React + TypeScript dashboard.
- `scraper/` — AoPS scraper with optional Lean translation via Bedrock.
- `metrics/` — Proof evaluation/scoring utilities.
- `tests/` — Pytest suite (e2e Lean scoring, metrics).

## Prerequisites
- Python 3.10+ and `pip`
- Node 18+ and `npm`
- AWS credentials available locally (see below)

## Credentials
Use your AWS access keys for local dev:
```
AWS_ACCESS_KEY_ID=...        # required
AWS_SECRET_ACCESS_KEY=...    # required
AWS_REGION=us-east-1         # or your region
AWS_PROFILE=                 # leave blank when using keys
DDB_TABLE=hyperbeam-main
SQS_SCRAPE_QUEUE=hyperbeam-scrape-jobs
SQS_SCORE_QUEUE=hyperbeam-score-jobs
SAGEMAKER_ENDPOINT_NAME=your-sagemaker-endpoint
OPENAI_API_KEY=                  # optional fallback
```
Set these in both `backend/.env` and `scraper/.env`. (Examples provided.)

If you later switch to SSO/profile, set `AWS_PROFILE=<name>` and omit keys.

Frontend env:
```
VITE_API_URL=http://localhost:8000
VITE_SUPABASE_URL=...
VITE_SUPABASE_ANON_KEY=...
```

## Setup
### Backend
```bash
cd backend
cp .env.example .env    # fill in AWS + Supabase vars
pip install -r ../requirements.txt

# (once) create DynamoDB table + SQS queues with your creds
python scripts/bootstrap_infra.py

uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000
```

### One-shot dev setup
From repo root:
```bash
./dev_setup.sh           # installs deps, copies env examples
BOOTSTRAP_INFRA=1 ./dev_setup.sh   # also creates DynamoDB table + SQS queues (needs AWS creds)
```

### Workers (SQS)
```bash
cd backend
python scripts/worker.py --queue scrape   # consume hyperbeam-scrape-jobs
python scripts/worker.py --queue score    # consume hyperbeam-score-jobs
```

### Frontend
```bash
cd frontend
cp .env.example .env    # fill in VITE_SUPABASE_URL/KEY etc. if needed
npm install
npm run dev             # opens http://localhost:5173
```

### Scraper
```bash
cd scraper
cp .env.example .env    # same AWS creds as backend
pip install -r ../requirements.txt

# Optional: persist scraped problems to DynamoDB
export SCRAPER_PERSIST_TO_DDB=true   # or set in scraper/.env

# Single problem
python scrape_problem.py --url <AOPS_URL> --out scraped_problems --lean
# Or list of URLs from a text file (one per line)
python scrape_problem.py urls.txt --out scraped_problems --lean

# Entire competition
python scrape_competition.py --url <COMPETITION_PAGE_URL> --out scraped_problems --lean
```

## Testing
From repo root:
```bash
pip install -r requirements.txt
pytest
```
The end-to-end Lean test will call Bedrock; ensure AWS creds are set.

## Security
- Never commit filled `.env` files or access keys.
- Prefer IAM roles on EC2 later (no long-term keys on instances).
- Rotate keys periodically.

## Quick smoke test (Bedrock)
```bash
python - <<'PY'
from backend.services.bedrock_client import bedrock_chat
print(bedrock_chat("Say hi in one word.", max_tokens=5, temperature=0))
PY
```

If this returns text, Bedrock is working. If not, check AWS creds/region.
