-- 2023 AIME I Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AIME_I_Problems/Problem_5

-- Problem (LaTeX):
/-
Let $P$ be a point on the circle circumscribing square $ABCD$ that satisfies $PA \cdot PC = 56$ and $PB \cdot PD = 90.$ Find the area of $ABCD.$
-/

-- Solution/Answer (LaTeX):
/-
Ptolemy's theorem states that for cyclic quadrilateral $WXYZ$ , $WX\cdot YZ + XY\cdot WZ = WY\cdot XZ$ . We may assume that $P$ is between $B$ and $C$ . Let $PA = a$ , $PB = b$ , $PC = c$ , $PD = d$ , and $AB = s$ . We have $a^2 + c^2 = AC^2 = 2s^2$ , because $AC$ is a diameter of the circle. Similarly, $b^2 + d^2 = 2s^2$ . Therefore, $(a+c)^2 = a^2 + c^2 + 2ac = 2s^2 + 2(56) = 2s^2 + 112$ . Similarly, $(b+d)^2 = 2s^2 + 180$ . By Ptolemy's Theorem on $PCDA$ , $as + cs = ds\sqrt{2}$ , and therefore $a + c = d\sqrt{2}$ . By Ptolemy's on $PBAD$ , $bs + ds = as\sqrt{2}$ , and therefore $b + d = a\sqrt{2}$ . By squaring both equations, we obtain \begin{alignat*}{8} 2d^2 &= (a+c)^2 &&= 2s^2 + 112, \\ 2a^2 &= (b+d)^2 &&= 2s^2 + 180. \end{alignat*} Thus, $a^2 = s^2 + 90$ , and $d^2 = s^2 + 56$ . Plugging these values into $a^2 + c^2 = b^2 + d^2 = 2s^2$ , we obtain $c^2 = s^2 - 90$ , and $b^2 = s^2 - 56$ . Now, we can solve using $a$ and $c$ (though using $b$ and $d$ yields the same solution for $s$ ). \begin{align*} ac = (\sqrt{s^2 - 90})(\sqrt{s^2 + 90}) &= 56 \\ (s^2 + 90)(s^2 - 90) &= 56^2 \\ s^4 &= 90^2 + 56^2 = 106^2 \\ s^2 &= \boxed{106}. \end{align*} ~mathboy100
-/

import Mathlib.Tactic

theorem wiki_index_php_cd789a91f4 : Prop := by
  sorry
