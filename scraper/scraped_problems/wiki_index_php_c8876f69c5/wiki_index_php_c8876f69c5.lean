-- 2018 AMC 12B Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12B_Problems/Problem_3

-- Problem (LaTeX):
/-
A line with slope $2$ intersects a line with slope $6$ at the point $(40,30)$ . What is the distance between the $x$ -intercepts of these two lines? $\textbf{(A) } 5 \qquad \textbf{(B) } 10 \qquad \textbf{(C) } 20 \qquad \textbf{(D) } 25 \qquad \textbf{(E) } 50$
-/

-- Solution/Answer (LaTeX):
/-
Using point slope form, we get the equations $y-30 = 6(x-40)$ and $y-30 = 2(x-40)$ . Simplifying, we get $6x-y=210$ and $2x-y=50$ . Letting $y=0$ in both equations and solving for $x$ gives the $x$ -intercepts: $x=35$ and $x=25$ , respectively. Thus the distance between them is $35-25=\boxed{\textbf{(B) } 10}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_c8876f69c5 : Prop := by
  sorry
