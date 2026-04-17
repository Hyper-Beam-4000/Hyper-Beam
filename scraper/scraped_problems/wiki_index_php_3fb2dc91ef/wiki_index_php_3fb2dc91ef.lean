-- 2022 AIME I Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_I_Problems/Problem_14

-- Problem (LaTeX):
/-
Given $\triangle ABC$ and a point $P$ on one of its sides, call line $\ell$ the $\textit{splitting line}$ of $\triangle ABC$ through $P$ if $\ell$ passes through $P$ and divides $\triangle ABC$ into two polygons of equal perimeter. Let $\triangle ABC$ be a triangle where $BC = 219$ and $AB$ and $AC$ are positive integers. Let $M$ and $N$ be the midpoints of $\overline{AB}$ and $\overline{AC},$ respectively, and suppose that the splitting lines of $\triangle ABC$ through $M$ and $N$ intersect at $30^\circ.$ Find the perimeter of $\triangle ABC.$
-/

-- Solution/Answer (LaTeX):
/-
Consider the splitting line through $M$ . Extend $D$ on ray $BC$ such that $CD=CA$ . Then the splitting line bisects segment $BD$ , so in particular it is the midline of triangle $ABD$ and thus it is parallel to $AD$ . But since triangle $ACD$ is isosceles, we can easily see $AD$ is parallel to the angle bisector of $C$ , so the splitting line is also parallel to this bisector, and similar for the splitting line through $N$ . Some simple angle chasing reveals the condition is now equivalent to $\angle A=120^\circ$ . - MortemEtInteritum
-/

import Mathlib.Tactic

theorem wiki_index_php_3fb2dc91ef : Prop := by
  sorry
