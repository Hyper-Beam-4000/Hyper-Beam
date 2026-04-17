-- 2021 AMC 12A Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_7

-- Problem (LaTeX):
/-
What is the least possible value of $(xy-1)^2+(x+y)^2$ for real numbers $x$ and $y$ ? $\textbf{(A)} ~0\qquad\textbf{(B)} ~\frac{1}{4}\qquad\textbf{(C)} ~\frac{1}{2} \qquad\textbf{(D)} ~1 \qquad\textbf{(E)} ~2$
-/

-- Solution/Answer (LaTeX):
/-
Expanding, we get that the expression is $x^2+2xy+y^2+x^2y^2-2xy+1$ or $x^2+y^2+x^2y^2+1$ . By the Trivial Inequality (all squares are nonnegative) the minimum value for this is $\boxed{\textbf{(D)} ~1}$ , which can be achieved at $x=y=0$ . ~aop2014
-/

import Mathlib.Tactic

theorem wiki_index_php_b50b14ba6d : Prop := by
  sorry
