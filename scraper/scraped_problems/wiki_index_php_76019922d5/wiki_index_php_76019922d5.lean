-- 2021 AIME I Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AIME_I_Problems/Problem_6

-- Problem (LaTeX):
/-
Segments $\overline{AB}, \overline{AC},$ and $\overline{AD}$ are edges of a cube and $\overline{AG}$ is a diagonal through the center of the cube. Point $P$ satisfies $BP=60\sqrt{10}$ , $CP=60\sqrt{5}$ , $DP=120\sqrt{2}$ , and $GP=36\sqrt{7}$ . Find $AP.$
-/

-- Solution/Answer (LaTeX):
/-
First scale down the whole cube by $12$ . Let point $P$ have coordinates $(x, y, z)$ , point $A$ have coordinates $(0, 0, 0)$ , and $s$ be the side length. Then we have the equations \begin{align*} (s-x)^2+y^2+z^2&=\left(5\sqrt{10}\right)^2, \\ x^2+(s-y)^2+z^2&=\left(5\sqrt{5}\right)^2, \\ x^2+y^2+(s-z)^2&=\left(10\sqrt{2}\right)^2, \\ (s-x)^2+(s-y)^2+(s-z)^2&=\left(3\sqrt{7}\right)^2. \end{align*} These simplify into \begin{align*} s^2+x^2+y^2+z^2-2sx&=250, \\ s^2+x^2+y^2+z^2-2sy&=125, \\ s^2+x^2+y^2+z^2-2sz&=200, \\ 3s^2-2s(x+y+z)+x^2+y^2+z^2&=63. \end{align*} Adding the first three equations together, we get $3s^2-2s(x+y+z)+3(x^2+y^2+z^2)=575$ .
Subtracting this from the fourth equation, we get $2(x^2+y^2+z^2)=512$ , so $x^2+y^2+z^2=256$ . This means $PA=16$ . However, we scaled down everything by $12$ so our answer is $16*12=\boxed{192}$ . ~JHawk0224
-/

import Mathlib.Tactic

theorem wiki_index_php_76019922d5 : Prop := by
  sorry
