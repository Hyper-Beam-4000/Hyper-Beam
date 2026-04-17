-- 2023 AIME II Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AIME_II_Problems/Problem_9

-- Problem (LaTeX):
/-
Circles $\omega_1$ and $\omega_2$ intersect at two points $P$ and $Q,$ and their common tangent line closer to $P$ intersects $\omega_1$ and $\omega_2$ at points $A$ and $B,$ respectively. The line parallel to $AB$ that passes through $P$ intersects $\omega_1$ and $\omega_2$ for the second time at points $X$ and $Y,$ respectively. Suppose $PX=10,$ $PY=14,$ and $PQ=5.$ Then the area of trapezoid $XABY$ is $m\sqrt{n},$ where $m$ and $n$ are positive integers and $n$ is not divisible by the square of any prime. Find $m+n.$
-/

-- Solution/Answer (LaTeX):
/-
Denote by $O_1$ and $O_2$ the centers of $\omega_1$ and $\omega_2$ , respectively.
Let $XY$ and $AO_1$ intersect at point $C$ .
Let $XY$ and $BO_2$ intersect at point $D$ . Because $AB$ is tangent to circle $\omega_1$ , $O_1 A \perp AB$ .
Because $XY \parallel AB$ , $O_1 A \perp XY$ .
Because $X$ and $P$ are on $\omega_1$ , $O_1A$ is the perpendicular bisector of $XP$ .
Thus, $PC = \frac{PX}{2} = 5$ . Analogously, we can show that $PD = \frac{PY}{2} = 7$ . Thus, $CD = CP + PD = 12$ .
Because $O_1 A \perp CD$ , $O_1 A \perp AB$ , $O_2 B \perp CD$ , $O_2 B \perp AB$ , $ABDC$ is a rectangle. Hence, $AB = CD = 12$ . Let $QP$ and $AB$ meet at point $M$ .
Thus, $M$ is the midpoint of $AB$ .
Thus, $AM = \frac{AB}{2} = 6$ . This is the case because $PQ$ is the radical axis of the two circles, and the powers with respect to each circle must be equal. In $\omega_1$ , for the tangent $MA$ and the secant $MPQ$ , following from the power of a point, we have $MA^2 = MP \cdot MQ$ .
By solving this equation, we get $MP = 4$ . We notice that $AMPC$ is a right trapezoid.
Hence, \begin{align*} AC & = \sqrt{MP^2 - \left( AM - CP \right)^2} \\ & = \sqrt{15} . \end{align*} Therefore, \begin{align*} [XABY] & = \frac{1}{2} \left( AB + XY \right) AC \\ & = \frac{1}{2} \left( 12 + 24 \right) \sqrt{15} \\ & = 18 \sqrt{15}. \end{align*} Therefore, the answer is $18 + 15 = \boxed{\textbf{(033)}}$ . ~Steven Chen (Professor Chen Education Palace, www.professorchenedu.com)
-/

import Mathlib.Tactic

theorem wiki_index_php_b86095010a : Prop := by
  sorry
