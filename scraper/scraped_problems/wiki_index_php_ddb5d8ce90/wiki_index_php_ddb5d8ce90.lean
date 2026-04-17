-- 2019 AMC 10B Problems/Problem 23
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12B_Problems/Problem_20

-- Problem (LaTeX):
/-
Points $A=(6,13)$ and $B=(12,11)$ lie on circle $\omega$ in the plane. Suppose that the tangent lines to $\omega$ at $A$ and $B$ intersect at a point on the $x$ -axis. What is the area of $\omega$ ? $\textbf{(A) }\frac{83\pi}{8}\qquad\textbf{(B) }\frac{21\pi}{2}\qquad\textbf{(C) } \frac{85\pi}{8}\qquad\textbf{(D) }\frac{43\pi}{4}\qquad\textbf{(E) }\frac{87\pi}{8}$
-/

-- Solution/Answer (LaTeX):
/-
First, observe that the two tangent lines are of identical length. Therefore, supposing that the point of intersection is $(x, 0)$ , the Pythagorean Theorem gives $\sqrt{(x-6)^2 + 13^2} = \sqrt{(x-12)^2 + 11^2}$ . This simplifies to $x = 5$ . Further, notice (due to the right angles formed by a radius and its tangent line) that the quadrilateral (a kite) $AOBX$ is cyclic. Therefore, we can apply Ptolemy's Theorem to give: $2\sqrt{170}r = d \sqrt{40}$ , where $r$ is the radius of the circle and $d$ is the distance between the circle's center and $(5, 0)$ . Therefore, $d = \sqrt{17}r$ . Using the Pythagorean Theorem on the right triangle $OAX$ (or $OBX$ ), we find that $170 + r^2 = 17r^2$ , so $r^2 = \frac{85}{8}$ , and thus the area of the circle is $\boxed{\textbf{(C) }\frac{85}{8}\pi}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_ddb5d8ce90 : Prop := by
  sorry
