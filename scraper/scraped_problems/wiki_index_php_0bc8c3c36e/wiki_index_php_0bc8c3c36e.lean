-- 2025 USAMO Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_USAMO_Problems/Problem_2

-- Problem (LaTeX):
/-
Let $n$ and $k$ be positive integers with $k<n$ . Let $P(x)$ be a polynomial of degree $n$ with real coefficients, nonzero constant term, and no repeated roots. Suppose that for any real numbers $a_0, a_1, \dots, a_k$ such that the polynomial $a_kx^k+\cdots+a_1x+a_0$ divides $P(x)$ , the product $a_0a_1\cdots a_k$ is zero. Prove that $P(x)$ has a nonreal root.
-/

-- Solution/Answer (LaTeX):
/-
We proceed by contradiction. Assume that all roots of $P(x)$ are real. Let the distinct roots be $r_1, r_2, \ldots, r_n$ , all nonzero since the constant term is nonzero. Consider any subset of $k$ roots $\{r_{i_1}, r_{i_2}, \ldots, r_{i_k}\}$ and form the polynomial: \[Q(x) = \prod_{j=1}^k (x - r_{i_j}) =a_{k} x^k + a_{k-1}x^{k-1} + \cdots + a_0\] By Vieta's formulas: $a_0 = (-1)^k \prod_{j=1}^k r_{i_j} \neq 0$ $a_{k-1} = -\sum_{j=1}^k r_{i_j}$ $a_{k-2} = \sum_{1\leq m<n\leq k} r_{i_m}r_{i_n}$ The given condition requires that $a_0a_1\cdots a_k = 0$ . Since $a_0 \neq 0$ , at least one other coefficient must be zero. Case $k=2$ :
For any pair of roots $(r_i, r_j)$ , we have: \[Q(x) = x^2 - (r_i+r_j)x + r_ir_j\] The condition implies $-r_ir_j(r_i+r_j) = 0$ , so $r_i + r_j = 0$ for all pairs. But with $n \geq 3$ , considering three roots $r_1, r_2, r_3$ gives: \[r_1 + r_2 = 0 \quad \text{and} \quad r_1 + r_3 = 0 \implies r_2 = r_3\] contradicting distinct roots.
In General:
For any $k$ roots, some symmetric sum must be zero. For $k=3$ , this would require: \[r_i + r_j + r_m = 0 \quad \text{for all triples}\] which leads to contradictions for any $n \geq 4$ as it would force roots to be equal. Thus, our initial assumption is false, and $P(x)$ must have at least one nonreal root.~Jonathan
-/

import Mathlib.Tactic

theorem wiki_index_php_0bc8c3c36e : Prop := by
  sorry
