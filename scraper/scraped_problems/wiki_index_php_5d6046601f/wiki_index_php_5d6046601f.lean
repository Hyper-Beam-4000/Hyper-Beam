-- 2022 AMC 10B Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12B_Problems/Problem_2

-- Problem (LaTeX):
/-
In rhombus $ABCD$ , point $P$ lies on segment $\overline{AD}$ so that $\overline{BP}$ $\perp$ $\overline{AD}$ , $AP = 3$ , and $PD = 2$ . What is the area of $ABCD$ ? (Note: The figure is not drawn to scale.) [asy] import olympiad; size(180); real r = 3, s = 5, t = sqrt(r*r+s*s); defaultpen(linewidth(0.6) + fontsize(10)); pair A = (0,0), B = (r,s), C = (r+t,s), D = (t,0), P = (r,0); draw(A--B--C--D--A^^B--P^^rightanglemark(B,P,D)); label("$A$",A,SW); label("$B$", B, NW); label("$C$",C,NE); label("$D$",D,SE); label("$P$",P,S); [/asy] $\textbf{(A) }3\sqrt 5 \qquad \textbf{(B) }10 \qquad \textbf{(C) }6\sqrt 5 \qquad \textbf{(D) }20\qquad \textbf{(E) }25$
-/

-- Solution/Answer (LaTeX):
/-
Notice that $BC = AD = AP + PD = 3 + 2 = 5$ .
Now, because the question tells us $ABCD$ is a rhombus, $BC = AB = 5$ . Thus, by Pythagorean Theorem on $APB$ , $BP = 4$ .
Therefore, \[[ABCD] = AD \times BP = 5 \times 4 = \boxed{\text{D 20}}\] ~DUODUOLUO(First time using $\LaTeX$ , may have some minor mistakes)
-/

import Mathlib.Tactic

theorem wiki_index_php_5d6046601f : Prop := by
  sorry
