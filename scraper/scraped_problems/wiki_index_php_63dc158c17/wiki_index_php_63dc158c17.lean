-- 2019 AIME II Problems/Problem 15
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AIME_II_Problems/Problem_15

-- Problem (LaTeX):
/-
In acute triangle $ABC$ points $P$ and $Q$ are the feet of the perpendiculars from $C$ to $\overline{AB}$ and from $B$ to $\overline{AC}$ , respectively. Line $PQ$ intersects the circumcircle of $\triangle ABC$ in two distinct points, $X$ and $Y$ . Suppose $XP=10$ , $PQ=25$ , and $QY=15$ . The value of $AB\cdot AC$ can be written in the form $m\sqrt n$ where $m$ and $n$ are positive integers, and $n$ is not divisible by the square of any prime. Find $m+n$ .
-/

-- Solution/Answer (LaTeX):
/-
First we have $a\cos A=PQ=25$ , and $(a\cos A)(c\cos C)=(a\cos C)(c\cos A)=AP\cdot PB=10(25+15)=400$ by PoP. Similarly, $(a\cos A)(b\cos B)=15(10+25)=525,$ and dividing these each by $a\cos A$ gives $b\cos B=21,c\cos C=16$ . It is known that the sides of the orthic triangle are $a\cos A,b\cos B,c\cos C$ , and its angles are $\pi-2A$ , $\pi-2B$ , and $\pi-2C$ . We thus have the three sides of the orthic triangle now.
Letting $D$ be the foot of the altitude from $A$ , we have, in $\triangle DPQ$ , \[\cos P,\cos Q=\frac{21^2+25^2-16^2}{2\cdot 21\cdot 25},\frac{16^2+25^2-21^2}{2\cdot 16\cdot 25}= \frac{27}{35}, \frac{11}{20}.\] \[\Rightarrow \cos B=\cos\left(\tfrac 12 (\pi-P)\right)=\sin\tfrac 12 P =\sqrt{\frac{4}{35}},\] similarly, we get \[\cos C=\cos\left(\tfrac 12 (\pi-Q)\right)=\sin\tfrac 12 Q=\sqrt{\frac{9}{40}}.\] To finish, \[bc= \frac{(b\cos B)(c\cos C)}{\cos B\cos C}=\frac{16\cdot 21}{(2/\sqrt{35})(3/\sqrt{40})}=560\sqrt{14}.\] The requested sum is $\boxed{574}$ .
- crazyeyemoody907 Remark: The proof that $a \cos A = PQ$ can be found here: http://www.irmo.ie/5.Orthic_triangle.pdf
-/

import Mathlib.Tactic

theorem wiki_index_php_63dc158c17 : Prop := by
  sorry
