-- 2023 AMC 12B Problems/Problem 25
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_25

-- Problem (LaTeX):
/-
A regular pentagon with area $\sqrt{5}+1$ is printed on paper and cut out. The five vertices of the pentagon are folded into the center of the pentagon, creating a smaller pentagon. What is the area of the new pentagon? $\textbf{(A)}~4-\sqrt{5}\qquad\textbf{(B)}~\sqrt{5}-1\qquad\textbf{(C)}~8-3\sqrt{5}\qquad\textbf{(D)}~\frac{\sqrt{5}+1}{2}\qquad\textbf{(E)}~\frac{2+\sqrt{5}}{3}$
-/

-- Solution/Answer (LaTeX):
/-
Since $A$ is folded onto $O$ , $AM = MO$ where $M$ is the intersection of $AO$ and the creaseline between $A$ and $O$ . Note that the inner pentagon is regular, and therefore similar to the original pentagon, due to symmetry. Because of their similarity, the ratio of the inner pentagon's area to that of the outer pentagon can be represented by $\left(\frac{OM}{ON}\right)^{2} = \left(\frac{\frac{OA}{2}}{OA\sin (\angle OAE)}\right)^{2} = \frac{1}{4\sin^{2}54}$
-/

import Mathlib.Tactic

theorem wiki_index_php_c2d2993eca : Prop := by
  sorry
