-- 2019 USAMO Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_USAMO_Problems/Problem_2

-- Problem (LaTeX):
/-
Let $ABCD$ be a cyclic quadrilateral satisfying $AD^2 + BC^2 = AB^2$ . The diagonals of $ABCD$ intersect at $E$ . Let $P$ be a point on side $\overline{AB}$ satisfying $\angle APD = \angle BPC$ . Show that line $PE$ bisects $\overline{CD}$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $PE \cap DC = M$ . Also, let $N$ be the midpoint of $AB$ .
Note that only one point $P$ satisfies the given angle condition. With this in mind, construct $P'$ with the following properties: (1) $AP' \cdot AB = AD^2$ (2) $BP' \cdot AB = CD^2$ Claim: $P = P'$ Proof:
The conditions imply the similarities $ADP \sim ABD$ and $BCP \sim BAC$ whence $\measuredangle APD = \measuredangle BDA = \measuredangle BCA = \measuredangle CPB$ as desired. $\square$ Claim: $PE$ is a symmedian in $AEB$ Proof:
We have \begin{align*} AP \cdot AB = AD^2 \iff AB^2 \cdot AP &= AD^2 \cdot AB \\ \iff \left( \frac{AB}{AD} \right)^2 &= \frac{AB}{AP} \\ \iff \left( \frac{AB}{AD} \right)^2 - 1 &= \frac{AB}{AP} - 1 \\ \iff \frac{AB^2 - AD^2}{AD^2} &= \frac{BP}{AP} \\ \iff \left(\frac{BC}{AD} \right)^2 &= \left(\frac{BE}{AE} \right)^2 = \frac{BP}{AP} \end{align*} as desired. $\square$ Since $P$ is the isogonal conjugate of $N$ , $\measuredangle PEA = \measuredangle MEC = \measuredangle BEN$ . However $\measuredangle MEC = \measuredangle BEN$ implies that $M$ is the midpoint of $CD$ from similar triangles, so we are done. $\square$
-/

import Mathlib.Tactic

theorem wiki_index_php_901839ac74 : Prop := by
  sorry
