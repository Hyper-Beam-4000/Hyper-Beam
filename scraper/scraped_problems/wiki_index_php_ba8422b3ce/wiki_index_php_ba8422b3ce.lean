-- 2022 AMC 12B Problems/Problem 17
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12B_Problems/Problem_17

-- Problem (LaTeX):
/-
How many $4 \times 4$ arrays whose entries are $0$ s and $1$ s are there such that the row sums (the sum of the entries in each row) are $1, 2, 3,$ and $4,$ in some order, and the column sums (the sum of the entries in each column) are also $1, 2, 3,$ and $4,$ in some order? For example, the array \[\left[ \begin{array}{cccc} 1 & 1 & 1 & 0 \\ 0 & 1 & 1 & 0 \\ 1 & 1 & 1 & 1 \\ 0 & 1 & 0 & 0 \\ \end{array} \right]\] satisfies the condition. $\textbf{(A) }144 \qquad \textbf{(B) }240 \qquad \textbf{(C) }336 \qquad \textbf{(D) }576 \qquad \textbf{(E) }624$
-/

-- Solution/Answer (LaTeX):
/-
Note that the arrays and the sum configurations have one-to-one correspondence. Furthermore, the row sum configuration and the column sum configuration are independent of each other. Therefore, the answer is $(4!)^2=\boxed{\textbf{(D) }576}.$ Remark For any given sum configuration, we can uniquely reconstruct the array it represents. Conversely, for any array, it is clear that we can determine the unique sum configuration associated with it. Therefore, this establishes a one-to-one correspondence between the arrays and the sum configurations. ~bad_at_mathcounts ~MRENTHUSIASM ~tsun26
-/

import Mathlib.Tactic

theorem wiki_index_php_ba8422b3ce : Prop := by
  sorry
