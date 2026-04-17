-- 2024 AMC 12B Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_12

-- Problem (LaTeX):
/-
Suppose $z$ is a complex number with positive imaginary part, with real part greater than $1$ , and with $|z| = 2$ . In the complex plane, the four points $0$ , $z$ , $z^{2}$ , and $z^{3}$ are the vertices of a quadrilateral with area $15$ . What is the imaginary part of $z$ ? $\textbf{(A) }\frac{3}{4}\qquad\textbf{(B) }1\qquad\textbf{(C) }\frac{4}{3}\qquad\textbf{(D) }\frac{3}{2}\qquad\textbf{(E) }\frac{5}{3}$
-/

-- Solution/Answer (LaTeX):
/-
By making a rough estimate of where $z$ , $z^2$ , and $z^3$ are on the complex plane, we can draw a pretty accurate diagram (like above.) Here, points $Z_1$ , $Z_2$ , and $Z_3$ lie at the coordinates of $z$ , $z^2$ , and $z^3$ respectively, and $O$ is the origin. We're given $|z|=2$ , so $|z^2|=|z|^2=4$ and $|z^3|=|z|^3 = 8$ . This gives us $OZ_1=2$ , $OZ_2=4$ , and $OZ_3=8$ . Additionally, we know that $\angle{Z_1OZ_2}\cong\angle{Z_2OZ_3}$ (since every power of $z$ rotates around the origin by the same angle.) We set these angles equal to $\theta$ . We have that
\begin{align*}
[OZ_1Z_2Z_3]&=[OZ_1Z_2]+[OZ_2Z_3] \\
&=\frac{1}{2}\cdot2\cdot4 \sin\theta+\frac{1}{2}\cdot4\cdot8 \sin\theta \\
&=4\sin\theta+16\sin\theta \\
&=20 \sin\theta
\end{align*} Since this is equal to $15$ , we have $20\sin\theta=15$ , so $\sin\theta=\frac{3}{4}$ . Thus, $\text{Im}(z)=|z|\sin(\theta)=2(\frac{3}{4})=\boxed{\textbf{(D) }\frac{3}{2}}$ . ~nm1728, ShortPeopleFartalot
-/

import Mathlib.Tactic

theorem wiki_index_php_b39bff6690 : Prop := by
  sorry
