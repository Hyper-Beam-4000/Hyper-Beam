-- 2022 AMC 10B Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12B_Problems/Problem_4

-- Problem (LaTeX):
/-
For how many values of the constant $k$ will the polynomial $x^{2}+kx+36$ have two distinct integer roots? $\textbf{(A)}\ 6 \qquad\textbf{(B)}\ 8 \qquad\textbf{(C)}\ 9 \qquad\textbf{(D)}\ 14 \qquad\textbf{(E)}\ 16$
-/

-- Solution/Answer (LaTeX):
/-
Let $p$ and $q$ be the roots of $x^{2}+kx+36.$ By Vieta's Formulas , we have $p+q=-k$ and $pq=36.$ It follows that $p$ and $q$ must be distinct factors of $36.$ The possibilities of $\{p,q\}$ are \[\pm\{1,36\},\pm\{2,18\},\pm\{3,12\},\pm\{4,9\}.\] Each unordered pair gives a unique value of $k.$ Therefore, there are $\boxed{\textbf{(B) }8}$ values of $k,$ corresponding to $\mp37,\mp20,\mp15,\mp13,$ respectively. ~stevens0209 ~MRENTHUSIASM ~ $\color{magenta}zoomanTV$
-/

import Mathlib.Tactic

theorem wiki_index_php_ab7633fc42 : Prop := by
  sorry
