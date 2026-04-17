-- 2024 AMC 10B Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_1

-- Problem (LaTeX):
/-
In a long line of people arranged left to right, the 1013th person from the left is also the 1010th person from the right. How many people are in the line? $\textbf{(A) } 2021 \qquad\textbf{(B) } 2022 \qquad\textbf{(C) } 2023 \qquad\textbf{(D) } 2024 \qquad\textbf{(E) } 2025$
-/

-- Solution/Answer (LaTeX):
/-
If the person is the 1013th from the left, that means there is 1012 people to their left.
If the person is the 1010th from the right, that means there is 1009 people to their right.
Therefore, there are $1012 + 1 + 1009 = \boxed{\textbf{(B) } 2022}$ people in line.
-/

import Mathlib.Tactic

theorem wiki_index_php_e9a0e1fa66 : Prop := by
  sorry
