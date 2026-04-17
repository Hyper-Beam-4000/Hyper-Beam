-- 2022 AMC 10A Problems/Problem 16
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_15

-- Problem (LaTeX):
/-
The roots of the polynomial $10x^3 - 39x^2 + 29x - 6$ are the height, length, and width of a rectangular box (right rectangular prism). A new rectangular box is formed by lengthening each edge of the original box by $2$ units. What is the volume of the new box? $\textbf{(A) } \frac{24}{5} \qquad \textbf{(B) } \frac{42}{5} \qquad \textbf{(C) } \frac{81}{5} \qquad \textbf{(D) } 30 \qquad \textbf{(E) } 48$
-/

-- Solution/Answer (LaTeX):
/-
Let $a$ , $b$ , $c$ be the three roots of the polynomial. The lengthened prism's volume is \[V = (a+2)(b+2)(c+2) = abc+2ac+2ab+2bc+4a+4b+4c+8 = abc + 2(ab+ac+bc) + 4(a+b+c) + 8.\] By Vieta's formulas, we know that a cubic polynomial $Ax^3+Bx^2+Cx+D$ with roots $a$ , $b$ , $c$ satisfies: \begin{alignat*}{8} a+b+c &= -\frac{B}{A} &&= \frac{39}{10}, \\ ab+ac+bc &= \hspace{2mm}\frac{C}{A} &&= \frac{29}{10}, \\ abc &= -\frac{D}{A} &&= \frac{6}{10}. \end{alignat*} We can substitute these into the expression, obtaining \[V = \frac{6}{10} + 2\left(\frac{29}{10}\right) + 4\left(\frac{39}{10}\right) + 8 = \boxed{\textbf{(D) } 30}.\] - phuang1024
-/

import Mathlib.Tactic

theorem wiki_index_php_931d8fcfed : Prop := by
  sorry
