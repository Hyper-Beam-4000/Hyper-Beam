# Quick Start: Industry-Standard Proof Evaluation

## What Changed?

Your evaluation system now includes **industry-standard metrics** used in MATH dataset, ProofBench, and formal verification research, going beyond simple embedding similarity.

## Key New Features

### 1. Answer Extraction & Verification (MATH Dataset Style)
```python
from metrics.math_metrics import extract_final_answer, verify_answer_correctness

pred_answer = extract_final_answer(predicted_proof)
exp_answer = extract_final_answer(expected_proof)
is_correct, confidence = verify_answer_correctness(pred_answer, exp_answer)
```

**Why it's better**: Directly verifies correctness using symbolic computation, not just string matching.

### 2. Rubric-Based Scoring (ProofBench Style)
```python
from metrics.math_metrics import rubric_based_scoring

results = rubric_based_scoring(
    predicted_proof=predicted_proof,
    expected_proof=expected_proof,
    problem_statement=problem
)
# Returns 0-7 scale score (ProofBench standard)
print(f"Score: {results['rubric_scale_score']}/7.0")
```

**Why it's better**: Evaluates proof quality (structure, rigor, completeness), not just final answer.

### 3. Comprehensive Multi-Metric Evaluation
```python
from metrics.math_metrics import comprehensive_proof_evaluation

results = comprehensive_proof_evaluation(
    predicted_proof=predicted_proof,
    expected_proof=expected_proof,
    problem_statement=problem,
    use_embeddings=True  # Include baseline embedding similarity
)

# Results include:
# - answer_verification: Answer extraction & correctness
# - rubric_scoring: 0-7 scale proof quality
# - embedding_similarity: Semantic similarity (baseline)
# - overall_score: Weighted combination
```

**Why it's better**: Combines multiple evaluation dimensions for comprehensive assessment.

### 4. Lean Formal Verification (Optional)
```python
from metrics.math_metrics import verify_lean_proof

results = verify_lean_proof(lean_code)
# Returns: is_valid, is_complete, tactic_count, etc.
```

**Why it's better**: Absolute correctness guarantee—if Lean verifies it, it's mathematically correct.

## Recommended Usage

### For LaTeX-Only Evaluation:
```python
# Use comprehensive evaluation (combines all methods)
results = comprehensive_proof_evaluation(
    predicted_proof=predicted_latex,
    expected_proof=expected_latex,
    problem_statement=problem
)

# Key metrics:
print(f"Answer correct: {results['answer_verification']['is_correct']}")
print(f"Proof quality: {results['rubric_scoring']['rubric_scale_score']}/7.0")
print(f"Overall: {results['overall_score_0_7']}/7.0")
```

### For Lean Evaluation:
```python
# First verify formally
lean_results = verify_lean_proof(lean_code)
if lean_results['is_complete']:
    print("✓ Proof formally verified!")
else:
    print(f"✗ Verification failed: {lean_results['error_message']}")

# Then evaluate quality
results = comprehensive_proof_evaluation(
    predicted_proof=predicted_latex,
    expected_proof=expected_latex,
    lean_code=lean_code  # Include Lean verification
)
```

## Comparison: Old vs New

| Aspect | Old (Embeddings Only) | New (Multi-Metric) |
|--------|----------------------|-------------------|
| **Correctness** | ❌ Can't verify | ✅ Answer extraction + verification |
| **Proof Quality** | ❌ Not measured | ✅ Rubric-based scoring (0-7 scale) |
| **Formal Verification** | ❌ Not supported | ✅ Lean verification (if available) |
| **Industry Standard** | ⚠️ Baseline only | ✅ MATH, ProofBench, MiniF2F methods |

## Example Output

```
=== Comprehensive Evaluation Test ===
Overall Score: 0.7234 (0-1 scale)
Overall Score: 5.06 (0-7 ProofBench scale)

--- Answer Verification (MATH dataset style) ---
Predicted: f(1000) = 1000
Expected: f(1000) = 1000
Correct: True (confidence: 1.00)

--- Rubric Scoring (ProofBench style) ---
Score: 4.85/7.0
Normalized: 0.6929

--- Embedding Similarity (baseline) ---
Similarity: 0.7234
```

## Next Steps

1. **Run the tests**: `pytest tests/metrics/test_math_metrics.py`
2. **Read the full documentation**: `metrics/EVALUATION_METHODS.md`
3. **Integrate into your pipeline**: Replace `proof_embedding_similarity()` calls with `comprehensive_proof_evaluation()`

## Questions?

- See `EVALUATION_METHODS.md` for detailed explanations
- See `test_math_metrics.py` for usage examples
- All functions have docstrings with detailed parameter descriptions
