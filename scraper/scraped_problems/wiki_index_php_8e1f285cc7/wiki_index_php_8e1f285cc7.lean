-- 2023 AMC 12A Problems/Problem 20
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_20

-- Problem (LaTeX):
/-
Rows 1, 2, 3, 4, and 5 of a triangular array of integers are shown below. [asy] size(4.5cm); label("$1$", (0,0)); label("$1$", (-0.5,-2/3)); label("$1$", (0.5,-2/3)); label("$1$", (-1,-4/3)); label("$3$", (0,-4/3)); label("$1$", (1,-4/3)); label("$1$", (-1.5,-2)); label("$5$", (-0.5,-2)); label("$5$", (0.5,-2)); label("$1$", (1.5,-2)); label("$1$", (-2,-8/3)); label("$7$", (-1,-8/3)); label("$11$", (0,-8/3)); label("$7$", (1,-8/3)); label("$1$", (2,-8/3)); [/asy] Each row after the first row is formed by placing a 1 at each end of the row, and each interior entry is 1 greater than the sum of the two numbers diagonally above it in the previous row. What is the units digits of the sum of the 2023 numbers in the 2023rd row? $\textbf{(A) } 1 \qquad \textbf{(B) } 3 \qquad \textbf{(C) } 5 \qquad \textbf{(D) } 7 \qquad \textbf{(E) } 9$
-/

-- Solution/Answer (LaTeX):
/-
First, let $R(n)$ be the sum of the $n$ th row. Now, with some observation and math instinct, we can guess that $R(n) = 2^n - n$ . Now we try to prove it by induction, $R(1) = 2^n - n = 2^1 - 1 = 1$ (works for base case) $R(k) = 2^k - k$ $R(k+1) = 2^{k+1} - (k + 1) = 2(2^k) - k - 1$ By definition from the question, the next row is always $:$ Double the sum of last row (Imagine each number from last row branches off toward left and right to the next row), plus # of new row, minus 2 (minus leftmost and rightmost's 1) Which gives us $:$ $2(2^k - k) + (k + 1) - 2 = 2(2^k) - k - 1$ Hence, proven Last, simply substitute $n = 2023$ , we get $R(2023) = 2^{2023} - 2023$ Last digit of $2^{2023}$ is $8$ , $8-3 = \boxed{\textbf{(C) } 5}$ ~lptoggled
-/

import Mathlib.Tactic

theorem wiki_index_php_8e1f285cc7 : Prop := by
  sorry
