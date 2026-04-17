-- 2025 AMC 12B Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_2

-- Problem (LaTeX):
/-
Jerry wrote down the ones digit of each of the first $2025$ positive squares: $1, 4, 9, 6, 5, 6, \dots$ . What is the sum of all the numbers Jerry wrote down? $\textbf{(A)}~9025 \qquad \textbf{(B)}~9070 \qquad \textbf{(C)}~9090 \qquad \textbf{(D)}~9115 \qquad \textbf{(E)}~9160$
-/

-- Solution/Answer (LaTeX):
/-
By a modulo $10$ argument, the ones digits repeat with period $10$ in the following order: \[1,4,9,6,5,6,9,4,1,0\] The sum of the numbers can be verified to be $45$ . There are $202$ periods that occur from $1$ to $2025$ , and there are five extra numbers, those being $1,4,9,6,5$ , corresponding to $2021,2022,2023,2024,2025$ . The sum of these numbers is $25$ . Hence, the total is \[202\cdot 45+25=9090+25=\boxed{\textbf{(D)}~9115}\] ~ eevee9406 ~ Phinetium
-/

import Mathlib.Tactic

theorem wiki_index_php_b74343559f : Prop := by
  sorry
