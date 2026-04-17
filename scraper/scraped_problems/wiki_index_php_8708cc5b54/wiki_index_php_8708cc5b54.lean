-- 2020 AIME I Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_I_Problems/Problem_3

-- Problem (LaTeX):
/-
A positive integer $N$ has base-eleven representation $\underline{a}\kern 0.1em\underline{b}\kern 0.1em\underline{c}$ and base-eight representation $\underline1\kern 0.1em\underline{b}\kern 0.1em\underline{c}\kern 0.1em\underline{a},$ where $a,b,$ and $c$ represent (not necessarily distinct) digits. Find the least such $N$ expressed in base ten.
-/

-- Solution/Answer (LaTeX):
/-
From the given information, $121a+11b+c=512+64b+8c+a \implies 120a=512+53b+7c$ . Since $a$ , $b$ , and $c$ have to be positive, $a \geq 5$ . Since we need to minimize the value of $n$ , we want to minimize $a$ , so we have $a = 5$ . Then we know $88=53b+7c$ , and we can see the only solution is $b=1$ , $c=5$ . Finally, $515_{11} = 621_{10}$ , so our answer is $\boxed{621}$ . ~ JHawk0224
-/

import Mathlib.Tactic

theorem wiki_index_php_8708cc5b54 : Prop := by
  sorry
