-- 2024 AMC 10A Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_6

-- Problem (LaTeX):
/-
The product of three integers is $60$ . What is the least possible positive sum of the
three integers? $\textbf{(A) }2\qquad\textbf{(B) }3\qquad\textbf{(C) }5\qquad\textbf{(D) }6\qquad\textbf{(E) }13$
-/

-- Solution/Answer (LaTeX):
/-
We notice that the optimal solution involves two negative numbers and a positive number. Thus we may split $60$ into three factors and choose negativity. We notice that $10\cdot6\cdot1=10\cdot(-6)\cdot(-1)=60$ , and trying other combinations does not yield lesser results so the answer is $10-6-1=\boxed{\textbf{(B) }3}$ . ~eevee9406
-/

import Mathlib.Tactic

theorem wiki_index_php_991663fa4a : Prop := by
  sorry
