-- 2018 AMC 10A Problems/Problem 21
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_16

-- Problem (LaTeX):
/-
Which of the following describes the set of values of $a$ for which the curves $x^2+y^2=a^2$ and $y=x^2-a$ in the real $xy$ -plane intersect at exactly $3$ points? $\textbf{(A) }a=\frac14 \qquad \textbf{(B) }\frac14 < a < \frac12 \qquad \textbf{(C) }a>\frac14 \qquad \textbf{(D) }a=\frac12 \qquad \textbf{(E) }a>\frac12 \qquad$
-/

-- Solution/Answer (LaTeX):
/-
Substituting $y=x^2-a$ into $x^2+y^2=a^2$ , we get \[x^2+(x^2-a)^2=a^2 \implies x^2+x^4-2ax^2=0 \implies x^2(x^2-(2a-1))=0\] Since this is a quartic, there are $4$ total roots (counting multiplicity). We see that $x=0$ always has at least one intersection at $(0,-a)$ (and is in fact a double root). The other two intersection points have $x$ coordinates $\pm\sqrt{2a-1}$ . We must have $2a-1> 0;$ otherwise we are in the case where the parabola lies entirely below the circle (tangent at the point $(0,-a)$ ). This only results in a single intersection point in the real coordinate plane. Thus, we see that $\boxed{\textbf{(E) }a>\frac12}$ . (projecteulerlover)
-/

import Mathlib.Tactic

theorem wiki_index_php_7c814d2da2 : Prop := by
  sorry
