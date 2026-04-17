-- 2025 AIME I Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AIME_I_Problems/Problem_3

-- Problem (LaTeX):
/-
The $9$ members of a baseball team went to an ice-cream parlor after their game. Each player had a single scoop cone of chocolate, vanilla, or strawberry ice cream. At least one player chose each flavor, and the number of players who chose chocolate was greater than the number of players who chose vanilla, which was greater than the number of players who chose strawberry. Let $N$ be the number of different assignments of flavors to players that meet these conditions. Find the remainder when $N$ is divided by $1000.$
-/

-- Solution/Answer (LaTeX):
/-
Let $c$ be the number of players who choose chocolate, $v$ be the number of players who choose vanilla, and $s$ be the number of players who choose strawberry ice cream. We are given two pieces of information $c,v,s\ge 1$ and $c+v+s=9.$ By inspection the only solutions for $(c,v,s)$ are $(2,3,4),(1,2,6),(1,3,5).$ Now we must choose which player chooses which flavor. For the general case $(c,v,s),$ we begin by choose $c$ of the $9$ players who eat chocolate, then we choose $v$ of the $9-c$ players who vanilla, after this the amount of players who eat strawberry is fixed. Therefore the general formula is $\binom{9}{c}\binom{9-c}{v}.$ Therefore our final answer is, \[\binom{9}{2}\binom{7}{3}+\binom{9}{1}\binom{8}{2}+\binom{9}{1}\binom{8}{3}=2\boxed{016}.\] ~ mathkiddus
-/

import Mathlib.Tactic

theorem wiki_index_php_7923d7dc77 : Prop := by
  sorry
