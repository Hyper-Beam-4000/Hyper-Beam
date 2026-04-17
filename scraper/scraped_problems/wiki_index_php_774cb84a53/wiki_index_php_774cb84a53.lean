-- 2022 AMC 12A Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_5

-- Problem (LaTeX):
/-
The taxicab distance between points $(x_1, y_1)$ and $(x_2, y_2)$ in the coordinate plane is given by \[|x_1 - x_2| + |y_1 - y_2|.\] For how many points $P$ with integer coordinates is the taxicab distance between $P$ and the origin less than or equal to $20$ ? $\textbf{(A)} \, 441 \qquad\textbf{(B)} \, 761 \qquad\textbf{(C)} \, 841 \qquad\textbf{(D)} \, 921 \qquad\textbf{(E)} \, 924$
-/

-- Solution/Answer (LaTeX):
/-
Let us consider the number of points for a certain $x$ -coordinate. For any $x$ , the viable points are in the range $[-20 + |x|, 20 - |x|]$ . This means that our total sum is equal to \begin{align*} 1 + 3 + 5 + \cdots + 41 + 39 + 37 + \cdots + 1 &= (1 + 3 + 5 + \cdots + 39) + (1 + 3 + 5 + \cdots + 41) \\ & = 20^2 + 21^2 \\ & = 29^2 \\ &= \boxed{\textbf{(C)} \, 841}. \end{align*} ~mathboy100
-/

import Mathlib.Tactic

theorem wiki_index_php_774cb84a53 : Prop := by
  sorry
