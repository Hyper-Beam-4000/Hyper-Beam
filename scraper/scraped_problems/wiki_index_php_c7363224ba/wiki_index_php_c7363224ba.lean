-- 2023 AMC 12A Problems/Problem 24
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_24

-- Problem (LaTeX):
/-
Let $K$ be the number of sequences $A_1$ , $A_2$ , $\dots$ , $A_n$ such that $n$ is a positive integer less than or equal to $10$ , each $A_i$ is a subset of $\{1, 2, 3, \dots, 10\}$ , and $A_{i-1}$ is a subset of $A_i$ for each $i$ between $2$ and $n$ , inclusive. For example, $\{\}$ , $\{5, 7\}$ , $\{2, 5, 7\}$ , $\{2, 5, 7\}$ , $\{2, 5, 6, 7, 9\}$ is one such sequence, with $n = 5$ .What is the remainder when $K$ is divided by $10$ ? $\textbf{(A) } 1 \qquad \textbf{(B) } 3 \qquad \textbf{(C) } 5 \qquad \textbf{(D) } 7 \qquad \textbf{(E) } 9$
-/

-- Solution/Answer (LaTeX):
/-
Consider any sequence with $n$ terms. Every number has such choices: never appear, appear the first time in the first spot, appear the first time in the second spot ..., and appear the first time in the $n$ th spot, which means every number has $(n+1)$ choices to show up in the sequence. Consequently, for each sequence with length $n$ , there are $(n+1)^{10}$ possible ways. Thus, the desired value is $\sum_{n=1}^{10}(n+1)^{10}\equiv \boxed{\textbf{(C) } 5}\pmod{10}$ . ~bluesoul
-/

import Mathlib.Tactic

theorem wiki_index_php_c7363224ba : Prop := by
  sorry
