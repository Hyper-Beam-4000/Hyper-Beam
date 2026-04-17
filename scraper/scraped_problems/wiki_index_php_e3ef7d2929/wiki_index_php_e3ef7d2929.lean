-- 2023 AIME II Problems/Problem 15
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AIME_II_Problems/Problem_15

-- Problem (LaTeX):
/-
For each positive integer $n$ let $a_n$ be the least positive integer multiple of $23$ such that $a_n \equiv 1 \pmod{2^n}.$ Find the number of positive integers $n$ less than or equal to $1000$ that satisfy $a_n = a_{n+1}.$
-/

-- Solution/Answer (LaTeX):
/-
Denote $a_n = 23 b_n$ .
Thus, for each $n$ , we need to find smallest positive integer $k_n$ , such that \[ 23 b_n = 2^n k_n + 1 . \] Thus, we need to find smallest $k_n$ , such that \[ 2^n k_n \equiv - 1 \pmod{23} . \] Now, we find the smallest $m$ , such that $2^m \equiv 1 \pmod{23}$ .
By Fermat's Theorem, we must have $m | \phi \left( 23 \right)$ . That is, $m | 22$ .
We find $m = 11$ . Therefore, for each $n$ , we need to find smallest $k_n$ , such that \[ 2^{{\rm Rem} \left( n , 11 \right)} k_n \equiv - 1 \pmod{23} . \] We have the following results: If \({\rm Rem} \left( n , 11 \right) = 0\), then \(k_n = 22\) and \(b_n = 1\). If \({\rm Rem} \left( n , 11 \right) = 1\), then \(k_n = 11\) and \(b_n = 1\). If \({\rm Rem} \left( n , 11 \right) = 2\), then \(k_n = 17\) and \(b_n = 3\). If \({\rm Rem} \left( n , 11 \right) = 3\), then \(k_n = 20\) and \(b_n = 7\). If \({\rm Rem} \left( n , 11 \right) = 4\), then \(k_n = 10\) and \(b_n = 7\). If \({\rm Rem} \left( n , 11 \right) = 5\), then \(k_n = 5\) and \(b_n = 7\). If \({\rm Rem} \left( n , 11 \right) = 6\), then \(k_n = 14\) and \(b_n = 39\). If \({\rm Rem} \left( n , 11 \right) = 7\), then \(k_n = 7\) and \(b_n = 39\). If \({\rm Rem} \left( n , 11 \right) = 8\), then \(k_n = 15\) and \(b_n = 167\). If \({\rm Rem} \left( n , 11 \right) = 9\), then \(k_n = 19\) and \(b_n = 423\). If \({\rm Rem} \left( n , 11 \right) = 10\), then \(k_n = 21\) and \(b_n = 935\). Therefore, in each cycle, $n \in \left\{ 11 l , 11l + 1 , \cdots , 11l + 10 \right\}$ , we have $n = 11l$ , $11l + 3$ , $11l + 4$ , $11l + 6$ , such that $b_n = b_{n+1}$ . That is, $a_n = a_{n+1}$ .
At the boundary of two consecutive cycles, $b_{11L + 10} \neq b_{11 \left(l + 1 \right)}$ . We have $1000 = 90 \cdot 11 + 10$ .
Therefore, the number of feasible $n$ is $91 \cdot 4 - 1 = \boxed{\textbf{(363) }}$ . ~Steven Chen (Professor Chen Education Palace, www.professorchenedu.com)
-/

import Mathlib.Tactic

theorem wiki_index_php_e3ef7d2929 : Prop := by
  sorry
