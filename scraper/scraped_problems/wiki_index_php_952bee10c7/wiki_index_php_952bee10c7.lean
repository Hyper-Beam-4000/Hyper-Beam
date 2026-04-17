-- 2023 AMC 12B Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_6

-- Problem (LaTeX):
/-
When the roots of the polynomial \[P(x) = (x-1)^1 (x-2)^2 (x-3)^3 \cdot \cdot \cdot \cdot (x-10)^{10}\] are removed from the number line, what remains is the union of $11$ disjoint open intervals. On how many of these intervals is $P(x)$ positive? $\textbf{(A)}~3\qquad\textbf{(B)}~7\qquad\textbf{(C)}~6\qquad\textbf{(D)}~4\qquad\textbf{(E)}~5$
-/

-- Solution/Answer (LaTeX):
/-
The expressions to the power of even powers are always positive, so we don't need to care about those. We only need to care about $(x-1)^1(x-3)^3(x-5)^5(x-7)^7(x-9)^9$ . We need 0, 2, or 4 of the expressions to be negative. The 9 through 10 interval and 10 plus interval make all of the expressions positive. The 5 through 6 and 6 through 7 intervals make two of the expressions negative. The 1 through 2 and 2 through 3 intervals make four of the expressions negative. There are $\boxed{\textbf{(C) 6}}$ intervals. ~Aopsthedude
-/

import Mathlib.Tactic

theorem wiki_index_php_952bee10c7 : Prop := by
  sorry
