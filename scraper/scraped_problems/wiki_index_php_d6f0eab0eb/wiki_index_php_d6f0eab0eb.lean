-- 2024 AMC 10A Problems/Problem 18
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_11

-- Problem (LaTeX):
/-
There are exactly $K$ positive integers $b$ with $5 \leq b \leq 2024$ such that the base- $b$ integer $2024_b$ is divisible by $16$ (where $16$ is in base ten). What is the sum of the digits of $K$ ? $\textbf{(A) }16\qquad\textbf{(B) }17\qquad\textbf{(C) }18\qquad\textbf{(D) }20\qquad\textbf{(E) }21$
-/

-- Solution/Answer (LaTeX):
/-
$2024_b = 2b^3+2b+4\equiv 0\pmod{16}\implies b^3+b+2\equiv 0\pmod 8$ . If $b$ is even, then $b+2\equiv 0\pmod 8\implies b\equiv 6\pmod 8$ . If $b$ is odd, then $b^2\equiv 1\pmod 8$ * $\implies b^3+b+2\equiv 2b+2\pmod 8$ so $2b+2\equiv 0\pmod 8\implies b+1\equiv 0\pmod 4\implies b\equiv 3,7\pmod 8$ . Now $8\mid 2024$ so $\frac38\cdot 2024=759$ but one of the answers we got from that, $3$ , is too small, so $759 - 1 = 758\implies\boxed{\textbf{(D) }20}$ . The reason why $b^2\equiv 1\pmod 8$ (if b is odd) is that we can write $b$ as $2k+1,$ where $k$ is any number (such that the problem conditions are met). Plugging this into $b^2\equiv 1\pmod 8,$ we get $(2k+1)^2=4k^2+1+4k=4k(k+1)+1\equiv 1\pmod 8.$ Since $4k$ is, of course, always a multiple of $4$ and since $k+1$ is even, $4k(k+1)$ is divisible by $8,$ and adding $1$ creates a remainder of $1.$ ~OronSH ~ mathkiddus ~andliu766 ~megaboy6679 ~trevian1(minor edit for clarity) ~Ebai ( $b^2\equiv 1\pmod 8$ remark)
-/

import Mathlib.Tactic

theorem wiki_index_php_d6f0eab0eb : Prop := by
  sorry
