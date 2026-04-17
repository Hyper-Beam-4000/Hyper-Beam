-- 2019 AMC 10A Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12A_Problems/Problem_3

-- Problem (LaTeX):
/-
A box contains $28$ red balls, $20$ green balls, $19$ yellow balls, $13$ blue balls, $11$ white balls, and $9$ black balls. What is the minimum number of balls that must be drawn from the box without replacement to guarantee that at least $15$ balls of a single color will be drawn? $\textbf{(A) } 75 \qquad\textbf{(B) } 76 \qquad\textbf{(C) } 79 \qquad\textbf{(D) } 84 \qquad\textbf{(E) } 91$
-/

-- Solution/Answer (LaTeX):
/-
We try to find the worst case scenario where we can find the maximum number of balls that can be drawn while getting $<15$ of each color by applying the pigeonhole principle and through this we get a perfect guarantee.
Namely, we can draw up to $14$ red balls, $14$ green balls, $14$ yellow balls, $13$ blue balls, $11$ white balls, and $9$ black balls, for a total of $75$ balls, without drawing $15$ balls of any one color. Drawing one more ball guarantees that we will get $15$ balls of one color — either red, green, or yellow. Thus, the answer is $75 + 1 = \boxed{\textbf{(B) } 76}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_cabf21a540 : Prop := by
  sorry
