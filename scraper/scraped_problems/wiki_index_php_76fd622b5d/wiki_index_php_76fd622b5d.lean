-- 2019 AIME II Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AIME_II_Problems/Problem_12

-- Problem (LaTeX):
/-
For $n \ge 1$ call a finite sequence $(a_1, a_2 \ldots a_n)$ of positive integers progressive if $a_i < a_{i+1}$ and $a_i$ divides $a_{i+1}$ for all $1 \le i \le n-1$ . Find the number of progressive sequences such that the sum of the terms in the sequence is equal to $360$ .
-/

-- Solution/Answer (LaTeX):
/-
If the first term is $x$ , then dividing through by $x$ , we see that we can find the number of progressive sequences whose sum is $\frac{360}{x} - 1$ , and whose first term is not 1. If $a(k)$ denotes the number of progressive sequences whose sum is $k$ and whose first term is not 1, then we can express the answer $N$ as follows: \begin{align*}N &= a(359) + a(179) + a(119) + a(89) + a(71) + a(59) + a(44) + a(39) \\ &+ a(35) + a(29) + a(23) + a(19) + a(17) + a(14) + a(11) + a(9) \\ &+ a(8) + a(7) + a(5) + a(4) + a(3) + a(2) + a(1) + 1 \end{align*} And in general, we have $a(k) = 1+\sum_{d|k\text{ and } d\ne 1,k}a(d-1)$ . The $+1$ at the end accounts for the sequence whose only term is 360. Fortunately, many of these numbers are prime; we have $a(p) = 1$ for primes $p$ as the only such sequence is " $p$ " itself. Also, $a(1) = 0$ . So we have \[N = 15 + a(119) + a(44) + a(39) + a(35) + a(14) + a(9) + a(8) + a(4)\] For small $k$ , $a(k)$ is easy to compute: $a(4) = 1$ , $a(8) = 2$ , $a(9) = 2$ . For intermediate $k$ (e.g. $k=21$ below), $a(k)$ can be computed recursively using previously-computed values of $a(\cdot)$ , similar to dynamic programming. Then we have \begin{align*} a(14) &= 1+a(6) = 1+2 = 3\\ a(35) &= 1+a(6)+a(4) = 1 + 2 + 1 = 4 \\ a(39) &= 2 + a(12) = 2+4 = 6 \\ a(44) &= 2 + a(21) + a(10) = 2+4+2=8 \\ a(119) &= 1 + a(16) + a(6) = 1 + 3 + 2 = 6 \end{align*} Thus the answer is $N = 15+6+8+6+4+3+2+2+1 = \boxed{047}$ . -scrabbler94
-/

import Mathlib.Tactic

theorem wiki_index_php_76fd622b5d : Prop := by
  sorry
