-- 2022 AMC 10B Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12B_Problems/Problem_1

-- Problem (LaTeX):
/-
Define $x\diamond y$ to be $|x-y|$ for all real numbers $x$ and $y.$ What is the value of \[(1\diamond(2\diamond3))-((1\diamond2)\diamond3)?\] $\textbf{(A)}\ {-}2 \qquad \textbf{(B)}\ {-}1 \qquad \textbf{(C)}\ 0 \qquad \textbf{(D)}\ 1 \qquad \textbf{(E)}\ 2$
-/

-- Solution/Answer (LaTeX):
/-
We have \begin{align*} (1\diamond(2\diamond3))-((1\diamond2)\diamond3) &= |1-|2-3|| - ||1-2|-3| \\ &= |1-1| - |1-3| \\ &= 0-2 \\ &= \boxed{\textbf{(A)}\ {-}2}. \end{align*} ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_94c9588651 : Prop := by
  sorry
