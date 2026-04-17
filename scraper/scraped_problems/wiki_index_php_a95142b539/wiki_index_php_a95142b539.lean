-- 2022 USAMO Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_USAMO_Problems/Problem_4

-- Problem (LaTeX):
/-
Find all pairs of primes $(p, q)$ for which $p-q$ and $pq-q$ are both perfect squares.
-/

-- Solution/Answer (LaTeX):
/-
Since $q(p-1)$ is a perfect square and $q$ is prime, we should have $p - 1 = qb^2$ for some positive integer $b$ . Let $a^2 = p - q$ . Therefore, $q = p - a^2$ , and substituting that into the $p - 1 = qb^2$ and solving for $p$ gives \[p = \frac{a^2b^2 - 1}{b^2 - 1} = \frac{(ab - 1)(ab + 1)}{b^2 - 1}.\] Notice that we also have \[p = \frac{a^2b^2 - 1}{b^2 - 1} = a^2 + \frac{a^2 - 1}{b^2 - 1}\] and so $b^2 - 1 | a^2 - 1$ . We run through the cases $a = 1$ : Then $p - q = 1$ so $(p, q) = (3, 2)$ , which works. $a = b$ : This means $p = a^2 + 1$ , so $q = 1$ , a contradiction. $a > b$ : This means that $b^2 - 1 < ab - 1$ . Since $b^2 - 1$ can be split up into two factors $F_1, F_2$ such that $F_1 | ab - 1$ and $F_2 | ab + 1$ , we get \[p = \frac{ab - 1}{F_1} \cdot \frac{ab + 1}{F_2}\] and each factor is greater than $1$ , contradicting the primality of $p$ . Thus, the only solution is $(p, q) = (3, 2)$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_a95142b539 : Prop := by
  sorry
