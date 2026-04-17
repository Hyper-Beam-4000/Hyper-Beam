-- 2017 AMC 12A Problems/Problem 15
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12A_Problems/Problem_15

-- Problem (LaTeX):
/-
Let $f(x) = \sin{x} + 2\cos{x} + 3\tan{x}$ , using radian measure for the variable $x$ . In what interval does the smallest positive value of $x$ for which $f(x) = 0$ lie? $\textbf{(A)}\ (0,1) \qquad \textbf{(B)}\ (1, 2) \qquad\textbf{(C)}\ (2, 3) \qquad\textbf{(D)}\ (3, 4) \qquad\textbf{(E)}\ (4,5)$
-/

-- Solution/Answer (LaTeX):
/-
We must first get an idea of what $f(x)$ looks like: Between $0$ and $1$ , $f(x)$ starts at $2$ and increases; clearly there is no zero here. Between $1$ and $\frac{\pi}{2}$ , $f(x)$ starts at a positive number and increases to $\infty$ ; there is no zero here either. Between $\frac{\pi}{2}$ and 3, $f(x)$ starts at $-\infty$ and increases to some negative number; there is no zero here either. Between $3$ and $\pi$ , $f(x)$ starts at some negative number and increases to -2; there is no zero here either. Between $\pi$ and $\pi+\frac{\pi}{4} < 4$ , $f(x)$ starts at -2 and increases to $-\frac{\sqrt2}{2} + 2\left(-\frac{\sqrt2}{2}\right) + 3\left(1\right)=3\left(1-\frac{\sqrt2}{2}\right)>0$ . There is a zero here by the Intermediate Value Theorem. Therefore, the answer is $\boxed{\textbf{(D)}}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_4fee679d56 : Prop := by
  sorry
