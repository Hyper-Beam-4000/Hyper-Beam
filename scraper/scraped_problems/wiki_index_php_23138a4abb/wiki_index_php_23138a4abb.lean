-- 2018 AMC 12B Problems/Problem 23
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12B_Problems/Problem_23

-- Problem (LaTeX):
/-
Ajay is standing at point $A$ near Pontianak, Indonesia, $0^\circ$ latitude and $110^\circ \text{ E}$ longitude. Billy is standing at point $B$ near Big Baldy Mountain, Idaho, USA, $45^\circ \text{ N}$ latitude and $115^\circ \text{ W}$ longitude. Assume that Earth is a perfect sphere with center $C.$ What is the degree measure of $\angle ACB?$ $\textbf{(A) }105 \qquad \textbf{(B) }112\frac{1}{2} \qquad \textbf{(C) }120 \qquad \textbf{(D) }135 \qquad \textbf{(E) }150 \qquad$
-/

-- Solution/Answer (LaTeX):
/-
This solution refers to the Diagram section. Let $D$ be the orthogonal projection of $B$ onto the equator. Note that $\angle BDA = \angle BDC = 90^\circ$ and $\angle BCD = 45^\circ.$ Recall that $115^\circ \text{ W}$ longitude is the same as $245^\circ \text{ E}$ longitude, so $\angle ACD=135^\circ.$ We obtain the following diagram: [asy] /* Made by MRENTHUSIASM */ size(250); import graph3; import solids; currentprojection=orthographic((0.2,-0.5,0.2)); triple A, B, C, D; A = (1,0,0); B = (-1/2,1/2,sqrt(2)/2); C = (0,0,0); D = (-1/2,1/2,0); draw(unitsphere,white,light=White); draw(surface(A--B--C--cycle),yellow); dot(A^^B^^C^^D,linewidth(4.5)); draw(Circle(C,1,(0,0,1))^^A--B--D--C--B^^C--A--D); label("$A$",A,3*dir(A)); label("$B$",B,3*dir(B)); label("$C$",C,3*(0,0,-1)); label("$D$",D,3*(-1/2,-1/2,0)); [/asy] Without loss of generality, let $AC=BC=1.$ For tetrahedron $ABCD:$ Since $\triangle BCD$ is an isosceles right triangle, we have $BD=CD=\frac{\sqrt2}{2}.$ In $\triangle ACD,$ we apply the Law of Cosines to get $AD=\sqrt{AC^2+CD^2-2\cdot AC\cdot CD\cdot\cos\angle ACD}=\frac{\sqrt{10}}{2}.$ In right $\triangle ABD,$ we apply the Pythagorean Theorem to get $AB=\sqrt{AD^2+BD^2}=\sqrt{3}.$ In $\triangle ABC,$ we apply the Law of Cosines to get $\cos\angle ACB=\frac{AC^2+BC^2-AB^2}{2\cdot AC\cdot BC}=-\frac12,$ so $\angle ACB=\boxed{\textbf{(C) }120}$ degrees. ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_23138a4abb : Prop := by
  sorry
