-- 2018 AIME II Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_II_Problems/Problem_2

-- Problem (LaTeX):
/-
Let $a_{0} = 2$ , $a_{1} = 5$ , and $a_{2} = 8$ , and for $n > 2$ define $a_{n}$ recursively to be the remainder when $4$ ( $a_{n-1}$ $+$ $a_{n-2}$ $+$ $a_{n-3}$ ) is divided by $11$ . Find $a_{2018} \cdot a_{2020} \cdot a_{2022}$ .
-/

-- Solution/Answer (LaTeX):
/-
When given a sequence problem, one good thing to do is to check if the sequence repeats itself or if there is a pattern. After computing more values of the sequence, it can be observed that the sequence repeats itself every 10 terms starting at $a_{0}$ . $a_{0} = 2$ , $a_{1} = 5$ , $a_{2} = 8$ , $a_{3} = 5$ , $a_{4} = 6$ , $a_{5} = 10$ , $a_{6} = 7$ , $a_{7} = 4$ , $a_{8} = 7$ , $a_{9} = 6$ , $a_{10} = 2$ , $a_{11} = 5$ , $a_{12} = 8$ , $a_{13} = 5$ We can simplify the expression we need to solve to $a_{8}\cdot a_{10} \cdot a_{2}$ . Our answer is $7 \cdot 2 \cdot 8$ $= \boxed{112}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_98b7b57243 : Prop := by
  sorry
