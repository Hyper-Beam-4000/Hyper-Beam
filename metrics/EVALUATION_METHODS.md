# Industry-Standard Evaluation Methods for Competition Math Proofs

## Overview

This document outlines industry-standard evaluation methods for assessing LLM performance on competition math proofs (USAMO/IMO level), specifically for LaTeX and Lean formats.

## Current Approach vs. Industry Standards

### Current: Sentence Embeddings + Cosine Similarity
- **Pros**: Fast, semantic similarity, good baseline
- **Cons**: Misses logical reasoning, doesn't verify correctness, can't distinguish between correct but different proofs

### Industry Standards: Multi-Metric Evaluation

## 1. Answer Extraction + Verification (MATH Dataset Style)

**Used by**: MATH benchmark, competition math evaluations

**How it works**:
- Extracts final answer from proof (e.g., "f(1000) = 1000")
- Verifies mathematical equivalence using symbolic computation (SymPy)
- Not just string matching—checks if expressions are mathematically equivalent

**Metrics**:
- `Pass@1`: Binary correctness (answer correct or not)
- `Accuracy`: Fraction of problems with correct answers

**Pros**:
- Directly measures correctness
- Fast and scalable
- Industry standard for competition math

**Cons**:
- Doesn't evaluate proof quality, only final answer
- Can't detect correct answers from flawed reasoning

**Implementation**: `extract_final_answer()`, `verify_answer_correctness()`

## 2. Fine-Grained Rubric-Based Scoring (ProofBench Style)

**Used by**: ProofBench, ProofGrader, MathArena

**How it works**:
- Scores proofs on multiple dimensions (0-7 scale):
  - Final answer correctness (2 points)
  - Key logical steps present (2 points)
  - Logical flow/coherence (1.5 points)
  - Mathematical rigor (1 point)
  - Completeness (0.5 points)

**Metrics**:
- `Mean Absolute Error (MAE)`: Difference from expert scores
- `Rubric Score`: 0-7 scale (ProofBench standard)
- `Normalized Score`: 0-1 scale

**Pros**:
- Captures proof quality, not just correctness
- Allows partial credit
- Aligns with human grading rubrics
- Can accommodate multiple valid solution approaches

**Cons**:
- More expensive (requires rubric design)
- Some subjectivity in rubric weights
- Requires reference solutions

**Implementation**: `rubric_based_scoring()`

## 3. Proof Structure Analysis

**Used by**: Various proof evaluation systems

**How it works**:
- Analyzes logical flow and coherence
- Checks for key mathematical concepts/operations
- Verifies proof structure (beginning, middle, conclusion)
- Detects justification vs. mere assertions

**Metrics**:
- Logical flow score
- Key steps coverage
- Rigor score (presence of justifications)

**Pros**:
- Captures proof quality beyond correctness
- Can identify well-structured but incorrect proofs

**Cons**:
- Heuristic-based (not perfect)
- May miss domain-specific nuances

**Implementation**: `_analyze_logical_flow()`, `_analyze_key_steps()`, `_analyze_rigor()`

## 4. Lean Formal Verification

**Used by**: MiniF2F benchmark, formal verification research

**How it works**:
- Attempts to compile/verify Lean proof code
- Checks for `sorry` (incomplete proofs)
- Measures proof length and complexity

**Metrics**:
- `Pass Rate`: Fraction of proofs that verify
- `Pass@k`: Success rate with k attempts
- `Proof Length`: Number of tactics/steps
- `Completeness`: No `sorry` in proof

**Pros**:
- **Absolute correctness guarantee** (if it verifies, it's correct)
- No ambiguity—either verifies or doesn't
- Can measure proof complexity

**Cons**:
- Requires Lean code (not just LaTeX)
- May reject correct but non-idiomatic proofs
- Computational cost (verification can be slow)
- Requires Lean installation

**Implementation**: `verify_lean_proof()`

## 5. Combined Multi-Metric Evaluation

**Best Practice**: Use multiple metrics together

**Recommended Weighting**:
- Answer correctness: 40% (most important)
- Rubric score: 40% (proof quality)
- Embedding similarity: 10% (semantic baseline)
- Lean verification: 10% (if available)

**Implementation**: `comprehensive_proof_evaluation()`

## Comparison Table

| Metric | What It Measures | Speed | Accuracy | Industry Use |
|--------|-----------------|-------|----------|--------------|
| **Answer Extraction** | Final answer correctness | ⚡⚡⚡ Fast | ✅ High | MATH dataset |
| **Rubric Scoring** | Proof quality & structure | ⚡⚡ Medium | ✅✅ High | ProofBench, MathArena |
| **Embedding Similarity** | Semantic similarity | ⚡⚡⚡ Fast | ⚠️ Medium | Baseline only |
| **Lean Verification** | Formal correctness | ⚡ Slow | ✅✅✅ Perfect | MiniF2F, formal math |

## Recommendations

### For LaTeX-Only Evaluation:
1. **Primary**: Answer extraction + verification (MATH dataset style)
2. **Secondary**: Rubric-based scoring (ProofBench style)
3. **Baseline**: Embedding similarity (for comparison)

### For Lean Evaluation:
1. **Primary**: Lean verification (formal correctness)
2. **Secondary**: Proof length/complexity metrics
3. **Tertiary**: Answer extraction (if answer is extractable)

### For Comprehensive Evaluation:
Use `comprehensive_proof_evaluation()` which combines all methods with appropriate weights.

## Example Usage

```python
from metrics.math_metrics import comprehensive_proof_evaluation

results = comprehensive_proof_evaluation(
    predicted_proof=predicted_latex,
    expected_proof=expected_latex,
    problem_statement=problem,
    lean_code=lean_code,  # Optional
    use_embeddings=True
)

# Results include:
# - answer_verification: Answer extraction & correctness
# - rubric_scoring: 0-7 scale proof quality
# - embedding_similarity: Semantic similarity
# - lean_verification: Formal verification (if provided)
# - overall_score: Weighted combination
```

## References

1. **MATH Dataset**: Hendrycks et al., "Measuring Mathematical Problem Solving With the MATH Dataset"
2. **ProofBench**: Welleck et al., "ProofBench: Evaluating Mathematical Proof Generation"
3. **MiniF2F**: Zheng et al., "MiniF2F: a cross-system benchmark for formal Olympiad-level mathematics"
4. **MathArena**: Recent competition math evaluation benchmark
5. **ProofGrader**: Expert-annotated proof evaluation system

## Future Improvements

1. **LLM-as-Judge**: Use GPT-4/Claude to evaluate proofs (like ProofGrader)
2. **Symbolic Equivalence**: Enhanced SymPy-based equivalence checking
3. **Proof Step Matching**: Align proof steps between predicted and expected
4. **Domain-Specific Metrics**: Geometry-specific, number theory-specific metrics
5. **Human Evaluation**: Gold standard for calibration
