-- 2017 AIME I Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_I_Problems/Problem_10

-- Problem (LaTeX):
/-
Let $z_1=18+83i,~z_2=18+39i,$ and $z_3=78+99i,$ where $i=\sqrt{-1}.$ Let $z$ be the unique complex number with the properties that $\frac{z_3-z_1}{z_2-z_1}~\cdot~\frac{z-z_2}{z-z_3}$ is a real number and the imaginary part of $z$ is the greatest possible. Find the real part of $z$ .
-/

-- Solution/Answer (LaTeX):
/-
This problem is pretty obvious how to bash, and indeed many of the solutions below explain how to do that. But there’s no fun in that, and let’s see if we can come up with a slicker solution that will be more enjoyable. Instead of thinking of complex numbers as purely a real plus a constant times $i$ , let’s graph them and hope that the geometric visualization adds insight to the problem. [asy] size(1200,300); real xMin = 0; real xMax = 100; real yMin = 0; real yMax = 120; draw((xMin,0)--(xMax,0),black+linewidth(1.5),EndArrow(5)); draw((0,yMin)--(0,yMax),black+linewidth(1.5),EndArrow(5)); label("$R$",(xMax,0),(2,0)); label("$Im$",(0,yMax),(0,2)); pair A,B,C,D; A = (18,83); B = (18,39); C = (78,99); D = (56, 104.908997); dot(A); dot(B); dot(C); dot(D); label("$Z_1$", A, N); label("$Z_2$", B, S); label("$Z_3$", C, N); label("$Z$", D, N); [/asy] Note that when we subtract two vectors, the geometric result is the line segment between the two endpoints of the vectors. Thus we can fill in $z_3 - z_1, z_2 - z_1, z-z_2$ and $z-z_3$ as so; [asy] size(1200,300); real xMin = 0; real xMax = 100; real yMin = 0; real yMax = 120; draw((xMin,0)--(xMax,0),black+linewidth(1.5),EndArrow(5)); draw((0,yMin)--(0,yMax),black+linewidth(1.5),EndArrow(5)); label("$R$",(xMax,0),(2,0)); label("$Im$",(0,yMax),(0,2)); pair A,B,C,D; A = (18,83); B = (18,39); C = (78,99); D = (56, 104.908997); dot(A); dot(B); dot(C); dot(D); draw(A--C); draw(A--B); draw(D--C); draw(D--B); label("$Z_1$", A, N); label("$Z_2$", B, S); label("$Z_3$", C, N); label("$Z$", D, N); [/asy] $\angle Z_3Z_1Z_2$ looks similar to $\angle Z_3ZZ_2$ , so let’s try to prove that they are congruent. We can show this in two ways;
-/

import Mathlib.Tactic

theorem wiki_index_php_d0ed4da153 : Prop := by
  sorry
