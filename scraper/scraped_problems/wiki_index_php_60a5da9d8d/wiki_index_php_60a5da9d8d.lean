-- 2018 AMC 10B Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12B_Problems/Problem_2

-- Problem (LaTeX):
/-
Sam drove $96$ miles in $90$ minutes. His average speed during the first $30$ minutes was $60$ mph (miles per hour), and his average speed during the second $30$ minutes was $65$ mph. What was his average speed, in mph, during the last $30$ minutes? $\textbf{(A) } 64 \qquad \textbf{(B) } 65 \qquad \textbf{(C) } 66 \qquad \textbf{(D) } 67 \qquad \textbf{(E) } 68$
-/

-- Solution/Answer (LaTeX):
/-
Suppose that Sam's average speed during the last $30$ minutes was $x$ mph. Recall that a half hour is equal to $30$ minutes. Therefore, Sam drove $60\cdot0.5=30$ miles during the first half hour, $65\cdot0.5=32.5$ miles during the second half hour, and $x\cdot0.5$ miles during the last half hour. We have \begin{align*} 30+32.5+x\cdot0.5&=96 \\ x\cdot0.5&=33.5 \\ x&=\boxed{\textbf{(D) } 67}. \end{align*} ~Haha0201 ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_60a5da9d8d : Prop := by
  sorry
