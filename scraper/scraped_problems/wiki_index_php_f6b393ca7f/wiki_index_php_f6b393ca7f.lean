-- 2021 AIME II Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AIME_II_Problems/Problem_5

-- Problem (LaTeX):
/-
For positive real numbers $s$ , let $\tau(s)$ denote the set of all obtuse triangles that have area $s$ and two sides with lengths $4$ and $10$ . The set of all $s$ for which $\tau(s)$ is nonempty, but all triangles in $\tau(s)$ are congruent, is an interval $[a,b)$ . Find $a^2+b^2$ .
-/

-- Solution/Answer (LaTeX):
/-
We start by defining a triangle. The two small sides MUST add to a larger sum than the long side. We are given $4$ and $10$ as the sides, so we know that the $3$ rd side is between $6$ and $14$ , exclusive. We also have to consider the word OBTUSE triangles. That means that the two small sides squared is less than the $3$ rd side. So the triangles' sides are between $6$ and $\sqrt{84}$ exclusive, and the larger bound is between $\sqrt{116}$ and $14$ , exclusive. The area of these triangles are from $0$ (straight line) to $2\sqrt{84}$ on the first "small bound" and the larger bound is between $0$ and $20$ . $0 < s < 2\sqrt{84}$ is our first equation, and $0 < s < 20$ is our $2$ nd equation. Therefore, the area is between $\sqrt{336}$ and $\sqrt{400}$ , so our final answer is $\boxed{736}$ . ~ARCTICTURN
-/

import Mathlib.Tactic

theorem wiki_index_php_f6b393ca7f : Prop := by
  sorry
