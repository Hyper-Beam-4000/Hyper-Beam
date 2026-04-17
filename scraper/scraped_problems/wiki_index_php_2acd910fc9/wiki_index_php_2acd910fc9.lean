-- 2018 AMC 10A Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_11

-- Problem (LaTeX):
/-
A paper triangle with sides of lengths $3,4,$ and $5$ inches, as shown, is folded so that point $A$ falls on point $B$ . What is the length in inches of the crease? [asy] draw((0,0)--(4,0)--(4,3)--(0,0)); label("$A$", (0,0), SW); label("$B$", (4,3), NE); label("$C$", (4,0), SE); label("$4$", (2,0), S); label("$3$", (4,1.5), E); label("$5$", (2,1.5), NW); fill(origin--(0,0)--(4,3)--(4,0)--cycle, gray); [/asy] $\textbf{(A) } 1+\frac12 \sqrt2 \qquad \textbf{(B) } \sqrt3 \qquad \textbf{(C) } \frac74 \qquad \textbf{(D) } \frac{15}{8} \qquad \textbf{(E) } 2$
-/

-- Solution/Answer (LaTeX):
/-
[asy] draw((0,0)--(4,0)--(4,3)--(0,0)); label("$A$", (0,0), SW); label("$B$", (4,3), NE); label("$C$", (4,0), SE); label("$D$", (2,1.5), NW); label("$E$", (3.125,0), S); draw ((2,1.5)--(3.125,0),linewidth(1)); draw(rightanglemark((0,0),(2,1.5),(3.125,0))); [/asy] First, we need to realize that the crease line is just the perpendicular bisector of side $AB$ , the hypotenuse of right triangle $\triangle ABC$ . Call the midpoint of $AB$ point $D$ . Draw this line and call the intersection point with $AC$ as $E$ . Now, $\triangle ACB$ is similar to $\triangle ADE$ by $AA$ similarity. Setting up the ratios, we find that \[\frac{BC}{AC}=\frac{DE}{AD} \Rightarrow \frac{3}{4}=\frac{DE}{\frac{5}{2}} \Rightarrow DE=\frac{15}{8}.\] Thus, our answer is $\boxed{\textbf{(D) } \frac{15}{8}}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_2acd910fc9 : Prop := by
  sorry
