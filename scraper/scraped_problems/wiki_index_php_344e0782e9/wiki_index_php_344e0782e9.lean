-- 2018 AMC 10A Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_10

-- Problem (LaTeX):
/-
How many ordered pairs of real numbers $(x,y)$ satisfy the following system of equations? \begin{align*} x+3y&=3 \\ \big||x|-|y|\big|&=1 \end{align*} $\textbf{(A) } 1 \qquad \textbf{(B) } 2 \qquad \textbf{(C) } 3 \qquad \textbf{(D) } 4 \qquad \textbf{(E) } 8$
-/

-- Solution/Answer (LaTeX):
/-
We can solve this by graphing the equations. The second equation looks challenging to graph, but start by graphing it in the first quadrant only (which is easy since the inner absolute value signs can be ignored), then simply reflect that graph into the other quadrants. The graph looks something like this: [asy] draw((-3,0)--(3,0), Arrows); draw((0,-3)--(0,3), Arrows); draw((2,3)--(0,1)--(-2,3), blue); draw((-3,2)--(-1,0)--(-3,-2), blue); draw((-2,-3)--(0,-1)--(2,-3), blue); draw((3,-2)--(1,0)--(3,2), blue); draw((-3,2)--(3,0), red); dot((-3,2)); dot((3/2,1/2)); dot((0,1)); [/asy] Now, it becomes clear that there are $\boxed{\textbf{(C) } 3}$ intersection points. (not the author)The lines in the first quadrant are $y=x+1$ and $y=x-1$ and we reflect them into all quadrants as all instances of variables are in a context where flipping the sign does not affect the overall expression.
-/

import Mathlib.Tactic

theorem wiki_index_php_344e0782e9 : Prop := by
  sorry
