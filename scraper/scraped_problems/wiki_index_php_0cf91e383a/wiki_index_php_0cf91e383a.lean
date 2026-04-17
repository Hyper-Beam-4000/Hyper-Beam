-- 2024 AMC 12A Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_5

-- Problem (LaTeX):
/-
A data set containing $20$ numbers, some of which are $6$ , has mean $45$ . When all the 6s are removed, the data set has mean $66$ . How many 6s were in the original data set? $\textbf{(A) }4\qquad\textbf{(B) }5\qquad\textbf{(C) }6\qquad\textbf{(D) }7\qquad\textbf{(E) }8$
-/

-- Solution/Answer (LaTeX):
/-
Because the set has $20$ numbers and mean $45$ , the sum of the terms in the set is $45\cdot 20=900$ . Let there be $s$ sixes in the set. Then, the mean of the set without the sixes is $\frac{900-6s}{20-s}$ . Equating this expression to $66$ and solving yields $s=7$ , so we choose answer choice $\boxed{\textbf{(D) }7}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_0cf91e383a : Prop := by
  sorry
