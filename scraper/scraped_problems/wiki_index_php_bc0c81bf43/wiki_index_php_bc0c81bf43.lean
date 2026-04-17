-- 2017 AIME I Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_I_Problems/Problem_9

-- Problem (LaTeX):
/-
Let $a_{10} = 10$ , and for each positive integer $n >10$ let $a_n = 100a_{n - 1} + n$ . Find the least positive $n > 10$ such that $a_n$ is a multiple of $99$ .
-/

-- Solution/Answer (LaTeX):
/-
Writing out the recursive statement for $a_n, a_{n-1}, \dots, a_{10}$ and summing them gives \[a_n+\dots+a_{10}=(a_n+\cdots+a_{11})+a_{10}=100(a_{n-1}+\dots+a_{10})+n+\dots+10\] Which simplifies to \[a_n=99(a_{n-1}+\dots+a_{10})+\frac{1}{2}(n+10)(n-9)\] Therefore, $a_n$ is divisible by 99 if and only if $\frac{1}{2}(n+10)(n-9)$ is divisible by 99, so $(n+10)(n-9)$ needs to be divisible by 9 and 11. Since our goal is just finding the minimum $n$ , we can do casework on whether the $n+10$ or $n-9$ is a multiple of 11 (We choose 11 because it is prime). Assume that $n+10$ is a multiple of 11. Writing out a few terms, $n=12, 23, 34, 45$ , we see that $n=45$ is the smallest $n$ that works in this case. Next, assume that $n-9$ is a multiple of 11. Writing out a few terms, $n=20, 31, 42, 53$ , we see that $n=53$ is the smallest $n$ that works in this case. The smallest $n$ is $\boxed{045}$ . Note that we can also construct the solution using CRT by assuming either $11$ divides $n+10$ and $9$ divides $n-9$ , or $9$ divides $n+10$ and $11$ divides $n-9$ , and taking the smaller solution. (We know this because it's impossible for both $n+10$ and $n-9$ to be divisible by 3).
-/

import Mathlib.Tactic

theorem wiki_index_php_bc0c81bf43 : Prop := by
  sorry
