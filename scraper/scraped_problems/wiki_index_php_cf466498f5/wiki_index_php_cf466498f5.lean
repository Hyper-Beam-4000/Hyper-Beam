-- 2024 AIME II Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AIME_II_Problems/Problem_10

-- Problem (LaTeX):
/-
Let $\triangle$ $ABC$ have incenter $I$ , circumcenter $O$ , inradius $6$ , and circumradius $13$ . Suppose that $\overline{IA} \perp \overline{OI}$ . Find $AB \cdot AC$ .
-/

-- Solution/Answer (LaTeX):
/-
Start off by (of course) drawing a diagram! Let $I$ and $O$ be the incenter and circumcenters of triangle $ABC$ , respectively. Furthermore, extend $AI$ to meet $BC$ at $L$ and the circumcircle of triangle $ABC$ at $D$ . [asy] size(300); import olympiad; real c=8.1,a=5*(c+sqrt(c^2-64))/6,b=5*(c-sqrt(c^2-64))/6; pair B=(0,0),C=(c,0), D = (c/2-0.01, -2.26); pair A = (c/3,8.65*c/10); draw(circumcircle(A,B,C)); pair I=incenter(A,B,C); pair O=circumcenter(A,B,C); pair L=extension(A,I,C,B); dot(I^^O^^A^^B^^C^^D^^L); draw(A--L); draw(A--D); path midangle(pair d,pair e,pair f) {return e--e+((f-e)/length(f-e)+(d-e)/length(d-e))/2;} draw(C--B--D--cycle); draw(A--C--B); draw(A--B); draw(B--I--C^^A--I); draw(incircle(A,B,C)); label("$B$",B,SW); label("$C$",C,SE); label("$A$",A,N); label("$D$",D,S); label("$I$",I,NW); label("$L$",L,SW); label("$O$",O,E); label("$\alpha$",B,5*dir(midangle(A,B,I)),fontsize(8)); label("$\alpha$",B,5*dir(midangle(I,B,C)),fontsize(8)); label("$\beta$",C,12*dir(midangle(B,C,I)),fontsize(8)); label("$\beta$",C,12*dir(midangle(I,C,A)),fontsize(8)); label("$\gamma$",A,5*dir(midangle(B,A,I)),fontsize(8)); label("$\gamma$",A,5*dir(midangle(I,A,C)),fontsize(8)); draw(I--O); draw(A--O); draw(rightanglemark(A,I,O)); [/asy] We'll tackle the initial steps of the problem in two different manners, both leading us to the same final calculations.
-/

import Mathlib.Tactic

theorem wiki_index_php_cf466498f5 : Prop := by
  sorry
