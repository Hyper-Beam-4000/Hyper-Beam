-- 2018 AMC 12A Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_5

-- Problem (LaTeX):
/-
What is the sum of all possible values of $k$ for which the polynomials $x^2 - 3x + 2$ and $x^2 - 5x + k$ have a root in common? $\textbf{(A) }3 \qquad\textbf{(B) }4 \qquad\textbf{(C) }5 \qquad\textbf{(D) }6 \qquad\textbf{(E) }10$
-/

-- Solution/Answer (LaTeX):
/-
We factor $x^2-3x+2$ into $(x-1)(x-2)$ . Thus, either $1$ or $2$ is a root of $x^2-5x+k$ . If $1$ is a root, then $1^2-5\cdot1+k=0$ , so $k=4$ . If $2$ is a root, then $2^2-5\cdot2+k=0$ , so $k=6$ . The sum of all possible values of $k$ is $\boxed{\textbf{(E) }10}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_d35f163410 : Prop := by
  sorry
