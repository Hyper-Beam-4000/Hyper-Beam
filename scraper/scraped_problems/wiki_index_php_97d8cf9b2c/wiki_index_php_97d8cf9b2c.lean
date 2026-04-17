-- 2017 AIME I Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_I_Problems/Problem_7

-- Problem (LaTeX):
/-
For nonnegative integers $a$ and $b$ with $a + b \leq 6$ , let $T(a, b) = \binom{6}{a} \binom{6}{b} \binom{6}{a + b}$ . Let $S$ denote the sum of all $T(a, b)$ , where $a$ and $b$ are nonnegative integers with $a + b \leq 6$ . Find the remainder when $S$ is divided by $1000$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $c=6-(a+b)$ , and note that $\binom{6}{a + b}=\binom{6}{c}$ . The problem thus asks for the sum $\binom{6}{a} \binom{6}{b} \binom{6}{c}$ over all $a,b,c$ such that $a+b+c=6$ . Consider an array of 18 dots, with 3 columns of 6 dots each. The desired expression counts the total number of ways to select 6 dots by considering each column separately, which is equal to $\binom{18}{6}=18564$ . Therefore, the answer is $\boxed{564}$ . -rocketscience
-/

import Mathlib.Tactic

theorem wiki_index_php_97d8cf9b2c : Prop := by
  sorry
