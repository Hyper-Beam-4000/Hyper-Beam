-- 2022 AIME II Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_II_Problems/Problem_5

-- Problem (LaTeX):
/-
Twenty distinct points are marked on a circle and labeled $1$ through $20$ in clockwise order. A line segment is drawn between every pair of points whose labels differ by a prime number. Find the number of triangles formed whose vertices are among the original $20$ points.
-/

-- Solution/Answer (LaTeX):
/-
Let $a$ , $b$ , and $c$ be the vertex of a triangle that satisfies this problem, where $a > b > c$ . \[a - b = p_1\] \[b - c = p_2\] \[a - c = p_3\] $p_3 = a - c = a - b + b - c = p_1 + p_2$ . Because $p_3$ is the sum of two primes, $p_1$ and $p_2$ , $p_1$ or $p_2$ must be $2$ . Let $p_1 = 2$ , then $p_3 = p_2 + 2$ . There are only $8$ primes less than $20$ : $2, 3, 5, 7, 11, 13, 17, 19$ . Only $3, 5, 11, 17$ plus $2$ equals another prime. $p_2 \in \{ 3, 5, 11, 17 \}$ . Once $a$ is determined, $a = b+2$ and $b = c + p_2$ . There are $18$ values of $a$ where $b+2 \le 20$ , and $4$ values of $p_2$ . Therefore the answer is $18 \cdot 4 = \boxed{\textbf{072}}$ ~ isabelchen
-/

import Mathlib.Tactic

theorem wiki_index_php_d8ca8537fc : Prop := by
  sorry
