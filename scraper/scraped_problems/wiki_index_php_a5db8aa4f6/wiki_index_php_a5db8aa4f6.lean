-- 2018 AIME I Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_I_Problems/Problem_11

-- Problem (LaTeX):
/-
Find the least positive integer $n$ such that when $3^n$ is written in base $143$ , its two right-most digits in base $143$ are $01$ .
-/

-- Solution/Answer (LaTeX):
/-
Note that the given condition is equivalent to $3^n \equiv 1 \pmod{143^2}$ and $143=11\cdot 13$ . Because $\gcd(11^2, 13^2) = 1$ , the desired condition is equivalent to $3^n \equiv 1 \pmod{121}$ and $3^n \equiv 1 \pmod{169}$ . If $3^n \equiv 1 \pmod{121}$ , one can see the sequence $1, 3, 9, 27, 81, 1, 3, 9...$ so $5|n$ . Now if $3^n \equiv 1 \pmod{169}$ , it is harder. But we do observe that $3^3 \equiv 1 \pmod{13}$ , therefore $3^3 = 13a + 1$ for some integer $a$ . So our goal is to find the first number $p_1$ such that $(13a+1)^ {p_1} \equiv 1 \pmod{169}$ . Then, $p_1 \equiv 0 \pmod{13},$ which follows from the binomial theorem. It is not difficult to see that the smallest $p_1=13$ , so ultimately $3^{39} \equiv 1 \pmod{169}$ . Therefore, $39|n$ . The first $n$ satisfying both criteria is thus $5\cdot 39=\boxed{195}$ . -expiLnCalc
-/

import Mathlib.Tactic

theorem wiki_index_php_a5db8aa4f6 : Prop := by
  sorry
