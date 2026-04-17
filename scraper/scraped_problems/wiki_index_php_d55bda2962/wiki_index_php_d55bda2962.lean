-- 2025 AMC 12A Problems/Problem 20
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12A_Problems/Problem_20

-- Problem (LaTeX):
/-
The base of the pentahedron shown below is a $13 \times 8$ rectangle, and its lateral faces are two isosceles triangles with base of length $8$ and congruent sides of length $13$ , and two isosceles trapezoids with bases of length $7$ and $13$ and nonparallel sides of length $13$ . [asy] /* Refined by Mathemagician108 */ import graph3; size(200); real l = 13; real w = 8; real offset = (l - 7)/2; // 3 real midy = w/2; // 4 real h = 12; triple O1 = (0,0,0); triple O2 = (l,0,0); triple O3 = (l,w,0); triple O4 = (0,w,0); triple T1 = (offset, midy, h); triple T2 = (l - offset, midy, h); currentprojection=orthographic((-4,-6,3)); draw(O4--O1--O2, linewidth(1)); draw(O2--O3--O4, dashed + linewidth(1)); draw(O3--T2, dashed + linewidth(1)); draw(O1--T1, linewidth(1)); draw(O4--T1, linewidth(1)); draw(O2--T2, linewidth(1)); draw(T1--T2, linewidth(1)); label("13", (O1+O2)/2, 3*-Y); // Bottom length label("13", (O2+T2)/2, 1.5*X); label("13", (O4+T1)/2, 2*-X); label("8", (O1+O4)/2, 2*-X); // Width label("7", (T1+T2)/2, 1.5*Z); // Top length [/asy] What is the volume of the pentahedron? $\textbf{(A) } 416 \qquad \textbf{(B) } 520 \qquad \textbf{(C) } 528 \qquad \textbf{(D) } 676 \qquad \textbf{(E) } 832$
-/

-- Solution/Answer (LaTeX):
/-
Notice that the triangular faces have a slant height of $\sqrt{13^2-4^2}=\sqrt{153}$ and that the height is therefore $\sqrt{153-(\frac{13-7}{2})^2} = 12$ . Then we can split the pentahedron into a triangular prism and two pyramids. The pyramids each have a volume of $\frac{1}{3}(3)(8)(12) = 96$ and the prism has a volume of $\frac{1}{2}(8)(12)(7) = 336$ . Thus the answer is $336+96 \cdot 2 = \boxed{\textbf{(C) } 528}$ ~ Shadowleafy
-/

import Mathlib.Tactic

theorem wiki_index_php_d55bda2962 : Prop := by
  sorry
