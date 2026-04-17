-- 2023 AMC 12A Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_10

-- Problem (LaTeX):
/-
Positive real numbers $x$ and $y$ satisfy $y^3=x^2$ and $(y-x)^2=4y^2$ . What is $x+y$ ? $\textbf{(A) }12\qquad\textbf{(B) }18\qquad\textbf{(C) }24\qquad\textbf{(D) }36\qquad\textbf{(E) }42$
-/

-- Solution/Answer (LaTeX):
/-
Because $y^3=x^2$ , set $x=a^3$ , $y=a^2$ ( $a\neq 0$ ). Put them in $(y-x)^2=4y^2$ we get $(a^2(a-1))^2=4a^4$ which implies $a^2-2a+1=4$ . Solve the equation to get $a=3$ or $-1$ . Since $x$ and $y$ are positive, $a=3$ and $x+y=3^3+3^2=\boxed{\textbf{(D)} 36}$ . ~plasta
-/

import Mathlib.Tactic

theorem wiki_index_php_27b6e66f38 : Prop := by
  sorry
