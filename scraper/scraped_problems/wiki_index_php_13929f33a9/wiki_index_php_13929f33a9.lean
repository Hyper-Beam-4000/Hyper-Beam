-- 2019 AMC 10B Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12B_Problems/Problem_6

-- Problem (LaTeX):
/-
In a given plane, points $A$ and $B$ are $10$ units apart. How many points $C$ are there in the plane such that the perimeter of $\triangle ABC$ is $50$ units and the area of $\triangle ABC$ is $100$ square units? $\textbf{(A) }0\qquad\textbf{(B) }2\qquad\textbf{(C) }4\qquad\textbf{(D) }8\qquad\textbf{(E) }\text{infinitely many}$
-/

-- Solution/Answer (LaTeX):
/-
Notice that whatever point we pick for $C$ , $AB$ will be the base of the triangle. Without loss of generality, let points $A$ and $B$ be $(0,0)$ and $(10,0)$ , since for any other combination of points, we can just rotate the plane to make them $(0,0)$ and $(10,0)$ under a new coordinate system. When we pick point $C$ , we have to make sure that its $y$ -coordinate is $\pm20$ , because that's the only way the area of the triangle can be $100$ . Now when the perimeter is minimized, by symmetry, we put $C$ in the middle, at $(5, 20)$ . We can easily see that $AC$ and $BC$ will both be $\sqrt{20^2+5^2} = \sqrt{425}$ . The perimeter of this minimal triangle is $2\sqrt{425} + 10$ , which is larger than $50$ . Since the minimum perimeter is greater than $50$ , there is no triangle that satisfies the condition, giving us $\boxed{\textbf{(A) }0}$ . ~IronicNinja
-/

import Mathlib.Tactic

theorem wiki_index_php_13929f33a9 : Prop := by
  sorry
