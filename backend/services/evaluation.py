"""Evaluation orchestrator — runs problems through a model and scores responses."""

import asyncio
import traceback
from datetime import date, datetime, timezone

from backend.services.prompt_templates import format_problem_prompt
from backend.services.model_caller import call_model_api

try:
    from backend.services import dynamo_repository as ddb
except Exception:
    ddb = None


def evaluate_submission(submission_id: str, contest_id: str) -> None:
    """
    Core evaluation function. Called as a background task.

    1. Fetch submission details from DynamoDB
    2. Fetch all scraped problems from DynamoDB
    3. Anti-contamination filter (training cutoff)
    4. For each problem: prompt → model → score → DynamoDB
    5. Aggregate and update submission
    """
    if not ddb:
        print("[evaluation] DynamoDB not available — cannot evaluate")
        return

    try:
        ddb.update_submission_status(submission_id, "running")

        submission = ddb.get_submission(submission_id)
        if not submission:
            print(f"[evaluation] Submission {submission_id} not found")
            ddb.update_submission_status(submission_id, "failed")
            return

        api_endpoint = submission.get("api_endpoint", "")
        model_name = submission.get("model_name", "unknown")
        training_cutoff = submission.get("training_cutoff_date")

        # Fetch all problems from DynamoDB
        problems_raw, _ = ddb.list_problems(limit=500)

        problems = []
        for p in problems_raw:
            if not p.get("problem_text"):
                continue
            problems.append({
                "id": p.get("id"),
                "problem_latex": p.get("problem_text", ""),
                "solution_latex": p.get("solution_text", ""),
                "lean_code": p.get("lean_code"),
                "published_date": str(p["year"]) + "-01-01" if p.get("year") else None,
                "title": p.get("title"),
            })

        # Anti-contamination filter
        if training_cutoff and problems:
            cutoff_date = date.fromisoformat(training_cutoff) if isinstance(training_cutoff, str) else training_cutoff
            problems = [
                p for p in problems
                if not p.get("published_date")
                or date.fromisoformat(p["published_date"]) > cutoff_date
            ]

        if not problems:
            ddb.update_submission_status(submission_id, "completed")
            return

        # Score each problem
        per_metric_lists: dict = {}
        for problem in problems:
            # Check for cancellation before each problem
            current = ddb.get_submission(submission_id)
            if current and current.get("evaluation_status") == "cancelled":
                print(f"[evaluation] {submission_id} cancelled by user")
                return

            try:
                mv = _evaluate_single_problem(api_endpoint, problem, submission_id, model_name)
                if mv:
                    for k, v in mv.items():
                        if v is not None:
                            per_metric_lists.setdefault(k, []).append(float(v))
            except Exception as e:
                print(f"[evaluation] problem {problem.get('id')} failed: {e}")

        # Aggregate
        def _mean(key):
            vals = per_metric_lists.get(key, [])
            return round(sum(vals) / len(vals), 4) if vals else None

        per_metric_means = {
            "overall_score": _mean("overall_score"),
            "answer_correctness": _mean("answer_correctness"),
            "rubric_score": _mean("rubric_score"),
            "reasoning_alignment": _mean("reasoning_alignment"),
            "embedding_similarity": _mean("embedding_similarity"),
            "proof_technique_match": _mean("proof_technique_match"),
            "concept_coverage": _mean("concept_coverage"),
        }

        ddb.save_submission_summary(
            submission_id=submission_id,
            model_name=model_name,
            overall_score=per_metric_means["overall_score"],
            per_metric_means=per_metric_means,
            status="completed",
        )

    except Exception:
        traceback.print_exc()
        if ddb:
            ddb.update_submission_status(submission_id, "failed")


def _evaluate_single_problem(
    api_endpoint: str,
    problem: dict,
    submission_id: str,
    model_name: str = "unknown",
) -> dict | None:
    """Evaluate a single problem: prompt → call model → score → save."""
    import sys
    import os

    project_root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    if project_root not in sys.path:
        sys.path.insert(0, project_root)

    from metrics.model_scorer import score_question

    problem_latex = problem.get("problem_latex", "")
    solution_latex = problem.get("solution_latex", "")
    lean_code = problem.get("lean_code")

    if not problem_latex:
        return None

    prompt = format_problem_prompt(problem_latex)
    model_response = asyncio.run(call_model_api(api_endpoint, prompt))

    q_score = score_question(
        predicted=model_response,
        expected=solution_latex,
        problem=problem_latex,
        predicted_lean=None,
        expected_lean=lean_code,
    )

    mv = q_score.metric_values

    if ddb:
        ddb.save_evaluation_result(
            submission_id=submission_id,
            problem_id=problem["id"],
            model_name=model_name,
            model_response=model_response,
            q_score={"overall_score": q_score.overall_score, "errors": q_score.errors},
            per_metric=mv,
        )

    result = dict(mv)
    result["overall_score"] = q_score.overall_score
    return result
