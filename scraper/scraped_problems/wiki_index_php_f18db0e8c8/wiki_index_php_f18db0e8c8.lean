-- 2017 AMC 12B Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12B_Problems/Problem_9

-- Problem (LaTeX):
/-
A circle has center $(-10, -4)$ and has radius $13$ . Another circle has center $(3, 9)$ and radius $\sqrt{65}$ . The line passing through the two points of intersection of the two circles has equation $x+y=c$ . What is $c$ ? $\textbf{(A)}\ 3\qquad\textbf{(B)}\ 3\sqrt{3}\qquad\textbf{(C)}\ 4\sqrt{2}\qquad\textbf{(D)}\ 6\qquad\textbf{(E)}\ \frac{13}{2}$
-/

-- Solution/Answer (LaTeX):
/-
The equations of the two circles are $(x+10)^2+(y+4)^2=169$ and $(x-3)^2+(y-9)^2=65$ . Rearrange them to $(x+10)^2+(y+4)^2-169=0$ and $(x-3)^2+(y-9)^2-65=0$ , respectively. Their intersection points are where these two equations gain equality. The two points lie on the line with the equation $(x+10)^2+(y+4)^2-169=(x-3)^2+(y-9)^2-65$ . We can simplify this like the following. $(x+10)^2+(y+4)^2-169=(x-3)^2+(y-9)^2-65 \rightarrow (x^2+20x+100)+(y^2+8y+16)-(x^2-6x+9)-(y^2-18y+81)=104 \rightarrow 26x+26y+26=104 \rightarrow 26x+26y=78 \rightarrow x+y=3$ . Thus, $c = \boxed{\textbf{(A)}\ 3}$ . Solution by TheUltimate123
-/

import Mathlib.Tactic

theorem wiki_index_php_f18db0e8c8 : Prop := by
  sorry
