-- 2020 AMC 12B Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_6

-- Problem (LaTeX):
/-
For all integers $n \geq 9,$ the value of \[\frac{(n+2)!-(n+1)!}{n!}\] is always which of the following? $\textbf{(A) } \text{a multiple of 4} \qquad \textbf{(B) } \text{a multiple of 10} \qquad \textbf{(C) } \text{a prime number} \qquad \textbf{(D) } \text{a perfect square} \qquad \textbf{(E) } \text{a perfect cube}$
-/

-- Solution/Answer (LaTeX):
/-
We first expand the expression: \[\frac{(n+2)!-(n+1)!}{n!} = \frac{(n+2)(n+1)n!-(n+1)n!}{n!}.\] We can now divide out a common factor of $n!$ from each term of the numerator: \[(n+2)(n+1)-(n+1).\] Factoring out $(n+1),$ we get \[[(n+2)-1](n+1) = (n+1)^2,\] which proves that the answer is $\boxed{\textbf{(D) } \text{a perfect square}}.$
-/

import Mathlib.Tactic

theorem wiki_index_php_8e8d207a6c : Prop := by
  sorry
