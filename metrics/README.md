# Metrics System

Evaluation engine for scoring LLM-generated math proofs against reference solutions, with full support for Lean 4 formal proofs. Two levels of scoring: **per-problem** and **per-model**.

## Quick Start

```python
from metrics import score_question, score_model, compute_superscore

# 1. Score a single problem
result = score_question(
    predicted="<model's proof>",
    expected="<reference proof>",
    problem="<problem statement>",
    predicted_lean="<model's Lean code>",   # optional
    expected_lean="<reference Lean code>",  # optional
)
print(result.overall_score)          # 0-1
print(result.metric_values)          # per-metric breakdown
print(result.to_frontend_dict())     # ready for the API

# 2. Aggregate into model-level stats
q_scores = [score_question(...) for problem in problems]
model = score_model(q_scores, model_name="gpt-4o")
print(model.mean_score, model.accuracy)

# 3. Compute superscore (holistic model ranking)
ss = compute_superscore(model)
print(ss.superscore)       # single 0-1 number
print(ss.to_frontend_dict())
```

## Architecture

```
metrics/
├── __init__.py              # Public API — import everything from here
├── model_scorer.py          # Per-problem scoring + model aggregation
├── superscore.py            # Model-level superscore (consistency, frontier, reliability)
├── math_metrics.py          # Low-level LaTeX metrics (embeddings, rubric, answer extraction)
├── lean_proof_comparison.py # Lean 4 proof structural comparison
├── language_metrics.py      # NLP metrics (ROUGE, BLEU, METEOR)
└── README.md
```

## Per-Problem Metrics

`score_question()` runs all available metrics and returns a `QuestionScore`:

| Metric | Range | What it measures |
|---|---|---|
| `answer_correctness` | 0 or 1 | Did the model get the final answer right? (SymPy symbolic check) |
| `rubric_score` | 0-1 | ProofBench 0-7 rubric: answer, key steps, flow, rigor, completeness |
| `embedding_similarity` | 0-1 | Cosine similarity of proof embeddings (sentence-transformers) |
| `semantic_structure` | 0-1 | LaTeX line-category alignment + logical flow quality |
| `reasoning_alignment` | 0-1 | Step-sequence alignment with order-inversion penalty |
| `proof_technique_match` | 0-1 | Jaccard overlap of detected proof techniques |
| `concept_coverage` | 0-1 | F1 score on mathematical concept categories |
| `lean_compiles` | 0 or 1 | Does the Lean 4 code compile? |
| `lean_comparison` | 0-1 | Multi-dimensional Lean proof comparison (theorem, tactics, structure, imports) |

### Weight Presets

Three built-in weight presets control how metrics combine into `overall_score`:

- **`default`** — Balanced for Lean-focused autoformalization. Embedding similarity and semantic structure are weighted higher (0.15 and 0.10) to capture deep structural patterns in well-generated Lean solutions.
- **`latex_only`** — For evaluating LaTeX proofs without Lean code. Answer correctness weighted highest (0.30).
- **`lean_heavy`** — Maximizes formal verification weight. `lean_compiles` gets 0.25.

```python
result = score_question(..., weight_preset="lean_heavy")
# or pass custom weights:
result = score_question(..., weights={"answer_correctness": 0.5, "embedding_similarity": 0.5})
```

When a metric is unavailable (e.g., no Lean code provided), its weight is **redistributed proportionally** among available metrics so weights always sum to 1.0.

## Model-Level Superscore

`compute_superscore()` takes a `ModelScore` (from `score_model()`) and produces a `ModelSuperscore` with five dimensions:

| Dimension | Weight | What it captures |
|---|---|---|
| `weighted_mean` | 0.40 | Average problem score |
| `reliability` | 0.20 | Fraction of problems above threshold (default 0.5) |
| `consistency` | 0.15 | 1 - coefficient of variation (rewards low variance) |
| `frontier` | 0.15 | Mean of top 25% scores (peak capability) |
| `difficulty_adjusted` | 0.10 | Weighted mean where harder problems count more |

Plus percentiles (P25, P50, P75, P90), per-metric profile, and per-category breakdowns.

### Ranking & Comparison

```python
from metrics import compute_superscore, rank_models, compare_superscores

superscores = {name: compute_superscore(ms) for name, ms in model_scores.items()}

# Ranked leaderboard
leaderboard = rank_models(superscores)  # sorted list with rank field

# Side-by-side comparison (for radar charts / tables)
comparison = compare_superscores(superscores)
```

## Frontend Integration

Every dataclass has a `.to_frontend_dict()` method that returns a flat dict matching the frontend TypeScript interfaces:

- `QuestionScore.to_frontend_dict()` → matches `EvaluationResult`
- `ModelScore.to_frontend_dict()` → matches `LeaderboardEntry`
- `ModelSuperscore.to_frontend_dict()` → flat dict for dashboard/leaderboard

```python
# Example: building API response
@app.get("/api/evaluations/{submission_id}")
def get_evaluations(submission_id: str):
    results = [q.to_frontend_dict() for q in question_scores]
    return {"submission_id": submission_id, "results": results}
```

## Export

```python
from metrics import export_scores

export_scores({"gpt-4o": model_score, "gemini": model_score}, "results.json", format="json")
export_scores(..., format="csv")      # CSV table
export_scores(..., format="summary")  # Human-readable text
```

## Running Tests

```bash
# All metric tests (skips slow model-loading tests)
pytest tests/metrics/ -m "not slow"

# Specific test file
pytest tests/metrics/test_superscore.py -v
```
