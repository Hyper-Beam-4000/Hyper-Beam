-- 2017 AMC 12A Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12A_Problems/Problem_8

-- Problem (LaTeX):
/-
The region consisting of all points in three-dimensional space within $3$ units of line segment $\overline{AB}$ has volume $216 \pi$ . What is the length $AB$ ? $\textbf{(A)}\ 6 \qquad\textbf{(B)}\ 12 \qquad\textbf{(C)}\ 18 \qquad\textbf{(D)}\ 20 \qquad\textbf{(E)}\ 24$
-/

-- Solution/Answer (LaTeX):
/-
Let the length $AB$ be $L$ . Then, we see that the region is just the union of the cylinder with central axis $\overline{AB}$ and radius $3$ and the two hemispheres connected to each face of the cylinder (also with radius $3$ ). Thus the volume is $9\pi L + \frac{4}{3}\pi(3)^3 = 9\pi L + 36\pi ( = 216\pi)$ $9\pi L = 180\pi$ $L = \boxed{(D)=\ 20}$
-/

import Mathlib.Tactic

theorem wiki_index_php_1be8f6ce63 : Prop := by
  sorry
