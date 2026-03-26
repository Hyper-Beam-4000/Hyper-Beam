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

        # If running as a worker on the same machine as the API, rewrite the
        # public-IP URL to localhost so the connection doesn't go through AWS's
        # internet gateway (which drops long-idle TCP connections mid-response).
        import os, re as _re
        self_url = os.environ.get("WORKER_API_SELF_URL", "")
        if self_url and api_endpoint:
            # Replace scheme+host+port portion if it matches any known public addresses
            # e.g. http://54.221.97.240:8000/... → http://localhost:8000/...
            api_endpoint = _re.sub(
                r"^https?://[^/]+",
                self_url.rstrip("/"),
                api_endpoint,
            ) if not api_endpoint.startswith(("http://localhost", "http://127.")) else api_endpoint
            print(f"[evaluation] endpoint rewritten to: {api_endpoint}")

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

        # Throttle for free-tier rate limits (Gemini: 10 RPM, Groq: ~30 RPM)
        import time
        if "gemini" in api_endpoint:
            inter_request_delay = 7.0   # ~8 RPM, safely under 10 RPM
        elif "groq" in api_endpoint:
            inter_request_delay = 2.5   # ~24 RPM, safely under 30 RPM
        else:
            inter_request_delay = 0.0

        # Score each problem
        per_metric_lists: dict = {}
        for i, problem in enumerate(problems):
            # Check for cancellation before each problem
            current = ddb.get_submission(submission_id)
            if current and current.get("evaluation_status") == "cancelled":
                print(f"[evaluation] {submission_id} cancelled by user")
                return

            if inter_request_delay > 0 and i > 0:
                time.sleep(inter_request_delay)

            try:
                mv = _evaluate_single_problem(api_endpoint, problem, submission_id, model_name)
                if mv:
                    for k, v in mv.items():
                        if v is not None:
                            per_metric_lists.setdefault(k, []).append(float(v))
            except Exception as e:
                import traceback
                print(f"[evaluation] problem {problem.get('id')} failed: {type(e).__name__}: {e}")
                traceback.print_exc()

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


def _extract_lean_block(text: str) -> str | None:
    """Extract the first ```lean ... ``` fenced block from a model response."""
    import re
    match = re.search(r"```lean\s*\n(.*?)```", text, re.DOTALL)
    if match:
        return match.group(1).strip()
    return None


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

    predicted_lean = _extract_lean_block(model_response)

    q_score = score_question(
        predicted=model_response,
        expected=solution_latex,
        problem=problem_latex,
        predicted_lean=predicted_lean,
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
