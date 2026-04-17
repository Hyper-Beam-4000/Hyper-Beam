-- 2024 AIME II Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AIME_II_Problems/Problem_9

-- Problem (LaTeX):
/-
There is a collection of $25$ indistinguishable white chips and $25$ indistinguishable black chips. Find the number of ways to place some of these chips in the $25$ unit cells of a $5\times5$ grid such that: each cell contains at most one chip all chips in the same row and all chips in the same column have the same colour any additional chip placed on the grid would violate one or more of the previous two conditions.
-/

-- Solution/Answer (LaTeX):
/-
The problem says "some", so not all cells must be occupied.
We start by doing casework on the column on the left. There can be 5,4,3,2, or 1 black chip. The same goes for white chips, so we will multiply by 2 at the end. There is $1$ way to select $5$ cells with black chips. Because of the 2nd condition, there can be no white, and the grid must be all black- $1$ way . There are $5$ ways to select 4 cells with black chips. We now consider the row that does not contain a black chip. The first cell must be blank, and the remaining $4$ cells have $2^4-1$ different ways, since each cell can be white or blank( $-1$ comes from all blank). This gives us $75$ ways. Notice that for 3,2 or 1 black chips on the left there is a pattern. Once the first blank row is chosen, the rest of the blank rows must be ordered similarly. For example, with 2 black chips on the left, there will be 3 blank rows. There are 15 ways for the first row to be chosen, and the following 2 rows must have the same order. Thus, The number of ways for 3,2,and 1 black chips is $10*15$ , $10*15$ , $5*15$ . Adding these up, we have $1+75+150+150+75 = 451$ . Multiplying this by 2, we get $\boxed{902}$ .
~westwoodmonster
-/

import Mathlib.Tactic

theorem wiki_index_php_38bdb1b473 : Prop := by
  sorry
