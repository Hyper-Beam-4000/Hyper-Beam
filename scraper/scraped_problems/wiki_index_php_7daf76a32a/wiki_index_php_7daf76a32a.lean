-- 2023 AMC 12B Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_14

-- Problem (LaTeX):
/-
For how many ordered pairs $(a,b)$ of integers does the polynomial $x^3+ax^2+bx+6$ have $3$ distinct integer roots? $\textbf{(A)}\ 5 \qquad\textbf{(B)}\ 6 \qquad\textbf{(C)}\ 8 \qquad\textbf{(D)}\ 7 \qquad\textbf{(E)}\ 4$
-/

-- Solution/Answer (LaTeX):
/-
Denote three roots as $r_1 < r_2 < r_3$ .
Following from Vieta's formula, $r_1r_2r_3 = -6$ . Case 1: All roots are negative. We have the following solution: $\left( -3, -2, -1 \right)$ . Case 2: One root is negative and two roots are positive. We have the following solutions: $\left( -3, 1, 2 \right)$ , $\left( -2, 1, 3 \right)$ , $\left( -1, 2, 3 \right)$ , $\left( -1, 1, 6 \right)$ . Putting all cases together, the total number of solutions is $\boxed{\textbf{(A) 5}}$ . ~Steven Chen (Professor Chen Education Palace, www.professorchenedu.com)
-/

import Mathlib.Tactic

theorem wiki_index_php_7daf76a32a : Prop := by
  sorry
