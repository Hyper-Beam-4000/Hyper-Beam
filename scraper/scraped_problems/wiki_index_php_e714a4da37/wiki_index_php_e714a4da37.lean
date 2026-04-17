-- 2018 AIME I Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_I_Problems/Problem_7

-- Problem (LaTeX):
/-
A right hexagonal prism has height $2$ . The bases are regular hexagons with side length $1$ . Any $3$ of the $12$ vertices determine a triangle. Find the number of these triangles that are isosceles (including equilateral triangles).
-/

-- Solution/Answer (LaTeX):
/-
We can consider two cases: when the three vertices are on one base, and when the vertices are on two bases. Case 1: vertices are on one base. Then we can call one of the vertices $A$ for distinction. Either the triangle can have sides $1, 1, \sqrt{3}$ with 6 cases or $\sqrt{3}, \sqrt{3}, \sqrt{3}$ with 2 cases. This can be repeated on the other base for $16$ cases. Case 2: The vertices span two bases. WLOG call the only vertex on one of the bases $X$ . Call the closest vertex on the other base $B$ , and label clockwise $C, D, E, F, G$ . We will multiply the following scenarios by $12$ , because the top vertex can have $6$ positions and the top vertex can be on the other base. We can have $XCG, XDF$ , but we are not done! Don't forget that the problem statement implies that the longest diagonal in a base is $2$ and the height is $2$ , so $XBE$ is also correct! Those are the only three cases, so there are $12*3=36$ cases for this case. In total there's $\boxed{052}$ cases.
-/

import Mathlib.Tactic

theorem wiki_index_php_e714a4da37 : Prop := by
  sorry
