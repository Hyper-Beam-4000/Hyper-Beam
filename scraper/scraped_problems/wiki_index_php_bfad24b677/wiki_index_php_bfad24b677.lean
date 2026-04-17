-- 2018 AIME II Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_II_Problems/Problem_4

-- Problem (LaTeX):
/-
In equiangular octagon $CAROLINE$ , $CA = RO = LI = NE =$ $\sqrt{2}$ and $AR = OL = IN = EC = 1$ . The self-intersecting octagon $CORNELIA$ encloses six non-overlapping triangular regions. Let $K$ be the area enclosed by $CORNELIA$ , that is, the total area of the six triangular regions. Then $K =$ $\dfrac{a}{b}$ , where $a$ and $b$ are relatively prime positive integers. Find $a + b$ .
-/

-- Solution/Answer (LaTeX):
/-
We can draw $CORNELIA$ and introduce some points. The diagram is essentially a 3x3 grid where each of the 9 squares making up the grid have a side length of 1. In order to find the area of $CORNELIA$ , we need to find 4 times the area of $\bigtriangleup$ $ACY$ and 2 times the area of $\bigtriangleup$ $YZW$ . Using similar triangles $\bigtriangleup$ $ARW$ and $\bigtriangleup$ $YZW$ (We look at their heights), $YZ$ $=$ $\frac{1}{3}$ . Therefore, the area of $\bigtriangleup$ $YZW$ is $\frac{1}{3}\cdot\frac{1}{2}\cdot\frac{1}{2}$ $=$ $\frac{1}{12}$ Since $YZ$ $=$ $\frac{1}{3}$ and $XY = ZQ$ , $XY$ $=$ $\frac{1}{3}$ and $CY$ $=$ $\frac{4}{3}$ . Therefore, the area of $\bigtriangleup$ $ACY$ is $\frac{4}{3}\cdot$ $1$ $\cdot$ $\frac{1}{2}$ $=$ $\frac{2}{3}$ Our final answer is $\frac{1}{12}$ $\cdot$ $2$ $+$ $\frac{2}{3}$ $\cdot$ $4$ $=$ $\frac{17}{6}$ $17 + 6 =$ $\boxed{023}$
-/

import Mathlib.Tactic

theorem wiki_index_php_bfad24b677 : Prop := by
  sorry
