-- 2022 AIME II Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_II_Problems/Problem_14

-- Problem (LaTeX):
/-
For positive integers $a$ , $b$ , and $c$ with $a < b < c$ , consider collections of postage stamps in denominations $a$ , $b$ , and $c$ cents that contain at least one stamp of each denomination. If there exists such a collection that contains sub-collections worth every whole number of cents up to $1000$ cents, let $f(a, b, c)$ be the minimum number of stamps in such a collection. Find the sum of the three least values of $c$ such that $f(a, b, c) = 97$ for some choice of $a$ and $b$ .
-/

-- Solution/Answer (LaTeX):
/-
Notice that we must have $a = 1$ ; otherwise $1$ cent stamp cannot be represented. At least $b-1$ numbers of $1$ cent stamps are needed to represent the values less than $b$ . Using at most $c-1$ stamps of value $1$ and $b$ , it can have all the values from $1$ to $c-1$ cents. Plus $\lfloor \frac{999}{c} \rfloor$ stamps of value $c$ , every value up to $1000$ can be represented.
-/

import Mathlib.Tactic

theorem wiki_index_php_17625da0a5 : Prop := by
  sorry
