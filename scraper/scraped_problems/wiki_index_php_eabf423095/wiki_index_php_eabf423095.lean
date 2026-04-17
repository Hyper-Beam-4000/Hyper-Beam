-- 2025 AIME II Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AIME_II_Problems/Problem_1

-- Problem (LaTeX):
/-
Six points $A, B, C, D, E,$ and $F$ lie in a straight line in that order. Suppose that $G$ is a point not on the line and that $AC=26, BD=22, CE=31, DF=33, AF=73, CG=40,$ and $DG=30.$ Find the area of $\triangle BGE.$
-/

-- Solution/Answer (LaTeX):
/-
[asy] pair A,B,C,D,E,F,G; A=(0,0); label("$A$", A, S); B=(1.5,0); label("$B$", B, S); C=(2.9,0); label("$C$", C, S); D=(4.2,0); label("$D$", D, S); E=(5.3,0); label("$E$", E, S); F=(6.5,0); label("$F$", F, S); G=(3.7,3); label("$G$", G, N); draw(A--B--C--D--E--F); draw(C--G--D); draw(B--G--E); [/asy] Let $AB=a$ , $BC=b$ , $CD=c$ , $DE=d$ and $EF=e$ . Then we know that $a+b+c+d+e=73$ , $a+b=26$ , $b+c=22$ , $c+d=31$ and $d+e=33$ . From this we can easily deduce $c=14$ and $a+e=34$ thus $b+c+d=39$ . Using Heron's formula we can calculate the area of $\triangle{CGD}$ to be $\sqrt{(42)(28)(12)(2)}=168$ , and since the base of $\triangle{BGE}$ is $\frac{39}{14}$ of that of $\triangle{CGD}$ $\triangle{BGE}$ shares an altitude with $\triangle{CGD}$ , we conclude they are proportional and we can calculate the area of $\triangle{BGE}$ to be $168\times \frac{39}{14}=\boxed{468}$ . ~ Quick Asymptote Fix by eevee9406 , edited by aoum
-/

import Mathlib.Tactic

theorem wiki_index_php_eabf423095 : Prop := by
  sorry
