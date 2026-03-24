# Hyper Beam – Competition Math Benchmarking

Backend + frontend + scraper for benchmarking LLM performance on competition math problems (USAMO 2017–2025) with optional Lean 4 formalization via OpenAI (gpt-4o).

## Project layout

| Directory | Description |
|-----------|-------------|
| `backend/` | FastAPI server, OpenAI client, Supabase + DynamoDB integration |
| `frontend/` | Vite + React + TypeScript dashboard |
| `scraper/` | AoPS Wiki scraper with optional Lean 4 translation |
| `metrics/` | Multi-metric proof evaluation and model scoring engine |
| `tests/` | Pytest suite (unit + end-to-end Lean scoring) |
| `autoformalizer/` | Placeholder for Herald translator integration (future) |

## Prerequisites

- Python 3.10+ and `pip`
- Node 18+ and `npm`
- AWS credentials (for DynamoDB tables and SQS queues)
- OpenAI API key (required for Lean 4 translation)
- Supabase project (optional; used by frontend and leaderboard)

## Credentials

Copy the example files and fill in values:

```bash
cp backend/.env.example backend/.env
cp scraper/.env.example scraper/.env
cp frontend/.env.example frontend/.env
```

**`backend/.env`** (also read by the scraper):
```
# AWS — DynamoDB tables and SQS queues
AWS_ACCESS_KEY_ID=...
AWS_SECRET_ACCESS_KEY=...
AWS_REGION=us-east-1
AWS_PROFILE=            # set this OR the keys above, not both

# DynamoDB tables (created by bootstrap_infra.py)
DDB_TABLE=hyperbeam-main
DDB_TABLE_PROBLEM=hyperbeam-problem
DDB_TABLE_SCORE=hyperbeam-score
DDB_TABLE_SUBMISSION=hyperbeam-submission
DDB_TABLE_USER=hyperbeam-user

# SQS queues
SQS_SCRAPE_QUEUE=hyperbeam-scrape-jobs
SQS_SCORE_QUEUE=hyperbeam-score-jobs

# OpenAI — required for Lean 4 translation
OPENAI_API_KEY=...

# Supabase — optional, used by leaderboard and frontend auth
SUPABASE_URL=...
SUPABASE_SERVICE_KEY=...

# Misc
API_SECRET_KEY=changeme
FRONTEND_URL=http://localhost:5173
```

**`frontend/.env`**:
```
VITE_API_URL=http://localhost:8000
VITE_SUPABASE_URL=...
VITE_SUPABASE_ANON_KEY=...
```

## Setup

### One-shot dev setup (recommended)
```bash
./dev_setup.sh                     # installs Python + npm deps, copies .env examples
BOOTSTRAP_INFRA=1 ./dev_setup.sh   # also creates DynamoDB tables + SQS queues
```

### Manual setup

**Backend:**
```bash
pip install -r requirements.txt
cp backend/.env.example backend/.env   # fill in values

# (once) create all DynamoDB tables and SQS queues
python backend/scripts/bootstrap_infra.py

uvicorn backend.main:app --reload --host 0.0.0.0 --port 8000
```

**Frontend:**
```bash
cd frontend
cp .env.example .env   # fill in VITE_SUPABASE_URL/KEY
npm install
npm run dev            # http://localhost:8080
```

**SQS workers** (optional, for async scrape/score jobs):
```bash
python backend/scripts/worker.py --queue scrape   # consumes hyperbeam-scrape-jobs
python backend/scripts/worker.py --queue score    # consumes hyperbeam-score-jobs
```

## Scraper

The scraper fetches AoPS Wiki problems and optionally translates them to Lean 4 via OpenAI. Results are saved as JSON + LaTeX + `.lean` files and optionally persisted to `hyperbeam-problem` in DynamoDB.

```bash
cd scraper
cp .env.example .env

# Single problem (add --lean to generate Lean 4)
python scrape_problem.py --url <AOPS_URL> --out scraped_problems --lean

# Batch from urls.txt (USAMO 2017–2025, 54 problems)
python scrape_problem.py urls.txt --out scraped_problems --lean

# Entire competition index page
python scrape_competition.py --url <COMPETITION_INDEX_URL> --out scraped_problems --lean

# Persist to DynamoDB (hyperbeam-problem)
SCRAPER_PERSIST_TO_DDB=true python scrape_problem.py urls.txt --out scraped_problems --lean
```

### Problem dataset (urls.txt)

`scraper/urls.txt` contains 54 USAMO problems across 9 years, grouped by training-data era:

| Years | Era |
|-------|-----|
| 2017 | Pre-GPT baseline — definitively in all models' training data |
| 2018 | GPT-1 release year — early knowledge boundary |
| 2019–2023 | Known training data for most current models |
| 2024–2025 | Post-cutoff — held-out test data for most models |

## DynamoDB tables

All 5 tables are created by `bootstrap_infra.py`:

| Table | Key | Contents |
|-------|-----|----------|
| `hyperbeam-problem` | `problem_id` | Scraped problems (text, solution, Lean code) |
| `hyperbeam-score` | `submission_id` + `problem_id` | Per-problem metric scores |
| `hyperbeam-submission` | `submission_id` | Submission summaries and aggregate scores |
| `hyperbeam-user` | `email` | User accounts (bcrypt hash, team name) |
| `hyperbeam-main` | `pk` + `sk` | Legacy single-table fallback |

## Metrics

The scoring engine (`metrics/`) evaluates model responses against reference solutions across ~10 metrics:

- **Answer correctness** — SymPy symbolic verification
- **Rubric score** — 0–7 ProofBench scale
- **Embedding similarity** — sentence-transformers cosine similarity
- **Reasoning alignment**, **proof technique match**, **concept coverage** — NLP-based
- **Lean compiles** — checks whether generated Lean 4 compiles
- **LLM-as-judge** — optional, uses OpenAI when `use_llm_judge=True`

Missing metrics redistribute their weights automatically so scores always sum to 1.0. See `metrics/README.md` for full documentation.

## Testing

```bash
pip install -r requirements.txt
pytest                  # all tests
pytest -m "not slow"    # skip tests that load ML models
pytest tests/metrics/test_end_to_end_lean.py -v -s   # full pipeline (requires OPENAI_API_KEY)
```

## Quick smoke test (OpenAI)

```bash
python - <<'PY'
from backend.services.openai_client import openai_chat
print(openai_chat("Say hi in one word.", max_tokens=5, temperature=0))
PY
```

## Security

- Never commit filled `.env` files or API keys.
- Prefer IAM roles in production (no long-term keys on EC2).
- Rotate keys periodically.
