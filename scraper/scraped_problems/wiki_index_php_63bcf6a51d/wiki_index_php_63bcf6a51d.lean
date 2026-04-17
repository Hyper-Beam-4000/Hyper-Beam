-- 2020 AMC 10B Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_9

-- Problem (LaTeX):
/-
A three-quarter sector of a circle of radius $4$ inches together with its interior can be rolled up to form the lateral surface area of a right circular cone by taping together along the two radii shown. What is the volume of the cone in cubic inches? [asy] draw(Arc((0,0), 4, 0, 270)); draw((0,-4)--(0,0)--(4,0)); label("$4$", (2,0), S); [/asy] $\textbf{(A)}\ 3\pi \sqrt5 \qquad\textbf{(B)}\ 4\pi \sqrt3 \qquad\textbf{(C)}\ 3 \pi \sqrt7 \qquad\textbf{(D)}\ 6\pi \sqrt3 \qquad\textbf{(E)}\ 6\pi \sqrt7$
-/

-- Solution/Answer (LaTeX):
/-
Notice that when the cone is created, the 2 shown radii when merged will become the slant height of the cone and the intact circumference of the circle will become the circumference of the base of the cone. We can calculate that the intact circumference of the circle is $8\pi\cdot\frac{3}{4}=6\pi$ . Since that is also equal to the circumference of the cone, the radius of the cone is $3$ . We also have that the slant height of the cone is $4$ . Therefore, we use the Pythagorean Theorem to calculate that the height of the cone is $\sqrt{4^2-3^2}=\sqrt7$ . The volume of the cone is $\frac{1}{3}\cdot\pi\cdot3^2\cdot\sqrt7=\boxed{\textbf{(C)}\ 3 \pi \sqrt7 }$ -PCChess
-/

import Mathlib.Tactic

theorem wiki_index_php_63bcf6a51d : Prop := by
  sorry
