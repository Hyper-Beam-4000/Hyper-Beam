-- 2025 AMC 12B Problems/Problem 25
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_25

-- Problem (LaTeX):
/-
Three concentric circles have radii $1$ , $2$ , and $3$ . An equilateral triangle of side length $s$ has one vertex on each circle. What is $s^{2}$ ? $\textbf{(A)}~6 \qquad \textbf{(B)}~\frac{25}{4} \qquad \textbf{(C)}~\frac{13}{2} \qquad \textbf{(D)}~\frac{27}{4} \qquad \textbf{(E)}~7$
-/

-- Solution/Answer (LaTeX):
/-
Let $\triangle ABC$ and center $O$ be such that $OA=1, OB=2, OC=3$ . Suppose the length of the side of $ABC$ is $s$ . Noticing that $OA + OB = OC$ , we suspect that $OACB$ is a cyclic quadrilateral. If it was, we could apply Ptolemy's Theorem, which would say that \[CB \cdot OA + OB \cdot AC = OC \cdot AB\] \[s + 2s = 3s.\] Because Ptolemy's is true, $OACB$ is cyclic. Because it's cyclic, $\angle AOB = 180 - \angle BCA = 120$ . Applying Law of Cosines on $AOB$ , we get \[s^2 = 1^2 + 2^2 - 2 \cdot 1 \cdot 2 \cdot \cos{120}\] \[s^2 = 1 + 4 +2 = \boxed{7}.\] ~lprado
-/

import Mathlib.Tactic

theorem wiki_index_php_e62be94864 : Prop := by
  sorry
