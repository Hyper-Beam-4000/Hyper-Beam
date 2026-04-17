-- 2017 AMC 12B Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12B_Problems/Problem_8

-- Problem (LaTeX):
/-
The ratio of the short side of a certain rectangle to the long side is equal to the ratio of the long side to the diagonal. What is the square of the ratio of the short side to the long side of this rectangle? $\textbf{(A)}\ \frac{\sqrt{3}-1}{2}\qquad\textbf{(B)}\ \frac{1}{2}\qquad\textbf{(C)}\ \frac{\sqrt{5}-1}{2} \qquad\textbf{(D)}\ \frac{\sqrt{2}}{2} \qquad\textbf{(E)}\ \frac{\sqrt{6}-1}{2}$
-/

-- Solution/Answer (LaTeX):
/-
Let $a$ be the short side of the rectangle, and $b$ be the long side of the rectangle. The diagonal, therefore, is $\sqrt{a^2 + b^2}$ . We can get the equation $\frac{a}{b} = \frac{b}{\sqrt{a^2 + b^2}}$ . Cross-multiplying, we get $a\sqrt{a^2 + b^2} = b^2$ . Squaring both sides of the equation, we get $a^2 (a^2 + b^2) = b^4$ , which simplifies to $a^4 + a^2b^2 - b^4 = 0$ . Solving for a quadratic in $a^2$ , using the quadratic formula we get $a^2 = \frac{-b^2 \pm \sqrt{5b^4}}{2}$ which gives us $\frac{a^2}{b^2} = \frac{-1 \pm \sqrt{5}}{2}$ . We know that the square of the ratio must be positive (the square of any real number is positive), so the solution is $\boxed{\textbf{(C)} \frac{\sqrt{5}-1}{2}}$ . Solution by: vedadehhc
-/

import Mathlib.Tactic

theorem wiki_index_php_61fa6b13bb : Prop := by
  sorry
