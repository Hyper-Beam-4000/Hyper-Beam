-- 2025 AMC 12A Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12A_Problems/Problem_9

-- Problem (LaTeX):
/-
Let $w$ be the complex number $2+i$ , where $i=\sqrt{-1}$ . What real number $r$ has the property that $r$ , $w$ , and $w^2$ are three collinear points in the complex plane? $\textbf{(A)}~\frac34\qquad\textbf{(B)}~1\qquad\textbf{(C)}~\frac75\qquad\textbf{(D)}~\frac32\qquad\textbf{(E)}~\frac53$
-/

-- Solution/Answer (LaTeX):
/-
We begin by calculating $w^2$ : \[w^2 = (2+i)^2 = 4+4i-1 = 3+4i.\] Values on the complex plane can easily be represented as points on the Cartesian plane, so we go ahead and do that so we are in a more familiar place.
Translating onto the Cartesian plane, we have the points $(2,1)$ and $(3,4)$ . The slope of the line passing through these points is $\frac{4-1}{3-2} = 3$ , so the equation of this line is \begin{align*} y &= 3(x-2)+1 \\ y &= 3x-5. \end{align*} We want the real number that passes through this line, which is equivalent to the $x-$ intercept. This occurs when $y=0$ , so the $x$ -intercept of this line is $x=\boxed{\textbf{(E)}~\frac53}.$ ~lprado (minor edits ~Logibyte)
-/

import Mathlib.Tactic

theorem wiki_index_php_9aee8a512a : Prop := by
  sorry
