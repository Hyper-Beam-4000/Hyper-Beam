-- 2018 AMC 12A Problems/Problem 23
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_23

-- Problem (LaTeX):
/-
In $\triangle PAT,$ $\angle P=36^{\circ},$ $\angle A=56^{\circ},$ and $PA=10.$ Points $U$ and $G$ lie on sides $\overline{TP}$ and $\overline{TA},$ respectively, so that $PU=AG=1.$ Let $M$ and $N$ be the midpoints of segments $\overline{PA}$ and $\overline{UG},$ respectively. What is the degree measure of the acute angle formed by lines $MN$ and $PA?$ $\textbf{(A) } 76 \qquad \textbf{(B) } 77 \qquad \textbf{(C) } 78 \qquad \textbf{(D) } 79 \qquad \textbf{(E) } 80$
-/

-- Solution/Answer (LaTeX):
/-
Let $P$ be the origin, and $PA$ lie on the $x$ -axis. We can find $U=\left(\cos(36), \sin(36)\right)$ and $G=\left(10-\cos(56), \sin(56)\right)$ Then, we have $M=(5, 0)$ and $N$ is the midpoint of $U$ and $G$ , or $\left(\frac{10+\cos(36)-\cos(56)}{2}, \frac{\sin(36)+\sin(56)}{2}\right)$ Notice that the tangent of our desired points is the the absolute difference between the $y$ -coordinates of the two points divided by the absolute difference between the $x$ -coordinates of the two points. This evaluates to \[\frac{\sin(36)+\sin(56)}{\cos(36)-\cos(56)}\] Now, using sum to product identities, we have this equal to \[\frac{2\sin(46)\cos(10)}{-2\sin(46)\sin({-10})}=\frac{\sin(80)}{\cos(80)}=\tan(80)\] so the answer is $\boxed{\textbf{(E) } 80}.$ ~lifeisgood03 Note: Though this solution is excellent, setting $M = (0,0)$ makes life a tad bit easier ~MathleteMA
-/

import Mathlib.Tactic

theorem wiki_index_php_ead1987deb : Prop := by
  sorry
