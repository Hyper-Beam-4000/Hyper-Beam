# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **competition math autoformalization** research project (CIS 4000 senior design). It scrapes math competition problems (primarily from AoPS Wiki), evaluates LLM-generated proofs against reference solutions using multi-metric scoring, and includes a Lean 4 formal verification pipeline. The long-term goal includes autoformalization via the Herald translator.

## Build & Run Commands

### One-shot Setup
```bash
bash dev_setup.sh   # installs Python deps, npm deps, and optionally bootstraps AWS infra
```

### Python Backend (FastAPI server)
```bash
pip install -r requirements.txt

# Start the FastAPI backend
uvicorn backend.main:app --reload

# Run all tests
pytest

# Run a single test file
pytest tests/metrics/test_math_metrics.py

# Run a specific test class/method
pytest tests/metrics/test_model_scorer.py::TestScoreQuestion::test_basic_scoring

# Skip slow tests (those marked @pytest.mark.slow that load models)
pytest -m "not slow"
```

### Frontend (React + Vite + TypeScript)
```bash
cd frontend
npm install
npm run dev      # dev server (port 8080)
npm run build    # production build
npm run lint     # eslint
npm run preview  # preview production build
```

### Scraper
```bash
# Single problem (requires OPENAI_API_KEY in backend/.env for --lean)
python scraper/scrape_problem.py --url <AOPS_URL> --out scraper/scraped_problems

# Entire competition (finds /Problem_N subpages automatically)
python scraper/scrape_competition.py --url <COMPETITION_PAGE_URL> --out scraped_problems --lean
```

### Infrastructure (AWS)
```bash
# Bootstrap DynamoDB tables and SQS queues (requires AWS creds)
python backend/scripts/bootstrap_infra.py

# Start SQS worker (processes scrape/score jobs)
python backend/scripts/worker.py
```

## Architecture

### `backend/` — FastAPI Application
REST API server with the following structure:

- **`main.py`** — FastAPI entry point; CORS middleware, APScheduler lifespan (daily scrape at 03:00), router registration.
- **`config.py`** — Loads all environment variables (AWS, Supabase, SQS, DynamoDB, CORS).
- **`db.py`** — Supabase client wrapper (service-role authenticated, cached).
- **Routers** (`routers/`): `problems`, `auth`, `contests`, `submissions`, `evaluations`, `leaderboard`, `scraper`, `upload`.
- **Services** (`services/`):
  - `openai_client.py` — OpenAI API wrapper; primary LLM backend for Lean translation (`gpt-4o` via `translate_to_lean()`) and general inference.
  - `model_caller.py` — Unified LLM backend interface.
  - `auth_service.py` — bcrypt hashing + JWT validation.
  - `queue_client.py` — SQS client for async job queues.
  - `dynamo_repository.py` — DynamoDB data access layer.
  - `sagemaker_client.py` — AWS SageMaker inference endpoint integration (optional; not used in Lean translation).
  - `scraper_service.py` — Scheduled scraping coordination via SQS.
  - `evaluation.py` — Evaluation orchestration; calls metrics and formats results.
  - `prompt_templates.py` — Prompt engineering templates for Lean translation.
- **Scripts** (`scripts/`): `bootstrap_infra.py`, `worker.py`, `migrate_existing_problems.py`.
- Credentials go in `backend/.env` (see `backend/.env.example`).

### `metrics/` — Proof Evaluation Engine
The core of the project. Layers of evaluation:

- **`math_metrics.py`** — LaTeX proof evaluation: embedding similarity (`proof_embedding_similarity` via sentence-transformers), answer extraction + SymPy symbolic verification, rubric-based scoring (0-7 ProofBench scale), and Lean compilation check. Entry point: `comprehensive_proof_evaluation()`.
- **`model_scorer.py`** — Unified scoring system that combines ~10 metrics (answer correctness, rubric score, Lean compilation, reasoning alignment, proof technique match, concept coverage, LLM-as-judge, embedding similarity) with configurable weights and graceful degradation when metrics are unavailable. Key functions: `score_question()`, `score_model()`, `score_batch()`, `compare_models()`, `export_scores()`.
- **`lean_proof_comparison.py`** — Lean 4 proof structural comparison: parses proofs into `LeanProofStructure` (imports, tactics, hypotheses, sorry positions), then compares across theorem similarity, tactic usage, structural similarity, and import compatibility. Entry point: `compare_lean_proofs()`.
- **`language_metrics.py`** — NLP metrics (ROUGE, BLEU, METEOR) plus HuggingFace translation helpers. Used as supplementary evaluation.
- **`superscore.py`** — Model-level ranking across five dimensions: weighted mean, reliability, consistency, frontier score, and difficulty-adjusted score. Computes percentiles and per-metric profiles. Entry point: `compute_superscore()`.
- **`__init__.py`** — Public API exports: `score_question`, `score_model`, `compute_superscore`, etc.

### `scraper/` — AoPS Wiki Problem Scraper
- **`scrape_problem.py`** — Scrapes a single AoPS Wiki URL, extracts problem/solution LaTeX from HTML, calls OpenAI (`gpt-4o`) to translate to Lean 4. Outputs per-problem: `{id}.json`, `{id}_problem.tex`, `{id}_solution.tex`, `{id}.lean`. Respects robots.txt.
- **`scrape_competition.py`** — Discovers `/Problem_N` subpages from a competition index page and feeds them to `scrape_problem.scrape_url()`.
- Scraped output lives in `scraper/scraped_problems/` (hash-named subdirectories).
- Lean translation uses `OPENAI_API_KEY` from `backend/.env` (or environment).

### `utilities/`
- **`translation_utilities.py`** — HuggingFace translation pipelines (EN↔ES).

### `autoformalizer/` — Herald Translator Integration (Planned)
Placeholder directory for future autoformalization work using the Herald translator. See `autoformalizer/todo.txt` for links to Herald documentation.

### `frontend/` — React Dashboard
Built with Vite, React 18, TypeScript, shadcn/ui, Tailwind CSS, Supabase, and Recharts. Managed via Lovable. Standard `npm run dev` workflow.

Pages: `Index`, `Dashboard`, `Problems`, `ProblemDetail`, `Contest`, `Archive`, `Leaderboard`, `Submit`, `Auth`.

Key dependencies: TanStack Query (server state), React Router 6, React Hook Form + Zod (forms), React Markdown + KaTeX (LaTeX rendering), Sonner (toasts), next-themes (dark mode).

### `tests/`
- `conftest.py` adds project root to `sys.path`.
- Test data lives in `tests/metrics/test_data.py` (USAMO questions, model predictions, Lean proofs).
- pytest config: `pytest.ini` sets `testpaths = tests`, `addopts = -s`, and defines a `slow` marker.
- Test files: `test_math_metrics.py`, `test_lean_proof_comparison.py`, `test_language_metrics.py`, `test_model_scorer.py`, `test_superscore.py`, `test_end_to_end_lean.py` (integration, calls OpenAI `gpt-4o`).

## Key Design Decisions

- **Weight redistribution**: When metrics are unavailable (e.g., no Lean code provided), `model_scorer._redistribute_weights()` proportionally redistributes weights among available metrics so they always sum to 1.0.
- **LLM-as-judge is opt-in**: `llm_judge_evaluate()` uses OpenAI when `use_llm_judge=True`.
- **Embedding model is globally cached**: `math_metrics._embedding_model` avoids reloading sentence-transformers across calls.
- **Scraped output structure**: Each problem gets its own directory under the output folder, named `{url_slug}_{sha1_hash[:10]}/`.
- **Async job processing**: Scraping and scoring are offloaded to SQS queues; `backend/scripts/worker.py` is the consumer.
- **Scheduled scraping**: APScheduler in `backend/main.py` triggers a daily AoPS scrape at 03:00 (non-blocking; failure doesn't prevent startup).
