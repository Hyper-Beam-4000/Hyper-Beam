-- 2019 AMC 12A Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12A_Problems/Problem_13

-- Problem (LaTeX):
/-
How many ways are there to paint each of the integers $2, 3, \cdots , 9$ either red, green, or blue so that each number has a different color from each of its proper divisors? $\textbf{(A)}~144\qquad\textbf{(B)}~216\qquad\textbf{(C)}~256\qquad\textbf{(D)}~384\qquad\textbf{(E)}~432$
-/

-- Solution/Answer (LaTeX):
/-
The $5$ and $7$ can be painted with no restrictions because the set of integers does not contain a multiple or proper factor of $5$ or $7$ . There are 3 ways to paint each, giving us $\underline{9}$ ways to paint both. The $2$ is the most restrictive number. There are $\underline{3}$ ways to paint $2$ , but without loss of generality, let it be painted red. $4$ cannot be the same color as $2$ or $8$ , so there are $\underline{2}$ ways to paint $4$ , which automatically determines the color for $8$ . $6$ cannot be painted red, so there are $\underline{2}$ ways to paint $6$ , but WLOG, let it be painted blue. There are $\underline{2}$ choices for the color for $3$ , which is either red or green in this case. Lastly, there are $\underline{2}$ ways to choose the color for $9$ . $9 \cdot 3 \cdot 2 \cdot 2 \cdot 2 \cdot 2 = \boxed{\textbf{(E) }432}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_4b12c3ae1a : Prop := by
  sorry
