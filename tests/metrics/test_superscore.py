"""
Tests for metrics/superscore.py
"""

import sys
from pathlib import Path

project_root = Path(__file__).parent.parent.parent
if str(project_root) not in sys.path:
    sys.path.insert(0, str(project_root))

from metrics.model_scorer import score_question, score_model, QuestionScore
from metrics.superscore import (
    ModelSuperscore,
    compute_superscore,
    rank_models,
    compare_superscores,
    compute_weighted_mean,
    compute_consistency,
    compute_frontier,
    compute_reliability,
    compute_percentiles,
)
from tests.metrics.test_data import (
    USAMO_QUESTION,
    USAMO_SOLUTION,
    GEMINI_PREDICTION,
    GPT_PREDICTION,
)


# ============================================================================
# DIMENSION UNIT TESTS
# ============================================================================

class TestComputeWeightedMean:
    def test_basic(self):
        result = compute_weighted_mean([0.5, 0.7, 0.9])
        assert abs(result - 0.7) < 1e-9

    def test_empty(self):
        assert compute_weighted_mean([]) == 0.0


class TestComputeConsistency:
    def test_identical_scores(self):
        """All same scores should give perfect consistency."""
        assert compute_consistency([0.8, 0.8, 0.8]) == 1.0

    def test_variable_scores(self):
        """Mixed scores should have lower consistency."""
        score = compute_consistency([0.1, 0.5, 0.9])
        assert 0.0 <= score <= 1.0
        assert score < 1.0

    def test_single_score(self):
        assert compute_consistency([0.5]) == 1.0


class TestComputeFrontier:
    def test_top_quarter(self):
        """Frontier of [0.1, 0.3, 0.5, 0.9] with top 25% should be 0.9."""
        assert compute_frontier([0.1, 0.3, 0.5, 0.9], top_fraction=0.25) == 0.9

    def test_empty(self):
        assert compute_frontier([]) == 0.0


class TestComputeReliability:
    def test_all_above(self):
        assert compute_reliability([0.6, 0.7, 0.8], threshold=0.5) == 1.0

    def test_none_above(self):
        assert compute_reliability([0.1, 0.2, 0.3], threshold=0.5) == 0.0

    def test_mixed(self):
        assert compute_reliability([0.3, 0.6, 0.8], threshold=0.5) == 2 / 3


class TestComputePercentiles:
    def test_basic(self):
        pcts = compute_percentiles([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1.0])
        assert pcts["p25"] > 0.0
        assert pcts["p50"] > pcts["p25"]
        assert pcts["p75"] > pcts["p50"]
        assert pcts["p90"] > pcts["p75"]

    def test_empty(self):
        pcts = compute_percentiles([])
        assert pcts["p50"] == 0.0


# ============================================================================
# INTEGRATION TESTS
# ============================================================================

class TestComputeSuperscore:
    def test_basic_superscore(self):
        """Compute superscore from real model scores."""
        q1 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION, problem=USAMO_QUESTION)
        q2 = score_question(GPT_PREDICTION, USAMO_SOLUTION, problem=USAMO_QUESTION)
        model = score_model([q1, q2], model_name="test_model")

        ss = compute_superscore(model)

        assert isinstance(ss, ModelSuperscore)
        assert ss.model_name == "test_model"
        assert 0.0 <= ss.superscore <= 1.0
        assert 0.0 <= ss.weighted_mean <= 1.0
        assert 0.0 <= ss.consistency <= 1.0
        assert 0.0 <= ss.frontier <= 1.0
        assert 0.0 <= ss.reliability <= 1.0
        assert ss.num_problems == 2

    def test_frontend_dict(self):
        """to_frontend_dict should produce expected keys."""
        q1 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)
        model = score_model([q1], model_name="test")
        ss = compute_superscore(model)
        fd = ss.to_frontend_dict()

        assert "superscore" in fd
        assert "weighted_mean" in fd
        assert "consistency" in fd
        assert "frontier" in fd
        assert "reliability" in fd
        assert "metric_profile" in fd
        assert "category_scores" in fd

    def test_empty_model(self):
        """Empty model should produce low superscore."""
        model = score_model([], model_name="empty")
        ss = compute_superscore(model)
        # consistency=1.0 for empty sets (no variance), so superscore won't be exactly 0
        assert ss.superscore <= 0.2
        assert ss.num_problems == 0
        assert ss.weighted_mean == 0.0


class TestRankModels:
    def test_ranking(self):
        """Rank multiple models by superscore."""
        q1 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)
        q2 = score_question(GPT_PREDICTION, USAMO_SOLUTION)

        model_a = score_model([q1], model_name="gemini")
        model_b = score_model([q2], model_name="gpt")

        ss_a = compute_superscore(model_a)
        ss_b = compute_superscore(model_b)

        ranked = rank_models({"gemini": ss_a, "gpt": ss_b})

        assert len(ranked) == 2
        assert ranked[0]["rank"] == 1
        assert ranked[1]["rank"] == 2
        assert ranked[0]["superscore"] >= ranked[1]["superscore"]

    def test_rank_by_dimension(self):
        """Should support ranking by any dimension."""
        q1 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)
        model = score_model([q1], model_name="test")
        ss = compute_superscore(model)

        ranked = rank_models({"test": ss}, sort_by="reliability")
        assert ranked[0]["rank"] == 1


class TestCompareSuperscores:
    def test_comparison(self):
        """Compare superscores side by side."""
        q1 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)
        q2 = score_question(GPT_PREDICTION, USAMO_SOLUTION)

        model_a = score_model([q1], model_name="gemini")
        model_b = score_model([q2], model_name="gpt")

        ss_a = compute_superscore(model_a)
        ss_b = compute_superscore(model_b)

        result = compare_superscores({"gemini": ss_a, "gpt": ss_b})

        assert "models" in result
        assert "dimensions" in result
        assert "rankings" in result
        assert "superscore" in result["dimensions"]
        assert len(result["models"]) == 2
