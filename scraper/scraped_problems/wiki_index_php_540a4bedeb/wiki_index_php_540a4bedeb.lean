-- 2020 AIME II Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_II_Problems/Problem_9

-- Problem (LaTeX):
/-
While watching a show, Ayako, Billy, Carlos, Dahlia, Ehuang, and Frank sat in that order in a row of six chairs. During the break, they went to the kitchen for a snack. When they came back, they sat on those six chairs in such a way that if two of them sat next to each other before the break, then they did not sit next to each other after the break. Find the number of possible seating orders they could have chosen after the break.
-/

-- Solution/Answer (LaTeX):
/-
There are $2^{5}-1$ intersections that we must consider if we are to perform a PIE bash on this problem. Since we don't really want to think that hard, and bashing does not take that long for this problem, we can write down half of all permutations that satisfy the conditions presented in the problem in "lexicographically next" order to keep track easily. We do this for all cases such that the first "person" is $A-C$ , and multiply by two, since the number of working permutations with $D-F$ as the first person is the same as if it were $A-C$ , hence, after doing such a bash, we get $45\times2=90$ permutations that result in no consecutive letters being adjacent to each other.
~afatperson
-/

import Mathlib.Tactic

theorem wiki_index_php_540a4bedeb : Prop := by
  sorry
