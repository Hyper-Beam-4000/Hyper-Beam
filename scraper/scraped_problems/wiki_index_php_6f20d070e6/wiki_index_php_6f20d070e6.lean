-- 2018 AIME II Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_II_Problems/Problem_8

-- Problem (LaTeX):
/-
A frog is positioned at the origin of the coordinate plane. From the point $(x, y)$ , the frog can jump to any of the points $(x + 1, y)$ , $(x + 2, y)$ , $(x, y + 1)$ , or $(x, y + 2)$ . Find the number of distinct sequences of jumps in which the frog begins at $(0, 0)$ and ends at $(4, 4)$ .
-/

-- Solution/Answer (LaTeX):
/-
We solve this problem by working backwards. Notice, the only points the frog can be on to jump to $(4,4)$ in one move are $(2,4),(3,4),(4,2),$ and $(4,3)$ . This applies to any other point, thus we can work our way from $(0,0)$ to $(4,4)$ , recording down the number of ways to get to each point recursively. $(0,0): 1$ $(1,0)=(0,1)=1$ $(2,0)=(0, 2)=2$ $(3,0)=(0, 3)=3$ $(4,0)=(0, 4)=5$ $(1,1)=2$ , $(1,2)=(2,1)=5$ , $(1,3)=(3,1)=10$ , $(1,4)=(4,1)= 20$ $(2,2)=14, (2,3)=(3,2)=32, (2,4)=(4,2)=71$ $(3,3)=84, (3,4)=(4,3)=207$ $(4,4)=2\cdot \left( (4,2)+(4,3)\right) = 2\cdot \left( 207+71\right)=2\cdot 278=\boxed{556}$ A diagram of the numbers: [asy] import graph; add(shift(0,0)*grid(4,4)); label((0,0), "1", SW); label((1,0), "1", SW); label((2,0), "2", SW); label((3,0), "3", SW); label((4,0), "5", SW); label((0,1), "1", SW); label((1,1), "2", SW); label((2,1), "5", SW); label((3,1), "10", SW); label((4,1), "20", SW); label((0,2), "2", SW); label((1,2), "5", SW); label((2,2), "14", SW); label((3,2), "32", SW); label((4,2), "71", SW); label((0,3), "3", SW); label((1,3), "10", SW); label((2,3), "32", SW); label((3,3), "84", SW); label((4,3), "207", SW); label((0,4), "5", SW); label((1,4), "20", SW); label((2,4), "71", SW); label((3,4), "207", SW); label((4,4), "556", SW); [/asy] ~First
-/

import Mathlib.Tactic

theorem wiki_index_php_6f20d070e6 : Prop := by
  sorry
