-- 2022 AMC 12A Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_12

-- Problem (LaTeX):
/-
Let $M$ be the midpoint of $\overline{AB}$ in regular tetrahedron $ABCD$ . What is $\cos(\angle CMD)$ ? $\textbf{(A) } \frac14 \qquad \textbf{(B) } \frac13 \qquad \textbf{(C) } \frac25 \qquad \textbf{(D) } \frac12 \qquad \textbf{(E) } \frac{\sqrt{3}}{2}$
-/

-- Solution/Answer (LaTeX):
/-
Without loss of generality, let the edge-length of $ABCD$ be $2.$ It follows that $MC=MD=\sqrt3.$ Let $O$ be the center of $\triangle ABD,$ so $\overline{CO}\perp\overline{MOD}.$ Note that $MO=\frac13 MD=\frac{\sqrt{3}}{3}.$ In right $\triangle CMO,$ we have \[\cos(\angle CMD)=\frac{MO}{MC}=\boxed{\textbf{(B) } \frac13}.\] ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_d94e01d45c : Prop := by
  sorry
