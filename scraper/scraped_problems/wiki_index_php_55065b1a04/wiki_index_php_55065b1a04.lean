-- 2023 AMC 12B Problems/Problem 22
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_22

-- Problem (LaTeX):
/-
A real-valued function $f$ has the property that for all real numbers $a$ and $b,$ \[f(a + b) + f(a - b) = 2f(a) f(b).\] Which one of the following cannot be the value of $f(1)?$ $\textbf{(A) } 0 \qquad \textbf{(B) } 1 \qquad \textbf{(C) } -1 \qquad \textbf{(D) } 2 \qquad \textbf{(E) } -2$
-/

-- Solution/Answer (LaTeX):
/-
Substituting $a = b$ we get \[f(2a) + f(0) = 2f(a)^2\] Substituting $a= 0$ we find \[2f(0) = 2f(0)^2 \implies f(0) \in \{0, 1\}.\] This gives \[f(2a) = 2f(a)^2 - f(0) \geq 0-1\] Plugging in $a = \frac{1}{2}$ implies $f(1) \geq -1$ , so answer choice $\boxed{\textbf{(E) -2}}$ is impossible. ~AtharvNaphade
-/

import Mathlib.Tactic

theorem wiki_index_php_55065b1a04 : Prop := by
  sorry
