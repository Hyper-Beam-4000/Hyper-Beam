# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **competition math autoformalization** research project (CIS 4000 senior design). It scrapes math competition problems (primarily from AoPS Wiki), evaluates LLM-generated proofs against reference solutions using multi-metric scoring, and includes a Lean 4 formal verification pipeline. The long-term goal includes autoformalization via the Herald translator.

## Build & Run Commands

### Python Backend (metrics, scraper, utilities)
```bash
pip install -r requirements.txt

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
npm run dev      # dev server
npm run build    # production build
npm run lint     # eslint
```

### Scraper
```bash
# Single problem (requires AWS Bedrock creds in backend/.env for --lean)
python scraper/scrape_problem.py --url <AOPS_URL> --out scraper/scraped_problems

# Entire competition (finds /Problem_N subpages automatically)
python scraper/scrape_competition.py --url <COMPETITION_PAGE_URL> --out scraped_problems --lean
```

## Architecture

### `metrics/` — Proof Evaluation Engine
The core of the project. Three layers of evaluation:

- **`math_metrics.py`** — LaTeX proof evaluation: embedding similarity (`proof_embedding_similarity` via sentence-transformers), answer extraction + SymPy symbolic verification, rubric-based scoring (0-7 ProofBench scale), and Lean compilation check. Entry point: `comprehensive_proof_evaluation()`.
- **`model_scorer.py`** — Unified scoring system that combines ~10 metrics (answer correctness, rubric score, Lean compilation, reasoning alignment, proof technique match, concept coverage, LLM-as-judge, embedding similarity) with configurable weights and graceful degradation when metrics are unavailable. Key functions: `score_question()`, `score_model()`, `score_batch()`, `compare_models()`, `export_scores()`.
- **`lean_proof_comparison.py`** — Lean 4 proof structural comparison: parses proofs into `LeanProofStructure` (imports, tactics, hypotheses, sorry positions), then compares across theorem similarity, tactic usage, structural similarity, and import compatibility. Entry point: `compare_lean_proofs()`.
- **`language_metrics.py`** — NLP metrics (ROUGE, BLEU, METEOR) plus HuggingFace translation helpers. Used as supplementary evaluation.

### `scraper/` — AoPS Wiki Problem Scraper
- **`scrape_problem.py`** — Scrapes a single AoPS Wiki URL, extracts problem/solution LaTeX from HTML, calls AWS Bedrock (Claude) to translate to Lean 4. Outputs per-problem: `{id}.json`, `{id}_problem.tex`, `{id}_solution.tex`, `{id}.lean`. Respects robots.txt.
- **`scrape_competition.py`** — Discovers `/Problem_N` subpages from a competition index page and feeds them to `scrape_problem.scrape_url()`.
- Scraper uses AWS credentials in `backend/.env` (or environment) for Lean translation.

### `utilities/`
- **`translation_utilities.py`** — HuggingFace translation pipelines (EN↔ES).

### `frontend/` — React Dashboard
Built with Vite, React 18, TypeScript, shadcn-ui, Tailwind CSS, Supabase, and Recharts. Managed via Lovable. Standard `npm run dev` workflow.

### `tests/`
- `conftest.py` adds project root to `sys.path`.
- Test data lives in `tests/metrics/test_data.py` (USAMO questions, model predictions, Lean proofs).
- pytest config: `pytest.ini` sets `testpaths = tests`, `addopts = -s`, and defines a `slow` marker.

## Key Design Decisions

- **Weight redistribution**: When metrics are unavailable (e.g., no Lean code provided), `model_scorer._redistribute_weights()` proportionally redistributes weights among available metrics so they always sum to 1.0.
- **LLM-as-judge is opt-in**: `llm_judge_evaluate()` uses AWS Bedrock (Claude) when `use_llm_judge=True`.
- **Embedding model is globally cached**: `math_metrics._embedding_model` avoids reloading sentence-transformers across calls.
- **Scraped output structure**: Each problem gets its own directory under the output folder, named `{url_slug}_{sha1_hash[:10]}/`.
