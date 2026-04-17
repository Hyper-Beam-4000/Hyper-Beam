-- 2019 AMC 10A Problems/Problem 20
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12A_Problems/Problem_16

-- Problem (LaTeX):
/-
The numbers $1,2,\dots,9$ are randomly placed into the $9$ squares of a $3 \times 3$ grid. Each square gets one number, and each of the numbers is used once. What is the probability that the sum of the numbers in each row and each column is odd? $\textbf{(A) }\frac{1}{21}\qquad\textbf{(B) }\frac{1}{14}\qquad\textbf{(C) }\frac{5}{63}\qquad\textbf{(D) }\frac{2}{21}\qquad\textbf{(E) }\frac{1}{7}$
-/

-- Solution/Answer (LaTeX):
/-
Note that odd sums can only be formed by $(e,e,o)$ or $(o,o,o),$ so we focus on placing the evens: we need to have each even be with another even in each row/column. Because there are only $5$ odd numbers overall, we can only have $1$ $(o,o,o)$ row and $1$ $(o,o,o)$ column. It can be seen that there are $3 \cdot 3 = 9$ ways to do this. There are then $5!$ ways to permute the odd numbers, and $4!$ ways to permute the even numbers, thus giving the answer as $\frac{9 \cdot 5! \cdot 4!}{9!}=\boxed{\textbf{(B) }\frac{1}{14}}$ . ~Petallstorm
(Minor edits by JeffersonJ and monkey_land)
-/

import Mathlib.Tactic

theorem wiki_index_php_43b531bdef : Prop := by
  sorry
