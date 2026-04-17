-- 2023 AMC 12A Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_2

-- Problem (LaTeX):
/-
The weight of $\frac{1}{3}$ of a large pizza together with $3 \frac{1}{2}$ cups of orange slices is the same as the weight of $\frac{3}{4}$ of a large pizza together with $\frac{1}{2}$ cup of orange slices. A cup of orange slices weighs $\frac{1}{4}$ of a pound. What is the weight, in pounds, of a large pizza? $\textbf{(A) }1\frac{4}{5}\qquad\textbf{(B) }2\qquad\textbf{(C) }2\frac{2}{5}\qquad\textbf{(D) }3\qquad\textbf{(E) }3\frac{3}{5}$
-/

-- Solution/Answer (LaTeX):
/-
Use a system of equations. Let $x$ be the weight of a pizza and $y$ be the weight of a cup of orange slices.
We have \[\frac{1}{3}x+\frac{7}{2}y=\frac{3}{4}x+\frac{1}{2}y.\] Rearranging, we get \begin{align*} \frac{5}{12}x&=3y, \\ x&=\frac{36}{5}y. \end{align*} Plugging in $\frac{1}{4}$ pounds for $y$ by the given gives $\frac{9}{5}=\boxed{\textbf{(A) }1\frac{4}{5}}.$ ~ItsMeNoobieboy
~walmartbrian
-/

import Mathlib.Tactic

theorem wiki_index_php_eb055d2b46 : Prop := by
  sorry
