-- 2020 AIME II Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_II_Problems/Problem_1

-- Problem (LaTeX):
/-
Find the number of ordered pairs of positive integers $(m,n)$ such that ${m^2n = 20 ^{20}}$ .
-/

-- Solution/Answer (LaTeX):
/-
In this problem, we want to find the number of ordered pairs $(m, n)$ such that $m^2n = 20^{20}$ . Let $x = m^2$ . Therefore, we want two numbers, $x$ and $n$ , such that their product is $20^{20}$ and $x$ is a perfect square. Note that there is exactly one valid $n$ for a unique $x$ , which is $\tfrac{20^{20}}{x}$ . This reduces the problem to finding the number of unique perfect square factors of $20^{20}$ . $20^{20} = 2^{40} \cdot 5^{20} = \left(2^2\right)^{20}\cdot\left(5^2\right)^{10}.$ Therefore, the answer is $21 \cdot 11 = \boxed{231}.$ ~superagh ~TheBeast5520
-/

import Mathlib.Tactic

theorem wiki_index_php_fffd7d4fbd : Prop := by
  sorry
