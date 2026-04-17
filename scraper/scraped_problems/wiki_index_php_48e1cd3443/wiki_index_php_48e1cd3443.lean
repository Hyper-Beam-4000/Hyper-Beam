-- 2022 AIME I Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_I_Problems/Problem_10

-- Problem (LaTeX):
/-
Three spheres with radii $11$ , $13$ , and $19$ are mutually externally tangent. A plane intersects the spheres in three congruent circles centered at $A$ , $B$ , and $C$ , respectively, and the centers of the spheres all lie on the same side of this plane. Suppose that $AB^2 = 560$ . Find $AC^2$ .
-/

-- Solution/Answer (LaTeX):
/-
This solution refers to the Diagram section. We let $\ell$ be the plane that passes through the spheres and $O_A$ and $O_B$ be the centers of the spheres with radii $11$ and $13$ . We take a cross-section that contains $A$ and $B$ , which contains these two spheres but not the third, as shown below: [asy] size(400); pair A, B, OA, OB; B = (0,0); A = (-23.6643191,0); OB = (0,8); OA = (-23.6643191,4); draw(circle(OB,13)); draw(circle(OA,11)); draw((-48,0)--(24,0)); label("$\ell$",(-42,0),S); label("$A$",A,S); label("$B$",B,S); label("$O_A$",OA,N); label("$O_B$",OB,N); draw(A--OA); draw(B--OB); draw(OA--OB); draw(OA--(0,4)); draw(OA--(-33.9112699,0)); draw(OB--(10.2469508,0)); label("$24$",midpoint(OA--OB),N); label("$\sqrt{560}$",midpoint(A--B),S); label("$11$",midpoint(OA--(-33.9112699,0)),NW); label("$13$",midpoint(OB--(10.2469508,0)),NE); label("$r$",midpoint(midpoint(A--B)--A),S); label("$r$",midpoint(midpoint(A--B)--B),S); label("$r$",midpoint(A--(-33.9112699,0)),S); label("$r$",midpoint(B--(10.2469508,0)),S); label("$x$",midpoint(midpoint(B--OB)--OB),W); label("$D$",midpoint(B--OB),E); [/asy] Because the plane cuts out congruent circles, they have the same radius and from the given information, $AB = \sqrt{560}$ . Since $ABO_BO_A$ is a trapezoid, we can drop an altitude from $O_A$ to $BO_B$ to create a rectangle and triangle to use Pythagorean theorem. We know that the length of the altitude is $\sqrt{560}$ and let the distance from $O_B$ to $D$ be $x$ . Then we have $x^2 = 576-560 \implies x = 4$ . We have $AO_A = BD$ because of the rectangle, so $\sqrt{11^2-r^2} = \sqrt{13^2-r^2}-4$ .
Squaring, we have $121-r^2 = 169-r^2 + 16 - 8 \cdot \sqrt{169-r^2}$ .
Subtracting, we get $8 \cdot \sqrt{169-r^2} = 64 \implies \sqrt{169-r^2} = 8 \implies 169-r^2 = 64 \implies r^2 = 105$ .
We also notice that since we had $\sqrt{169-r^2} = 8$ means that $BO_B = 8$ and since we know that $x = 4$ , $AO_A = 4$ . We take a cross-section that contains $A$ and $C$ , which contains these two spheres but not the third, as shown below: [asy] size(400); pair A, C, OA, OC, M; C = (0,0); A = (-27.4954541697,0); OC = (0,16); OA = (-27.4954541697,4); M = midpoint(A--C); draw(circle(OC,19)); draw(circle(OA,11)); draw((-48,0)--(24,0)); label("$\ell$",(-42,0),S); label("$A$",A,S); label("$C$",C,S); label("$O_A$",OA,N); label("$O_C$",OC,N); draw(A--OA); draw(C--OC); draw(OA--OC); draw(OA--(0,4)); draw(OA--(-37.8877590151,0)); draw(OC--(10.2469508,0)); label("$30$",midpoint(OA--OC),NW); label("$11$",midpoint(OA--(-37.8877590151,0)),NW); label("$19$",midpoint(OC--(10.2469508,0)),NE); label("$r$",midpoint(midpoint(M--A)--A),S); label("$r$",midpoint(midpoint(M--C)--C),S); label("$r$",midpoint(A--(-37.8877590151,0)),S); label("$r$",midpoint(C--(10.2469508,0)),S); label("$E$",(0,4),E); [/asy] We have $CO_C = \sqrt{19^2-r^2} = \sqrt{361 - 105} = \sqrt{256} = 16$ . Since $AO_A = 4$ , we have $EO_C = 16-4 = 12$ . Using Pythagorean theorem, $O_AE = \sqrt{30^2 - 12^2} = \sqrt{900-144} = \sqrt{756}$ . Therefore, $O_AE^2 = AC^2 = \boxed{756}$ . ~KingRavi
-/

import Mathlib.Tactic

theorem wiki_index_php_48e1cd3443 : Prop := by
  sorry
