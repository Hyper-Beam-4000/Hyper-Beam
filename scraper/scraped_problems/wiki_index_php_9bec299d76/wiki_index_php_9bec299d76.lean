-- 2020 AMC 10A Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12A_Problems/Problem_5

-- Problem (LaTeX):
/-
The $25$ integers from $-10$ to $14,$ inclusive, can be arranged to form a $5$ -by- $5$ square in which the sum of the numbers in each row, the sum of the numbers in each column, and the sum of the numbers along each of the main diagonals are all the same. What is the value of this common sum? $\textbf{(A) }2 \qquad\textbf{(B) } 5\qquad\textbf{(C) } 10\qquad\textbf{(D) } 25\qquad\textbf{(E) } 50$
-/

-- Solution/Answer (LaTeX):
/-
Without loss of generality, consider the five rows in the square. Each row must have the same sum of numbers, meaning that the sum of all the numbers in the square divided by $5$ is the total value per row. The sum of the $25$ integers is $-10+-9+...+14=11+12+13+14=50$ , and the common sum is $\frac{50}{5}=\boxed{\text{(C) }10}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_9bec299d76 : Prop := by
  sorry
