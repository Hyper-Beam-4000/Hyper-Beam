-- 2019 AIME I Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AIME_I_Problems/Problem_3

-- Problem (LaTeX):
/-
In $\triangle PQR$ , $PR=15$ , $QR=20$ , and $PQ=25$ . Points $A$ and $B$ lie on $\overline{PQ}$ , points $C$ and $D$ lie on $\overline{QR}$ , and points $E$ and $F$ lie on $\overline{PR}$ , with $PA=QB=QC=RD=RE=PF=5$ . Find the area of hexagon $ABCDEF$ .
-/

-- Solution/Answer (LaTeX):
/-
We know the area of the hexagon $ABCDEF$ to be $\triangle PQR- \triangle PAF- \triangle BCQ- \triangle RED$ . Since $PR^2+RQ^2=PQ^2$ , we know that $\triangle PRQ$ is a right triangle. Thus the area of $\triangle PQR$ is $150$ . Since $\triangle PQR$ is a right triangle, we also know that $\sin \angle PQR = \frac{15}{25} = \frac{3}{5}$ . Then the area of $\triangle BCQ = \frac12 \cdot BQ \cdot CQ \cdot \sin \angle PQR= \frac{25}{2}\cdot \frac{3}{5}=\frac{15}{2}$ . Preceding in a similar fashion for $\triangle PAF$ , the area of $\triangle PAF$ is $10$ . Since $\angle ERD = 90^{\circ}$ , the area of $\triangle RED=\frac{25}{2}$ . Thus our desired answer is $150-\frac{15}{2}-10-\frac{25}{2}=\boxed{120}$
-/

import Mathlib.Tactic

theorem wiki_index_php_5b070a1da3 : Prop := by
  sorry
