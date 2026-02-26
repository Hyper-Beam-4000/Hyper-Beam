"""Upload service — validates and scores uploaded local results."""

import sys
import os
from datetime import datetime, timezone

# Ensure project root is on path for metrics imports
_project_root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
if _project_root not in sys.path:
    sys.path.insert(0, _project_root)


def process_uploaded_results(submission_id: str, data: list[dict]) -> dict:
    """
    Process uploaded evaluation results.

    Args:
        submission_id: The submission to attach results to
        data: List of dicts with 'problem_id' and 'model_response' keys

    Returns:
        Summary dict with scores
    """
    from backend.db import get_client
    from metrics.model_scorer import score_question, score_model, QuestionScore

    # Optional: Dynamo repository (preferred for persistence)
    try:
        from backend.services import dynamo_repository as ddb
    except Exception:
        ddb = None

    db = get_client()

    # Verify submission exists (Supabase) if available
    sub = None
    try:
        sub = db.table("submissions").select("*").eq("id", submission_id).execute()
    except Exception:
        sub = None
    if not sub or not getattr(sub, "data", None):
        # Dynamo fallback: allow processing without Supabase metadata
        sub_record = {"model_name": "unknown"}
    else:
        sub_record = sub.data[0]

    model_name = sub_record.get("model_name", "unknown")

    # Mark as running (Supabase best-effort)
    try:
        db.table("submissions").update(
            {"evaluation_status": "running"}
        ).eq("id", submission_id).execute()
    except Exception:
        pass

    question_scores: list[QuestionScore] = []
    processed = 0
    errors = []

    for entry in data:
        problem_id = entry.get("problem_id")
        model_response = entry.get("model_response", "")

        if not problem_id:
            errors.append("Missing problem_id in entry")
            continue

        # Fetch problem (prefer Dynamo, fallback to Supabase)
        problem = None
        if ddb:
            problem = ddb.get_problem(problem_id)
        if not problem:
            try:
                prob = db.table("problems").select("*").eq("id", problem_id).execute()
                if prob.data:
                    problem = prob.data[0]
            except Exception:
                pass
        if not problem:
            errors.append(f"Problem {problem_id} not found")
            continue

        solution_latex = problem.get("solution_text") or problem.get("solution_latex", "")
        problem_latex = problem.get("problem_text") or problem.get("problem_latex", "")
        lean_code = problem.get("lean_code")

        # Score using metrics engine
        q_score = score_question(
            predicted=model_response,
            expected=solution_latex,
            problem=problem_latex,
            predicted_lean=None,
            expected_lean=lean_code,
        )
        question_scores.append(q_score)

        mv = q_score.metric_values

        # Save result (Dynamo preferred, Supabase fallback)
        if ddb:
            ddb.save_evaluation_result(
                submission_id=submission_id,
                problem_id=problem_id,
                model_name=model_name,
                model_response=model_response,
                q_score={
                    "overall_score": q_score.overall_score,
                    "errors": q_score.errors,
                },
                per_metric=mv,
            )
        else:
            db.table("evaluation_results").upsert(
                {
                    "submission_id": submission_id,
                    "problem_id": problem_id,
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
                },
                on_conflict="submission_id,problem_id",
            ).execute()
        processed += 1

    # Aggregate
    if question_scores:
        model_score = score_model(question_scores, model_name=model_name)
        if ddb:
            ddb.save_submission_summary(
                submission_id=submission_id,
                model_name=model_name,
                overall_score=model_score.mean_score,
                per_metric_means=model_score.per_metric_means,
                status="completed",
            )
        else:
            db.table("submissions").update({
                "evaluation_status": "completed",
                "overall_score": model_score.mean_score,
                "answer_correctness": model_score.per_metric_means.get("answer_correctness"),
                "rubric_score": model_score.per_metric_means.get("rubric_score"),
                "reasoning_alignment": model_score.per_metric_means.get("reasoning_alignment"),
                "embedding_similarity": model_score.per_metric_means.get("embedding_similarity"),
                "proof_technique_match": model_score.per_metric_means.get("proof_technique_match"),
                "concept_coverage": model_score.per_metric_means.get("concept_coverage"),
            }).eq("id", submission_id).execute()
    else:
        if ddb:
            ddb.save_submission_summary(
                submission_id=submission_id,
                model_name=model_name,
                overall_score=None,
                per_metric_means={},
                status="completed",
            )
        else:
            db.table("submissions").update(
                {"evaluation_status": "completed"}
            ).eq("id", submission_id).execute()

    return {
        "status": "completed",
        "processed": processed,
        "total": len(data),
        "errors": errors,
        "overall_score": question_scores and score_model(question_scores).mean_score or None,
    }
