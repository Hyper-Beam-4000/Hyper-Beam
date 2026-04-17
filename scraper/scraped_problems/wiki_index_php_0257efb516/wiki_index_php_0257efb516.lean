-- 2017 AIME I Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_I_Problems/Problem_13

-- Problem (LaTeX):
/-
For every $m \geq 2$ , let $Q(m)$ be the least positive integer with the following property: For every $n \geq Q(m)$ , there is always a perfect cube $k^3$ in the range $n < k^3 \leq m \cdot n$ . Find the remainder when \[\sum_{m = 2}^{2017} Q(m)\] is divided by 1000.
-/

-- Solution/Answer (LaTeX):
/-
Lemma 1: The ratio between $k^3$ and $(k+1)^3$ decreases as $k$ increases. Lemma 2: If the range $(n,mn]$ includes $y$ cubes, $(p,mp]$ will always contain at least $y-1$ cubes for all $p$ in $[n,+\infty)$ . If $m=14$ , the range $(1,14]$ includes one cube. The range $(2,28]$ includes 2 cubes, which fulfills the Lemma. Since $n=1$ also included a cube, we can assume that $Q(m)=1$ for all $m>14$ . Two groups of 1000 are included in the sum modulo 1000. They do not count since $Q(m)=1$ for all of them, therefore \[\sum_{m = 2}^{2017} Q(m) \equiv \sum_{m = 2}^{17} Q(m) \mod 1000\] Now that we know this we will find the smallest $n$ that causes $(n,mn]$ to contain two cubes and work backwards (recursion) until there is no cube in $(n,mn]$ . For $m=2$ there are two cubes in $(n,2n]$ for $n=63$ . There are no cubes in $(31,62]$ but there is one in $(32,64]$ . Therefore $Q(2)=32$ . For $m=3$ there are two cubes in $(n,3n]$ for $n=22$ . There are no cubes in $(8,24]$ but there is one in $(9,27]$ . Therefore $Q(3)=9$ . For $m$ in $\{4,5,6,7\}$ there are two cubes in $(n,4n]$ for $n=7$ . There are no cubes in $(1,4]$ but there is one in $(2,8]$ . Therefore $Q(4)=2$ , and the same for $Q(5)$ , $Q(6)$ , and $Q(7)$ for a sum of $8$ . For all other $m$ there is one cube in $(1,8]$ , $(2,16]$ , $(3,24]$ , and there are two in $(4,32]$ . Therefore, since there are 10 values of $m$ in the sum, this part sums to $10$ . When the partial sums are added, we get $\boxed{059}\hspace{2 mm}QED\hspace{2 mm} \blacksquare$ This solution is brought to you by a1b2
-/

import Mathlib.Tactic

theorem wiki_index_php_0257efb516 : Prop := by
  sorry
