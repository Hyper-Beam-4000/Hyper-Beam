"""Evaluation orchestrator — runs problems through a model and scores responses."""

import asyncio
import traceback
from datetime import date, datetime, timezone
from dataclasses import asdict

from backend.db import get_client
from backend.services.prompt_templates import format_problem_prompt
from backend.services.model_caller import call_model_api


def evaluate_submission(submission_id: str, contest_id: str) -> None:
    """
    Core evaluation function. Called as a background task.

    1. Fetch submission details
    2. Fetch contest problems
    3. Anti-contamination filter
    4. For each problem: prompt → model → score → DB
    5. Aggregate and update submission
    """
    db = get_client()

    try:
        # Mark as running
        db.table("submissions").update(
            {"evaluation_status": "running"}
        ).eq("id", submission_id).execute()

        # Fetch submission
        sub = db.table("submissions").select("*").eq("id", submission_id).execute()
        if not sub.data:
            raise ValueError(f"Submission {submission_id} not found")
        submission = sub.data[0]

        api_endpoint = submission["api_endpoint"]
        training_cutoff = submission.get("training_cutoff_date")

        # Fetch contest problems
        cp = (
            db.table("contest_problems")
            .select("problem_id, problems(*)")
            .eq("contest_id", contest_id)
            .execute()
        )

        problems = [row["problems"] for row in (cp.data or []) if row.get("problems")]

        if not problems:
            db.table("submissions").update(
                {"evaluation_status": "completed"}
            ).eq("id", submission_id).execute()
            return

        # Anti-contamination filter
        if training_cutoff:
            cutoff_date = date.fromisoformat(training_cutoff) if isinstance(training_cutoff, str) else training_cutoff
            problems = [
                p for p in problems
                if not p.get("published_date")
                or date.fromisoformat(p["published_date"]) > cutoff_date
            ]

        if not problems:
            db.table("submissions").update(
                {"evaluation_status": "completed"}
            ).eq("id", submission_id).execute()
            return

        # Score each problem
        question_scores = []
        for problem in problems:
            try:
                result = _evaluate_single_problem(
                    api_endpoint, problem, submission_id, db
                )
                if result:
                    question_scores.append(result)
            except Exception as e:
                # Log error for this problem but continue with others
                _save_error_result(
                    db, submission_id, problem["id"], str(e)
                )

        # Aggregate scores and update submission
        _aggregate_and_update(db, submission_id, question_scores)

    except Exception:
        traceback.print_exc()
        db.table("submissions").update(
            {"evaluation_status": "failed"}
        ).eq("id", submission_id).execute()


def _evaluate_single_problem(
    api_endpoint: str,
    problem: dict,
    submission_id: str,
    db,
) -> dict | None:
    """Evaluate a single problem: prompt → call model → score → save."""
    import sys
    import os

    # Ensure project root is on path for metrics imports
    project_root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    if project_root not in sys.path:
        sys.path.insert(0, project_root)

    from metrics.model_scorer import score_question

    problem_latex = problem.get("problem_latex", "")
    solution_latex = problem.get("solution_latex", "")
    lean_code = problem.get("lean_code")

    if not problem_latex:
        return None

    # Get model response
    prompt = format_problem_prompt(problem_latex)
    model_response = asyncio.run(call_model_api(api_endpoint, prompt))

    # Score using existing metrics engine
    q_score = score_question(
        predicted=model_response,
        expected=solution_latex,
        problem=problem_latex,
        predicted_lean=None,
        expected_lean=lean_code,
    )

    mv = q_score.metric_values

    # Upsert evaluation result
    result_row = {
        "submission_id": submission_id,
        "problem_id": problem["id"],
        "model_response": model_response,
        "overall_score": q_score.overall_score,
        "answer_correctness": mv.get("answer_correctness"),
        "rubric_score": mv.get("rubric_score"),
        "reasoning_alignment": mv.get("reasoning_alignment"),
        "embedding_similarity": mv.get("embedding_similarity"),
        "proof_technique_match": mv.get("proof_technique_match"),
        "concept_coverage": mv.get("concept_coverage"),
        "lean_compiles": mv.get("lean_compiles", 0) == 1.0 if "lean_compiles" in mv else None,
        "lean_sorry_free": mv.get("lean_sorry_free", 0) == 1.0 if "lean_sorry_free" in mv else None,
        "llm_judge_score": mv.get("llm_judge_score"),
        "errors": q_score.errors if q_score.errors else None,
        "evaluated_at": datetime.now(timezone.utc).isoformat(),
    }

    db.table("evaluation_results").upsert(
        result_row, on_conflict="submission_id,problem_id"
    ).execute()

    return mv


def _save_error_result(db, submission_id: str, problem_id: str, error: str):
    """Save a failed evaluation result."""
    db.table("evaluation_results").upsert(
        {
            "submission_id": submission_id,
            "problem_id": problem_id,
            "errors": [error],
            "evaluated_at": datetime.now(timezone.utc).isoformat(),
        },
        on_conflict="submission_id,problem_id",
    ).execute()


def _aggregate_and_update(db, submission_id: str, question_scores: list[dict]):
    """Aggregate per-question scores and update the submissions row."""
    if not question_scores:
        db.table("submissions").update(
            {"evaluation_status": "completed"}
        ).eq("id", submission_id).execute()
        return

    # Fetch all evaluation results for this submission to compute means
    results = (
        db.table("evaluation_results")
        .select("overall_score, answer_correctness, rubric_score, reasoning_alignment, "
                "embedding_similarity, proof_technique_match, concept_coverage")
        .eq("submission_id", submission_id)
        .not_.is_("overall_score", "null")
        .execute()
    )

    rows = results.data or []
    if not rows:
        db.table("submissions").update(
            {"evaluation_status": "completed"}
        ).eq("id", submission_id).execute()
        return

    def _mean(key):
        vals = [r[key] for r in rows if r.get(key) is not None]
        return round(sum(vals) / len(vals), 4) if vals else None

    db.table("submissions").update({
        "evaluation_status": "completed",
        "overall_score": _mean("overall_score"),
        "answer_correctness": _mean("answer_correctness"),
        "rubric_score": _mean("rubric_score"),
        "reasoning_alignment": _mean("reasoning_alignment"),
        "embedding_similarity": _mean("embedding_similarity"),
        "proof_technique_match": _mean("proof_technique_match"),
        "concept_coverage": _mean("concept_coverage"),
    }).eq("id", submission_id).execute()
