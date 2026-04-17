-- 2022 AMC 10B Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12B_Problems/Problem_3

-- Problem (LaTeX):
/-
How many of the first ten numbers of the sequence $121, 11211, 1112111, \ldots$ are prime numbers? $\textbf{(A) } 0 \qquad \textbf{(B) }1 \qquad \textbf{(C) }2 \qquad \textbf{(D) }3 \qquad \textbf{(E) }4$
-/

-- Solution/Answer (LaTeX):
/-
The $n$ th term of this sequence is \[\sum_{k=n}^{2n}10^k + \sum_{k=0}^{n}10^k = 10^n\sum_{k=0}^{n}10^k + \sum_{k=0}^{n}10^k = \left(10^n+1\right)\sum_{k=0}^{n}10^k.\] It follows that the terms are \begin{align*} 121 &= 11\cdot11, \\ 11211 &= 101\cdot111, \\ 1112111 &= 1001\cdot1111, \\ & \ \vdots \end{align*} Therefore, there are $\boxed{\textbf{(A) } 0}$ prime numbers in this sequence. ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_2acb484076 : Prop := by
  sorry
