-- 2020 AIME I Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_I_Problems/Problem_1

-- Problem (LaTeX):
/-
In $\triangle ABC$ with $AB=AC,$ point $D$ lies strictly between $A$ and $C$ on side $\overline{AC},$ and point $E$ lies strictly between $A$ and $B$ on side $\overline{AB}$ such that $AE=ED=DB=BC.$ The degree measure of $\angle ABC$ is $\tfrac{m}{n},$ where $m$ and $n$ are relatively prime positive integers. Find $m+n.$
-/

-- Solution/Answer (LaTeX):
/-
[asy] size(10cm); pair A, B, C, D, F; A = (0, tan(3 * pi / 7)); B = (1, 0); C = (-1, 0); F = rotate(90/7, A) * (A - (0, 2)); D = rotate(900/7, F) * A; draw(A -- B -- C -- cycle); draw(F -- D); draw(D -- B); label("$A$", A, N); label("$B$", B, E); label("$C$", C, W); label("$D$", D, W); label("$E$", F, E); [/asy] If we set $\angle{BAC}$ to $x$ , we can find all other angles through these two properties:
1. Angles in a triangle sum to $180^{\circ}$ .
2. The base angles of an isosceles triangle are congruent. Now we angle chase. $\angle{ADE}=\angle{EAD}=x$ , $\angle{AED} = 180-2x$ , $\angle{BED}=\angle{EBD}=2x$ , $\angle{EDB} = 180-4x$ , $\angle{BDC} = \angle{BCD} = 3x$ , $\angle{CBD} = 180-6x$ . Since $AB = AC$ as given by the problem, $\angle{ABC} = \angle{ACB}$ , so $180-4x=3x$ . Therefore, $x = 180/7^{\circ}$ , and our desired angle is \[180-4\left(\frac{180}{7}\right) = \frac{540}{7}\] for an answer of $\boxed{547}$ . See here for a video solution: https://youtu.be/4e8Hk04Ax_E
-/

import Mathlib.Tactic

theorem wiki_index_php_399e94426c : Prop := by
  sorry
