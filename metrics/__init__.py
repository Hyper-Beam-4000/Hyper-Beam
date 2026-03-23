"""
metrics — Proof evaluation and model scoring for competition math autoformalization.

Public API:

  Problem-level scoring:
    score_question()          Score a single problem (predicted vs reference)
    QuestionScore             Per-problem result dataclass

  Model-level scoring:
    score_model()             Aggregate question scores into model stats
    score_batch()             Score multiple problems and aggregate in one call
    compare_models()          Rank models with statistical significance
    ModelScore                Model-level result dataclass

  Model superscore:
    compute_superscore()      Holistic model score (consistency, frontier, reliability, ...)
    rank_models()             Rank models by any superscore dimension
    compare_superscores()     Side-by-side model comparison
    ModelSuperscore           Superscore result dataclass

  Weight presets:
    DEFAULT_WEIGHTS           Balanced for Lean-focused evaluation
    LATEX_ONLY_WEIGHTS        For pure LaTeX (no Lean code)
    LEAN_HEAVY_WEIGHTS        Maximizes formal verification weight
    WEIGHT_PRESETS            Dict of all presets by name

  Individual metrics (importable for custom pipelines):
    proof_embedding_similarity()   Cosine similarity via sentence-transformers
    rubric_based_scoring()         ProofBench 0-7 rubric
    reasoning_alignment_score()    Step-sequence alignment
    proof_technique_match_score()  Technique overlap (Jaccard)
    concept_coverage_score()       Math concept F1
    semantic_structure_score()     LaTeX structure + logical flow
    latex_structural_similarity()  Line-category sequence matching
    compare_lean_proofs()          Multi-dim Lean proof comparison
    classify_errors()              Heuristic error classification

  Export:
    export_scores()           Export to JSON / CSV / summary text
"""

# Problem-level
from metrics.model_scorer import (
    QuestionScore,
    ModelScore,
    score_question,
    score_model,
    score_batch,
    compare_models,
    export_scores,
    DEFAULT_WEIGHTS,
    LATEX_ONLY_WEIGHTS,
    LEAN_HEAVY_WEIGHTS,
    WEIGHT_PRESETS,
    # Individual metrics
    reasoning_alignment_score,
    proof_technique_match_score,
    concept_coverage_score,
    semantic_structure_score,
    latex_structural_similarity,
    classify_errors,
)

# Model superscore
from metrics.superscore import (
    ModelSuperscore,
    compute_superscore,
    rank_models,
    compare_superscores,
    DEFAULT_SUPERSCORE_WEIGHTS,
)

__all__ = [
    # Data classes
    "QuestionScore",
    "ModelScore",
    "ModelSuperscore",
    # Core scoring
    "score_question",
    "score_model",
    "score_batch",
    "compare_models",
    "export_scores",
    # Superscore
    "compute_superscore",
    "rank_models",
    "compare_superscores",
    # Weight presets
    "DEFAULT_WEIGHTS",
    "LATEX_ONLY_WEIGHTS",
    "LEAN_HEAVY_WEIGHTS",
    "WEIGHT_PRESETS",
    "DEFAULT_SUPERSCORE_WEIGHTS",
    # Individual metrics
    "reasoning_alignment_score",
    "proof_technique_match_score",
    "concept_coverage_score",
    "semantic_structure_score",
    "latex_structural_similarity",
    "classify_errors",
]
