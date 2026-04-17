-- 2023 AMC 12A Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_9

-- Problem (LaTeX):
/-
A square of area $2$ is inscribed in a square of area $3$ , creating four congruent triangles, as shown below. What is the ratio of the shorter leg to the longer leg in the shaded right triangle? [asy] size(200); defaultpen(linewidth(0.6pt)+fontsize(10pt)); real y = sqrt(3); pair A,B,C,D,E,F,G,H; A = (0,0); B = (0,y); C = (y,y); D = (y,0); E = ((y + 1)/2,y); F = (y, (y - 1)/2); G = ((y - 1)/2, 0); H = (0,(y + 1)/2); fill(H--B--E--cycle, gray); draw(A--B--C--D--cycle); draw(E--F--G--H--cycle); [/asy] $\textbf{(A) }\frac15\qquad\textbf{(B) }\frac14\qquad\textbf{(C) }2-\sqrt3\qquad\textbf{(D) }\sqrt3-\sqrt2\qquad\textbf{(E) }\sqrt2-1$
-/

-- Solution/Answer (LaTeX):
/-
The side lengths of the inner square and outer square are $\sqrt{2}$ and $\sqrt{3}$ respectively. Let the shorter side of our triangle be $x$ , thus the longer leg is $\sqrt{3}-x$ .
Hence, by the Pythagorean Theorem, we have \begin{align*} (\sqrt{3}-x)^2+x^2&=(\sqrt{2})^2 \\ 3-2\sqrt{3}x+x^2+x^2&=2 \\ 2x^2-2\sqrt{3}x+1&=0. \end{align*} By the quadratic formula, we find that $x=\frac{\sqrt{3}\pm1}{2}$ , so the answer is $\frac{\sqrt{3}-1}{\sqrt{3}+1}=\boxed{\textbf{(C) }2-\sqrt3}.$ ~semisteve
~SirAppel
~ItsMeNoobieboy
-/

import Mathlib.Tactic

theorem wiki_index_php_5e94e9f206 : Prop := by
  sorry
