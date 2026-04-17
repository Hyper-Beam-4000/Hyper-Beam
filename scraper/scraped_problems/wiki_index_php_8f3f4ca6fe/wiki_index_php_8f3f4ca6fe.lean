-- 2018 AIME I Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_I_Problems/Problem_8

-- Problem (LaTeX):
/-
Let $ABCDEF$ be an equiangular hexagon such that $AB=6, BC=8, CD=10$ , and $DE=12$ . Denote by $d$ the diameter of the largest circle that fits inside the hexagon. Find $d^2$ .
-/

-- Solution/Answer (LaTeX):
/-
First of all, draw a good diagram! This is always the key to solving any geometry problem. Once you draw it, realize that $EF=2, FA=16$ . Why? Because since the hexagon is equiangular, we can put an equilateral triangle around it, with side length $6+8+10=24$ . Then, if you drew it to scale, notice that the "widest" this circle can be according to $AF, CD$ is $7\sqrt{3}$ . And it will be obvious that the sides won't be inside the circle, so our answer is $\boxed{147}$ . -expiLnCalc
-/

import Mathlib.Tactic

theorem wiki_index_php_8f3f4ca6fe : Prop := by
  sorry
