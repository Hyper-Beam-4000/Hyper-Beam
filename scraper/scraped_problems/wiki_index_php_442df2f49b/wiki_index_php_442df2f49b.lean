-- 2017 AIME I Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_I_Problems/Problem_1

-- Problem (LaTeX):
/-
Fifteen distinct points are designated on $\triangle ABC$ : the 3 vertices $A$ , $B$ , and $C$ ; $3$ other points on side $\overline{AB}$ ; $4$ other points on side $\overline{BC}$ ; and $5$ other points on side $\overline{CA}$ . Find the number of triangles with positive area whose vertices are among these $15$ points.
-/

-- Solution/Answer (LaTeX):
/-
Every triangle is uniquely determined by 3 points. There are $\binom{15}{3}=455$ ways to choose 3 points, but that counts the degenerate triangles formed by choosing three points on a line. There are $\binom{5}{3}$ invalid cases on segment $AB$ , $\binom{6}{3}$ invalid cases on segment $BC$ , and $\binom{7}{3}$ invalid cases on segment $CA$ for a total of $65$ invalid cases. The answer is thus $455-65=\boxed{390}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_442df2f49b : Prop := by
  sorry
