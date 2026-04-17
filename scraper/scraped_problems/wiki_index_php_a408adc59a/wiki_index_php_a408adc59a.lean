-- 2025 USAMO Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_USAMO_Problems/Problem_1

-- Problem (LaTeX):
/-
Let $k$ and $d$ be positive integers. Prove that there exists a positive integer $N$ such that for every odd integer $n>N$ , the digits in the base- $2n$ representation of $n^k$ are all greater than $d$ .
-/

-- Solution/Answer (LaTeX):
/-
We define a remainder operation $\,a \bmod b\,$ to be the remainder when $a$ is divided by $b$ .
Also, let $\lfloor x\rfloor$ be the usual floor function. Base- $(2n)$ Representation: \[n^k \;=\; a_{k-1}\,(2n)^{k-1} \;+\; a_{k-2}\,(2n)^{k-2} \;+\;\dots\;+\;a_1\,(2n)\;+\;a_0,\] where each $a_i$ satisfies $0 \le a_i < 2n.$ Hence, the base- $(2n)$ representation of $n^k$ is $a_{k-1}\,a_{k-2}\,\dots\,a_1\,a_0.$ Leading Digit: \[a_{k-1} \;=\; \left\lfloor \dfrac{n^k}{(2n)^{k-1}} \right\rfloor \;=\; \left\lfloor \dfrac{n}{2^{k-1}} \right\rfloor.\] General Digit Formula:
For $0 \le i < k,$ \[a_i \;=\; \left\lfloor \dfrac{\,n^k \bmod (2n)^{\,i+1}}{(2n)^i} \right\rfloor.\] Because $n$ is odd, one can show \[n^k \bmod (2n)^{\,i+1} \;\ge\; n^{\,i+1},\] which implies \[a_i \;\ge\; \left\lfloor \dfrac{n^{\,i+1}}{(2n)^i} \right\rfloor \;=\; \left\lfloor \dfrac{n}{2^i} \right\rfloor \;\ge\; 2^{\,k-1-i} \left\lfloor \dfrac{n}{2^{\,k-1}} \right\rfloor.\] As $n$ grows large, $\bigl\lfloor n / 2^{\,k-1}\bigr\rfloor$ becomes arbitrarily big, so each digit $a_i$ eventually exceeds any fixed $d.$ Hence there exists an integer $N$ such that for all odd $n > N,$ the digits $a_i$ in the base- $(2n)$ representation of $n^k$ are all $> d.$
-/

import Mathlib.Tactic

theorem wiki_index_php_a408adc59a : Prop := by
  sorry
