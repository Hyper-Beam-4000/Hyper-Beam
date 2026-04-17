-- 2020 AMC 12B Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_10

-- Problem (LaTeX):
/-
In unit square $ABCD,$ the inscribed circle $\omega$ intersects $\overline{CD}$ at $M,$ and $\overline{AM}$ intersects $\omega$ at a point $P$ different from $M.$ What is $AP?$ $\textbf{(A) } \frac{\sqrt5}{12} \qquad \textbf{(B) } \frac{\sqrt5}{10} \qquad \textbf{(C) } \frac{\sqrt5}{9} \qquad \textbf{(D) } \frac{\sqrt5}{8} \qquad \textbf{(E) } \frac{2\sqrt5}{15}$
-/

-- Solution/Answer (LaTeX):
/-
Call the midpoint of $\overline{AB}$ point $N.$ Draw in $\overline{NM}$ and $\overline{NP}.$ Note that $\angle{NPM}=90^{\circ}$ due to Thales's Theorem. [asy] /* Made by QIDb602; edited by MRENTHUSIASM */ size(180); pair A, B, C, D, M, N, O, P; O = origin; A = (-1/2,-1/2); B = (-1/2,1/2); C = (1/2,1/2); D = (1/2,-1/2); M = midpoint(C--D); N = midpoint(A--B); path p; p = Circle(O,1/2); P = intersectionpoints(A--M,p)[0]; fill(N--A--M--cycle,yellow); dot("$\omega$",O,1.5*(0,1),linewidth(4)); dot("$A$",A,1.5*SW,linewidth(4)); dot("$B$",B,1.5*NW,linewidth(4)); dot("$C$",C,1.5*NE,linewidth(4)); dot("$D$",D,1.5*SE,linewidth(4)); dot("$M$",M,1.5*E,linewidth(4)); dot("$N$",N,1.5*W,linewidth(4)); dot("$P$",P,1.5*dir(60),linewidth(4)); markscalefactor=0.00625; draw(rightanglemark(A,N,M),red); draw(rightanglemark(N,P,A),red); draw(A--B--C--D--cycle^^A--M^^P--N--M^^p); [/asy] Using the Pythagorean theorem, $AM=\frac{\sqrt{5}}{2}.$ Now we just need to find $AP$ using similar triangles $\triangle APN\sim\triangle ANM:$ \begin{align*} \frac{AP}{AN}&=\frac{AN}{AM} \\ \frac{AP}{1/2}&=\frac{1/2}{\sqrt5/2} \\ AP&=\boxed{\textbf{(B) } \frac{\sqrt5}{10}}. \end{align*} ~QIDb602
-/

import Mathlib.Tactic

theorem wiki_index_php_0acbe862e1 : Prop := by
  sorry
