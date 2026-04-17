-- 2018 AIME I Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_I_Problems/Problem_2

-- Problem (LaTeX):
/-
The number $n$ can be written in base $14$ as $\underline{a}\text{ }\underline{b}\text{ }\underline{c}$ , can be written in base $15$ as $\underline{a}\text{ }\underline{c}\text{ }\underline{b}$ , and can be written in base $6$ as $\underline{a}\text{ }\underline{c}\text{ }\underline{a}\text{ }\underline{c}\text{ }$ , where $a > 0$ . Find the base- $10$ representation of $n$ .
-/

-- Solution/Answer (LaTeX):
/-
We have these equations: $196a+14b+c=225a+15c+b=222a+37c$ .
Taking the last two we get $3a+b=22c$ . Because $c \neq 0$ otherwise $a \ngtr 0$ , and $a \leq 5$ , $c=1$ . Then we know $3a+b=22$ .
Taking the first two equations we see that $29a+14c=13b$ . Combining the two gives $a=4, b=10, c=1$ . Then we see that $222 \times 4+37 \times1=\boxed{925}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_c046e582ad : Prop := by
  sorry
