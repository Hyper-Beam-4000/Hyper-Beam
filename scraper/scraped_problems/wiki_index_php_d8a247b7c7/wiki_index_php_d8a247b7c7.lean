-- 2021 AMC 12B Problems/Problem 24
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12B_Problems/Problem_24

-- Problem (LaTeX):
/-
Let $ABCD$ be a parallelogram with area $15$ . Points $P$ and $Q$ are the projections of $A$ and $C,$ respectively, onto the line $BD;$ and points $R$ and $S$ are the projections of $B$ and $D,$ respectively, onto the line $AC.$ See the figure, which also shows the relative locations of these points. [asy] size(350); defaultpen(linewidth(0.8)+fontsize(11)); real theta = aTan(1.25/2); pair A = 2.5*dir(180+theta), B = (3.35,0), C = -A, D = -B, P = foot(A,B,D), Q = -P, R = foot(B,A,C), S = -R; draw(A--B--C--D--A^^B--D^^R--S^^rightanglemark(A,P,D,6)^^rightanglemark(C,Q,D,6)); draw(B--R^^C--Q^^A--P^^D--S,linetype("4 4")); dot("$A$",A,dir(270)); dot("$B$",B,E); dot("$C$",C,N); dot("$D$",D,W); dot("$P$",P,SE); dot("$Q$",Q,NE); dot("$R$",R,N); dot("$S$",S,dir(270)); [/asy] Suppose $PQ=6$ and $RS=8,$ and let $d$ denote the length of $\overline{BD},$ the longer diagonal of $ABCD.$ Then $d^2$ can be written in the form $m+n\sqrt p,$ where $m,n,$ and $p$ are positive integers and $p$ is not divisible by the square of any prime. What is $m+n+p?$ $\textbf{(A) }81 \qquad \textbf{(B) }89 \qquad \textbf{(C) }97\qquad \textbf{(D) }105 \qquad \textbf{(E) }113$
-/

-- Solution/Answer (LaTeX):
/-
Let $X$ denote the intersection point of the diagonals $AC$ and $BD$ . Remark that by symmetry $X$ is the midpoint of both $\overline{PQ}$ and $\overline{RS}$ , so $XP = XQ = 3$ and $XR = XS = 4$ . Now note that since $\angle APB = \angle ARB = 90^\circ$ , quadrilateral $ARPB$ is cyclic, and so \[XR\cdot XA = XP\cdot XB,\] which implies $\tfrac{XA}{XB} = \tfrac{XP}{XR} = \tfrac34$ . Thus let $x> 0$ be such that $XA = 3x$ and $XB = 4x$ . Then Pythagorean Theorem on $\triangle APX$ yields $AP = \sqrt{AX^2 - XP^2} = 3\sqrt{x^2-1}$ , and so \[[ABCD] = 2[ABD] = AP\cdot BD = 3\sqrt{x^2-1}\cdot 8x = 24x\sqrt{x^2-1}=15\] Solving this for $x^2$ yields $x^2 = \tfrac12 + \tfrac{\sqrt{41}}8$ , and so \[(8x)^2 = 64x^2 = 64\left(\tfrac12 + \tfrac{\sqrt{41}}8\right) = 32 + 8\sqrt{41}.\] The requested answer is $32 + 8 + 41 = \boxed{\textbf{(A)} ~81}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_d8a247b7c7 : Prop := by
  sorry
