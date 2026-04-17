-- 2025 AMC 12B Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_8

-- Problem (LaTeX):
/-
There are integers $a$ and $b$ such that the polynomial $x^3 - 5x^2 + ax + b$ has $4+\sqrt{5}$ as a root. What is $a+b$ ? $\textbf{(A) } 13 \qquad \textbf{(B) } 17 \qquad \textbf{(C) } 20 \qquad \textbf{(D) } 30 \qquad \textbf{(E) } 68$
-/

-- Solution/Answer (LaTeX):
/-
Because every coefficient of our polynomial $f(x)$ is an integer, the conjugate of $4+\sqrt{5}$ , $4-\sqrt{5}$ is also a root. Let the third and final root be $r_3$ . Thanks to Vieta's Formulas, we know that the sum of the roots is \[(r_3) + (4+\sqrt{5}) + (4 - \sqrt{5}) = 5\] \[r_3 = -3.\] We now calculate $f(1) = (1+3)(1-4-\sqrt{5})(1-4+\sqrt{5})$ . $(1-4-\sqrt{3})(1-4+\sqrt{3}) = (-3-\sqrt{5})(-3+\sqrt{5}) = 9 - 5 = 4.$ So $f(1) = 4 \cdot 4 = 16.$ Hence $f(1) = 16 = 1-5 + a + b$ . Therefore, $a + b = \boxed{20}$ . ~lprado (minor edits by singularity1)
-/

import Mathlib.Tactic

theorem wiki_index_php_4072d9d50e : Prop := by
  sorry
