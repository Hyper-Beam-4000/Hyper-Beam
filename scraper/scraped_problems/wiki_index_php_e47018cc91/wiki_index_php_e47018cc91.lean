-- 2025 AIME II Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AIME_II_Problems/Problem_5

-- Problem (LaTeX):
/-
Suppose $\triangle ABC$ has angles $\angle BAC = 84^\circ, \angle ABC=60^\circ,$ and $\angle ACB = 36^\circ.$ Let $D, E,$ and $F$ be the midpoints of sides $\overline{BC}, \overline{AC},$ and $\overline{AB},$ respectively. The circumcircle of $\triangle DEF$ intersects $\overline{BD}, \overline{AE},$ and $\overline{AF}$ at points $G, H,$ and $J,$ respectively. The points $G, D, E, H, J,$ and $F$ divide the circumcircle of $\triangle DEF$ into six minor arcs, as shown. Find $\widehat{DE}+2\cdot \widehat{HJ} + 3\cdot\widehat{FG},$ where the arcs are measured in degrees. [asy] import olympiad; size(6cm); defaultpen(fontsize(10pt)); pair B = (0, 0), A = (Cos(60), Sin(60)), C = (Cos(60)+Sin(60)/Tan(36), 0), D = midpoint(B--C), E = midpoint(A--C), F = midpoint(A--B); guide circ = circumcircle(D, E, F); pair G = intersectionpoint(B--D, circ), J = intersectionpoints(A--F, circ)[0], H = intersectionpoints(A--E, circ)[0]; draw(B--A--C--cycle); draw(D--E--F--cycle); draw(circ); dot(A);dot(B);dot(C);dot(D);dot(E);dot(F);dot(G);dot(H);dot(J); label("$A$", A, (0, .8)); label("$B$", B, (-.8, -.8)); label("$C$", C, (.8, -.8)); label("$D$", D, (0, -.8)); label("$E$", E, (.8, .2)); label("$F$", F, (-.8, .2)); label("$G$", G, (0, .8)); label("$H$", H, (-.2, -1)); label("$J$", J, (.2, -.8)); [/asy]
-/

-- Solution/Answer (LaTeX):
/-
Notice that due to midpoints, $\triangle DEF\sim\triangle FBD\sim\triangle AFE\sim\triangle EDC\sim\triangle ABC$ . As a result, the angles and arcs are readily available. Due to inscribed angles, \[\widehat{DE}=2\angle DFE=2\angle ACB=2\cdot36=72^\circ\] Similarly, \[\widehat{FG}=2\angle FDB=2\angle ACB=2\cdot36=72^\circ\] In order to calculate $\widehat{HJ}$ , we use the fact that $\angle BAC=\frac{1}{2}(\widehat{FDE}-\widehat{HJ})$ . We know that $\angle BAC=84^\circ$ , and \[\widehat{FDE}=360-\widehat{FE}=360-2\angle FDE=360-2\angle CAB=360-2\cdot84=192^\circ\] Substituting, \begin{align*}
84 &= \frac{1}{2}(192-\widehat{HJ}) \\
168 &= 192-\widehat{HJ} \\
\widehat{HJ} &= 24^\circ
\end{align*} Thus, $\widehat{DE}+2\cdot\widehat{HJ}+3\cdot\widehat{FG}=72+48+216=\boxed{336}^\circ$ . ~ eevee9406 ~ Edited by aoum Alternatively, \begin{align*} \widehat{HJ} &= \widehat{FH} + \widehat{JE} - \widehat{FE} \\ &= 2\angle FEH + 2\angle JFE - 2\angle FDE \\ &= 2 \cdot 36^\circ + 2 \cdot 60^\circ - 2 \cdot 84^\circ \\ &= 24^\circ. \end{align*} ~ Pengu14
-/

import Mathlib.Tactic

theorem wiki_index_php_e47018cc91 : Prop := by
  sorry
