"""
End-to-End Lean Proof Comparison Test

Takes a competition math question + predicted answer + reference solution,
translates both to Lean 4 via OpenAI GPT-4o, then runs the full Lean
comparison and unified scoring pipeline.  Prints every step verbosely.

Run:
    python -m pytest tests/metrics/test_end_to_end_lean.py -v -s
or:
    python tests/metrics/test_end_to_end_lean.py
"""

import json
import os
import sys
import textwrap
import time
from pathlib import Path

# ---------------------------------------------------------------------------
# Path setup
# ---------------------------------------------------------------------------
project_root = Path(__file__).parent.parent.parent
if str(project_root) not in sys.path:
    sys.path.insert(0, str(project_root))

# Load .env from scraper/ (where the OpenAI key lives)
try:
    from dotenv import load_dotenv
    load_dotenv(os.path.join(project_root, "scraper", ".env"))
except ImportError:
    pass

# ---------------------------------------------------------------------------
# Imports
# ---------------------------------------------------------------------------
from metrics.lean_proof_comparison import (
    parse_lean_proof,
    compare_lean_proofs,
    LeanProofStructure,
    LeanComparisonResult,
)
from metrics.model_scorer import score_question, QuestionScore

# ---------------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------------
SEPARATOR = "=" * 72
THIN_SEP  = "-" * 72

def heading(title: str) -> None:
    print(f"\n{SEPARATOR}")
    print(f"  {title}")
    print(SEPARATOR)

def sub_heading(title: str) -> None:
    print(f"\n{THIN_SEP}")
    print(f"  {title}")
    print(THIN_SEP)

def print_wrapped(text: str, indent: int = 4, width: int = 90) -> None:
    """Print long text with wrapping and indent."""
    prefix = " " * indent
    for line in text.split("\n"):
        if len(line) <= width:
            print(f"{prefix}{line}")
        else:
            for wrapped in textwrap.wrap(line, width=width):
                print(f"{prefix}{wrapped}")

def print_structure(label: str, s: LeanProofStructure) -> None:
    """Pretty-print a parsed LeanProofStructure."""
    sub_heading(f"Parsed Structure: {label}")
    print(f"    Theorem name : {s.theorem_name or '(none)'}")
    print(f"    Conclusion   : {s.conclusion[:120] or '(none)'}")
    print(f"    Imports ({len(s.imports)})  : {', '.join(s.imports) or '(none)'}")
    print(f"    Opens ({len(s.opens)})    : {', '.join(s.opens) or '(none)'}")
    print(f"    Hypotheses   : {len(s.hypotheses)}")
    for h in s.hypotheses:
        print(f"        {h}")
    print(f"    Tactics ({len(s.tactics)}) : {', '.join(s.tactics) or '(none)'}")
    print(f"    Have stmts   : {len(s.have_statements)}")
    for h in s.have_statements:
        print(f"        {h[:100]}")
    print(f"    Sorry count  : {s.sorry_count}  positions={s.sorry_positions}")
    print(f"    Proof length : {s.proof_length} lines")


# ---------------------------------------------------------------------------
# Lean Translation via OpenAI
# ---------------------------------------------------------------------------
LEAN_TRANSLATION_PROMPT = """You are an expert in formal mathematics and the Lean 4 theorem prover with deep knowledge of Mathlib.

TASK: Translate this competition math problem and the given proof into valid, compilable Lean 4 code.

PROBLEM INFORMATION:
Title: {title}
Problem Statement: {problem}
Solution / Proof: {solution}

REQUIREMENTS:
1. Output ONLY raw Lean 4 code - NO markdown code fences, NO backticks, NO explanatory text
2. Start directly with "import" statements
3. Use ONLY Lean 4 syntax (not Lean 3)
4. Use "by" for proofs, NOT "begin...end"
5. Import only from Mathlib (e.g., import Mathlib.Data.Nat.Basic)
6. Write a well-formed theorem statement with proper types
7. Use standard Mathlib tactics: intro, apply, rw, simp, ring, norm_num, constructor, exact, have, obtain
8. Add comments explaining the proof strategy
9. Use "sorry" for steps that are too complex, but structure the proof outline
10. Ensure all syntax is valid - no hallucinated tactics or types

EXAMPLE FORMAT:
import Mathlib.Data.Nat.Prime
import Mathlib.Tactic

open Nat

-- Problem: Prove that for all n, n + 0 = n
theorem example_theorem (n : N) : n + 0 = n := by
  -- Use reflexivity since this is definitional
  rfl

YOUR LEAN 4 CODE (start directly with imports):"""


def strip_markdown_fences(code: str) -> str:
    """Remove markdown code fences from LLM output."""
    code = code.strip()
    if code.startswith("```"):
        lines = code.split("\n")
        if lines[0].startswith("```"):
            lines = lines[1:]
        if lines and lines[-1].strip() == "```":
            lines = lines[:-1]
        code = "\n".join(lines)
    return code.strip()


def translate_to_lean(problem: str, solution: str, title: str = "Competition Problem") -> str:
    """
    Translate a LaTeX problem + solution to Lean 4 via OpenAI GPT-4o.

    Returns the Lean 4 code string, or raises if the API is unavailable.
    """
    from openai import OpenAI

    api_key = os.environ.get("OPENAI_API_KEY")
    if not api_key or api_key == "ATTACH_YOUR_OPENAI_API_KEY_HERE":
        raise EnvironmentError(
            "OPENAI_API_KEY not set (or still placeholder).  "
            "Set it in scraper/.env or export it in your shell."
        )

    prompt = LEAN_TRANSLATION_PROMPT.format(
        title=title,
        problem=problem,
        solution=solution,
    )

    print(f"    [API] Calling OpenAI GPT-4o  (temperature=0.3) ...")
    t0 = time.time()

    client = OpenAI(api_key=api_key)
    response = client.chat.completions.create(
        model="gpt-4o",
        messages=[{"role": "user", "content": prompt}],
        max_tokens=4096,
        temperature=0.3,
    )

    elapsed = time.time() - t0
    lean_code = strip_markdown_fences(response.choices[0].message.content)

    usage = response.usage
    print(f"    [API] Done in {elapsed:.1f}s  "
          f"(prompt={usage.prompt_tokens} completion={usage.completion_tokens} tokens)")

    return lean_code


# ---------------------------------------------------------------------------
# Test Data
# ---------------------------------------------------------------------------

# 2019 USAMO Problem 1  (functional equation)
PROBLEM_STATEMENT = (
    r"Let $\mathbb{N}$ denote the set of positive integers.  "
    r"Find all functions $f : \mathbb{N} \to \mathbb{N}$ such that "
    r"$\underbrace{f(f(\ldots f}_{f(n)\text{ times}}(n)\ldots)) "
    r"= \frac{n^2}{f(f(n))}$ for all positive integers $n$."
)

REFERENCE_SOLUTION = (
    r"We prove $f(n) = n$ for all $n \in \mathbb{N}$."
    "\n\n"
    r"First, $f$ is injective: if $f(a)=f(b)$ then $f^2(a)=f^2(b)$ and "
    r"$f^{f(a)}(a)=f^{f(b)}(b)$, so $a^2 = f^2(a) \cdot f^{f(a)}(a) = "
    r"f^2(b) \cdot f^{f(b)}(b) = b^2$, giving $a=b$."
    "\n\n"
    r"Setting $n=1$: $f(f(1)) \mid 1 \implies f(f(1))=1$.  "
    r"Injectivity gives $f(1)=1$."
    "\n\n"
    r"For any prime $p$: $f(f(p)) \mid p^2$, so $f(f(p)) \in \{1, p, p^2\}$.  "
    r"$f(f(p))=1$ contradicts $p \neq 1$; $f(f(p))=p^2$ leads to "
    r"$f^{p^2}(p)=1$ hence $p=1$, contradiction.  "
    r"Therefore $f(f(p))=p$ and $f^2(p)=p$."
    "\n\n"
    r"If $f(p)=k$ then $f(k)=p$ and $f^2(k)=k$, so "
    r"$k^2 = f^2(k) \cdot f^{f(k)}(k)$ gives $f^{f(k)}(k)=k$.  "
    r"Since $f^m(k)=k$ and $f^2(k)=k$ we get $f^{\gcd(m,2)}(k)=k$, "
    r"hence $f(k)=k$ and $k=p$.  So $f(p)=p$ for all primes."
    "\n\n"
    r"By strong induction, $f(n)=n$ for all $n$."
    "\n\n"
    r"Therefore $f(1000) = 1000$.  $\square$"
)

PREDICTED_ANSWER = (
    r"$f(n) = n$ satisfies the equation: "
    r"$\underbrace{f(f(\ldots f}_{n\text{ times}}(n)\ldots)) = f^n(n) = n$ "
    r"and $\frac{n^2}{f(f(n))} = \frac{n^2}{n} = n$."
    "\n\n"
    r"We prove $f(n)=n$ is unique.  "
    r"Let $f(n)=f(m) \implies f^2(n)=f^2(m)$.  "
    r"Then $f^{f(n)}(n) f^2(n) = n^2$ and $f^{f(m)}(m) f^2(m) = m^2$.  "
    r"Setting $f(n)=f(m)=k$ gives $n^2/m^2 = f^k(n)/f^k(m) = 1$, "
    r"so $n=m$ and $f$ is injective."
    "\n\n"
    r"$n=1 \implies f(f(1)) \mid 1 \implies f(f(1))=1$.  "
    r"Injectivity gives $f(1)=1$."
    "\n\n"
    r"For prime $p$: $f(f(p)) \mid p^2$, and $f(f(p)) \neq 1$, "
    r"$f(f(p))=p^2$ leads to contradiction.  "
    r"So $f(f(p))=p$ and $f^2(p)=p$.  "
    r"Let $f(p)=k$, then $f(k)=p$, $f^k(p)=p$, $f^2(p)=p$.  "
    r"For $p=2$: $k=2$, so $f(2)=2$.  "
    r"For odd $p$: $k=p$, so $f(p)=p$."
    "\n\n"
    r"Therefore $f(n)=n$ for all $n$, and $f(1000)=1000$.  $\square$"
)


# ---------------------------------------------------------------------------
# The Test
# ---------------------------------------------------------------------------

def test_end_to_end_lean_comparison():
    """
    End-to-end: question -> Lean translation -> parse -> compare -> score.

    Requires OPENAI_API_KEY.  If missing, falls back to pre-built Lean
    proofs so the structural comparison / scoring pipeline still runs.
    """

    heading("END-TO-END LEAN PROOF COMPARISON TEST")

    # ------------------------------------------------------------------
    # 1. Show the inputs
    # ------------------------------------------------------------------
    sub_heading("Step 1 : Problem Statement")
    print_wrapped(PROBLEM_STATEMENT)

    sub_heading("Step 1 : Reference Solution (LaTeX)")
    print_wrapped(REFERENCE_SOLUTION)

    sub_heading("Step 1 : Predicted Answer (LaTeX)")
    print_wrapped(PREDICTED_ANSWER)

    # ------------------------------------------------------------------
    # 2. Translate to Lean
    # ------------------------------------------------------------------
    heading("Step 2 : Translate to Lean 4 via GPT-4o")

    api_available = True
    try:
        sub_heading("Translating REFERENCE solution -> Lean")
        ref_lean = translate_to_lean(
            problem=PROBLEM_STATEMENT,
            solution=REFERENCE_SOLUTION,
            title="USAMO 2019 Problem 1 - Reference",
        )
        print()
        print_wrapped(ref_lean)

        sub_heading("Translating PREDICTED answer -> Lean")
        pred_lean = translate_to_lean(
            problem=PROBLEM_STATEMENT,
            solution=PREDICTED_ANSWER,
            title="USAMO 2019 Problem 1 - Predicted",
        )
        print()
        print_wrapped(pred_lean)

    except (EnvironmentError, ImportError, Exception) as exc:
        api_available = False
        print(f"\n    [SKIP] OpenAI API not available: {exc}")
        print("    [FALLBACK] Using pre-built Lean proofs for pipeline demo.\n")

        ref_lean = textwrap.dedent("""\
            import Mathlib.Data.Nat.Basic
            import Mathlib.Tactic

            open Nat

            -- Reference proof: f(n) = n for all n
            theorem usamo2019p1_ref (f : Nat -> Nat)
              (hf : forall n : Nat, n > 0 -> (Nat.iterate f (f n) n) * (f (f n)) = n ^ 2) :
              forall n : Nat, n > 0 -> f n = n := by
              -- Step 1: Show f is injective
              have h_inj : Function.Injective f := by
                intro a b hab
                -- f(a)=f(b) => f^2(a)=f^2(b) => a^2=b^2 => a=b
                sorry
              -- Step 2: f(1) = 1
              have h1 : f 1 = 1 := by
                have : f (f 1) = 1 := by sorry
                exact sorry
              -- Step 3: f(p) = p for all primes p
              have h_prime : forall p, Nat.Prime p -> f p = p := by
                intro p hp
                -- f(f(p)) | p^2, cases give f(f(p))=p, hence f(p)=p
                sorry
              -- Step 4: f(n) = n by strong induction
              intro n hn
              sorry
        """)

        pred_lean = textwrap.dedent("""\
            import Mathlib.Data.Nat.Basic
            import Mathlib.Tactic

            open Nat

            -- Predicted proof: f(n) = n
            theorem usamo2019p1_pred (f : Nat -> Nat)
              (hf : forall n : Nat, n > 0 -> (Nat.iterate f (f n) n) * (f (f n)) = n ^ 2) :
              forall n : Nat, n > 0 -> f n = n := by
              -- Injectivity
              have h_inj : Function.Injective f := by
                intro a b hab
                sorry
              -- Base case: f(1)=1
              have h1 : f 1 = 1 := by sorry
              -- Prime case
              have h_prime : forall p, Nat.Prime p -> f p = p := by
                intro p hp; sorry
              -- Conclude by induction
              intro n hn
              sorry
        """)

        sub_heading("Fallback REFERENCE Lean proof")
        print_wrapped(ref_lean)
        sub_heading("Fallback PREDICTED Lean proof")
        print_wrapped(pred_lean)

    # ------------------------------------------------------------------
    # 3. Parse both Lean proofs
    # ------------------------------------------------------------------
    heading("Step 3 : Parse Lean Proofs")

    ref_struct = parse_lean_proof(ref_lean)
    pred_struct = parse_lean_proof(pred_lean)

    print_structure("REFERENCE", ref_struct)
    print_structure("PREDICTED", pred_struct)

    # ------------------------------------------------------------------
    # 4. Lean-to-Lean comparison
    # ------------------------------------------------------------------
    heading("Step 4 : Lean Proof Comparison")

    comparison = compare_lean_proofs(pred_lean, ref_lean)

    sub_heading("Comparison Results")
    print(f"    Theorem statement similarity : {comparison.theorem_similarity:.4f}")
    print(f"    Hypothesis overlap           : {comparison.hypothesis_overlap:.4f}")
    print(f"    Tactic similarity            : {comparison.tactic_similarity:.4f}")
    print(f"    Structural similarity        : {comparison.structural_similarity:.4f}")
    print(f"    Import compatibility         : {comparison.import_compatibility:.4f}")
    print(f"    Sorry comparison             : {comparison.sorry_comparison}")
    print(f"    -----------------------------------------------")
    print(f"    COMBINED SCORE               : {comparison.combined_score:.4f}")

    # ------------------------------------------------------------------
    # 5. Full unified scoring (LaTeX + Lean)
    # ------------------------------------------------------------------
    heading("Step 5 : Unified Model Scoring (all metrics)")

    print("    Running score_question() with both LaTeX and Lean proofs...")
    print("    (embedding model will load on first call)\n")

    t0 = time.time()
    q_score: QuestionScore = score_question(
        predicted=PREDICTED_ANSWER,
        expected=REFERENCE_SOLUTION,
        problem=PROBLEM_STATEMENT,
        predicted_lean=pred_lean,
        expected_lean=ref_lean,
        use_llm_judge=False,  # off by default; flip to True if you want it
    )
    elapsed = time.time() - t0

    sub_heading(f"QuestionScore  (computed in {elapsed:.1f}s)")

    print(f"\n    Available metrics ({len(q_score.available_metrics)}):")
    for m in q_score.available_metrics:
        w = q_score.weights_used.get(m, 0)
        v = q_score.metric_values.get(m, 0)
        print(f"        {m:30s}  value={v:.4f}  weight={w:.4f}")

    print(f"\n    Weights sum to: {sum(q_score.weights_used.values()):.6f}")
    print(f"\n    OVERALL SCORE : {q_score.overall_score:.4f}  "
          f"(ProofBench 0-7: {q_score.overall_score * 7:.2f})")

    if q_score.errors:
        print(f"\n    Errors encountered:")
        for e in q_score.errors:
            print(f"        - {e}")

    # ------------------------------------------------------------------
    # 6. Summary
    # ------------------------------------------------------------------
    heading("SUMMARY")

    print(f"    Problem           : USAMO 2019 Problem 1 (functional equation)")
    print(f"    API used          : {'Yes (GPT-4o)' if api_available else 'No (fallback proofs)'}")
    print(f"    Lean comparison   : {comparison.combined_score:.4f}")
    print(f"    Overall score     : {q_score.overall_score:.4f}")
    print(f"    Metrics available : {len(q_score.available_metrics)}")
    print(f"    Answer correct    : {q_score.metric_values.get('answer_correctness', 'N/A')}")
    print(f"    Rubric score      : {q_score.metric_values.get('rubric_score', 'N/A')}")
    print(f"    Lean compiles     : {q_score.metric_values.get('lean_compiles', 'N/A')}")
    print(f"    Lean sorry-free   : {q_score.metric_values.get('lean_sorry_free', 'N/A')}")
    print(f"    Lean comparison   : {q_score.metric_values.get('lean_comparison', 'N/A')}")
    print(f"    Embedding sim.    : {q_score.metric_values.get('embedding_similarity', 'N/A')}")
    print(f"    Reasoning align.  : {q_score.metric_values.get('reasoning_alignment', 'N/A')}")
    print(f"    Technique match   : {q_score.metric_values.get('proof_technique_match', 'N/A')}")
    print(f"    Concept coverage  : {q_score.metric_values.get('concept_coverage', 'N/A')}")
    print()

    # ------------------------------------------------------------------
    # Assertions (so pytest marks it pass/fail)
    # ------------------------------------------------------------------
    assert isinstance(q_score, QuestionScore)
    assert 0.0 <= q_score.overall_score <= 1.0
    assert len(q_score.available_metrics) >= 5  # at least the non-Lean metrics
    assert comparison.combined_score >= 0.0
    assert abs(sum(q_score.weights_used.values()) - 1.0) < 1e-6


# ---------------------------------------------------------------------------
# Allow running directly:  python tests/metrics/test_end_to_end_lean.py
# ---------------------------------------------------------------------------
if __name__ == "__main__":
    test_end_to_end_lean_comparison()
