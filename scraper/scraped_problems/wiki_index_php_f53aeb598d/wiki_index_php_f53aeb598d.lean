-- 2017 AMC 12A Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12A_Problems/Problem_6

-- Problem (LaTeX):
/-
Joy has $30$ thin rods, one each of every integer length from $1 \text{ cm}$ through $30 \text{ cm}$ . She places the rods with lengths $3 \text{ cm}$ , $7 \text{ cm}$ , and $15 \text{cm}$ on a table. She then wants to choose a fourth rod that she can put with these three to form a quadrilateral with positive area. How many of the remaining rods can she choose as the fourth rod? $\textbf{(A)}\ 16 \qquad\textbf{(B)}\ 17 \qquad\textbf{(C)}\ 18 \qquad\textbf{(D)}\ 19 \qquad\textbf{(E)}\ 20$
-/

-- Solution/Answer (LaTeX):
/-
The quadrilateral cannot be a straight line. Thus, the fourth side must be longer than $15 - (3 + 7) = 5$ and shorter than $15 + 3 + 7 = 25$ . This means Joy can use the $19$ possible integer rod lengths that fall into $[6, 24]$ . However, she has already used the rods of length $7$ cm and $15$ cm so the answer is $19 - 2 = 17$ $\boxed{\textbf{(B)}}$
-/

import Mathlib.Tactic

theorem wiki_index_php_f53aeb598d : Prop := by
  sorry
