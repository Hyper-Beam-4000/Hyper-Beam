"""
Model Superscore System

Aggregates per-problem scores into holistic model-level metrics that
capture overall quality, consistency, and reliability. Designed for
leaderboard ranking and model comparison dashboards.

Superscore dimensions:
  - weighted_mean:  Standard weighted mean of all problem scores
  - consistency:    1 - coefficient_of_variation (rewards low variance)
  - frontier:       Mean of top-k% scores (shows peak capability)
  - reliability:    Fraction of problems scoring above a threshold
  - difficulty_adj: Weighted mean where harder problems count more
  - percentiles:    P25, P50, P75, P90 of problem scores

All scores are 0-1 and JSON-serializable for the frontend.
"""

import math
import statistics
from dataclasses import dataclass, field, asdict
from typing import Dict, List, Optional, Any

from metrics.model_scorer import ModelScore, QuestionScore


# ============================================================================
# DATA CLASSES
# ============================================================================

@dataclass
class ModelSuperscore:
    """Holistic model-level scoring beyond simple mean."""
    model_name: str = ""

    # Core superscore (weighted combination of dimensions below)
    superscore: float = 0.0

    # Individual dimensions
    weighted_mean: float = 0.0
    consistency: float = 0.0
    frontier: float = 0.0
    reliability: float = 0.0
    difficulty_adjusted: float = 0.0

    # Percentile breakdown
    p25: float = 0.0
    p50: float = 0.0
    p75: float = 0.0
    p90: float = 0.0

    # Per-metric averages (for radar charts)
    metric_profile: Dict[str, float] = field(default_factory=dict)

    # Per-category means (for grouped bar charts)
    category_scores: Dict[str, float] = field(default_factory=dict)

    # Metadata
    num_problems: int = 0
    accuracy: float = 0.0

    def to_frontend_dict(self) -> Dict[str, Any]:
        """Return a flat dict ready for the frontend leaderboard/dashboard."""
        return {
            "model_name": self.model_name,
            "superscore": self.superscore,
            "weighted_mean": self.weighted_mean,
            "consistency": self.consistency,
            "frontier": self.frontier,
            "reliability": self.reliability,
            "difficulty_adjusted": self.difficulty_adjusted,
            "p25": self.p25,
            "p50": self.p50,
            "p75": self.p75,
            "p90": self.p90,
            "metric_profile": self.metric_profile,
            "category_scores": self.category_scores,
            "num_problems": self.num_problems,
            "accuracy": self.accuracy,
        }


# ============================================================================
# SUPERSCORE DIMENSION WEIGHTS
# ============================================================================

DEFAULT_SUPERSCORE_WEIGHTS: Dict[str, float] = {
    "weighted_mean": 0.40,
    "consistency": 0.15,
    "frontier": 0.15,
    "reliability": 0.20,
    "difficulty_adjusted": 0.10,
}


# ============================================================================
# DIMENSION COMPUTERS
# ============================================================================

def compute_weighted_mean(scores: List[float]) -> float:
    """Simple mean of all problem scores."""
    if not scores:
        return 0.0
    return statistics.mean(scores)


def compute_consistency(scores: List[float]) -> float:
    """
    1 - coefficient_of_variation. Rewards models that perform uniformly
    well rather than being great on some problems and terrible on others.
    Returns 0-1 (1 = perfectly consistent).
    """
    if len(scores) < 2:
        return 1.0
    mean = statistics.mean(scores)
    if mean == 0:
        return 0.0
    std = statistics.stdev(scores)
    cv = std / mean
    return max(0.0, min(1.0, 1.0 - cv))


def compute_frontier(scores: List[float], top_fraction: float = 0.25) -> float:
    """
    Mean of top-k% scores. Shows peak model capability — what the model
    can do when it "gets it right".
    """
    if not scores:
        return 0.0
    sorted_scores = sorted(scores, reverse=True)
    k = max(1, int(len(sorted_scores) * top_fraction))
    return statistics.mean(sorted_scores[:k])


def compute_reliability(scores: List[float], threshold: float = 0.5) -> float:
    """
    Fraction of problems where the model scores above a threshold.
    Answers: "How often can I trust this model to produce something usable?"
    """
    if not scores:
        return 0.0
    above = sum(1 for s in scores if s >= threshold)
    return above / len(scores)


def compute_difficulty_adjusted(
    question_scores: List[QuestionScore],
    difficulty_map: Optional[Dict[str, float]] = None,
) -> float:
    """
    Weighted mean where harder problems count more.

    difficulty_map maps problem_id -> difficulty weight (higher = harder).
    If not provided, uses a heuristic: problems where the average score
    across all submissions is lower are considered harder.
    """
    if not question_scores:
        return 0.0

    if difficulty_map:
        weights = [difficulty_map.get(q.problem_id, 1.0) for q in question_scores]
    else:
        # Heuristic: use inverse of score as difficulty proxy
        # (problems scored low are "harder" for this model)
        scores = [q.overall_score for q in question_scores]
        mean_score = statistics.mean(scores) if scores else 0.5
        weights = [
            1.0 + (1.0 - q.overall_score)  # range 1.0 to 2.0
            for q in question_scores
        ]

    total_weight = sum(weights)
    if total_weight == 0:
        return 0.0

    weighted_sum = sum(
        w * q.overall_score
        for w, q in zip(weights, question_scores)
    )
    return weighted_sum / total_weight


def compute_percentiles(scores: List[float]) -> Dict[str, float]:
    """Compute P25, P50, P75, P90."""
    if not scores:
        return {"p25": 0.0, "p50": 0.0, "p75": 0.0, "p90": 0.0}

    sorted_scores = sorted(scores)
    n = len(sorted_scores)

    def _percentile(p: float) -> float:
        idx = p * (n - 1)
        low = int(math.floor(idx))
        high = int(math.ceil(idx))
        if low == high:
            return sorted_scores[low]
        frac = idx - low
        return sorted_scores[low] * (1 - frac) + sorted_scores[high] * frac

    return {
        "p25": round(_percentile(0.25), 4),
        "p50": round(_percentile(0.50), 4),
        "p75": round(_percentile(0.75), 4),
        "p90": round(_percentile(0.90), 4),
    }


# ============================================================================
# MAIN SUPERSCORE FUNCTION
# ============================================================================

def compute_superscore(
    model_score: ModelScore,
    dimension_weights: Optional[Dict[str, float]] = None,
    difficulty_map: Optional[Dict[str, float]] = None,
    reliability_threshold: float = 0.5,
    frontier_fraction: float = 0.25,
) -> ModelSuperscore:
    """
    Compute a holistic superscore for a model from its per-problem scores.

    Args:
        model_score: ModelScore with question_scores populated
        dimension_weights: Weights for superscore dimensions (default provided)
        difficulty_map: Optional problem_id -> difficulty weight
        reliability_threshold: Minimum score to count as "reliable"
        frontier_fraction: Top fraction for frontier score

    Returns:
        ModelSuperscore with all dimensions computed
    """
    dw = dimension_weights or DEFAULT_SUPERSCORE_WEIGHTS
    qs = model_score.question_scores
    scores = [q.overall_score for q in qs]

    # Compute individual dimensions
    wmean = compute_weighted_mean(scores)
    cons = compute_consistency(scores)
    front = compute_frontier(scores, top_fraction=frontier_fraction)
    rel = compute_reliability(scores, threshold=reliability_threshold)
    diff_adj = compute_difficulty_adjusted(qs, difficulty_map=difficulty_map)

    # Composite superscore
    superscore = (
        dw.get("weighted_mean", 0.40) * wmean
        + dw.get("consistency", 0.15) * cons
        + dw.get("frontier", 0.15) * front
        + dw.get("reliability", 0.20) * rel
        + dw.get("difficulty_adjusted", 0.10) * diff_adj
    )

    pcts = compute_percentiles(scores)

    # Per-category means
    cat_scores: Dict[str, List[float]] = {}
    for q in qs:
        cat = q.category or "uncategorized"
        cat_scores.setdefault(cat, []).append(q.overall_score)
    category_means = {
        cat: round(statistics.mean(s), 4)
        for cat, s in cat_scores.items()
    }

    return ModelSuperscore(
        model_name=model_score.model_name,
        superscore=round(max(0.0, min(1.0, superscore)), 4),
        weighted_mean=round(wmean, 4),
        consistency=round(cons, 4),
        frontier=round(front, 4),
        reliability=round(rel, 4),
        difficulty_adjusted=round(diff_adj, 4),
        p25=pcts["p25"],
        p50=pcts["p50"],
        p75=pcts["p75"],
        p90=pcts["p90"],
        metric_profile=model_score.per_metric_means,
        category_scores=category_means,
        num_problems=model_score.num_questions,
        accuracy=model_score.accuracy,
    )


def rank_models(
    superscores: Dict[str, ModelSuperscore],
    sort_by: str = "superscore",
) -> List[Dict[str, Any]]:
    """
    Rank models by any superscore dimension. Returns a sorted list
    of frontend-ready dicts with a `rank` field.

    Args:
        superscores: model_name -> ModelSuperscore
        sort_by: Dimension to sort by (default: "superscore")

    Returns:
        List of dicts sorted by the chosen dimension, with rank added
    """
    entries = []
    for name, ss in superscores.items():
        d = ss.to_frontend_dict()
        entries.append(d)

    entries.sort(key=lambda d: d.get(sort_by, 0), reverse=True)

    for i, entry in enumerate(entries):
        entry["rank"] = i + 1

    return entries


def compare_superscores(
    superscores: Dict[str, ModelSuperscore],
) -> Dict[str, Any]:
    """
    Side-by-side comparison of all models across all superscore dimensions.
    Returns a structure convenient for frontend table or radar chart rendering.
    """
    dimensions = [
        "superscore", "weighted_mean", "consistency",
        "frontier", "reliability", "difficulty_adjusted",
        "accuracy",
    ]

    comparison = {
        "models": list(superscores.keys()),
        "dimensions": {},
        "rankings": {},
    }

    for dim in dimensions:
        values = {
            name: getattr(ss, dim, 0.0)
            for name, ss in superscores.items()
        }
        comparison["dimensions"][dim] = values

        # Rank for this dimension
        ranked = sorted(values.items(), key=lambda x: x[1], reverse=True)
        comparison["rankings"][dim] = {
            name: rank + 1 for rank, (name, _) in enumerate(ranked)
        }

    return comparison
