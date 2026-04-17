-- 2025 AMC 12A Problems/Problem 24
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12A_Problems/Problem_24

-- Problem (LaTeX):
/-
A circle of radius $r$ is surrounded by $12$ circles of radius $1,$ externally tangent to the central circle and sequentially tangent to each other, as shown. Then $r$ can be written as $\sqrt a + \sqrt b + c,$ where $a, b, c$ are integers. What is $a+b+c?$ [asy] defaultpen(fontsize(12)+linewidth(1)); size(200); real r=2.925, x=360/12; pair O=origin; draw(CR(O,r),black+1.5); for (int i = 0; i<12; ++i) { draw(CR((r+1)*dir(i*x),1)); } dot(O); dot((r+1)*right); draw(O--(r,0)^^(r+1,0)--(r+2,0), linewidth(0.5)); label("$r$",(r/2,0),up); label("$1$",(r+3/2,0),up); [/asy] $\textbf{(A) } 3 \qquad \textbf{(B) } 5 \qquad \textbf{(C) } 7 \qquad \textbf{(D) } 9 \qquad \textbf{(E) } 11$
-/

-- Solution/Answer (LaTeX):
/-
Let the center of the large circle be $O$ and the centers of the $12$ circles be $A_1, A_2, A_3, \dots, A_{12}$ . Triangle $OA_1A_2$ has side lengths $r+1, r+1, 2$ , with the angle opposite $2$ being $360/12 = 30$ . Note that the line connecting $A_1$ and $A_2$ go through their common point of tangency, by definition, which causes $A_1A_2$ to have a length of $2$ . Drawing the angle bisector of the $30$ degree angle, we split $OA_1A_2$ into two congruent right triangles, each with hypotenuse $r+1$ and side opposite the $15$ degree angle $1$ . From here, note that $\sin{15} = \frac{\sqrt{6}-\sqrt{2}}{4}$ , which be derived using the trigonometric identity $\sin{(A-B)} = \sin{A} \cos{B} - \sin{B} \cos{A}$ , with $A=45$ and $B=30$ . In our right triangle, $\sin{15} = \frac{1}{r+1} = \frac{\sqrt{6}-\sqrt{2}}{4}$ . Let $x=r+1$ . Solving for $x$ , we get $x = \frac{4}{\sqrt{6}-\sqrt{2}}$ . Rationalizing, we get that $x = \sqrt{6}+\sqrt{2}$ . Remember $x = r+1 = \sqrt{6}+\sqrt{2}$ , so $r = \sqrt{6}+\sqrt{2} - 1$ . Therefore, our answer is $6+2-1 = \boxed{7}.$ ~lprado
-/

import Mathlib.Tactic

theorem wiki_index_php_186b53f43b : Prop := by
  sorry
