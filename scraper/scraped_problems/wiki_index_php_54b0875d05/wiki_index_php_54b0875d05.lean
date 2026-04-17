-- 2020 AMC 10B Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_8

-- Problem (LaTeX):
/-
How many ordered pairs of integers $(x, y)$ satisfy the equation \[x^{2020}+y^2=2y?\] $\textbf{(A) } 1 \qquad\textbf{(B) } 2 \qquad\textbf{(C) } 3 \qquad\textbf{(D) } 4 \qquad\textbf{(E) } \text{infinitely many}$
-/

-- Solution/Answer (LaTeX):
/-
Rearranging the terms and and completing the square for $y$ yields the result $x^{2020}+(y-1)^2=1$ . Then, notice that $x$ can only be $0$ , $1$ and $-1$ because any value of $x^{2020}$ that is greater than 1 will cause the term $(y-1)^2$ to be less than $0$ , which is impossible as $y$ must be real. Therefore, plugging in the above values for $x$ gives the ordered pairs $(0,0)$ , $(1,1)$ , $(-1,1)$ , and $(0,2)$ gives a total of $\boxed{\textbf{(D) }4}$ ordered pairs.
-/

import Mathlib.Tactic

theorem wiki_index_php_54b0875d05 : Prop := by
  sorry
