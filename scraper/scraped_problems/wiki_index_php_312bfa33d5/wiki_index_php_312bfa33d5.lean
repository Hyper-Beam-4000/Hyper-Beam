-- 2018 AMC 10B Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12B_Problems/Problem_8

-- Problem (LaTeX):
/-
Line segment $\overline{AB}$ is a diameter of a circle with $AB = 24$ . Point $C$ , not equal to $A$ or $B$ , lies on the circle. As point $C$ moves around the circle, the centroid (center of mass) of $\triangle ABC$ traces out a closed curve missing two points. To the nearest positive integer, what is the area of the region bounded by this curve? $\textbf{(A) } 25 \qquad \textbf{(B) } 38 \qquad \textbf{(C) } 50 \qquad \textbf{(D) } 63 \qquad \textbf{(E) } 75$
-/

-- Solution/Answer (LaTeX):
/-
By the Inscribed Angle Theorem, $\triangle ABC$ is a right triangle with $\angle C=90^{\circ}.$ So, its circumcenter is the midpoint of $\overline{AB},$ and its median from $C$ is half as long as $\overline{AB}.$ For each $\triangle ABC,$ let $O$ and $G$ be its circumcenter and centroid, respectively. It follows that $OA=OB=OC=12.$ In any triangle, since the centroid divides each median into parts in the ratio $2:1,$ with the centroid being twice as close to the midpoint of a side as it is to the opposite vertex, we have $OG=\frac13 OC=4.$ As shown below, $\triangle ABC_1$ and $\triangle ABC_2$ are two shapes of $\triangle ABC$ with centroids $G_1$ and $G_2,$ respectively: [asy] /* Made by MRENTHUSIASM */ size(200); pair O, A, B, C1, C2, G1, G2, M1, M2; O = (0,0); A = (-12,0); B = (12,0); C1 = (36/5,48/5); C2 = (-96/17,-180/17); G1 = O + 1/3 * C1; G2 = O + 1/3 * C2; M1 = (4,0); M2 = (-4,0); draw(Circle(O,12)); draw(Circle(O,4),red); dot("$O$", O, (3/5,-4/5), linewidth(4.5)); dot("$A$", A, W, linewidth(4.5)); dot("$B$", B, E, linewidth(4.5)); dot("$C_1$", C1, dir(C1), linewidth(4.5)); dot("$C_2$", C2, dir(C2), linewidth(4.5)); dot("$G_1$", G1, 1.5*E, linewidth(4.5)); dot("$G_2$", G2, 1.5*W, linewidth(4.5)); draw(A--B^^A--C1--B^^A--C2--B); draw(O--C1^^O--C2); dot(M1,red+linewidth(0.8),UnFill); dot(M2,red+linewidth(0.8),UnFill); [/asy] Therefore, point $G$ traces out a circle (missing two points) with the center $O$ and the radius $\overline{OG},$ as indicated in red. To the nearest positive integer, the area of the region bounded by the red curve is $\pi\cdot OG^2=16\pi\approx\boxed{\textbf{(C) } 50}.$ ~MRENTHUSIASM ~megacleverstarfish15
-/

import Mathlib.Tactic

theorem wiki_index_php_312bfa33d5 : Prop := by
  sorry
