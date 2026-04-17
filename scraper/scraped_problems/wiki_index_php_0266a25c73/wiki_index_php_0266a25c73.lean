-- 2021 AMC 12A Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_13

-- Problem (LaTeX):
/-
Of the following complex numbers $z$ , which one has the property that $z^5$ has the greatest real part? $\textbf{(A) }{-}2 \qquad \textbf{(B) }{-}\sqrt3+i \qquad \textbf{(C) }{-}\sqrt2+\sqrt2 i \qquad \textbf{(D) }{-}1+\sqrt3 i\qquad \textbf{(E) }2i$
-/

-- Solution/Answer (LaTeX):
/-
First, $\textbf{(B)}$ is $2\text{cis}(150)$ , $\textbf{(C)}$ is $2\text{cis}(135)$ , $\textbf{(D)}$ is $2\text{cis}(120)$ . Taking the real part of the $5$ th power of each we have: $\textbf{(A): }(-2)^5=-32$ $\textbf{(B): }32\cos(750)=32\cos(30)=16\sqrt{3}$ $\textbf{(C): }32\cos(675)=32\cos(-45)=16\sqrt{2}$ $\textbf{(D): }32\cos(600)=32\cos(240)<0$ $\textbf{(E): }(2i)^5=32i$ , whose real part is $0$ Thus, the answer is $\boxed{\textbf{(B) }{-}\sqrt3+i}$ . ~JHawk0224
-/

import Mathlib.Tactic

theorem wiki_index_php_0266a25c73 : Prop := by
  sorry
