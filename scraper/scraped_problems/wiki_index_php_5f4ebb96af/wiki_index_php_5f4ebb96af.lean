-- 2018 AMC 10A Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_8

-- Problem (LaTeX):
/-
All of the triangles in the diagram below are similar to isosceles triangle $ABC$ , in which $AB=AC$ . Each of the $7$ smallest triangles has area $1,$ and $\triangle ABC$ has area $40$ . What is the area of trapezoid $DBCE$ ? [asy] unitsize(5); dot((0,0)); dot((60,0)); dot((50,10)); dot((10,10)); dot((30,30)); draw((0,0)--(60,0)--(50,10)--(30,30)--(10,10)--(0,0)); draw((10,10)--(50,10)); label("$B$",(0,0),SW); label("$C$",(60,0),SE); label("$E$",(50,10),E); label("$D$",(10,10),W); label("$A$",(30,30),N); draw((10,10)--(15,15)--(20,10)--(25,15)--(30,10)--(35,15)--(40,10)--(45,15)--(50,10)); draw((15,15)--(45,15)); [/asy] $\textbf{(A) } 16 \qquad \textbf{(B) } 18 \qquad \textbf{(C) } 20 \qquad \textbf{(D) } 22 \qquad \textbf{(E) } 24$
-/

-- Solution/Answer (LaTeX):
/-
Let $x$ be the area of $ADE$ . Note that $x$ is comprised of the $7$ small isosceles triangles and a triangle similar to $ADE$ with side length ratio $3:4$ (so an area ratio of $9:16$ ). Thus, we have \[x=7+\dfrac{9}{16}x.\] This gives $x=16$ , so the area of $DBCE=40-x=\boxed{(E) 24}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_5f4ebb96af : Prop := by
  sorry
