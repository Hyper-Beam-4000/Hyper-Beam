-- 2020 AIME I Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_I_Problems/Problem_13

-- Problem (LaTeX):
/-
Point $D$ lies on side $\overline{BC}$ of $\triangle ABC$ so that $\overline{AD}$ bisects $\angle BAC.$ The perpendicular bisector of $\overline{AD}$ intersects the bisectors of $\angle ABC$ and $\angle ACB$ in points $E$ and $F,$ respectively. Given that $AB=4,BC=5,$ and $CA=6,$ the area of $\triangle AEF$ can be written as $\tfrac{m\sqrt{n}}p,$ where $m$ and $p$ are relatively prime positive integers, and $n$ is a positive integer not divisible by the square of any prime. Find $m+n+p.$
-/

-- Solution/Answer (LaTeX):
/-
Points are defined as shown (Actually Point G is a point on line BC such that $\triangle AGD$ has circumcenter F, while Point H is a point on line BC such that $\triangle AHD$ has circumcenter E). Since $\angle{AFE} = \angle{AGD}$ , and $\angle{AEF} = \angle{AHD}$ , it is a breakthrough to get $\triangle AFE \sim \triangle AGH$ . We'd like to compare altitudes to help us compare their areas. Now, note that $AD/2$ is the altitude of $\triangle AFE$ , and Stewart's theorem implies that $AD/2 = \frac{\sqrt{18}}{2}$ . Similarly, the altitude of $\triangle AGH$ is the altitude of $\triangle ABC$ , or $\frac{3\sqrt{7}}{2}$ . However, by the symmetry axis $BE$ on quadrilateral $ABHE$ , we have $BH = AB = 4$ , and similarly $CG = CA = 6$ , so $GB = HC = 1$ , and therefore $[AGH] = [ABC]$ . From here, we get that the area of $\triangle AFE$ is $\frac{15\sqrt{7}}{4}*(\frac{\frac{3\sqrt{7}}{2}}{\frac{\sqrt{18}}{2}})^2=\frac{15\sqrt{7}}{14} \implies \boxed{036}$ , by similarity. ~awang11 ~gougutheorem
-/

import Mathlib.Tactic

theorem wiki_index_php_452b508247 : Prop := by
  sorry
