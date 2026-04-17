-- 2022 AMC 10A Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_10

-- Problem (LaTeX):
/-
How many ways are there to split the integers $1$ through $14$ into $7$ pairs such that in each pair, the greater number is at least $2$ times the lesser number? $\textbf{(A) } 108 \qquad \textbf{(B) } 120 \qquad \textbf{(C) } 126 \qquad \textbf{(D) } 132 \qquad \textbf{(E) } 144$
-/

-- Solution/Answer (LaTeX):
/-
Clearly, the integers from $8$ through $14$ must be in different pairs, so are the integers from $1$ through $7.$ Note that $7$ must pair with $14.$ We pair the numbers $1,2,3,4,5,6$ with the numbers $8,9,10,11,12,13$ systematically: $6$ can pair with either $12$ or $13.$ $5$ can pair with any of the three remaining numbers from $10,11,12,13.$ $1,2,3,4$ can pair with the other four remaining numbers from $8,9,10,11,12,13$ without restrictions. Together, the answer is $2\cdot3\cdot4!=\boxed{\textbf{(E) } 144}.$ ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_4ce77da178 : Prop := by
  sorry
