-- 2025 AMC 12B Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_3

-- Problem (LaTeX):
/-
What is the value of $i(i-1)(i-2)(i-3)$ , where $i = \sqrt{-1}$ ? $\textbf{(A)}~6-5i \qquad \textbf{(B)}~-10i \qquad \textbf{(C)}~10i \qquad \textbf{(D)}~-10 \qquad \textbf{(E)}~10$
-/

-- Solution/Answer (LaTeX):
/-
We find that $i(i-3)=-1-3i$ and $(i-1)(i-2)=-1-3i+2=1-3i$ , so
\begin{align}
i(i-1)(i-2)(i-3)&=i(i-3)\cdot (i-1)(i-2)\\
&=(-1-3i)(1-3i)\\
&=-(1+3i)(1-3i)\\
&=-(1^2-(3i)^2)\\
&=-(1+9)\\
&=\boxed{\textbf{(D)}~-10 }
\end{align} ~ eevee9406
-/

import Mathlib.Tactic

theorem wiki_index_php_dc31c4c2db : Prop := by
  sorry
