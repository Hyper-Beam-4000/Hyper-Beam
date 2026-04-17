-- 2024 AMC 12A Problems/Problem 24
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_24

-- Problem (LaTeX):
/-
A $\textit{disphenoid}$ is a tetrahedron whose triangular faces are congruent to one another. What is the least total surface area of a disphenoid whose faces are scalene triangles with integer side lengths? $\textbf{(A) }\sqrt{3}\qquad\textbf{(B) }3\sqrt{15}\qquad\textbf{(C) }15\qquad\textbf{(D) }15\sqrt{7}\qquad\textbf{(E) }24\sqrt{6}$
-/

-- Solution/Answer (LaTeX):
/-
Notice that any scalene $\textit{acute}$ triangle can be the faces of a $\textit{disphenoid}$ . (See proof in Solution 2.) As a result, we simply have to find the smallest area a scalene acute triangle with integer side lengths can take on. This occurs with a $4,5,6$ triangle (notice that if you decrease the value of any of the sides the resulting triangle will either be isosceles, degenerate, or non-acute). For this triangle, the semiperimeter is $\frac{15}{2}$ , so by Heron’s Formula: \begin{align*}
A&=\sqrt{\frac{15}{2}\cdot\frac{7}{2}\cdot\frac{5}{2}\cdot\frac{3}{2}}\\
&=\sqrt{\frac{15^2\cdot7}{16}}\\
&=\frac{15}{4}\sqrt{7}
\end{align*} The surface area is simply four times the area of one of the triangles, or $\boxed{\textbf{(D) }15\sqrt{7}}$ . ~eevee9406
-/

import Mathlib.Tactic

theorem wiki_index_php_e594abff2f : Prop := by
  sorry
