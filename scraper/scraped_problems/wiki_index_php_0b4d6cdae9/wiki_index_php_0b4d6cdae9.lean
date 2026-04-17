-- 2019 AMC 10B Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12B_Problems/Problem_5

-- Problem (LaTeX):
/-
Each piece of candy in a store costs a whole number of cents. Casper has exactly enough money to buy either $12$ pieces of red candy, $14$ pieces of green candy, $15$ pieces of blue candy, or $n$ pieces of purple candy. A piece of purple candy costs $20$ cents. What is the smallest possible value of $n$ ? $\textbf{(A) } 18 \qquad \textbf{(B) } 21 \qquad \textbf{(C) } 24\qquad \textbf{(D) } 25 \qquad \textbf{(E) } 28$
-/

-- Solution/Answer (LaTeX):
/-
If he has enough money to buy $12$ pieces of red candy, $14$ pieces of green candy, and $15$ pieces of blue candy, then the smallest amount of money he could have is $\text{lcm}{(12,14,15)} = 420$ cents. Since a piece of purple candy costs $20$ cents, the smallest possible value of $n$ is $\frac{420}{20} = \boxed{\textbf{(B) } 21}$ . ~IronicNinja
-/

import Mathlib.Tactic

theorem wiki_index_php_0b4d6cdae9 : Prop := by
  sorry
