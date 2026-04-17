-- 2025 AIME II Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AIME_II_Problems/Problem_14

-- Problem (LaTeX):
/-
Let ${\triangle ABC}$ be a right triangle with $\angle A = 90^\circ$ and $BC = 38.$ There exist points $K$ and $L$ inside the triangle such \[AK = AL = BK = CL = KL = 14.\] The area of the quadrilateral $BKLC$ can be expressed as $n\sqrt3$ for some positive integer $n.$ Find $n.$
-/

-- Solution/Answer (LaTeX):
/-
From the given condition, we get $\angle{LAK}=60^{\circ}$ and $\triangle{LCA}, \triangle{BAK}$ are isosceles. Denote $\angle{BAK}=\alpha, \angle{CAL}=30^{\circ}-\alpha$ . From the isosceles condition, we have $\angle{BKA}=180^{\circ}-2\alpha, \angle{CLA}=120^{\circ}+2\alpha$ . Since $\angle{CAB}$ is right, then $AB^2+AC^2=BC^2$ , we can use the Law of Cosines to express $AC^2$ and $AB^2$ , and sum the equations to get $AC^2+AB^2=2\cdot 14^2(2-\cos \angle{BKA}-\angle {CLA})=2\cdot 14^2(2+\cos(2\alpha)+\cos(60^{\circ}-2\alpha))=38^2$ . This simplifies to $\cos(2\alpha)+\cos(60^{\circ}-2\alpha)=\frac{165}{98}$ , and expanding the expression using the angle subtraction formula, we get $\sqrt{3}\sin(2\alpha+60^{\circ})=\frac{165}{98}, \sin(2\alpha+60^{\circ})=\frac{55\sqrt{3}}{98}$ . Connecting $CK$ , we notice that $\angle{CLK}=360^{\circ}-\angle{CLA}-\angle{ALK}=180^{\circ}-2\alpha=\angle{AKB}$ , and since $CL=LK=AK=KB$ , we have $\triangle{CLK}\cong \triangle{AKB}$ by SAS Congruence. Moreover, since $K$ lies on the perpendicular bisector of $AB$ , the distance from $K$ to $AC$ is half of the length of $AB$ , which means $[ACK]=\frac{[ABC]}{2}$ , so we get $[ACK]=[ACL]+[ALK]+[CLK]=[ACL]+[ALK]+[ABK]=[ABC]-[BKLC]$ , which means that $[BKLC]=[AKC]=\frac{[ABC]}{2}$ . Thus, we find $[AKC]=[ALK]+\frac{14^2\cdot\sin(\angle{CLA})}{2}+\frac{14^2\cdot\sin(\angle{BKA})}{2}=[ALK]+\frac{14^2}{2}(\sin(60^{\circ}-2\alpha)+\sin 2\alpha)=98(\sin(60^{\circ}+2\alpha))+[ALK]=55\sqrt{3}+\frac{\sqrt{3}}{4}14^2=104\sqrt{3}$ . Our answer is $\boxed{104}$ . ~ Bluesoul ~ Edited by Christian
-/

import Mathlib.Tactic

theorem wiki_index_php_eca9caa663 : Prop := by
  sorry
