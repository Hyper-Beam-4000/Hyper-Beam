-- 2023 AMC 12A Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_7

-- Problem (LaTeX):
/-
A digital display shows the current date as an $8$ -digit integer consisting of a $4$ -digit year, followed by a $2$ -digit month, followed by a $2$ -digit date within the month. For example, Arbor Day this year is displayed as $20230428.$ For how many dates in $2023$ does each digit appear an even number of times in the $8$ -digital display for that date? $\textbf{(A)}~5\qquad\textbf{(B)}~6\qquad\textbf{(C)}~7\qquad\textbf{(D)}~8\qquad\textbf{(E)}~9$
-/

-- Solution/Answer (LaTeX):
/-
Do careful casework by each month. Make sure to start with 2023. In the month and the date, we need a $0$ , a $3$ , and two digits repeated (which has to be $1$ and $2$ after consideration). After the casework, we get $\boxed{\textbf{(E)}~9}$ .
For curious readers, the numbers (in chronological order) are:
-/

import Mathlib.Tactic

theorem wiki_index_php_30bb4c77bd : Prop := by
  sorry
