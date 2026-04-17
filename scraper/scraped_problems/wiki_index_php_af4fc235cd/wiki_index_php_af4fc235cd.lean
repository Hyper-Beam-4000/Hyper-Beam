-- 2018 AIME II Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_II_Problems/Problem_14

-- Problem (LaTeX):
/-
The incircle $\omega$ of triangle $ABC$ is tangent to $\overline{BC}$ at $X$ . Let $Y \neq X$ be the other intersection of $\overline{AX}$ with $\omega$ . Points $P$ and $Q$ lie on $\overline{AB}$ and $\overline{AC}$ , respectively, so that $\overline{PQ}$ is tangent to $\omega$ at $Y$ . Assume that $AP = 3$ , $PB = 4$ , $AC = 8$ , and $AQ = \dfrac{m}{n}$ , where $m$ and $n$ are relatively prime positive integers. Find $m+n$ .
-/

-- Solution/Answer (LaTeX):
/-
Let the sides $\overline{AB}$ and $\overline{AC}$ be tangent to $\omega$ at $Z$ and $W$ , respectively. Let $\alpha = \angle BAX$ and $\beta = \angle AXC$ . Because $\overline{PQ}$ and $\overline{BC}$ are both tangent to $\omega$ and $\angle YXC$ and $\angle QYX$ subtend the same arc of $\omega$ , it follows that $\angle AYP = \angle QYX = \angle YXC = \beta$ . By equal tangents, $PZ = PY$ . Applying the Law of Sines to $\triangle APY$ yields \[\frac{AZ}{AP} = 1 + \frac{ZP}{AP} = 1 + \frac{PY}{AP} = 1 + \frac{\sin\alpha}{\sin\beta}.\] Similarly, applying the Law of Sines to $\triangle ABX$ gives \[\frac{AZ}{AB} = 1 - \frac{BZ}{AB} = 1 - \frac{BX}{AB} = 1 - \frac{\sin\alpha}{\sin\beta}.\] It follows that \[2 = \frac{AZ}{AP} + \frac{AZ}{AB} = \frac{AZ}3 + \frac{AZ}7,\] implying $AZ = \tfrac{21}5$ . Applying the same argument to $\triangle AQY$ yields \[2 = \frac{AW}{AQ} + \frac{AW}{AC} = \frac{AZ}{AQ} + \frac{AZ}{AC} = \frac{21}5\left(\frac{1}{AQ} + \frac 18\right),\] from which $AQ = \tfrac{168}{59}$ . The requested sum is $168 + 59 = \boxed{227}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_af4fc235cd : Prop := by
  sorry
