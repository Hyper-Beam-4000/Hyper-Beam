-- 2017 AIME II Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_II_Problems/Problem_10

-- Problem (LaTeX):
/-
Rectangle $ABCD$ has side lengths $AB=84$ and $AD=42$ . Point $M$ is the midpoint of $\overline{AD}$ , point $N$ is the trisection point of $\overline{AB}$ closer to $A$ , and point $O$ is the intersection of $\overline{CM}$ and $\overline{DN}$ . Point $P$ lies on the quadrilateral $BCON$ , and $\overline{BP}$ bisects the area of $BCON$ . Find the area of $\triangle CDP$ .
-/

-- Solution/Answer (LaTeX):
/-
[asy] pair A,B,C,D,M,n,O,P; A=(0,42);B=(84,42);C=(84,0);D=(0,0);M=(0,21);n=(28,42);O=(12,18);P=(32,13); fill(C--D--P--cycle,blue); draw(A--B--C--D--cycle); draw(C--M); draw(D--n); draw(B--P); draw(D--P); label("$A$",A,NW); label("$B$",B,NE); label("$C$",C,SE); label("$D$",D,SW); label("$M$",M,W); label("$N$",n,N); label("$O$",O,(-0.5,1)); label("$P$",P,N); dot(A); dot(B); dot(C); dot(D); dot(M); dot(n); dot(O); dot(P); label("28",(0,42)--(28,42),N); label("56",(28,42)--(84,42),N); [/asy] Impose a coordinate system on the diagram where point $D$ is the origin. Therefore $A=(0,42)$ , $B=(84,42)$ , $C=(84,0)$ , and $D=(0,0)$ . Because $M$ is a midpoint and $N$ is a trisection point, $M=(0,21)$ and $N=(28,42)$ . The equation for line $DN$ is $y=\frac{3}{2}x$ and the equation for line $CM$ is $\frac{1}{84}x+\frac{1}{21}y=1$ , so their intersection, point $O$ , is $(12,18)$ . Using the shoelace formula on quadrilateral $BCON$ , or drawing diagonal $\overline{BO}$ and using $\frac12bh$ , we find that its area is $2184$ . Therefore the area of triangle $BCP$ is $\frac{2184}{2} = 1092$ . Using $A = \frac 12 bh$ , we get $2184 = 42h$ . Simplifying, we get $h = 52$ . This means that the x-coordinate of $P = 84 - 52 = 32$ . Since P lies on $\frac{1}{84}x+\frac{1}{21}y=1$ , you can solve and get that the y-coordinate of $P$ is $13$ . Therefore the area of $CDP$ is $\frac{1}{2} \cdot 13 \cdot 84=\boxed{546}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_799d4a2c6d : Prop := by
  sorry
