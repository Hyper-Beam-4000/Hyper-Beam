-- 2021 AMC 12A Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_11

-- Problem (LaTeX):
/-
A laser is placed at the point $(3,5)$ . The laser beam travels in a straight line. Larry wants the beam to hit and bounce off the $y$ -axis, then hit and bounce off the $x$ -axis, then hit the point $(7,5)$ . What is the total distance the beam will travel along this path? $\textbf{(A) }2\sqrt{10} \qquad \textbf{(B) }5\sqrt2 \qquad \textbf{(C) }10\sqrt2 \qquad \textbf{(D) }15\sqrt2 \qquad \textbf{(E) }10\sqrt5$
-/

-- Solution/Answer (LaTeX):
/-
Let $A=(3,5)$ and $D=(7,5).$ Suppose that the beam hits and bounces off the $y$ -axis at $B,$ then hits and bounces off the $x$ -axis at $C.$ When the beam hits and bounces off a coordinate axis, the angle of incidence and the angle of reflection are congruent. Therefore, we straighten up the path of the beam by reflections: We reflect $\overline{BC}$ about the $y$ -axis to get $\overline{BC'}.$ We reflect $\overline{CD}$ about the $x$ -axis to get $\overline{CD'}$ with $D'=(7,-5),$ then reflect $\overline{CD'}$ about the $y$ -axis to get $\overline{C'D''}$ with $D''=(-7,-5).$ We obtain the following diagram: [asy] /* Made by MRENTHUSIASM */ size(225); int xMin = -9; int xMax = 9; int yMin = -7; int yMax = 7; draw((xMin,0)--(xMax,0),black+linewidth(1.5),EndArrow(5)); draw((0,yMin)--(0,yMax),black+linewidth(1.5),EndArrow(5)); label("$x$",(xMax,0),(2,0)); label("$y$",(0,yMax),(0,2)); pair A = (3,5); pair B = (0,2); pair C = (2,0); pair D = (7,5); pair E = (-2,0); pair F = (7,-5); pair G = (-7,-5); draw(A--B--C--D,red); draw(B--E,heavygreen+dashed); draw(C--F,heavygreen+dashed); draw(E--G,heavygreen+dashed); dot("$A(3,5)$",A,(0,2),linewidth(3.5)); dot("$B$",B,(-2,0),linewidth(3.5)); dot("$C$",C,(0,-2),linewidth(3.5)); dot("$D(7,5)$",D,(0,2),linewidth(3.5)); dot("$C'$",E,(0,-2),linewidth(3.5)); dot("$D'(7,-5)$",F,(0,-2),linewidth(3.5)); dot("$D''(-7,-5)$",G,(0,-2),linewidth(3.5)); [/asy] The total distance that the beam will travel is \begin{align*} AB+BC+CD&=AB+BC+CD' \\ &=AB+BC'+C'D'' \\ &=AD'' \\ &=\sqrt{((3-(-7))^2+(5-(-5))^2} \\ &=\boxed{\textbf{(C) }10\sqrt2}. \end{align*} ~MRENTHUSIASM (Solution) ~JHawk0224 (Proposal) ~crystalkqw (Minor edits)
-/

import Mathlib.Tactic

theorem wiki_index_php_177a84f854 : Prop := by
  sorry
