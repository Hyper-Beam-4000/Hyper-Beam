-- 2017 AMC 12A Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12A_Problems/Problem_1

-- Problem (LaTeX):
/-
Pablo buys popsicles for his friends. The store sells single popsicles for $\$1$ each, 3-popsicle boxes for $\$2$ , and 5-popsicle boxes for $\$3$ . What is the greatest number of popsicles that Pablo can buy with $\$8$ ? $\textbf{(A)}\ 8\qquad\textbf{(B)}\ 11\qquad\textbf{(C)}\ 12\qquad\textbf{(D)}\ 13\qquad\textbf{(E)}\ 15$
-/

-- Solution/Answer (LaTeX):
/-
We can take two 5-popsicle boxes and one 3-popsicle box with $\$8$ . Note that it is optimal since one popsicle is at the rate of $\$1$ per popsicle, three popsicles at $\$\frac{2}{3}$ per popsicle and finally, five popsicles at $\$\frac{3}{5}$ per popsicle, hence we want as many $\$3$ sets as possible. It is clear that the above is the optimal method. $\boxed{\textbf{D}}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_3ec135ffee : Prop := by
  sorry
