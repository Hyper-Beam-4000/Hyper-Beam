-- 2024 AMC 12B Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_8

-- Problem (LaTeX):
/-
What value of $x$ satisfies \[\frac{\log_2x \cdot \log_3x}{\log_2x+\log_3x}=2?\] $\textbf{(A) } 25 \qquad\textbf{(B) } 32 \qquad\textbf{(C) } 36 \qquad\textbf{(D) } 42 \qquad\textbf{(E) } 48$
-/

-- Solution/Answer (LaTeX):
/-
We have
\begin{align*}
\log_2x\cdot\log_3x&=2(\log_2x+\log_3x) \\
1&=\frac{2(\log_2x+\log_3x)}{\log_2x\cdot\log_3x} \\
1&=2(\frac{1}{\log_3x}+\frac{1}{\log_2x}) \\
1&=2(\log_x3+\log_x2) \\
\log_x6&=\frac{1}{2} \\
x^{\frac{1}{2}}&=6 \\
x&=36
\end{align*}
so $\boxed{\textbf{(C) }36}$ ~kafuu_chino
-/

import Mathlib.Tactic

theorem wiki_index_php_a284ba62ca : Prop := by
  sorry
