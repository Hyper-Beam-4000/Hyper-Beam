-- 2018 AMC 12A Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_6

-- Problem (LaTeX):
/-
For positive integers $m$ and $n$ such that $m+10<n+1$ , both the mean and the median of the set $\{m, m+4, m+10, n+1, n+2, 2n\}$ are equal to $n$ . What is $m+n$ ? $\textbf{(A)}20\qquad\textbf{(B)}21\qquad\textbf{(C)}22\qquad\textbf{(D)}23\qquad\textbf{(E)}24$
-/

-- Solution/Answer (LaTeX):
/-
The mean and median are \[\frac{3m+4n+17}{6}=\frac{m+n+11}{2}=n,\] so $3m+17=2n$ and $m+11=n$ . Solving this gives $\left(m,n\right)=\left(5,16\right)$ for $m+n=\boxed{\textbf{(B)}~21}$ . (trumpeter)
-/

import Mathlib.Tactic

theorem wiki_index_php_2dbc1e56b1 : Prop := by
  sorry
