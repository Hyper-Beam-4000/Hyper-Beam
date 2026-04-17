-- 2020 AMC 12A Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12A_Problems/Problem_6

-- Problem (LaTeX):
/-
In the plane figure shown below, $3$ of the unit squares have been shaded. What is the least number of additional unit squares that must be shaded so that the resulting figure has two lines of symmetry? [asy] import olympiad; unitsize(25); filldraw((1,3)--(1,4)--(2,4)--(2,3)--cycle, gray(0.7)); filldraw((2,1)--(2,2)--(3,2)--(3,1)--cycle, gray(0.7)); filldraw((4,0)--(5,0)--(5,1)--(4,1)--cycle, gray(0.7)); for (int i = 0; i < 5; ++i) { for (int j = 0; j < 6; ++j) { pair A = (j,i); } } for (int i = 0; i < 5; ++i) { for (int j = 0; j < 6; ++j) { if (j != 5) { draw((j,i)--(j+1,i)); } if (i != 4) { draw((j,i)--(j,i+1)); } } } [/asy] $\textbf{(A) } 4 \qquad \textbf{(B) } 5 \qquad \textbf{(C) } 6 \qquad \textbf{(D) } 7 \qquad \textbf{(E) } 8$
-/

-- Solution/Answer (LaTeX):
/-
The two lines of symmetry must be horizontally and vertically through the middle. We can then fill the boxes in like so: [asy] import olympiad; unitsize(25); filldraw((1,3)--(1,4)--(2,4)--(2,3)--cycle, gray(0.7)); filldraw((0,3)--(0,4)--(1,4)--(1,3)--cycle, gray(0.9)); filldraw((3,3)--(3,4)--(4,4)--(4,3)--cycle, gray(0.9)); filldraw((4,3)--(4,4)--(5,4)--(5,3)--cycle, gray(0.9)); filldraw((2,2)--(2,3)--(3,3)--(3,2)--cycle, gray(0.9)); filldraw((2,1)--(2,2)--(3,2)--(3,1)--cycle, gray(0.7)); filldraw((3,0)--(4,0)--(4,1)--(3,1)--cycle, gray(0.9)); filldraw((1,0)--(2,0)--(2,1)--(1,1)--cycle, gray(0.9)); filldraw((4,0)--(5,0)--(5,1)--(4,1)--cycle, gray(0.7)); filldraw((0,0)--(1,0)--(1,1)--(0,1)--cycle, gray(0.9)); for (int i = 0; i < 5; ++i) { for (int j = 0; j < 6; ++j) { pair A = (j,i); } } for (int i = 0; i < 5; ++i) { for (int j = 0; j < 6; ++j) { if (j != 5) { draw((j,i)--(j+1,i)); } if (i != 4) { draw((j,i)--(j,i+1)); } } } [/asy] where the light gray boxes are the ones we have filled. Counting these, we get $\boxed{\textbf{(D) } 7}$ total boxes. ~ciceronii
-/

import Mathlib.Tactic

theorem wiki_index_php_4bac1eaa0e : Prop := by
  sorry
