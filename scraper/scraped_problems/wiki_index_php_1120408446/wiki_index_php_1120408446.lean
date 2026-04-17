-- 2023 AMC 12B Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_11

-- Problem (LaTeX):
/-
What is the maximum area of an isosceles trapezoid that has legs of length $1$ and one base twice as long as the other? $\textbf{(A) }\frac 54 \qquad \textbf{(B) } \frac 87 \qquad \textbf{(C)} \frac{5\sqrt2}4 \qquad \textbf{(D) } \frac 32 \qquad \textbf{(E) } \frac{3\sqrt3}4$
-/

-- Solution/Answer (LaTeX):
/-
Let the trapezoid be $ABCD$ with $AD = BC = 1, \; AB = x, CD = 2x$ . Extend $AD$ and $BC$ to meet at point $E$ . Then, notice $\triangle ABE \sim \triangle DCE$ with side length ratio $1:2$ and $AE = BE = 1$ . Thus, $[DCE] = 4 \cdot [ABE]$ and $[ABCD] = [DCE] - [ABE] = \frac{3}{4} \cdot [DCE]$ . The problem reduces to maximizing the area of $[DCE]$ , an isosceles triangle with legs of length $2$ . Analyzing the sine area formula, this is clearly maximized when $\angle DEC = 90^{\circ}$ , so $[DCE] = 2$ and $[ABCD] = \frac{3}{4} \cdot 2 = \boxed{\frac{3}{2}}.$ -PIDay
-/

import Mathlib.Tactic

theorem wiki_index_php_1120408446 : Prop := by
  sorry
