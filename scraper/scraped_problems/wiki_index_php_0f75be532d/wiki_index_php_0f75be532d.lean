-- 2021 AIME I Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AIME_I_Problems/Problem_5

-- Problem (LaTeX):
/-
Call a three-term strictly increasing arithmetic sequence of integers special if the sum of the squares of the three terms equals the product of the middle term and the square of the common difference. Find the sum of the third terms of all special sequences.
-/

-- Solution/Answer (LaTeX):
/-
Let the terms be $a-b$ , $a$ , and $a+b$ . Then we want $(a-b)^2+a^2+(a+b)^2=ab^2$ , or $3a^2+2b^2=ab^2$ . Rearranging, we get $b^2=\frac{3a^2}{a-2}$ . Simplifying further, $b^2=3a+6+\frac{12}{a-2}$ . Looking at this second equation, since the right side must be an integer, $a-2$ must equal $\pm1, 2, 3, 4, 6, 12$ . Looking at the first equation, we see $a>2$ since $b^2$ is positive. This means we must test $a=3, 4, 5, 6, 8, 14$ . After testing these, we see that only $a=5$ and $a=14$ work which give $b=5$ and $b=7$ respectively. Thus the answer is $10+21=\boxed{031}$ .
~JHawk0224 Note: You could also use synthetic division to get $b^2=\frac{3a^2}{a-2}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_0f75be532d : Prop := by
  sorry
