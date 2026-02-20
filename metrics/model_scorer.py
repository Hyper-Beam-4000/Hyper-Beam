"""
Unified Model Scoring System

Combines all evaluation metrics with graceful degradation when some
metrics are unavailable. Supports per-question scoring, model-level
aggregation, model comparison, and export.
"""

import json
import math
import os
import re
import statistics
from collections import Counter
from dataclasses import dataclass, field, asdict
from difflib import SequenceMatcher
from typing import Optional, List, Dict, Any, Tuple


# ============================================================================
# DATA CLASSES
# ============================================================================

@dataclass
class QuestionScore:
    """Per-question evaluation results."""
    metric_values: Dict[str, float] = field(default_factory=dict)
    available_metrics: List[str] = field(default_factory=list)
    weights_used: Dict[str, float] = field(default_factory=dict)
    overall_score: float = 0.0
    errors: List[str] = field(default_factory=list)


@dataclass
class ModelScore:
    """Aggregated model-level evaluation results."""
    model_name: str = ""
    mean_score: float = 0.0
    median_score: float = 0.0
    std_score: float = 0.0
    confidence_interval_95: Tuple[float, float] = (0.0, 0.0)
    accuracy: float = 0.0
    per_metric_means: Dict[str, float] = field(default_factory=dict)
    per_category_breakdown: Dict[str, Dict[str, float]] = field(default_factory=dict)
    error_analysis: Dict[str, int] = field(default_factory=dict)
    num_questions: int = 0
    question_scores: List[QuestionScore] = field(default_factory=list)


# ============================================================================
# DEFAULT WEIGHTS
# ============================================================================

DEFAULT_WEIGHTS: Dict[str, float] = {
    'answer_correctness':     0.25,
    'rubric_score':           0.20,
    'lean_compiles':          0.10,
    'reasoning_alignment':    0.10,
    'llm_judge_score':        0.10,
    'lean_sorry_free':        0.05,
    'lean_comparison':        0.05,
    'embedding_similarity':   0.05,
    'proof_technique_match':  0.05,
    'concept_coverage':       0.05,
}


# ============================================================================
# NEW METRIC IMPLEMENTATIONS
# ============================================================================

def reasoning_alignment_score(predicted: str, reference: str) -> float:
    """
    Compute reasoning alignment by splitting proofs into math steps,
    computing optimal alignment via SequenceMatcher, and penalizing
    order inversions.

    Returns:
        Float 0-1 alignment score
    """
    def _split_steps(text: str) -> List[str]:
        """Split proof text into individual reasoning steps."""
        lines = [l.strip() for l in text.split('\n') if l.strip()]
        steps = []
        for line in lines:
            # Split on logical connectors if line is long
            if len(line) > 150:
                sub = re.split(r'(?:therefore|thus|hence|implies|so that)\b', line, flags=re.IGNORECASE)
                steps.extend(s.strip() for s in sub if s.strip())
            else:
                steps.append(line)
        return steps

    pred_steps = _split_steps(predicted)
    ref_steps = _split_steps(reference)

    if not pred_steps or not ref_steps:
        return 0.0

    # Compute alignment using SequenceMatcher
    matcher = SequenceMatcher(None, pred_steps, ref_steps)
    alignment_score = matcher.ratio()

    # Penalize order inversions
    # Find matched pairs and check ordering
    matching_blocks = matcher.get_matching_blocks()
    if len(matching_blocks) > 2:  # More than just the sentinel
        positions = [(block.a, block.b) for block in matching_blocks if block.size > 0]
        inversions = 0
        for i in range(len(positions)):
            for j in range(i + 1, len(positions)):
                if positions[i][1] > positions[j][1]:
                    inversions += 1
        max_inversions = max(len(positions) * (len(positions) - 1) / 2, 1)
        order_penalty = inversions / max_inversions
        alignment_score *= (1.0 - 0.3 * order_penalty)

    return max(0.0, min(1.0, alignment_score))


# Proof technique patterns for detection
PROOF_TECHNIQUES = {
    'induction': r'\b(?:induction|inductive|base\s+case|inductive\s+step|strong\s+induction)\b',
    'contradiction': r'\b(?:contradiction|assume\s+not|suppose\s+not|absurd|by_contra)\b',
    'cases': r'\b(?:cases?|case\s+\d|by_cases|wlog|without\s+loss)\b',
    'pigeonhole': r'\b(?:pigeonhole|pigeon\s*hole)\b',
    'extremal': r'\b(?:extremal|maxim|minim|extreme|smallest|largest|greedy)\b',
    'constructive': r'\b(?:construct|define|let\s+\w+\s*=|set\s+\w+\s*=)\b',
    'counting': r'\b(?:count|double\s+counting|bijection|surjection|injection|combinat)\b',
    'invariant': r'\b(?:invariant|monovariant|coloring|parity\s+argument)\b',
    'generating_function': r'\b(?:generating\s+function|power\s+series|ogf|egf)\b',
    'modular_arithmetic': r'\b(?:modular|mod\s+\d|congruence|residue|\\pmod)\b',
    'algebraic_manipulation': r'\b(?:factor|expand|substitute|rearrang|telescop)\b',
    'geometric': r'\b(?:similar\s+triangles|homothety|inversion|projective|barycentric)\b',
}


def proof_technique_match_score(predicted: str, reference: str) -> float:
    """
    Detect proof techniques used in both proofs and compute overlap.
    Uses regex-based detection of 12 common proof techniques.

    Returns:
        Float 0-1 technique match score
    """
    def _detect_techniques(text: str) -> set:
        text_lower = text.lower()
        return {
            name
            for name, pattern in PROOF_TECHNIQUES.items()
            if re.search(pattern, text_lower)
        }

    pred_tech = _detect_techniques(predicted)
    ref_tech = _detect_techniques(reference)

    if not pred_tech and not ref_tech:
        return 1.0  # Neither uses identifiable techniques — neutral

    if not pred_tech or not ref_tech:
        return 0.3  # One has techniques, other doesn't

    # Jaccard similarity
    jaccard = len(pred_tech & ref_tech) / len(pred_tech | ref_tech)

    # Primary technique bonus: if both share the first/main technique
    # (approximate by checking if any technique matches)
    primary_bonus = 0.2 if pred_tech & ref_tech else 0.0

    return min(1.0, jaccard + primary_bonus)


# Math concept categories for detection
MATH_CONCEPTS = {
    'injectivity': r'\b(?:injective|one.to.one|1-1|inject)\b',
    'surjectivity': r'\b(?:surjective|onto|surject)\b',
    'divisibility': r'\b(?:divides?|divisib|\\mid|factor|multiple)\b',
    'fixed_points': r'\b(?:fixed\s+point|f\(x\)\s*=\s*x|f\(n\)\s*=\s*n)\b',
    'parity': r'\b(?:parity|even|odd|\\pmod\s*\{?\s*2)\b',
    'prime': r'\b(?:prime|coprime|gcd|lcm|relatively\s+prime)\b',
    'continuity': r'\b(?:continuous|continuity|epsilon.delta)\b',
    'convergence': r'\b(?:converge|limit|cauchy|bounded)\b',
    'inequalities': r'\b(?:inequality|AM.GM|Cauchy.Schwarz|Jensen|\\leq|\\geq)\b',
    'polynomials': r'\b(?:polynomial|degree|root|coefficient|irreducib)\b',
    'combinatorics': r'\b(?:choose|binom|permutation|combination|\\binom)\b',
    'number_theory': r'\b(?:Fermat|Euler|totient|quadratic\s+resid|Legendre)\b',
    'functional_equations': r'\b(?:functional\s+equation|Cauchy\s+equation|f\(x\+y\))\b',
}


def concept_coverage_score(predicted: str, reference: str) -> float:
    """
    Detect mathematical concept categories in both proofs and compute
    F1 score on coverage.

    Returns:
        Float 0-1 concept coverage F1 score
    """
    def _detect_concepts(text: str) -> set:
        text_lower = text.lower()
        return {
            name
            for name, pattern in MATH_CONCEPTS.items()
            if re.search(pattern, text_lower)
        }

    pred_concepts = _detect_concepts(predicted)
    ref_concepts = _detect_concepts(reference)

    if not pred_concepts and not ref_concepts:
        return 1.0  # Neither has identifiable concepts — neutral

    if not ref_concepts:
        return 0.5

    # F1 score
    tp = len(pred_concepts & ref_concepts)
    precision = tp / len(pred_concepts) if pred_concepts else 0.0
    recall = tp / len(ref_concepts) if ref_concepts else 0.0

    if precision + recall == 0:
        return 0.0

    f1 = 2 * precision * recall / (precision + recall)
    return f1


def llm_judge_evaluate(
    predicted: str,
    reference: str,
    problem: str,
    model: str = "gpt-4o",
) -> Optional[float]:
    """
    Use an LLM as an expert judge to evaluate proof quality.

    Sends a structured prompt to the LLM and gets 0-10 scores on 5 dimensions:
    correctness, completeness, clarity, rigor, elegance.

    Opt-in: off by default. Requires OPENAI_API_KEY environment variable.

    Args:
        predicted: Predicted proof text
        reference: Reference proof text
        problem: Problem statement
        model: LLM model to use

    Returns:
        Normalized score (0-1) or None if unavailable
    """
    api_key = os.environ.get("OPENAI_API_KEY")
    if not api_key:
        return None

    try:
        from openai import OpenAI
    except ImportError:
        return None

    prompt = f"""You are an expert mathematics proof evaluator. Score the predicted proof against the reference proof on these dimensions (0-10 each):

1. **Correctness**: Are all mathematical claims and steps valid?
2. **Completeness**: Does the proof address all necessary cases and steps?
3. **Clarity**: Is the proof well-organized and easy to follow?
4. **Rigor**: Are claims properly justified with appropriate level of formality?
5. **Elegance**: Is the proof efficient and well-crafted?

Problem Statement:
{problem}

Reference Proof:
{reference}

Predicted Proof:
{predicted}

Respond ONLY with a JSON object in this exact format:
{{"correctness": <0-10>, "completeness": <0-10>, "clarity": <0-10>, "rigor": <0-10>, "elegance": <0-10>}}"""

    try:
        client = OpenAI(api_key=api_key)
        response = client.chat.completions.create(
            model=model,
            messages=[{"role": "user", "content": prompt}],
            temperature=0.0,
            max_tokens=100,
        )

        content = response.choices[0].message.content.strip()
        scores = json.loads(content)

        # Weighted combination (correctness matters most)
        weights = {
            'correctness': 0.35,
            'completeness': 0.25,
            'clarity': 0.15,
            'rigor': 0.15,
            'elegance': 0.10,
        }

        weighted_sum = sum(
            weights[dim] * scores.get(dim, 0) / 10.0
            for dim in weights
        )
        return round(max(0.0, min(1.0, weighted_sum)), 4)

    except Exception:
        return None


# Line categories for LaTeX structural similarity
_LINE_CATEGORIES = [
    ('EQUATION', re.compile(r'.*[=<>\\leq\\geq\\equiv\\sim].*')),
    ('DEFINITION', re.compile(r'^\s*(?:let|define|set|denote)\b', re.IGNORECASE)),
    ('CONCLUSION', re.compile(r'^\s*(?:therefore|thus|hence|so|qed|\\square|\\blacksquare)\b', re.IGNORECASE)),
    ('CONNECTOR', re.compile(r'^\s*(?:since|because|by|from|using|implies|if|then|assume|suppose)\b', re.IGNORECASE)),
    ('ASSERTION', re.compile(r'.+')),  # Default catch-all
]


def latex_structural_similarity(predicted: str, reference: str) -> float:
    """
    Categorize proof lines as EQUATION/ASSERTION/CONNECTOR/DEFINITION/CONCLUSION,
    then compare sequences via SequenceMatcher.

    Returns:
        Float 0-1 structural similarity score
    """
    def _categorize_lines(text: str) -> List[str]:
        categories = []
        for line in text.split('\n'):
            line = line.strip()
            if not line:
                continue
            for cat_name, pattern in _LINE_CATEGORIES:
                if pattern.search(line):
                    categories.append(cat_name)
                    break
        return categories

    pred_cats = _categorize_lines(predicted)
    ref_cats = _categorize_lines(reference)

    if not pred_cats and not ref_cats:
        return 1.0

    if not pred_cats or not ref_cats:
        return 0.0

    return SequenceMatcher(None, pred_cats, ref_cats).ratio()


def classify_errors(predicted: str, reference: str) -> List[str]:
    """
    Heuristic error classification for a predicted proof vs reference.

    Returns:
        List of error category strings
    """
    errors = []
    pred_lower = predicted.lower()
    ref_lower = reference.lower()

    # Check for wrong answer
    from metrics.math_metrics import extract_final_answer, verify_answer_correctness
    pred_ans = extract_final_answer(predicted)
    ref_ans = extract_final_answer(reference)
    is_correct, _ = verify_answer_correctness(pred_ans, ref_ans)
    if not is_correct:
        errors.append('wrong_answer')

    # Check for wrong technique
    pred_tech = {
        name for name, pattern in PROOF_TECHNIQUES.items()
        if re.search(pattern, pred_lower)
    }
    ref_tech = {
        name for name, pattern in PROOF_TECHNIQUES.items()
        if re.search(pattern, ref_lower)
    }
    if pred_tech and ref_tech and not (pred_tech & ref_tech):
        errors.append('wrong_technique')

    # Missing case analysis
    ref_cases = len(re.findall(r'\bcase\b', ref_lower))
    pred_cases = len(re.findall(r'\bcase\b', pred_lower))
    if ref_cases > 1 and pred_cases < ref_cases:
        errors.append('missing_case')

    # Logical gap detection
    ref_steps = len([l for l in reference.split('\n') if l.strip()])
    pred_steps = len([l for l in predicted.split('\n') if l.strip()])
    if pred_steps < ref_steps * 0.5 and ref_steps > 5:
        errors.append('logical_gap')

    # Incomplete proof
    conclusion_markers = ['therefore', 'thus', 'hence', '\\square', 'qed', '\\blacksquare']
    has_conclusion = any(m in pred_lower for m in conclusion_markers)
    if not has_conclusion and len(predicted.strip()) > 50:
        errors.append('incomplete')

    # Sorry in Lean (if applicable)
    if 'sorry' in pred_lower:
        errors.append('sorry_present')

    return errors if errors else ['none']


# ============================================================================
# WEIGHT REDISTRIBUTION
# ============================================================================

def _redistribute_weights(
    weights: Dict[str, float],
    available_metrics: List[str],
) -> Dict[str, float]:
    """
    Redistribute weights proportionally among available metrics so they sum to 1.0.
    """
    available_weight = sum(weights.get(m, 0) for m in available_metrics)
    if available_weight <= 0:
        # Equal distribution fallback
        n = len(available_metrics) if available_metrics else 1
        return {m: 1.0 / n for m in available_metrics}

    return {
        m: weights.get(m, 0) / available_weight
        for m in available_metrics
    }


# ============================================================================
# CORE SCORING FUNCTIONS
# ============================================================================

def score_question(
    predicted: str,
    expected: str,
    problem: Optional[str] = None,
    predicted_lean: Optional[str] = None,
    expected_lean: Optional[str] = None,
    weights: Optional[Dict[str, float]] = None,
    use_llm_judge: bool = False,
    category: Optional[str] = None,
) -> QuestionScore:
    """
    Score a single predicted proof against a reference using all available metrics.

    Args:
        predicted: Predicted proof text (LaTeX/natural language)
        expected: Reference proof text
        problem: Problem statement (optional, used for context)
        predicted_lean: Predicted Lean 4 proof code (optional)
        expected_lean: Reference Lean 4 proof code (optional)
        weights: Custom metric weights (default: DEFAULT_WEIGHTS)
        use_llm_judge: Whether to use LLM-as-judge (requires OPENAI_API_KEY)
        category: Problem category for breakdown tracking

    Returns:
        QuestionScore with all metric values and overall score
    """
    w = weights or DEFAULT_WEIGHTS.copy()
    result = QuestionScore()
    metric_values: Dict[str, float] = {}
    available: List[str] = []

    # --- Answer correctness (binary) ---
    try:
        from metrics.math_metrics import extract_final_answer, verify_answer_correctness
        pred_ans = extract_final_answer(predicted)
        exp_ans = extract_final_answer(expected)
        is_correct, confidence = verify_answer_correctness(pred_ans, exp_ans, problem)
        metric_values['answer_correctness'] = 1.0 if is_correct else 0.0
        available.append('answer_correctness')
    except Exception as e:
        result.errors.append(f'answer_correctness: {e}')

    # --- Rubric score (0-7 normalized to 0-1) ---
    try:
        from metrics.math_metrics import rubric_based_scoring
        rubric_result = rubric_based_scoring(predicted, expected, problem)
        metric_values['rubric_score'] = rubric_result['normalized_score']
        available.append('rubric_score')
    except Exception as e:
        result.errors.append(f'rubric_score: {e}')

    # --- Lean compiles (binary) ---
    if predicted_lean:
        try:
            from metrics.math_metrics import verify_lean_proof
            lean_result = verify_lean_proof(predicted_lean)
            metric_values['lean_compiles'] = 1.0 if lean_result['is_valid'] else 0.0
            available.append('lean_compiles')

            # Lean sorry-free (binary)
            metric_values['lean_sorry_free'] = 1.0 if not lean_result['has_sorry'] else 0.0
            available.append('lean_sorry_free')
        except Exception as e:
            result.errors.append(f'lean_compiles: {e}')

    # --- Lean comparison ---
    if predicted_lean and expected_lean:
        try:
            from metrics.lean_proof_comparison import compare_lean_proofs
            comparison = compare_lean_proofs(predicted_lean, expected_lean)
            metric_values['lean_comparison'] = comparison.combined_score
            available.append('lean_comparison')
        except Exception as e:
            result.errors.append(f'lean_comparison: {e}')

    # --- Reasoning alignment ---
    try:
        metric_values['reasoning_alignment'] = reasoning_alignment_score(predicted, expected)
        available.append('reasoning_alignment')
    except Exception as e:
        result.errors.append(f'reasoning_alignment: {e}')

    # --- Embedding similarity ---
    try:
        from metrics.math_metrics import proof_embedding_similarity
        metric_values['embedding_similarity'] = proof_embedding_similarity(predicted, expected)
        available.append('embedding_similarity')
    except Exception as e:
        result.errors.append(f'embedding_similarity: {e}')

    # --- Proof technique match ---
    try:
        metric_values['proof_technique_match'] = proof_technique_match_score(predicted, expected)
        available.append('proof_technique_match')
    except Exception as e:
        result.errors.append(f'proof_technique_match: {e}')

    # --- Concept coverage ---
    try:
        metric_values['concept_coverage'] = concept_coverage_score(predicted, expected)
        available.append('concept_coverage')
    except Exception as e:
        result.errors.append(f'concept_coverage: {e}')

    # --- LLM judge (opt-in) ---
    if use_llm_judge and problem:
        try:
            llm_score = llm_judge_evaluate(predicted, expected, problem)
            if llm_score is not None:
                metric_values['llm_judge_score'] = llm_score
                available.append('llm_judge_score')
        except Exception as e:
            result.errors.append(f'llm_judge_score: {e}')

    # Redistribute weights among available metrics
    redistributed = _redistribute_weights(w, available)

    # Compute overall score
    overall = sum(
        redistributed.get(m, 0) * metric_values.get(m, 0)
        for m in available
    )

    result.metric_values = metric_values
    result.available_metrics = available
    result.weights_used = redistributed
    result.overall_score = round(max(0.0, min(1.0, overall)), 4)

    return result


def score_model(
    question_scores: List[QuestionScore],
    model_name: str = "",
) -> ModelScore:
    """
    Aggregate per-question scores into model-level statistics.

    Includes bootstrap 95% confidence interval (1000 samples).
    """
    import random

    if not question_scores:
        return ModelScore(model_name=model_name)

    overall_scores = [q.overall_score for q in question_scores]

    # Basic stats
    mean = statistics.mean(overall_scores)
    median = statistics.median(overall_scores)
    std = statistics.stdev(overall_scores) if len(overall_scores) > 1 else 0.0

    # Accuracy: fraction with answer_correctness == 1.0
    correct_count = sum(
        1 for q in question_scores
        if q.metric_values.get('answer_correctness', 0) == 1.0
    )
    accuracy = correct_count / len(question_scores)

    # Per-metric means
    all_metrics = set()
    for q in question_scores:
        all_metrics.update(q.metric_values.keys())

    per_metric_means = {}
    for metric in all_metrics:
        values = [
            q.metric_values[metric]
            for q in question_scores
            if metric in q.metric_values
        ]
        if values:
            per_metric_means[metric] = round(statistics.mean(values), 4)

    # Bootstrap 95% CI
    random.seed(42)
    n_bootstrap = 1000
    bootstrap_means = []
    for _ in range(n_bootstrap):
        sample = random.choices(overall_scores, k=len(overall_scores))
        bootstrap_means.append(statistics.mean(sample))
    bootstrap_means.sort()
    ci_lower = bootstrap_means[int(0.025 * n_bootstrap)]
    ci_upper = bootstrap_means[int(0.975 * n_bootstrap)]

    # Error analysis
    error_counts: Dict[str, int] = Counter()
    for q in question_scores:
        errors = classify_errors_from_metrics(q)
        for err in errors:
            error_counts[err] += 1

    return ModelScore(
        model_name=model_name,
        mean_score=round(mean, 4),
        median_score=round(median, 4),
        std_score=round(std, 4),
        confidence_interval_95=(round(ci_lower, 4), round(ci_upper, 4)),
        accuracy=round(accuracy, 4),
        per_metric_means=per_metric_means,
        error_analysis=dict(error_counts),
        num_questions=len(question_scores),
        question_scores=question_scores,
    )


def classify_errors_from_metrics(q: QuestionScore) -> List[str]:
    """Classify errors based on metric values in a QuestionScore."""
    errors = []
    mv = q.metric_values

    if mv.get('answer_correctness', 1.0) < 0.5:
        errors.append('wrong_answer')
    if mv.get('rubric_score', 1.0) < 0.3:
        errors.append('low_quality')
    if 'lean_compiles' in mv and mv['lean_compiles'] < 0.5:
        errors.append('lean_compilation_failure')
    if mv.get('reasoning_alignment', 1.0) < 0.3:
        errors.append('poor_reasoning')
    if mv.get('concept_coverage', 1.0) < 0.3:
        errors.append('missing_concepts')
    if mv.get('proof_technique_match', 1.0) < 0.3:
        errors.append('wrong_technique')

    return errors if errors else ['none']


def compare_models(
    model_scores: Dict[str, ModelScore],
) -> Dict[str, Any]:
    """
    Compare multiple models: rank by mean score and compute pairwise
    significance using Wilcoxon signed-rank test.
    """
    from scipy.stats import wilcoxon

    # Rankings
    ranked = sorted(
        model_scores.items(),
        key=lambda x: x[1].mean_score,
        reverse=True,
    )
    rankings = {name: rank + 1 for rank, (name, _) in enumerate(ranked)}

    # Pairwise significance tests
    significance = {}
    model_names = list(model_scores.keys())
    for i in range(len(model_names)):
        for j in range(i + 1, len(model_names)):
            name_a = model_names[i]
            name_b = model_names[j]
            scores_a = [q.overall_score for q in model_scores[name_a].question_scores]
            scores_b = [q.overall_score for q in model_scores[name_b].question_scores]

            # Need same length for paired test
            min_len = min(len(scores_a), len(scores_b))
            if min_len < 5:
                significance[f'{name_a}_vs_{name_b}'] = {
                    'p_value': None,
                    'significant': None,
                    'reason': 'insufficient_samples',
                }
                continue

            try:
                stat, p_value = wilcoxon(scores_a[:min_len], scores_b[:min_len])
                significance[f'{name_a}_vs_{name_b}'] = {
                    'statistic': round(float(stat), 4),
                    'p_value': round(float(p_value), 6),
                    'significant': p_value < 0.05,
                }
            except Exception as e:
                significance[f'{name_a}_vs_{name_b}'] = {
                    'p_value': None,
                    'significant': None,
                    'reason': str(e),
                }

    return {
        'rankings': rankings,
        'significance': significance,
        'summary': [
            {
                'model': name,
                'rank': rankings[name],
                'mean': score.mean_score,
                'median': score.median_score,
                'std': score.std_score,
                'accuracy': score.accuracy,
                'ci_95': score.confidence_interval_95,
            }
            for name, score in ranked
        ],
    }


def score_batch(
    predictions: List[str],
    references: List[str],
    model_name: str = "",
    problems: Optional[List[str]] = None,
    predicted_leans: Optional[List[str]] = None,
    expected_leans: Optional[List[str]] = None,
    weights: Optional[Dict[str, float]] = None,
    use_llm_judge: bool = False,
) -> ModelScore:
    """
    Convenience wrapper: score all question pairs and aggregate.
    """
    if len(predictions) != len(references):
        raise ValueError("predictions and references must have the same length")

    question_scores = []
    for i in range(len(predictions)):
        q = score_question(
            predicted=predictions[i],
            expected=references[i],
            problem=problems[i] if problems else None,
            predicted_lean=predicted_leans[i] if predicted_leans else None,
            expected_lean=expected_leans[i] if expected_leans else None,
            weights=weights,
            use_llm_judge=use_llm_judge,
        )
        question_scores.append(q)

    return score_model(question_scores, model_name=model_name)


# ============================================================================
# EXPORT
# ============================================================================

def export_scores(
    model_scores: Dict[str, ModelScore],
    path: str,
    format: str = "json",
) -> None:
    """
    Export model scores to a file.

    Args:
        model_scores: Dict mapping model names to ModelScore objects
        path: Output file path
        format: "json", "csv", or "summary"
    """
    if format == "json":
        data = {}
        for name, score in model_scores.items():
            score_dict = asdict(score)
            # Remove question_scores for cleaner export
            score_dict.pop('question_scores', None)
            data[name] = score_dict

        with open(path, 'w') as f:
            json.dump(data, f, indent=2, default=str)

    elif format == "csv":
        import csv
        with open(path, 'w', newline='') as f:
            writer = csv.writer(f)
            writer.writerow([
                'model', 'mean_score', 'median_score', 'std_score',
                'accuracy', 'ci_lower', 'ci_upper', 'num_questions',
            ])
            for name, score in model_scores.items():
                writer.writerow([
                    name, score.mean_score, score.median_score,
                    score.std_score, score.accuracy,
                    score.confidence_interval_95[0],
                    score.confidence_interval_95[1],
                    score.num_questions,
                ])

    elif format == "summary":
        lines = ["=" * 60, "MODEL EVALUATION SUMMARY", "=" * 60, ""]
        for name, score in model_scores.items():
            lines.append(f"Model: {name}")
            lines.append(f"  Mean Score:  {score.mean_score:.4f}")
            lines.append(f"  Median:      {score.median_score:.4f}")
            lines.append(f"  Std Dev:     {score.std_score:.4f}")
            lines.append(f"  Accuracy:    {score.accuracy:.4f}")
            lines.append(f"  95% CI:      [{score.confidence_interval_95[0]:.4f}, {score.confidence_interval_95[1]:.4f}]")
            lines.append(f"  Questions:   {score.num_questions}")
            if score.per_metric_means:
                lines.append("  Per-metric means:")
                for metric, val in sorted(score.per_metric_means.items()):
                    lines.append(f"    {metric}: {val:.4f}")
            lines.append("")

        with open(path, 'w') as f:
            f.write('\n'.join(lines))

    else:
        raise ValueError(f"Unknown format: {format}. Use 'json', 'csv', or 'summary'.")
