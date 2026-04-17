-- 2020 AIME I Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_I_Problems/Problem_7

-- Problem (LaTeX):
/-
A club consisting of $11$ men and $12$ women needs to choose a committee from among its members so that the number of women on the committee is one more than the number of men on the committee. The committee could have as few as $1$ member or as many as $23$ members. Let $N$ be the number of such committees that can be formed. Find the sum of the prime numbers that divide $N.$
-/

-- Solution/Answer (LaTeX):
/-
Let $k$ be the number of women selected. Then, the number of men not selected is $11-(k-1)=12-k$ .
Note that the sum of the number of women selected and the number of men not selected is constant at $12$ . Each combination of women selected and men not selected corresponds to a committee selection. Since choosing 12 individuals from the total of 23 would give $k$ women and $12-k$ men, the number of committee selections is $\binom{23}{12}$ .
The answer is $\boxed{081}$ .
~awang11's sol
-/

import Mathlib.Tactic

theorem wiki_index_php_b17fb3ce70 : Prop := by
  sorry
