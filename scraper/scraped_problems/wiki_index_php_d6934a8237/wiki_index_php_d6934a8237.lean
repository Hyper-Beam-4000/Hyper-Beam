-- 2024 AMC 12B Problems/Problem 23
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_23

-- Problem (LaTeX):
/-
A right pyramid has regular octagon $ABCDEFGH$ with side length $1$ as its base and apex $V.$ Segments $\overline{AV}$ and $\overline{DV}$ are perpendicular. What is the square of the height of the pyramid? $\textbf{(A) }1 \qquad \textbf{(B) }\frac{1+\sqrt2}{2} \qquad \textbf{(C) }\sqrt2 \qquad \textbf{(D) }\frac32 \qquad \textbf{(E) }\frac{2+\sqrt2}{3} \qquad$
-/

-- Solution/Answer (LaTeX):
/-
To find the height of the pyramid, we need the length from the center of the octagon (denote as $I$ ) to its vertices and the length of AV. From symmetry, we know that $\overline{AV} = \overline{DV}$ , therefore $\triangle{AVD}$ is a 45-45-90 triangle. Denote $\overline{AV}$ as $x$ so that $\overline{AD} = x\sqrt{2}$ . Doing some geometry on the isosceles trapezoid $ABCD$ (we know this from the fact that it is a regular octagon) reveals that $\overline{AD}=1+2(\sqrt{2}/2)=1+\sqrt{2}$ and $\overline{AV}=(\overline{AD})/\sqrt{2}=(\sqrt{2}+2)/2$ . To find the length $\overline{IA}$ , we cut the octagon into 8 triangles, each with a smallest angle of 45 degrees. Using the law of cosines on $\triangle{AIB}$ we find that ${\overline{IA}}^2=(2+\sqrt{2})/2$ . Finally, using the pythagorean theorem, we can find that ${\overline{IV}}^2={\overline{AV}}^2-{\overline{IA}}^2= {((\sqrt{2}+2)/2)}^2 - (2+\sqrt{2})/2 = \boxed{(1+\sqrt{2})/2}$ which is answer choice $\boxed{B}$ . ～username2333
~hashbrown2009
-/

import Mathlib.Tactic

theorem wiki_index_php_d6934a8237 : Prop := by
  sorry
