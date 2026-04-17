-- 2019 AMC 10A Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12A_Problems/Problem_7

-- Problem (LaTeX):
/-
Melanie computes the mean $\mu$ , the median $M$ , and the modes of the $365$ values that are the dates in the months of $2019$ . Thus her data consist of $12$ $1\text{s}$ , $12$ $2\text{s}$ , . . . , $12$ $28\text{s}$ , $11$ $29\text{s}$ , $11$ $30\text{s}$ , and $7$ $31\text{s}$ . Let $d$ be the median of the modes. Which of the following statements is true? $\textbf{(A) } \mu < d < M \qquad\textbf{(B) } M < d < \mu \qquad\textbf{(C) } d = M =\mu \qquad\textbf{(D) } d < M < \mu \qquad\textbf{(E) } d < \mu < M$
-/

-- Solution/Answer (LaTeX):
/-
First of all, $d$ obviously has to be smaller than $M$ , since when calculating $M$ , we must take into account the $29$ s, $30$ s, and $31$ s. So we can eliminate choices $B$ and $C$ . Since there are $365$ total entries, the median, $M$ , must be the $183\text{rd}$ one, at which point we note that $12 \cdot 15$ is $180$ , so $16$ has to be the median (because $183$ is between $12 \cdot 15 + 1 = 181$ and $12 \cdot 16 = 192$ ). Now, the mean, $\mu$ , must be smaller than $16$ , since there are many fewer $29$ s, $30$ s, and $31$ s. $d$ is less than $\mu$ , because when calculating $\mu$ , we would include $29$ , $30$ , and $31$ . Thus the answer is $\boxed{\textbf{(E) } d < \mu < M}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_e40dc141d6 : Prop := by
  sorry
