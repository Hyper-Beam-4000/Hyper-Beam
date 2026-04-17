-- 2020 AMC 12A Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12A_Problems/Problem_14

-- Problem (LaTeX):
/-
Regular octagon $ABCDEFGH$ has area $n$ . Let $m$ be the area of quadrilateral $ACEG$ . What is $\tfrac{m}{n}?$ $\textbf{(A) } \frac{\sqrt{2}}{4} \qquad \textbf{(B) } \frac{\sqrt{2}}{2} \qquad \textbf{(C) } \frac{3}{4} \qquad \textbf{(D) } \frac{3\sqrt{2}}{5} \qquad \textbf{(E) } \frac{2\sqrt{2}}{3}$
-/

-- Solution/Answer (LaTeX):
/-
$ACEG$ is a square. WLOG $AB = 1,$ then using Law of Cosines, $AC^2 = [ACEG] = 1^2 + 1^2 - 2 \cos{135} = 2 + \sqrt{2}.$ The area of the octagon is just $[ACEG]$ plus the area of the four congruent (by symmetry) isosceles triangles, all an angle of $135$ in between two sides of length 1. Now, \[\dfrac{m}{n} = \dfrac{2 + \sqrt{2}}{2 + \sqrt{2} + 4 \cdot \tfrac{1}{2} \sin{135}} = \dfrac{2 + \sqrt{2}}{2 + 2 \sqrt{2}} = \dfrac{\sqrt{2}}{2}.\] The answer is $\boxed{\textbf{(B)}}.$
-/

import Mathlib.Tactic

theorem wiki_index_php_3134c25304 : Prop := by
  sorry
