-- 2022 AMC 12A Problems/Problem 21
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_21

-- Problem (LaTeX):
/-
Let \[P(x) = x^{2022} + x^{1011} + 1.\] Which of the following polynomials is a factor of $P(x)$ ? $\textbf{(A)} \, x^2 -x + 1 \qquad\textbf{(B)} \, x^2 + x + 1 \qquad\textbf{(C)} \, x^4 + 1 \qquad\textbf{(D)} \, x^6 - x^3 + 1 \qquad\textbf{(E)} \, x^6 + x^3 + 1$
-/

-- Solution/Answer (LaTeX):
/-
$P(x) = x^{2022} + x^{1011} + 1$ is equal to $\frac{x^{3033}-1}{x^{1011}-1}$ by difference of powers. Therefore, the answer is a polynomial that divides $x^{3033}-1$ but not $x^{1011}-1$ . Note that any polynomial $x^m-1$ divides $x^n-1$ if and only if $m$ is a factor of $n$ . The prime factorizations of $1011$ and $3033$ are $3*337$ and $3^2*337$ , respectively. Hence, $x^9-1$ is a divisor of $x^{3033}-1$ but not $x^{1011}-1$ . By difference of powers, $x^9-1=(x^3-1)(x^6+x^3+1)$ .
Therefore, the answer is $\boxed{E}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_f9b857ccd6 : Prop := by
  sorry
