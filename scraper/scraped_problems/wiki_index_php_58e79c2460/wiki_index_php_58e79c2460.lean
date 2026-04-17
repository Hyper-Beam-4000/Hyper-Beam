-- 2019 AMC 12B Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12B_Problems/Problem_3

-- Problem (LaTeX):
/-
Which of the following rigid transformations (isometries) maps the line segment $\overline{AB}$ onto the line segment $\overline{A'B'}$ so that the image of $A(-2, 1)$ is $A'(2, -1)$ and the image of $B(-1, 4)$ is $B'(1, -4)$ ? $\textbf{(A) }$ reflection in the $y$ -axis $\textbf{(B) }$ counterclockwise rotation around the origin by $90^{\circ}$ $\textbf{(C) }$ translation by 3 units to the right and 5 units down $\textbf{(D) }$ reflection in the $x$ -axis $\textbf{(E) }$ clockwise rotation about the origin by $180^{\circ}$
-/

-- Solution/Answer (LaTeX):
/-
We can simply graph the points, or use coordinate geometry, to realize that both $A'$ and $B'$ are, respectively, obtained by rotating $A$ and $B$ by $180^{\circ}$ about the origin. Hence the rotation by $180^{\circ}$ about the origin maps the line segment $\overline{AB}$ to the line segment $\overline{A'B'}$ , so the answer is $\boxed{(\text{E})}$ . ~Dodgers66
-/

import Mathlib.Tactic

theorem wiki_index_php_58e79c2460 : Prop := by
  sorry
