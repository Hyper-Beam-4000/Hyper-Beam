-- 2021 AMC 12B Problems/Problem 19
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12B_Problems/Problem_19

-- Problem (LaTeX):
/-
Two fair dice, each with at least $6$ faces are rolled. On each face of each die is printed a distinct integer from $1$ to the number of faces on that die, inclusive. The probability of rolling a sum of $7$ is $\frac34$ of the probability of rolling a sum of $10,$ and the probability of rolling a sum of $12$ is $\frac{1}{12}$ . What is the least possible number of faces on the two dice combined? $\textbf{(A) }16 \qquad \textbf{(B) }17 \qquad \textbf{(C) }18\qquad \textbf{(D) }19 \qquad \textbf{(E) }20$
-/

-- Solution/Answer (LaTeX):
/-
Suppose the dice have $a$ and $b$ faces, and WLOG $a\geq{b}$ . Since each die has at least $6$ faces, there will always be $6$ ways to sum to $7$ . As a result, there must be $\tfrac{4}{3}\cdot6=8$ ways to sum to $10$ . There are at most nine distinct ways to get a sum of $10$ , which are possible whenever $a,b\geq{9}$ . To achieve exactly eight ways, $b$ must have $8$ faces, and $a\geq9$ . Let $n$ be the number of ways to obtain a sum of $12$ , then $\tfrac{n}{8a}=\tfrac{1}{12}\implies n=\tfrac{2}{3}a$ . Since $b=8$ , $n\leq8\implies a\leq{12}$ . In addition to $3\mid{a}$ , we only have to test $a=9,12$ , of which both work. Taking the smaller one, our answer becomes $a+b=9+8=\boxed{\textbf{(B)}\ 17}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_c43f4b2166 : Prop := by
  sorry
