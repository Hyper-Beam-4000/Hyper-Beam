-- 2020 AMC 10A Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12A_Problems/Problem_4

-- Problem (LaTeX):
/-
How many $4$ -digit positive integers (that is, integers between $1000$ and $9999$ , inclusive) having only even digits are divisible by $5?$ $\textbf{(A) } 80 \qquad \textbf{(B) } 100 \qquad \textbf{(C) } 125 \qquad \textbf{(D) } 200 \qquad \textbf{(E) } 500$
-/

-- Solution/Answer (LaTeX):
/-
The units digit, for all numbers divisible by 5, must be either $0$ or $5$ . However, since all digits are even, the units digit must be $0$ . The middle two digits can be 0, 2, 4, 6, or 8, but the thousands digit can only be 2, 4, 6, or 8 since it cannot be zero. There is one choice for the units digit, 5 choices for each of the middle 2 digits, and 4 choices for the thousands digit, we have a total of $4\cdot5\cdot5\cdot1 = \boxed{\textbf{(B) } 100} \qquad$ numbers.
-/

import Mathlib.Tactic

theorem wiki_index_php_e9d7355d4c : Prop := by
  sorry
