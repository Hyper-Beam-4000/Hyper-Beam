-- 2022 AMC 10B Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12B_Problems/Problem_6

-- Problem (LaTeX):
/-
Consider the following $100$ sets of $10$ elements each: \begin{align*} &\{1,2,3,\ldots,10\}, \\ &\{11,12,13,\ldots,20\},\\ &\{21,22,23,\ldots,30\},\\ &\vdots\\ &\{991,992,993,\ldots,1000\}. \end{align*} How many of these sets contain exactly two multiples of $7$ ? $\textbf{(A)}\ 40\qquad\textbf{(B)}\ 42\qquad\textbf{(C)}\ 43\qquad\textbf{(D)}\ 49\qquad\textbf{(E)}\ 50$
-/

-- Solution/Answer (LaTeX):
/-
There are $\left\lfloor \frac{1000}{7} \right\rfloor = 142$ numbers divisible by 7. We split these into 100 sets containing 10 numbers each, giving us 1.42 multiples of 7 per set. After the first set, the numbers come evenly, and we multiply 100 by $1.42 - 1 = \boxed{\textbf{(B)}\ 42}.$ ~Pinotation
-/

import Mathlib.Tactic

theorem wiki_index_php_6ab8dd7e8b : Prop := by
  sorry
