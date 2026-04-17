-- 2017 AMC 10B Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12B_Problems/Problem_3

-- Problem (LaTeX):
/-
Supposed that $x$ and $y$ are nonzero real numbers such that $\frac{3x+y}{x-3y}=-2$ . What is the value of $\frac{x+3y}{3x-y}$ ? $\textbf{(A)}\ -3\qquad\textbf{(B)}\ -1\qquad\textbf{(C)}\ 1\qquad\textbf{(D)}\ 2\qquad\textbf{(E)}\ 3$
-/

-- Solution/Answer (LaTeX):
/-
Rearranging, we find $3x+y=-2x+6y$ , or $5x=5y\implies x=y$ .
Substituting, we can convert the second equation into $\frac{x+3x}{3x-x}=\frac{4x}{2x}=\boxed{\textbf{(D)}\ 2}$ . More step-by-step explanation: $\frac{3x+y}{x-3y}=-2$ $3x+y=-2\left(x-3y\right)$ $3x+y=-2x+6y$ $5x=5y$ $x=y$ $\frac{x+3y}{3x-y}=\frac{1+3\left(1\right)}{3\left(1\right)-1}=\frac{4}{2}=2$ . We choose $\boxed{\textbf{(D)}\ 2}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_3d26ba2ac2 : Prop := by
  sorry
