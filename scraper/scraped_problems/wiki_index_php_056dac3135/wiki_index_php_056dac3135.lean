-- 2020 AMC 12B Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_12

-- Problem (LaTeX):
/-
Let $\overline{AB}$ be a diameter in a circle of radius $5\sqrt2.$ Let $\overline{CD}$ be a chord in the circle that intersects $\overline{AB}$ at a point $E$ such that $BE=2\sqrt5$ and $\angle AEC = 45^{\circ}.$ What is $CE^2+DE^2?$ $\textbf{(A)}\ 96 \qquad\textbf{(B)}\ 98 \qquad\textbf{(C)}\ 44\sqrt5 \qquad\textbf{(D)}\ 70\sqrt2 \qquad\textbf{(E)}\ 100$
-/

-- Solution/Answer (LaTeX):
/-
Let $O$ be the center of the circle, and $X$ be the midpoint of $\overline{CD}$ . Let $CX=a$ and $EX=b$ . This implies that $DE = a - b$ . Since $CE = CX + EX = a + b$ , we now want to find $(a+b)^2+(a-b)^2=2(a^2+b^2)$ . Since $\angle CXO$ is a right angle, by Pythagorean theorem $a^2 + b^2 = CX^2 + OX^2 = (5\sqrt{2})^2=50$ . Thus, our answer is $2\times50=\boxed{\textbf{(E)}\ 100}$ . ~JHawk0224
-/

import Mathlib.Tactic

theorem wiki_index_php_056dac3135 : Prop := by
  sorry
