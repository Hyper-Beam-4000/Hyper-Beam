-- 2024 AIME I Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AIME_I_Problems/Problem_9

-- Problem (LaTeX):
/-
Let $A$ , $B$ , $C$ , and $D$ be points on the hyperbola $\frac{x^2}{20}- \frac{y^2}{24} = 1$ such that $ABCD$ is a rhombus whose diagonals intersect at the origin. Find the greatest real number that is less than $BD^2$ for all such rhombi.
-/

-- Solution/Answer (LaTeX):
/-
A quadrilateral is a rhombus if and only if its two diagonals bisect each other and are perpendicular to each other. The first condition is automatically satisfied because of the hyperbola's symmetry about the origin. To satisfy the second condition, we set $BD$ as the line $y = mx$ and $AC$ as $y = -\frac{1}{m}x.$ Because the hyperbola has asymptotes of slopes $\pm \frac{\sqrt6}{\sqrt5},$ we have $m, -\frac{1}{m} \in \left(-\frac{\sqrt6}{\sqrt5}, \frac{\sqrt6}{\sqrt5}\right).$ This gives us $m^2 \in \left(\frac{5}{6}, \frac{6}{5}\right).$ Plugging $y = mx$ into the equation for the hyperbola yields $x^2 = \frac{120}{6-5m^2}$ and $y^2 = \frac{120m^2}{6-5m^2}.$ By symmetry of the hyperbola, we know that $\left(\frac{BD}{2}\right)^2 = x^2 + y^2,$ so we wish to find a lower bound for $x^2 + y^2 = 120\left(\frac{1+m^2}{6-5m^2}\right).$ This is equivalent to minimizing $\frac{1+m^2}{6-5m^2} = -\frac{1}{5} + \frac{11}{5(6-5m^2)}$ . It's then easy to see that this expression increases with $m^2,$ so we plug in $m^2 = \frac{5}{6}$ to get $x^2+y^2 > 120,$ giving $BD^2 > \boxed{480}.$
-/

import Mathlib.Tactic

theorem wiki_index_php_09bb619aa0 : Prop := by
  sorry
