"""
Shared test fixtures for metrics tests.

Contains USAMO problem data and Lean proof pairs used across test modules.
"""

# ============================================================================
# USAMO PROBLEM DATA (from test_math_metrics.py)
# ============================================================================

USAMO_QUESTION = (
    r"\\mathbb{N}\n\nf:\\mathbb{N}\\to\\mathbb{N}\n\nf(1000)\n\n"
    r"\\underbrace{f(f(\\ldots f}_{f(n)\\text{ times}}(n)\\ldots))=\\frac{n^2}{f(f(n))}"
)

USAMO_SOLUTION = (
    r"f^r(x)\n\nf^{r-1}(x)\n\nf^1(x)=f(x)\n\n\\hfill \\break \\hfill \\break\n\n"
    r"f(p)=f(q)\n\nf^2(p)=f^2(q)\n\nf^{f(p)}(p)=f^{f(q)}(q)\n\n"
    r"\\implies p^2=f^2(p)\\cdot f^{f(p)}(p)=f^2(q)\\cdot f^{f(q)}(q)=q^2\n\n"
    r"\\implies p=\\pm q\n\n\\implies p=q\n\np,q&gt;0\n\nf^r(b)=a\n\nf(a)=a\n\n"
    r"f^r(b)=a=f^r(a)\n\nf^2(m)=f^{f(m)}(m)=m\n\nf(m)=m\n\nf(m)=k\n\n"
    r"f^2(m)=m\n\nf(k)=m\n\nf^2(k)=k\n\n\\newline f^2(k)\\cdot f^{f(k)}(k)=k^2\n\n"
    r"k\\neq0\n\nf^{f(k)}(k)=k\n\n\\implies f^m(k)=k\n\n"
    r"\\implies f^{gcd(m, 2)}(k)=k\n\n\\implies f(k)=k\n\n"
    r"f^2(m)\\cdot f^{f(m)}(m)=m^2\n\n(1) f^2(m)=k&lt;m\n\n"
    r"(2) f^{f(m)}(m)=k&lt;m\n\n(3) f^2(m)=m\n\nf^{f(m)}(m)=m\n\n"
    r"f(1000)\n\nf(1000)=x, f(x)=1000\n\nf(k)=k\n\n1000\n\n"
    r"f^2(n)\\cdot f^{f(n)}(n)=n\\cdot n=n^2\n\nf(n)\n\nf^2(n)=n"
)

GEMINI_PREDICTION = (
    r"f(n) = n \text{ satisfies the given equation:}\n\n"
    r"\underbrace{f(f(\ldots f}_{n\text{ times}}(n)\ldots)) = f^n(n) = n\n\n"
    r"\frac{n^2}{f(f(n))} = \frac{n^2}{n} = n\n\n"
    r"\text{We prove } f(n)=n \text{ is the unique solution:}\n\n"
    r"\text{Let } f(n) = f(m) \implies f^2(n) = f^2(m)\n\n"
    r"f^{f(n)}(n) = \frac{n^2}{f^2(n)} \implies f^{f(n)}(n) f^2(n) = n^2\n\n"
    r"f^{f(m)}(m) f^2(m) = m^2 \implies f^{f(m)}(m) f^2(m) = m^2\n\n"
    r"f(n)=f(m)=k \implies f^k(n) f(k) = n^2 \text{ and } f^k(m) f(k) = m^2\n\n"
    r"\frac{n^2}{m^2} = \frac{f^k(n)}{f^k(m)} = 1 \implies n=m \implies f \text{ is injective}\n\n"
    r"f(f(n)) \mid n^2\n\nn=1 \implies f(f(1)) \mid 1 \implies f(f(1))=1\n\n"
    r"f(f(1))=1 \text{ and } f \text{ injective } \implies f(1)=1\n\n"
    r"\text{For prime } p, f(f(p)) \mid p^2 \implies f(f(p)) \in {1, p, p^2}\n\n"
    r"f(f(p)) \neq 1 \text{ (since } p \neq 1)\n\n"
    r"f(f(p)) = p^2 \implies f^{p^2}(p) = \frac{p^2}{p^2} = 1 \implies p=1 \text{ (contradiction)}\n\n"
    r"\therefore f(f(p)) = p \implies f^2(p) = p\n\n"
    r"f^{f(p)}(p) = \frac{p^2}{p} = p \implies f^{f(p)}(p) = p\n\n"
    r"\text{Let } f(p) = k \implies f(k) = p\n\nf^k(p) = p \text{ and } f^2(p) = p\n\n"
    r"p=2 \implies k \in {2} \implies f(2)=2\n\n"
    r"p \text{ odd } \implies k=p \implies f(p)=p\n\n"
    r"f(p)=p \text{ for all primes } p\n\nf(n)=n \text{ for all } n \in \mathbb{N}\n\n"
    r"f(1000) = 1000\n\n\square"
)

GPT_PREDICTION = (
    r"\underbrace{f(f(\ldots f}_{f(n)\text{ times}}(n)\ldots))\cdot f(f(n))=n^2\n"
    r"f(a)=f(b)\Rightarrow f^{f(a)}(a)=f^{f(b)}(b)=f^{f(a)-1}(f(a))\n"
    r"f(a)=f(b)\Rightarrow a^2=f^{f(a)}(a)\cdot f(f(a))=f^{f(b)}(b)\cdot f(f(b))=b^2\n"
    r"f(a)=f(b)\Rightarrow a=b\nf\ \text{injective}\n"
    r"n=1:\ f^{f(1)}(1)=1/f(f(1))\in\mathbb{N}\Rightarrow f(f(1))=1\n"
    r"k=f(1)\Rightarrow f^{f(k)}(k)=f^{1}(k)=f(k)=1=k^2/f(f(k))=k^2/f(1)=k\n"
    r"f(k)=1\Rightarrow 1=k\nf(1)=1\n"
    r"\text{Assume }m\text{ minimal with }f(m)\ne m\na=f(m)\n"
    r"a<m\Rightarrow f(a)=a\nf^{a}(m)=m^2/a\n"
    r"f^{a-1}(f(m))=f^{a-1}(a)=a\nf^{a}(m)=f^{a-1}(f(m))=a\n"
    r"a=m^2/a\na^2=m^2\na=m\n\text{Contradiction}\n"
    r"a>m\Rightarrow f(a)\ge a>m\nf^{a}(m)\cdot f(a)=m^2\n"
    r"f^{a}(m)\ge f(a)>m\n\text{Contradiction}\n"
    r"f(m)=m\ \forall m\in\mathbb{N}\nf(1000)=1000\n\square"
)

# ============================================================================
# LEAN PROOF PAIRS
# ============================================================================

LEAN_PROOF_SIMPLE = """
import Mathlib.Tactic

theorem simple_add_comm (a b : Nat) : a + b = b + a := by
  omega
"""

LEAN_PROOF_SIMPLE_ALT = """
import Mathlib.Tactic

theorem simple_add_comm (a b : Nat) : a + b = b + a := by
  induction a with
  | zero => simp
  | succ n ih => simp [Nat.succ_add, ih]
"""

LEAN_PROOF_STRUCTURED = """
import Mathlib.Data.Nat.Basic
import Mathlib.Tactic

open Nat

theorem structured_example (n : Nat) (h : n > 0) : n * n > 0 := by
  have h1 : n ≥ 1 := h
  have h2 : n * n ≥ n * 1 := by
    apply Nat.mul_le_mul_left
    exact h1
  linarith
"""

LEAN_PROOF_WITH_SORRY = """
import Mathlib.Tactic

theorem sorry_example (a b : Nat) : a + b = b + a := by
  sorry
"""

LEAN_PROOF_DIFFERENT_THEOREM = """
import Mathlib.Tactic

theorem mul_comm_example (a b : Nat) : a * b = b * a := by
  ring
"""

LEAN_PROOF_COMPLEX = """
import Mathlib.Data.Nat.Basic
import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Tactic

open Nat

theorem complex_example (p : Nat) (hp : Nat.Prime p) (hp2 : p > 2) : ¬ Even p := by
  intro h
  have h1 : p = 2 := by
    cases hp.eq_one_or_self_of_dvd 2 (Even.two_dvd h) with
    | inl h => omega
    | inr h => exact h
  omega
"""

LEAN_PROOF_NO_IMPORTS = """
theorem no_imports (n : Nat) : n = n := by
  rfl
"""

LEAN_PROOF_EMPTY = ""
