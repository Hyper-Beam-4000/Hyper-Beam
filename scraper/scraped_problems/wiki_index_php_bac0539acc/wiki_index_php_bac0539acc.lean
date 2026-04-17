-- 2018 AMC 12A Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_9

-- Problem (LaTeX):
/-
Which of the following describes the largest subset of values of $y$ within the closed interval $[0,\pi]$ for which \[\sin(x+y)\leq \sin(x)+\sin(y)\] for every $x$ between $0$ and $\pi$ , inclusive? $\textbf{(A) } y=0 \qquad \textbf{(B) } 0\leq y\leq \frac{\pi}{4} \qquad \textbf{(C) } 0\leq y\leq \frac{\pi}{2} \qquad \textbf{(D) } 0\leq y\leq \frac{3\pi}{4} \qquad \textbf{(E) } 0\leq y\leq \pi$
-/

-- Solution/Answer (LaTeX):
/-
On the interval $[0, \pi]$ sine is nonnegative; thus $\sin(x + y) = \sin x \cos y + \sin y \cos x \le \sin x + \sin y$ for all $x, y \in [0, \pi]$ and equality only occurs when $\cos x = \cos y = 1$ , which is cosine's maximum value. The answer is $\boxed{\textbf{(E) } 0\le y\le \pi}$ . (CantonMathGuy)
-/

import Mathlib.Tactic

theorem wiki_index_php_bac0539acc : Prop := by
  sorry
