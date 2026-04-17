-- 2023 AMC 12A Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_6

-- Problem (LaTeX):
/-
Points $A$ and $B$ lie on the graph of $y=\log_{2}x$ . The midpoint of $\overline{AB}$ is $(6, 2)$ . What is the positive difference between the $x$ -coordinates of $A$ and $B$ ? $\textbf{(A)}~2\sqrt{11}\qquad\textbf{(B)}~4\sqrt{3}\qquad\textbf{(C)}~8\qquad\textbf{(D)}~4\sqrt{5}\qquad\textbf{(E)}~9$
-/

-- Solution/Answer (LaTeX):
/-
Let $A(6+m,2+n)$ and $B(6-m,2-n)$ , since $(6,2)$ is their midpoint. Thus, we must find $2m$ . We find two equations due to $A,B$ both lying on the function $y=\log_{2}x$ . The two equations are then $\log_{2}(6+m)=2+n$ and $\log_{2}(6-m)=2-n$ . Now add these two equations to obtain $\log_{2}(6+m)+\log_{2}(6-m)=4$ . By logarithm rules, we get $\log_{2}((6+m)(6-m))=4$ . By raising 2 to the power of both sides, we obtain $(6+m)(6-m)=16$ . We then get \[36-m^2=16 \rightarrow m^2=20 \rightarrow m=2\sqrt{5}\] . Since we're looking for $2m$ , we obtain $(2)(2\sqrt{5})=\boxed{\textbf{(D) }4\sqrt{5}}$ ~amcrunner (yay, my first AMC solution)
-/

import Mathlib.Tactic

theorem wiki_index_php_afb2db7494 : Prop := by
  sorry
