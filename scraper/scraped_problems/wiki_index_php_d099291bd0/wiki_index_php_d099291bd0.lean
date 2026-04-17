-- 2021 AMC 12B Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12B_Problems/Problem_11

-- Problem (LaTeX):
/-
Triangle $ABC$ has $AB=13,BC=14$ and $AC=15$ . Let $P$ be the point on $\overline{AC}$ such that $PC=10$ . There are exactly two points $D$ and $E$ on line $BP$ such that quadrilaterals $ABCD$ and $ABCE$ are trapezoids. What is the distance $DE?$ $\textbf{(A) }\frac{42}5 \qquad \textbf{(B) }6\sqrt2 \qquad \textbf{(C) }\frac{84}5\qquad \textbf{(D) }12\sqrt2 \qquad \textbf{(E) }18$
-/

-- Solution/Answer (LaTeX):
/-
Toss on the Cartesian plane with $A=(5, 12), B=(0, 0),$ and $C=(14, 0)$ . Then $\overline{AD}\parallel\overline{BC}, \overline{AB}\parallel\overline{CE}$ by the trapezoid condition, where $D, E\in\overline{BP}$ . Since $PC=10$ , point $P$ is $\tfrac{10}{15}=\tfrac{2}{3}$ of the way from $C$ to $A$ and is located at $(8, 8)$ . Thus line $BP$ has equation $y=x$ . Since $\overline{AD}\parallel\overline{BC}$ and $\overline{BC}$ is parallel to the ground, we know $D$ has the same $y$ -coordinate as $A$ , except it'll also lie on the line $y=x$ . Therefore, $D=(12, 12). \, \blacksquare$ To find the location of point $E$ , we need to find the intersection of $y=x$ with a line parallel to $\overline{AB}$ passing through $C$ . The slope of this line is the same as the slope of $\overline{AB}$ , or $\tfrac{12}{5}$ , and has equation $y=\tfrac{12}{5}x-\tfrac{168}{5}$ . The intersection of this line with $y=x$ is $(24, 24)$ . Therefore point $E$ is located at $(24, 24). \, \blacksquare$ The distance $DE$ is equal to the distance between $(12, 12)$ and $(24, 24)$ , which is $\boxed{\textbf{(D) }12\sqrt2}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_d099291bd0 : Prop := by
  sorry
