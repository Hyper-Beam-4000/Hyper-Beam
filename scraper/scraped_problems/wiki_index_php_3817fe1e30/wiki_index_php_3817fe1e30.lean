-- 2021 AMC 12B Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12B_Problems/Problem_7

-- Problem (LaTeX):
/-
Let $N = 34 \cdot 34 \cdot 63 \cdot 270$ . What is the ratio of the sum of the odd divisors of $N$ to the sum of the even divisors of $N$ ? $\textbf{(A)} ~1 : 16 \qquad\textbf{(B)} ~1 : 15 \qquad\textbf{(C)} ~1 : 14 \qquad\textbf{(D)} ~1 : 8 \qquad\textbf{(E)} ~1 : 3$
-/

-- Solution/Answer (LaTeX):
/-
Prime factorize $N$ to get $N=2^{3} \cdot 3^{5} \cdot 5\cdot 7\cdot 17^{2}$ . For each odd divisor $n$ of $N$ , there exist even divisors $2n, 4n, 8n$ of $N$ , therefore the ratio is $1:(2+4+8)=\boxed{\textbf{(C)} ~1 : 14}$
-/

import Mathlib.Tactic

theorem wiki_index_php_3817fe1e30 : Prop := by
  sorry
