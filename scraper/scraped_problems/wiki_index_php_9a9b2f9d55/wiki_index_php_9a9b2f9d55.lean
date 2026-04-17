-- 2019 AIME II Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AIME_II_Problems/Problem_3

-- Problem (LaTeX):
/-
Find the number of $7$ -tuples of positive integers $(a,b,c,d,e,f,g)$ that satisfy the following systems of equations: \begin{align*} abc&=70,\\ cde&=71,\\ efg&=72. \end{align*}
-/

-- Solution/Answer (LaTeX):
/-
As 71 is prime, $c$ , $d$ , and $e$ must be 1, 1, and 71 (in some order). However, since $c$ and $e$ are divisors of 70 and 72 respectively, the only possibility is $(c,d,e) = (1,71,1)$ . Now we are left with finding the number of solutions $(a,b,f,g)$ satisfying $ab = 70$ and $fg = 72$ , which separates easily into two subproblems. The number of positive integer solutions to $ab = 70$ simply equals the number of divisors of 70 (as we can choose a divisor for $a$ , which uniquely determines $b$ ). As $70 = 2^1 \cdot 5^1 \cdot 7^1$ , we have $d(70) = (1+1)(1+1)(1+1) = 8$ solutions. Similarly, $72 = 2^3 \cdot 3^2$ , so $d(72) = 4 \times 3 = 12$ . Then the answer is simply $8 \times 12 = \boxed{096}$ . -scrabbler94
-/

import Mathlib.Tactic

theorem wiki_index_php_9a9b2f9d55 : Prop := by
  sorry
