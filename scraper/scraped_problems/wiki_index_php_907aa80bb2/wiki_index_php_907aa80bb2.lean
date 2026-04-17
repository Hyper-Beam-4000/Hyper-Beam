-- 2022 AMC 12B Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12B_Problems/Problem_10

-- Problem (LaTeX):
/-
Regular hexagon $ABCDEF$ has side length $2$ . Let $G$ be the midpoint of $\overline{AB}$ , and let $H$ be the midpoint of $\overline{DE}$ . What is the perimeter of $GCHF$ ? $\textbf{(A)}\ 4\sqrt3 \qquad \textbf{(B)}\ 8 \qquad \textbf{(C)}\ 4\sqrt5 \qquad \textbf{(D)}\ 4\sqrt7 \qquad \textbf{(E)}\ 12$
-/

-- Solution/Answer (LaTeX):
/-
Let the center of the hexagon be $O$ . $\triangle AOB$ , $\triangle BOC$ , $\triangle COD$ , $\triangle DOE$ , $\triangle EOF$ , and $\triangle FOA$ are all equilateral triangles with side length $2$ . Thus, $CO = 2$ , and $GO = \sqrt{AO^2 - AG^2} = \sqrt{3}$ . By symmetry, $\angle COG = 90^{\circ}$ . Thus, by the Pythagorean theorem, $CG = \sqrt{2^2 + \sqrt{3}^2} = \sqrt{7}$ . Because $CO = OF$ and $GO = OH$ , $CG = HC = FH = GF = \sqrt{7}$ . Thus, the solution to our problem is $\sqrt{7} + \sqrt{7} + \sqrt{7} + \sqrt{7} = \boxed{\textbf{(D)}\ 4\sqrt7}$ . ~mathboy100
-/

import Mathlib.Tactic

theorem wiki_index_php_907aa80bb2 : Prop := by
  sorry
