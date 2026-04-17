-- 2024 AMC 12B Problems/Problem 19
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_19

-- Problem (LaTeX):
/-
Equilateral $\triangle ABC$ with side length $14$ is rotated about its center by angle $\theta$ , where $0 < \theta < 60^{\circ}$ , to form $\triangle DEF$ . See the figure. The area of hexagon $ADBECF$ is $91\sqrt{3}$ . What is $\tan\theta$ ? [asy] // Credit to shihan for this diagram. defaultpen(fontsize(13)); size(200); pair O=(0,0),A=dir(225),B=dir(-15),C=dir(105),D=rotate(38.21,O)*A,E=rotate(38.21,O)*B,F=rotate(38.21,O)*C; draw(A--B--C--A,gray+0.4);draw(D--E--F--D,gray+0.4); draw(A--D--B--E--C--F--A,black+0.9); dot(O); dot("$A$",A,dir(A)); dot("$B$",B,dir(B)); dot("$C$",C,dir(C)); dot("$D$",D,dir(D)); dot("$E$",E,dir(E)); dot("$F$",F,dir(F)); [/asy] $\textbf{(A)}~\frac{3}{4}\qquad\textbf{(B)}~\frac{5\sqrt{3}}{11}\qquad\textbf{(C)}~\frac{4}{5}\qquad\textbf{(D)}~\frac{11}{13}\qquad\textbf{(E)}~\frac{7\sqrt{3}}{13}$
-/

-- Solution/Answer (LaTeX):
/-
Let O be circumcenter of the equilateral triangle Easily get $OF = \frac{14\sqrt{3}}{3}$ $2 \cdot (\triangle(OFC) + \triangle(OCE)) = OF^2 \cdot \sin(\theta) + OF^2 \cdot \sin(120 - \theta)$ \[= \frac{14^2 \cdot 3}{9} ( \sin(\theta) + \sin(120 - \theta) )\] \[= \frac{196}{3} ( \sin(\theta) + \sin(120 - \theta) )\] \[= 2 \cdot {\frac{1}{3} } \cdot(ADBECF) = 2\cdot \frac{91\sqrt{3}}{3}\] \[\sin(\theta) + \sin(120 - \theta) = \frac{13\sqrt{3}}{14}\] \[\sin(\theta) + \frac{ \sqrt{3}}{2}\cos( \theta) +\frac{ \sqrt{1}}{2}\sin( \theta) = \frac{13\sqrt{3}}{14}\] \[\sqrt{3} \sin( \theta) + \cos( \theta) = \frac{13 }{7}\] \[\cos( \theta) = \frac{13 }{7} - \sqrt{3} \sin( \theta)\] \[\frac{169 }{49} - \frac{26\sqrt{3} }{7} \sin( \theta) + 4 \sin( \theta)^2 = 1\] \[\sin( \theta) = \frac{5\sqrt{3} }{14} or \frac{4\sqrt{3} }{7}\] $\frac{4\sqrt{3} }{7}$ is invalid given $\theta \leq 60^\circ$ , $\sin(\theta ) < \sin( 60^\circ ) = \frac{\sqrt{3} }{2} = \frac{\sqrt{3} \cdot 3.5}{7}$ \[\cos( \theta) = \frac{11 }{14}\] \[\tan( \theta) = \frac{5\sqrt{3} }{11} \boxed{B }\] ~ luckuso
-/

import Mathlib.Tactic

theorem wiki_index_php_4d0343db2c : Prop := by
  sorry
