"""Uniform prompting templates — no hints, no few-shot examples."""

PROBLEM_SOLVING_PROMPT = """You are solving a competition mathematics problem.
Provide a complete, rigorous proof or solution.

Problem:
{problem_latex}

Instructions:
- Show all reasoning steps
- State your final answer clearly
- Use standard mathematical notation

Your Solution:"""


def format_problem_prompt(problem_latex: str) -> str:
    """Format a problem into a uniform evaluation prompt."""
    return PROBLEM_SOLVING_PROMPT.format(problem_latex=problem_latex)
