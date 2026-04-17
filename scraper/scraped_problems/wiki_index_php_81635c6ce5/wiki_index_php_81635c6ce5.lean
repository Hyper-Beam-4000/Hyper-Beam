-- 2017 AMC 12A Problems/Problem 18
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12A_Problems/Problem_18

-- Problem (LaTeX):
/-
Let $S(n)$ equal the sum of the digits of positive integer $n$ . For example, $S(1507) = 13$ . For a particular positive integer $n$ , $S(n) = 1274$ . Which of the following could be the value of $S(n+1)$ ? $\textbf{(A)}\ 1 \qquad\textbf{(B)}\ 3\qquad\textbf{(C)}\ 12\qquad\textbf{(D)}\ 1239\qquad\textbf{(E)}\ 1265$
-/

-- Solution/Answer (LaTeX):
/-
Note that $n\equiv S(n)\bmod 9$ , so $S(n+1)-S(n)\equiv n+1-n = 1\bmod 9$ . So, since $S(n)=1274\equiv 5\bmod 9$ , we have that $S(n+1)\equiv 6\bmod 9$ . The only one of the answer choices $\equiv 6\bmod 9$ is $\boxed{(D)=\ 1239}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_81635c6ce5 : Prop := by
  sorry
