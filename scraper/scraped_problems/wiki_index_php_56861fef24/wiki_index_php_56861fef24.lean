-- 2020 AMC 10A Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12A_Problems/Problem_8

-- Problem (LaTeX):
/-
What is the median of the following list of $4040$ numbers $?$ \[1, 2, 3, \ldots, 2020, 1^2, 2^2, 3^2, \ldots, 2020^2\] $\textbf{(A)}\ 1974.5\qquad\textbf{(B)}\ 1975.5\qquad\textbf{(C)}\ 1976.5\qquad\textbf{(D)}\ 1977.5\qquad\textbf{(E)}\ 1978.5$
-/

-- Solution/Answer (LaTeX):
/-
We can see that $44^2=1936$ which is less than 2020. Therefore, there are $2020-44=1976$ of the $4040$ numbers greater than $2020$ . Also, there are $2020+44=2064$ numbers that are less than or equal to $2020$ . Since there are $44$ duplicates/extras, it will shift up our median's placement down $44$ . Had the list of numbers been $1,2,3, \dots, 4040$ , the median of the whole set would be $\dfrac{1+4040}{2}=2020.5$ . Thus, our answer is $2020.5-44=\boxed{\textbf{(C)}\ 1976.5}$ . ~aryam ~Additions by BakedPotato66
-/

import Mathlib.Tactic

theorem wiki_index_php_56861fef24 : Prop := by
  sorry
