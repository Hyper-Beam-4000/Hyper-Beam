-- 2017 AMC 12B Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12B_Problems/Problem_7

-- Problem (LaTeX):
/-
The functions $\sin(x)$ and $\cos(x)$ are periodic with least period $2\pi$ . What is the least period of the function $\cos(\sin(x))$ ? $\textbf{(A)}\ \frac{\pi}{2}\qquad\textbf{(B)}\ \pi\qquad\textbf{(C)}\ 2\pi \qquad\textbf{(D)}\ 4\pi \qquad\textbf{(E)}$ The function is not periodic.
-/

-- Solution/Answer (LaTeX):
/-
Start by noting that $\cos(-x)=\cos(x)$ . Then realize that under this function, the negative sine values yield the same as their positive value, so take the absolute value of the sine function to get the new period. This has period $\pi$ , so the answer is $\boxed{(B)}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_2ad5d2dd2a : Prop := by
  sorry
