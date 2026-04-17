-- 2020 AMC 10B Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_4

-- Problem (LaTeX):
/-
The acute angles of a right triangle are $a^{\circ}$ and $b^{\circ}$ , where $a>b$ and both $a$ and $b$ are prime numbers. What is the least possible value of $b$ ? $\textbf{(A)}\ 2 \qquad\textbf{(B)}\ 3 \qquad\textbf{(C)}\ 5 \qquad\textbf{(D)}\ 7 \qquad\textbf{(E)}\ 11$
-/

-- Solution/Answer (LaTeX):
/-
Since the three angles of a triangle add up to $180^{\circ}$ and one of the angles is $90^{\circ}$ because it's a right triangle, $a^{\circ} + b^{\circ} = 90^{\circ}$ . The greatest prime number less than $90$ is $89$ . If $a=89^{\circ}$ , then $b=90^{\circ}-89^{\circ}=1^{\circ}$ , which is not prime. The next greatest prime number less than $90$ is $83$ . If $a=83^{\circ}$ , then $b=7^{\circ}$ , which IS prime, so we have our answer $\boxed{\textbf{(D)}\ 7}$ ~quacker88
-/

import Mathlib.Tactic

theorem wiki_index_php_8401bf1f28 : Prop := by
  sorry
