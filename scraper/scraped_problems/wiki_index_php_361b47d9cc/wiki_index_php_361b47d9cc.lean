-- 2018 AMC 10A Problems/Problem 17
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_12

-- Problem (LaTeX):
/-
Let $S$ be a set of $6$ integers taken from $\{1,2,\dots,12\}$ with the property that if $a$ and $b$ are elements of $S$ with $a<b$ , then $b$ is not a multiple of $a$ . What is the least possible value of an element in $S$ ? $\textbf{(A)}\ 2\qquad\textbf{(B)}\ 3\qquad\textbf{(C)}\ 4\qquad\textbf{(D)}\ 5\qquad\textbf{(E)}\ 7$
-/

-- Solution/Answer (LaTeX):
/-
We start with $2$ because $1$ is not an answer choice. We would have to include every odd number except $1$ to fill out the set, but then $3$ and $9$ would violate the rule, so that won't work. Experimentation with $3$ shows it's likewise impossible. You can include $7,11,$ and either $5$ or $10$ (which are always safe). But after adding either $4$ or $8$ we have no more valid numbers. Finally, starting with $4,$ we find that the sequence $4,5,6,7,9,11$ works, giving us $\boxed{\textbf{(C)}\ 4}.$
-/

import Mathlib.Tactic

theorem wiki_index_php_361b47d9cc : Prop := by
  sorry
