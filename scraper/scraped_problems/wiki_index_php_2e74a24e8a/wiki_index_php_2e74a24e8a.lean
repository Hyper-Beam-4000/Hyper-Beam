-- 2019 AMC 12A Problems/Problem 17
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12A_Problems/Problem_17

-- Problem (LaTeX):
/-
Let $s_k$ denote the sum of the $\textit{k}$ th powers of the roots of the polynomial $x^3-5x^2+8x-13$ . In particular, $s_0=3$ , $s_1=5$ , and $s_2=9$ . Let $a$ , $b$ , and $c$ be real numbers such that $s_{k+1} = a \, s_k + b \, s_{k-1} + c \, s_{k-2}$ for $k = 2$ , $3$ , $....$ What is $a+b+c$ ? $\textbf{(A)} \; -6 \qquad \textbf{(B)} \; 0 \qquad \textbf{(C)} \; 6 \qquad \textbf{(D)} \; 10 \qquad \textbf{(E)} \; 26$
-/

-- Solution/Answer (LaTeX):
/-
Applying Newton's Sums , we have \[s_{k+1}+(-5)s_k+(8)s_{k-1}+(-13)s_{k-2}=0,\] so \[s_{k+1}=5s_k-8s_{k-1}+13s_{k-2},\] we get the answer as $5+(-8)+13=10$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_2e74a24e8a : Prop := by
  sorry
