-- 2025 USAMO Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_USAMO_Problems/Problem_4

-- Problem (LaTeX):
/-
Let $H$ be the orthocenter of acute triangle $ABC$ , let $F$ be the foot of the altitude from $C$ to $AB$ , and let $P$ be the reflection of $H$ across $BC$ . Suppose that the circumcircle of triangle $FAP$ intersects line $BC$ at two distinct points $X$ and $Y$ . Prove that $C$ is the midpoint of $XY$ .
-/

-- Solution/Answer (LaTeX):
/-
Let AP intersects BC at D. Extend FC to the point E on the circumcircle $\omega$ of $FAP$ . Since $H$ is the orthocenter of $\Delta ABC$ , we know that $HD = DP$ or $HP = 2HD$ , and $AH \cdot HD = CH \cdot HF$ . Next we use the power of H in $\omega$ : $AH \cdot HP = CH \cdot HE$ . These relations imply that $HE = 2HF$ . Hence $C, D$ are midpoints of $HE, HP$ respectively. By midline theorem, $CD // EP$ . Since $AD \perp CD$ , we have $AD \perp EP$ . This implies that $\angle APE = 90^{\circ}$ . Consequently, $AE$ is the diameter of $\omega$ . Let $G$ be the midpoint of $AE$ which is also the center of $\omega$ . $G,C$ are midpoints of $AE, EH$ respectively. By the midline theorem again, we have $GC//AH$ , consequently, $GC \perp BC$ . This implies that $GC$ is the perpendicular bisector of the chord $XY$ hence $C$ is the midpoint of $XY$ . ~ Dr. Shi davincimath.com
-/

import Mathlib.Tactic

theorem wiki_index_php_ba3486e8c5 : Prop := by
  sorry
