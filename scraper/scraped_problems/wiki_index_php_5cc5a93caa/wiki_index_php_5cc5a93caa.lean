-- 2018 AIME II Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_II_Problems/Problem_11

-- Problem (LaTeX):
/-
Find the number of permutations of $1, 2, 3, 4, 5, 6$ such that for each $k$ with $1$ $\leq$ $k$ $\leq$ $5$ , at least one of the first $k$ terms of the permutation is greater than $k$ .
-/

-- Solution/Answer (LaTeX):
/-
If the first number is $6$ , then there are no restrictions. There are $5!$ , or $120$ ways to place the other $5$ numbers. If the first number is $5$ , $6$ can go in four places, and there are $4!$ ways to place the other $4$ numbers. $4 \cdot 4! = 96$ ways. If the first number is $4$ , .... 4 6 _ _ _ _ $\implies$ 24 ways 4 _ 6 _ _ _ $\implies$ 24 ways 4 _ _ 6 _ _ $\implies$ 24 ways 4 _ _ _ 6 _ $\implies$ 5 must go between $4$ and $6$ , so there are $3 \cdot 3! = 18$ ways. $24 + 24 + 24 + 18 = 90$ ways if 4 is first. If the first number is $3$ , .... 3 6 _ _ _ _ $\implies$ 24 ways 3 _ 6 _ _ _ $\implies$ 24 ways 3 1 _ 6 _ _ $\implies$ 4 ways 3 2 _ 6 _ _ $\implies$ 4 ways 3 4 _ 6 _ _ $\implies$ 6 ways 3 5 _ 6 _ _ $\implies$ 6 ways 3 5 _ _ 6 _ $\implies$ 6 ways 3 _ 5 _ 6 _ $\implies$ 6 ways 3 _ _ 5 6 _ $\implies$ 4 ways $24 + 24 + 4 + 4 + 6 + 6 + 6 + 6 + 4 = 84$ ways If the first number is $2$ , .... 2 6 _ _ _ _ $\implies$ 24 ways 2 _ 6 _ _ _ $\implies$ 18 ways 2 3 _ 6 _ _ $\implies$ 4 ways 2 4 _ 6 _ _ $\implies$ 6 ways 2 5 _ 6 _ _ $\implies$ 6 ways 2 5 _ _ 6 _ $\implies$ 6 ways 2 _ 5 _ 6 _ $\implies$ 4 ways 2 4 _ 5 6 _ $\implies$ 2 ways 2 3 4 5 6 1 $\implies$ 1 way $24 + 18 + 4 + 6 + 6 + 6 + 4 + 2 + 1 = 71$ ways Grand Total : $120 + 96 + 90 + 84 + 71 = \boxed{461}$
-/

import Mathlib.Tactic

theorem wiki_index_php_5cc5a93caa : Prop := by
  sorry
