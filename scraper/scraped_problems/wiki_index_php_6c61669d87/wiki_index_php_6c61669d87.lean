-- 2021 AMC 12A Problems/Problem 19
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_19

-- Problem (LaTeX):
/-
How many solutions does the equation $\sin \left( \frac{\pi}2 \cos x\right)=\cos \left( \frac{\pi}2 \sin x\right)$ have in the closed interval $[0,\pi]$ ? $\textbf{(A) }0 \qquad \textbf{(B) }1 \qquad \textbf{(C) }2 \qquad \textbf{(D) }3\qquad \textbf{(E) }4$
-/

-- Solution/Answer (LaTeX):
/-
The ranges of $\frac{\pi}2 \sin x$ and $\frac{\pi}2 \cos x$ are both $\left[-\frac{\pi}2, \frac{\pi}2 \right],$ which is included in the range of $\arcsin,$ so we can use it with no issues. \begin{align*} \frac{\pi}2 \cos x &= \arcsin \left( \cos \left( \frac{\pi}2 \sin x\right)\right) \\ \frac{\pi}2 \cos x &= \arcsin \left( \sin \left( \frac{\pi}2 - \frac{\pi}2 \sin x\right)\right) \\ \frac{\pi}2 \cos x &= \frac{\pi}2 - \frac{\pi}2 \sin x \\ \cos x &= 1 - \sin x \\ \cos x + \sin x &= 1. \end{align*} This only happens at $x = 0, \frac{\pi}2$ on the interval $[0,\pi],$ because one of $\sin$ and $\cos$ must be $1$ and the other $0.$ Therefore, the answer is $\boxed{\textbf{(C) }2}.$ ~Tucker
-/

import Mathlib.Tactic

theorem wiki_index_php_6c61669d87 : Prop := by
  sorry
