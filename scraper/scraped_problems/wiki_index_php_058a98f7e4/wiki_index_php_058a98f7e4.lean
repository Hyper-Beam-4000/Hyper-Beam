-- 2023 AIME I Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AIME_I_Problems/Problem_4

-- Problem (LaTeX):
/-
The sum of all positive integers $m$ such that $\frac{13!}{m}$ is a perfect square can be written as $2^a3^b5^c7^d11^e13^f,$ where $a,b,c,d,e,$ and $f$ are positive integers. Find $a+b+c+d+e+f.$
-/

-- Solution/Answer (LaTeX):
/-
We first rewrite $13!$ as a prime factorization, which is $2^{10}\cdot3^5\cdot5^2\cdot7\cdot11\cdot13.$ For the fraction to be a square, it needs each prime to be an even power. This means $m$ must contain $7\cdot11\cdot13$ . Also, $m$ can contain any even power of $2$ up to $2^{10}$ , any odd power of $3$ up to $3^{5}$ , and any even power of $5$ up to $5^{2}$ . The sum of $m$ is \[(2^0+2^2+2^4+2^6+2^8+2^{10})(3^1+3^3+3^5)(5^0+5^2)(7^1)(11^1)(13^1) =\] \[1365\cdot273\cdot26\cdot7\cdot11\cdot13 = 2\cdot3^2\cdot5\cdot7^3\cdot11\cdot13^4.\] Therefore, the answer is $1+2+1+3+1+4=\boxed{012}$ . ~chem1kall
-/

import Mathlib.Tactic

theorem wiki_index_php_058a98f7e4 : Prop := by
  sorry
