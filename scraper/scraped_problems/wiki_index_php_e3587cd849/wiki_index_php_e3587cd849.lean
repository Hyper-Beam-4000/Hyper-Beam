-- 2024 AMC 12A Problems/Problem 18
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_18

-- Problem (LaTeX):
/-
On top of a rectangular card with sides of length $1$ and $2+\sqrt{3}$ , an identical card is placed so that two of their diagonals line up, as shown ( $\overline{AC}$ , in this case). [asy] defaultpen(fontsize(12)+0.85); size(150); real h=2.25; pair C=origin,B=(0,h),A=(1,h),D=(1,0),Dp=reflect(A,C)*D,Bp=reflect(A,C)*B; pair L=extension(A,Dp,B,C),R=extension(Bp,C,A,D); draw(L--B--A--Dp--C--Bp--A); draw(C--D--R); draw(L--C^^R--A,dashed+0.6); draw(A--C,black+0.6); dot("$C$",C,2*dir(C-R)); dot("$A$",A,1.5*dir(A-L)); dot("$B$",B,dir(B-R)); [/asy] Continue the process, adding a third card to the second, and so on, lining up successive diagonals after rotating clockwise. In total, how many cards must be used until a vertex of a new card lands exactly on the vertex labeled $B$ in the figure? $\textbf{(A) }6\qquad\textbf{(B) }8\qquad\textbf{(C) }10\qquad\textbf{(D) }12\qquad\textbf{(E) }\text{No new vertex will land on }B.$
-/

-- Solution/Answer (LaTeX):
/-
Let the midpoint of $AC$ be $P$ . We see that no matter how many moves we do, $P$ stays where it is. Now we can find the angle of rotation ( $\angle APB$ ) per move with the following steps: \[AP^2=(\frac{1}{2})^2+(1+\frac{\sqrt{3}}{2})^2=2+\sqrt{3}\] \[1^2=AP^2+AP^2-2(AP)(AP)\cos\angle APB\] \[1=2(2+\sqrt{3})(1-\cos\angle APB)\] \[\cos\angle APB=\frac{3+2\sqrt{3}}{4+2\sqrt{3}}\] \[\cos\angle APB=\frac{3+2\sqrt{3}}{4+2\sqrt{3}}\cdot\frac{4-2\sqrt{3}}{4-2\sqrt{3}}\] \[\cos\angle APB=\frac{2\sqrt{3}}{4}=\frac{\sqrt{3}}{2}\] \[\angle APB=30^\circ\] Since Vertex $C$ is the closest one and \[\angle BPC=360-180-30=150\] Vertex C will land on Vertex B when $\frac{150}{30}+1=\fbox{(A) 6}$ cards are placed. (someone insert diagram maybe) ~lptoggled, minor Latex edits by eevee9406
-/

import Mathlib.Tactic

theorem wiki_index_php_e3587cd849 : Prop := by
  sorry
