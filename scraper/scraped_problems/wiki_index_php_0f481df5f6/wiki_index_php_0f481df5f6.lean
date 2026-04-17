-- 2020 AMC 12B Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_7

-- Problem (LaTeX):
/-
Two nonhorizontal, non vertical lines in the $xy$ -coordinate plane intersect to form a $45^{\circ}$ angle. One line has slope equal to $6$ times the slope of the other line. What is the greatest possible value of the product of the slopes of the two lines? $\textbf{(A)}\ \frac16 \qquad\textbf{(B)}\ \frac23 \qquad\textbf{(C)}\ \frac32 \qquad\textbf{(D)}\ 3 \qquad\textbf{(E)}\ 6$
-/

-- Solution/Answer (LaTeX):
/-
Let the intersection point be the origin. Let $(a,b)$ be a point on the line of lesser slope. The mutliplication of $a+bi$ by cis 45. $(a+bi)(\frac{1}{\sqrt 2 }+i*\frac{1}{\sqrt 2 })=\frac{1}{\sqrt 2 }((a-b)+(a+b)*i)$ and therefore $(a-b, a+b)$ lies on the line of greater slope. Then, the rotation of $(a,b)$ by 45 degrees gives a line of slope $\frac{a+b}{a-b}$ . We get the equation $\frac{6b}{a}=\frac{a+b}{a-b}\implies a^2-5ab+6b^2=(a-3b)(a-2b)=0$ and this gives our answer to be $\mathbf{(C)} \frac{3}{2}$ . ~jeffisepic
-/

import Mathlib.Tactic

theorem wiki_index_php_0f481df5f6 : Prop := by
  sorry
