-- 2024 AIME I Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AIME_I_Problems/Problem_8

-- Problem (LaTeX):
/-
Eight circles of radius $34$ are sequentially tangent, and two of the circles are tangent to $AB$ and $BC$ of triangle $ABC$ , respectively. $2024$ circles of radius $1$ can be arranged in the same manner. The inradius of triangle $ABC$ can be expressed as $\frac{m}{n}$ , where $m$ and $n$ are relatively prime positive integers. Find $m+n$ . [asy] /* Made by Mathemagician108 */ pair A = (2,1); pair B = (0,0); pair C = (3,0); dot(A^^B^^C); label("$A$", A, N); label("$B$", B, S); label("$C$", C, S); draw(A--B--C--cycle); for(real i=0.62; i<2.7; i+=0.29){ draw(circle((i,0.145), 0.145)); } [/asy]
-/

-- Solution/Answer (LaTeX):
/-
Draw an altitude from both end circles of the diagram with the circles of radius one, and call the lengths at the end cut off by the altitudes the altitudes of the circles down to $BC$ $a$ and $b$ . Now we have the length of side $BC$ of being $(2)(2022)+1+1+a+b$ . However, the side $BC$ can also be written as $(6)(68)+34+34+34a+34b$ , due to similar triangles from the second diagram. If we set the equations equal, we have $\frac{1190}{11} = a+b$ . Call the radius of the incircle $r$ , then we have the side BC to be $r(a+b)$ . We find $r$ as $\frac{4046+\frac{1190}{11}}{\frac{1190}{11}}$ , which simplifies to $\frac{10+((34)(11))}{10}$ ,so we have $\frac{192}{5}$ , which sums to $\boxed{197}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_2d91ca0ba1 : Prop := by
  sorry
