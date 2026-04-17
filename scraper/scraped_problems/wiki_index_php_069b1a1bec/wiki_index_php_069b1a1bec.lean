-- 2025 AMC 12B Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_10

-- Problem (LaTeX):
/-
The altitude to the hypotenuse of a $30^\circ{-}60^\circ{-}90^\circ$ is divided into two segments of lengths $x<y$ by the median to the shortest side of the triangle. What is the ratio $\tfrac{x}{x+y}$ ? $\textbf{(A) } \dfrac{3}{7} \qquad \textbf{(B) } \dfrac{\sqrt3}{4} \qquad \textbf{(C) } \dfrac{4}{9} \qquad \textbf{(D) } \dfrac{5}{11} \qquad \textbf{(E) } \dfrac{4\sqrt3}{15}$
-/

-- Solution/Answer (LaTeX):
/-
Without loss of generality, let $\triangle ABC$ have side-lengths $AB=2, BC=2\sqrt{3},$ and $AC=4.$ Let $D$ be the foot of the perpendicular from $B$ to $\overline{AC}, \ E$ be the midpoint of $\overline{AB},$ and $F$ be the intersection of $\overline{CE}$ and $\overline{BD}.$ Note that $\triangle ADB$ and $\triangle BDC$ are both $30^\circ{-}60^\circ{-}90^\circ$ triangles. From the side-length ratio, we get $AD=1$ and $DC=3.$ We obtain the following diagram: [asy] /* Made by MRENTHUSIASM */ size(250); pair A, B, C, D, E, F; A = (0,1); B = origin; C = (sqrt(3),0); D = foot(B,A,C); E = midpoint(A--B); F = intersectionpoint(B--D,C--E); markscalefactor=0.008; draw(rightanglemark(A,B,C)^^rightanglemark(B,D,C),red+linewidth(1.25)); draw(A--B--C--cycle,linewidth(1.25)); draw(B--D^^C--E,linewidth(1.25)); label("$1$",midpoint(A--E),1.5*W,red); label("$1$",midpoint(E--B),1.5*W,red); label("$2\sqrt{3}$",midpoint(B--C),1.5*S,red); label("$x$",midpoint(D--F),1.25*dir(-45),red); label("$y$",midpoint(F--B),1.5*dir(-10),red); label("$30^{\circ}$",C,7*dir(165),red); label("$60^{\circ}$",A,4*dir(-63),red); label("$1$",midpoint(A--D),1.5*midpoint(A--D),red); label("$3$",midpoint(D--C),1.5*dir(70),red); label("$A$",A,1.5*NW); label("$B$",B,1.5*SW); label("$C$",C,1.5*SE); label("$D$",D,1.5*NE); label("$E$",E,1.5*W); label("$F$",F,2*dir(-75)); [/asy] From here, we will proceed with mass points . Throughout this solution, we will use $W_P$ to denote the weight of point $P.$ Let $W_C=1.$ Since $3AD=DC,$ it follows that $W_A=3$ and $W_D=W_C+W_A=4.$ Since $AE=EB$ and $W_A=3,$ it follows that $W_B=3.$ Now we focus on $\overline{BD}:$ Since $W_B=3$ and $W_D=4,$ we have $\frac{DF}{FB}=\frac xy=\frac34.$ Therefore, the answer is \[\frac{x}{x+y}=\frac{3}{3+4}=\boxed{\textbf{(A) } \dfrac{3}{7}}.\] ~lprado ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_069b1a1bec : Prop := by
  sorry
