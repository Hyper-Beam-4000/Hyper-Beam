-- 2017 AMC 12A Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12A_Problems/Problem_11

-- Problem (LaTeX):
/-
Claire adds the degree measures of the interior angles of a convex polygon and arrives at a sum of $2017$ . She then discovers that she forgot to include one angle. What is the degree measure of the forgotten angle? $\textbf{(A)}\ 37\qquad\textbf{(B)}\ 63\qquad\textbf{(C)}\ 117\qquad\textbf{(D)}\ 143\qquad\textbf{(E)}\ 163$
-/

-- Solution/Answer (LaTeX):
/-
We know that the sum of the interior angles of the polygon is a multiple of $180$ . Note that $\left\lceil\frac{2017}{180}\right\rceil = 12$ and $180\cdot 12 = 2160$ , so the angle Claire forgot is $\equiv 2160-2017=143\mod 180$ . Since the polygon is convex, the angle is $\leq 180$ , so the answer is $\boxed{(D)\ =\ 143}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_4d7b26337c : Prop := by
  sorry
