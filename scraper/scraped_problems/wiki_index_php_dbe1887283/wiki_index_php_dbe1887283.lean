-- 2025 AMC 12B Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_5

-- Problem (LaTeX):
/-
Positive integers $x$ and $y$ satisfy the equation $57x+ 22y = 400$ . What is the least possible value of $x+y$ ? $\textbf{(A) } 10 \qquad\textbf{(B) } 11 \qquad\textbf{(C) } 13 \qquad\textbf{(D) } 14 \qquad\textbf{(E) } 15$
-/

-- Solution/Answer (LaTeX):
/-
Let $x+y = a$ . Then we have the equation \[35x + 22a = 400.\] Because the other two terms are divisible by $5$ , $22a$ must be divisible by $5$ too. Specifically, $a$ is divisible by $5$ . Let $a=5b$ and substitute: \[35x + 110b = 400\] \[7x + 22b = 80.\] After some analysis, we find that if $b=3$ , $x = 2$ . In fact, this is the only solution with positive integer solutions. Therefore, $a = x+y = 5 \cdot 3 = \boxed{\textbf{(E) }15}$ . ~lprado
-/

import Mathlib.Tactic

theorem wiki_index_php_dbe1887283 : Prop := by
  sorry
