-- 2024 AMC 10A Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_3

-- Problem (LaTeX):
/-
The number $2024$ is written as the sum of not necessarily distinct two-digit numbers. What is the least number of two-digit numbers needed to write this sum? $\textbf{(A) }20\qquad\textbf{(B) }21\qquad\textbf{(C) }22\qquad\textbf{(D) }23\qquad\textbf{(E) }24$
-/

-- Solution/Answer (LaTeX):
/-
Since we want the least number of two-digit numbers, we maximize the two-digit numbers by choosing as many $99$ s as possible. Since $2024=99\cdot20+44\cdot1,$ we choose twenty $99$ s and one $44,$ for a total of $\boxed{\textbf{(B) }21}$ two-digit numbers. ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_2ccba213ad : Prop := by
  sorry
