-- 2019 AMC 10A Problems/Problem 18
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12A_Problems/Problem_11

-- Problem (LaTeX):
/-
For some positive integer $k$ , the repeating base- $k$ representation of the (base-ten) fraction $\frac{7}{51}$ is $0.\overline{23}_k = 0.232323..._k$ . What is $k$ ? $\textbf{(A) } 13 \qquad\textbf{(B) } 14 \qquad\textbf{(C) } 15 \qquad\textbf{(D) } 16 \qquad\textbf{(E) } 17$
-/

-- Solution/Answer (LaTeX):
/-
We can expand the fraction $0.\overline{23}_k$ as follows: $0.\overline{23}_k = 2\cdot k^{-1} + 3 \cdot k^{-2} + 2 \cdot k^{-3} + 3 \cdot k^{-4} + \cdots$ Notice that this is equivalent to \[2( k^{-1} + k^{-3} + k^{-5} + ... ) + 3 (k^{-2} + k^{-4} + k^{-6} + \cdots )\] By summing the geometric series and simplifying, we have $\frac{2k+3}{k^2-1} = \frac{7}{51}$ . Solving this quadratic equation (or simply testing the answer choices) yields the answer $k = \boxed{\textbf{(D) }16}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_0e58e5e52e : Prop := by
  sorry
