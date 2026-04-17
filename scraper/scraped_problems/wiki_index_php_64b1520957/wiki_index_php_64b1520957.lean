-- 2023 AMC 12A Problems/Problem 23
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_23

-- Problem (LaTeX):
/-
How many ordered pairs of positive real numbers $(a,b)$ satisfy the equation \[(1+2a)(2+2b)(2a+b) = 32ab?\] $\textbf{(A) }0\qquad\textbf{(B) }1\qquad\textbf{(C) }2\qquad\textbf{(D) }3\qquad\textbf{(E) }\text{an infinite number}$
-/

-- Solution/Answer (LaTeX):
/-
Using the AM-GM inequality on the two terms in each factor on the left-hand side, we get \[(1+2a)(2+2b)(2a+b) \ge 8\sqrt{2a \cdot 4b \cdot 2ab}= 32ab,\] This means the equality condition must be satisfied. Therefore, we must have $1 = 2a = b$ , so the only solution is $\boxed{\textbf{(B) }1}$ . ~ semistevehan
-/

import Mathlib.Tactic

theorem wiki_index_php_64b1520957 : Prop := by
  sorry
