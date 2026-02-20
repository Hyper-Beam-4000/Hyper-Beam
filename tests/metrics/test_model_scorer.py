"""
Tests for metrics/model_scorer.py
"""

import json
import os
import sys
import tempfile
from pathlib import Path

# Add project root to Python path
project_root = Path(__file__).parent.parent.parent
if str(project_root) not in sys.path:
    sys.path.insert(0, str(project_root))

from metrics.model_scorer import (
    QuestionScore,
    ModelScore,
    DEFAULT_WEIGHTS,
    reasoning_alignment_score,
    proof_technique_match_score,
    concept_coverage_score,
    latex_structural_similarity,
    classify_errors,
    _redistribute_weights,
    score_question,
    score_model,
    compare_models,
    score_batch,
    export_scores,
    classify_errors_from_metrics,
)
from tests.metrics.test_data import (
    USAMO_QUESTION,
    USAMO_SOLUTION,
    GEMINI_PREDICTION,
    GPT_PREDICTION,
    LEAN_PROOF_SIMPLE,
    LEAN_PROOF_SIMPLE_ALT,
)


# ============================================================================
# NEW METRIC TESTS
# ============================================================================

class TestReasoningAlignment:
    def test_identical_proofs(self):
        """Identical proofs should have high alignment."""
        score = reasoning_alignment_score(GEMINI_PREDICTION, GEMINI_PREDICTION)
        assert score >= 0.9

    def test_different_proofs(self):
        """Different proofs should have lower alignment."""
        score = reasoning_alignment_score(GEMINI_PREDICTION, GPT_PREDICTION)
        assert 0.0 <= score <= 1.0

    def test_empty_input(self):
        """Empty input should return 0."""
        score = reasoning_alignment_score("", "some proof")
        assert score == 0.0

    def test_symmetry(self):
        """Score should be approximately symmetric."""
        s1 = reasoning_alignment_score(GEMINI_PREDICTION, GPT_PREDICTION)
        s2 = reasoning_alignment_score(GPT_PREDICTION, GEMINI_PREDICTION)
        assert abs(s1 - s2) < 0.3  # Approximately symmetric


class TestProofTechniqueMatch:
    def test_same_techniques(self):
        """Proofs with same techniques should score high."""
        proof_a = "We proceed by contradiction. Assume not."
        proof_b = "By contradiction, suppose the claim is false."
        score = proof_technique_match_score(proof_a, proof_b)
        assert score >= 0.8

    def test_different_techniques(self):
        """Proofs with different techniques should score lower."""
        proof_a = "We prove by induction on n. Base case: n=1."
        proof_b = "We proceed by contradiction."
        score = proof_technique_match_score(proof_a, proof_b)
        assert score < 0.8

    def test_no_techniques(self):
        """Proofs with no identifiable techniques should return 1.0 (neutral)."""
        proof_a = "x = 5"
        proof_b = "y = 10"
        score = proof_technique_match_score(proof_a, proof_b)
        assert score == 1.0


class TestConceptCoverage:
    def test_same_concepts(self):
        """Proofs covering same concepts should have high F1."""
        proof_a = "Since f is injective, f(a)=f(b) implies a=b."
        proof_b = "The function f is injective, so if f(x)=f(y) then x=y."
        score = concept_coverage_score(proof_a, proof_b)
        assert score >= 0.5

    def test_different_concepts(self):
        """Proofs with different concepts should score lower."""
        proof_a = "We use the parity argument and divisibility."
        proof_b = "By the Cauchy-Schwarz inequality and convergence."
        score = concept_coverage_score(proof_a, proof_b)
        assert score < 0.5

    def test_no_concepts(self):
        """No identifiable concepts should return 1.0 (neutral)."""
        score = concept_coverage_score("hello", "world")
        assert score == 1.0


class TestLatexStructuralSimilarity:
    def test_similar_structure(self):
        """Proofs with similar line structures should score high."""
        proof_a = "Let x = 5\nSince x > 0\nTherefore x^2 > 0"
        proof_b = "Let y = 3\nSince y > 0\nTherefore y^2 > 0"
        score = latex_structural_similarity(proof_a, proof_b)
        assert score >= 0.5

    def test_empty_proofs(self):
        """Empty proofs should return 1.0."""
        score = latex_structural_similarity("", "")
        assert score == 1.0


class TestClassifyErrors:
    def test_wrong_answer(self):
        """Should detect wrong answer."""
        pred = "Therefore the answer is \\boxed{42}\n\\square"
        ref = "Therefore the answer is \\boxed{1000}\n\\square"
        errors = classify_errors(pred, ref)
        assert 'wrong_answer' in errors

    def test_incomplete_proof(self):
        """Should detect incomplete proof (no conclusion marker)."""
        pred = "Let f(n) = n.\nWe show that f(f(n)) = n.\nSince f is injective, blah blah blah"
        ref = "Therefore f(n) = n for all n.\n\\square"
        errors = classify_errors(pred, ref)
        assert 'incomplete' in errors

    def test_no_errors(self):
        """Should return ['none'] for correct proof."""
        ref = "Therefore f(1000) = 1000\n\\square"
        errors = classify_errors(ref, ref)
        assert 'none' in errors


# ============================================================================
# WEIGHT REDISTRIBUTION TESTS
# ============================================================================

class TestWeightRedistribution:
    def test_all_metrics_available(self):
        """When all metrics available, weights should be unchanged."""
        all_metrics = list(DEFAULT_WEIGHTS.keys())
        result = _redistribute_weights(DEFAULT_WEIGHTS, all_metrics)
        total = sum(result.values())
        assert abs(total - 1.0) < 1e-6

    def test_subset_metrics(self):
        """Weights should sum to 1.0 even with subset of metrics."""
        available = ['answer_correctness', 'rubric_score', 'embedding_similarity']
        result = _redistribute_weights(DEFAULT_WEIGHTS, available)
        total = sum(result.values())
        assert abs(total - 1.0) < 1e-6

    def test_single_metric(self):
        """Single metric should get weight 1.0."""
        result = _redistribute_weights(DEFAULT_WEIGHTS, ['answer_correctness'])
        assert abs(result['answer_correctness'] - 1.0) < 1e-6

    def test_proportional_redistribution(self):
        """Weights should maintain proportions after redistribution."""
        available = ['answer_correctness', 'rubric_score']  # 0.25 and 0.20
        result = _redistribute_weights(DEFAULT_WEIGHTS, available)
        # Ratio should be preserved: 0.25 / 0.20 = 1.25
        ratio = result['answer_correctness'] / result['rubric_score']
        assert abs(ratio - 1.25) < 1e-6


# ============================================================================
# SCORING TESTS
# ============================================================================

class TestScoreQuestion:
    def test_basic_scoring(self):
        """Basic scoring should work without Lean code."""
        result = score_question(
            predicted=GEMINI_PREDICTION,
            expected=USAMO_SOLUTION,
            problem=USAMO_QUESTION,
        )

        assert isinstance(result, QuestionScore)
        assert 0.0 <= result.overall_score <= 1.0
        assert len(result.available_metrics) > 0
        assert abs(sum(result.weights_used.values()) - 1.0) < 1e-6

    def test_no_lean_graceful_degradation(self):
        """Should work without Lean code (graceful degradation)."""
        result = score_question(
            predicted=GPT_PREDICTION,
            expected=USAMO_SOLUTION,
        )

        # Lean metrics should NOT be in available
        assert 'lean_compiles' not in result.available_metrics
        assert 'lean_sorry_free' not in result.available_metrics
        assert 'lean_comparison' not in result.available_metrics
        # Other metrics should be present
        assert 'answer_correctness' in result.available_metrics
        assert 'rubric_score' in result.available_metrics
        assert 0.0 <= result.overall_score <= 1.0

    def test_metric_values_in_range(self):
        """All metric values should be in [0, 1]."""
        result = score_question(
            predicted=GEMINI_PREDICTION,
            expected=USAMO_SOLUTION,
        )

        for metric, value in result.metric_values.items():
            assert 0.0 <= value <= 1.0, f"{metric} = {value} out of range"


class TestScoreModel:
    def test_model_aggregation(self):
        """Aggregate multiple question scores."""
        q1 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)
        q2 = score_question(GPT_PREDICTION, USAMO_SOLUTION)

        model = score_model([q1, q2], model_name="test_model")

        assert isinstance(model, ModelScore)
        assert model.model_name == "test_model"
        assert model.num_questions == 2
        assert 0.0 <= model.mean_score <= 1.0
        assert 0.0 <= model.median_score <= 1.0
        assert model.std_score >= 0.0
        assert model.confidence_interval_95[0] <= model.confidence_interval_95[1]

    def test_ci_computation(self):
        """95% CI should bracket the mean."""
        q1 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)
        q2 = score_question(GPT_PREDICTION, USAMO_SOLUTION)
        q3 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)

        model = score_model([q1, q2, q3])

        ci_low, ci_high = model.confidence_interval_95
        # CI should contain the mean (or be very close)
        assert ci_low <= model.mean_score + 0.01
        assert ci_high >= model.mean_score - 0.01

    def test_empty_scores(self):
        """Empty question scores should return zeroed ModelScore."""
        model = score_model([])
        assert model.mean_score == 0.0
        assert model.num_questions == 0

    def test_error_analysis(self):
        """Error analysis should categorize errors."""
        q1 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)
        model = score_model([q1])
        assert isinstance(model.error_analysis, dict)


# ============================================================================
# MODEL COMPARISON TESTS
# ============================================================================

class TestCompareModels:
    def test_model_comparison(self):
        """Compare two models and get rankings."""
        q_gemini = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)
        q_gpt = score_question(GPT_PREDICTION, USAMO_SOLUTION)

        model_a = score_model([q_gemini], model_name="gemini")
        model_b = score_model([q_gpt], model_name="gpt")

        result = compare_models({"gemini": model_a, "gpt": model_b})

        assert 'rankings' in result
        assert 'significance' in result
        assert 'summary' in result
        assert len(result['rankings']) == 2
        assert set(result['rankings'].values()) == {1, 2}


# ============================================================================
# BATCH AND EXPORT TESTS
# ============================================================================

class TestBatchScoring:
    def test_score_batch(self):
        """Batch scoring should aggregate correctly."""
        preds = [GEMINI_PREDICTION, GPT_PREDICTION]
        refs = [USAMO_SOLUTION, USAMO_SOLUTION]

        model = score_batch(preds, refs, model_name="batch_test")

        assert model.num_questions == 2
        assert model.model_name == "batch_test"

    def test_score_batch_length_mismatch(self):
        """Mismatched lengths should raise ValueError."""
        try:
            score_batch(["a"], ["b", "c"])
            assert False, "Should have raised ValueError"
        except ValueError:
            pass


class TestExportScores:
    def test_json_export(self):
        """Export to JSON should produce valid JSON."""
        q1 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)
        model = score_model([q1], model_name="test")

        with tempfile.NamedTemporaryFile(suffix='.json', delete=False, mode='w') as f:
            path = f.name

        try:
            export_scores({"test": model}, path, format="json")
            with open(path) as f:
                data = json.load(f)
            assert "test" in data
            assert "mean_score" in data["test"]
        finally:
            os.unlink(path)

    def test_csv_export(self):
        """Export to CSV should produce valid CSV."""
        q1 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)
        model = score_model([q1], model_name="test")

        with tempfile.NamedTemporaryFile(suffix='.csv', delete=False, mode='w') as f:
            path = f.name

        try:
            export_scores({"test": model}, path, format="csv")
            with open(path) as f:
                content = f.read()
            assert "test" in content
            assert "mean_score" in content
        finally:
            os.unlink(path)

    def test_summary_export(self):
        """Export to summary should produce readable text."""
        q1 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)
        model = score_model([q1], model_name="test")

        with tempfile.NamedTemporaryFile(suffix='.txt', delete=False, mode='w') as f:
            path = f.name

        try:
            export_scores({"test": model}, path, format="summary")
            with open(path) as f:
                content = f.read()
            assert "Model: test" in content
            assert "Mean Score" in content
        finally:
            os.unlink(path)

    def test_invalid_format(self):
        """Invalid format should raise ValueError."""
        q1 = score_question(GEMINI_PREDICTION, USAMO_SOLUTION)
        model = score_model([q1], model_name="test")

        try:
            export_scores({"test": model}, "/tmp/test.xyz", format="xyz")
            assert False, "Should have raised ValueError"
        except ValueError:
            pass
