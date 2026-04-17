-- 2020 AMC 12A Problems/Problem 24
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12A_Problems/Problem_24

-- Problem (LaTeX):
/-
Suppose that $\triangle{ABC}$ is an equilateral triangle of side length $s$ , with the property that there is a unique point $P$ inside the triangle such that $AP=1$ , $BP=\sqrt{3}$ , and $CP=2$ . What is $s$ ? $\textbf{(A) } 1+\sqrt{2} \qquad \textbf{(B) } \sqrt{7} \qquad \textbf{(C) } \frac{8}{3} \qquad \textbf{(D) } \sqrt{5+\sqrt{5}} \qquad \textbf{(E) } 2\sqrt{2}$
-/

-- Solution/Answer (LaTeX):
/-
[asy] unitsize(0.4inch); pen p = fontsize(10pt); draw((0,0)--(4,5.65)--(8,0)--cycle); label("$A$", (4,5.65), N, p); label("$C$", (8,0), SE, p); label("$B$", (0,0), SW, p); label("$P$", (3.5,3.5), E, p); label("$E$", (2.8191,3.982), NW, p); label("$F$", (4.848,4.452), NE, p); label("$G$", (3.5,0), down, p); draw((0,0)--(3.5,3.5)); label("$\sqrt{3}$",(0,0)--(3.5,3.5), SE,p); draw((8,0)--(3.5,3.5)); label("$2$",(8,0)--(3.5,3.5), SW,p); draw((4,5.65)--(3.5,3.5)); label("$1$",(4,5.65)--(3.5,3.5), E,p); draw((3.5,3.5)--(2.8191,3.982)); draw((3.5,3.5)--(4.848,4.452)); draw((3.5,3.5)--(3.5,0)); [/asy] We begin by dropping altitudes from point $P$ down to all three sides of the triangle as shown above. We can therefore make equations regarding the areas of triangles $\triangle{APC}$ , $\triangle{APB}$ , and $\triangle{BPC}$ . Let $s$ be the side of the equilateral triangle, we use the Heron's formula: \[\triangle{APC} = \frac{s\cdot PF}{2} = \sqrt{\frac{s+3}{2}\left(\frac{s+3}{2}-s\right)\left(\frac{s+3}{2}-1\right)\left(\frac{s+3}{2}-2\right)}\] \[\implies PF = \frac{\sqrt{10s^2-s^4-9}}{2s}\] Similarly, we obtain: \[PE = \frac{\sqrt{8s^2-s^4-4}}{2s}\] \[PG = \frac{\sqrt{14s^2-s^4-1}}{2s}\] By Viviani's theorem, \[\frac{\sqrt{10s^2-s^4-9}}{2s}+\frac{\sqrt{8s^2-s^4-4}}{2s}+\frac{\sqrt{14s^2-s^4-1}}{2s} = \frac{\sqrt{3}}{2}s\] \[\sqrt{10s^2-s^4-9}+\sqrt{8s^2-s^4-4}+\sqrt{14s^2-s^4-1} = \sqrt{3}s^2\] Note that from now on, the algebra will get extremely ugly and almost impossible to do by hand within the time frame. However, we do see that it's extremely easy to check the answer choices with the equation in this form. Testing $s = \sqrt{7}$ , We obtain $7\sqrt{3}$ on both sides, revealing that our answer is in fact $\boxed{\textbf{(B) } \sqrt{7}}$ ~ siluweston
~ edits by aopspandy
-/

import Mathlib.Tactic

theorem wiki_index_php_614d8ceb9e : Prop := by
  sorry
