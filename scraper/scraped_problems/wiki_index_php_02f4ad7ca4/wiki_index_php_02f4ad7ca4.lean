-- 2024 AMC 10A Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_4

-- Problem (LaTeX):
/-
What is the least value of $n$ such that $n!$ is a multiple of $2024$ ? $\textbf{(A) } 11\qquad\textbf{(B) } 21\qquad\textbf{(C) } 22\qquad\textbf{(D) } 23\qquad\textbf{(E) } 253$
-/

-- Solution/Answer (LaTeX):
/-
Note that $2024=2^3\cdot11\cdot23$ in the prime factorization. Since $23!$ is a multiple of $2^3, 11,$ and $23,$ we conclude that $23!$ is a multiple of $2024.$ Therefore, we have $n=\boxed{\textbf{(D) } 23}.$ Remark Memorizing the prime factorization of the current year is useful for the AMC 8/10/12 Exams. ~MRENTHUSIASM Remark Note that $2024$ is $2025 -1$ , which is $45^2 -1 = (45+1)(45-1) = 46\cdot44$ . ~WISETIGERJ2
-/

import Mathlib.Tactic

theorem wiki_index_php_02f4ad7ca4 : Prop := by
  sorry
