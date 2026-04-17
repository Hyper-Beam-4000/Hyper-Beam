-- 2022 AMC 10A Problems/Problem 18
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_18

-- Problem (LaTeX):
/-
Let $T_k$ be the transformation of the coordinate plane that first rotates the plane $k$ degrees counterclockwise around the origin and then reflects the plane across the $y$ -axis. What is the least positive
integer $n$ such that performing the sequence of transformations $T_1, T_2, T_3, \cdots, T_n$ returns the point $(1,0)$ back to itself? $\textbf{(A) } 359 \qquad \textbf{(B) } 360 \qquad \textbf{(C) } 719 \qquad \textbf{(D) } 720 \qquad \textbf{(E) } 721$
-/

-- Solution/Answer (LaTeX):
/-
Let $P=(r,\theta)$ be a point in polar coordinates, where $\theta$ is in degrees. Rotating $P$ by $k^{\circ}$ counterclockwise around the origin gives the transformation $(r,\theta)\rightarrow(r,\theta+k^{\circ}).$ Reflecting $P$ across the $y$ -axis gives the transformation $(r,\theta)\rightarrow(r,180^{\circ}-\theta).$ Note that \begin{align*} T_k(P)&=(r,180^{\circ}-\theta-k^{\circ}), \\ T_{k+1}(T_k(P)) &= (r,\theta -1^{\circ}). \end{align*} We start with $(1,0^{\circ})$ in polar coordinates. For the sequence of transformations $T_1, T_2, T_3, \cdots, T_k,$ it follows that After $T_1,$ we have $(1,179^{\circ}).$ After $T_2,$ we have $(1,-1^{\circ}).$ After $T_3,$ we have $(1,178^{\circ}).$ After $T_4,$ we have $(1,-2^{\circ}).$ After $T_5,$ we have $(1,177^{\circ}).$ After $T_6,$ we have $(1,-3^{\circ}).$ ... After $T_{2k-1},$ we have $(1,180^{\circ}-k^{\circ}).$ After $T_{2k},$ we have $(1,-k^{\circ}).$ The least such positive integer $k$ is $180.$ Therefore, the least such positive integer $n$ is $2k-1=\boxed{\textbf{(A) } 359}.$ ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_b56998b868 : Prop := by
  sorry
