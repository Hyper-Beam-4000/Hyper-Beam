-- 2017 AIME I Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_I_Problems/Problem_5

-- Problem (LaTeX):
/-
A rational number written in base eight is $\underline{ab} . \underline{cd}$ , where all digits are nonzero. The same number in base twelve is $\underline{bb} . \underline{ba}$ . Find the base-ten number $\underline{abc}$ .
-/

-- Solution/Answer (LaTeX):
/-
First, note that the first two digits will always be a positive number. We will start with base twelve because of its repetition. List all the positive numbers in base eight that have equal tens and ones digits in base 12. $11_{12}=15_8$ $22_{12}=32_8$ $33_{12}=47_8$ $44_{12}=64_8$ $55_{12}=101_8$ We stop because we only can have two-digit numbers in base 8 and 101 is not a 2 digit number.
Compare the ones places to check if they are equal. We find that they are equal if $b=2$ or $b=4$ .
Evaluating the places to the right side of the decimal point gives us $22.23_{12}$ or $44.46_{12}$ .
When the numbers are converted into base 8, we get $32.14_8$ and $64.30_8$ . Since $d\neq0$ , the first value is correct. Compiling the necessary digits leaves us a final answer of $\boxed{321}$
-/

import Mathlib.Tactic

theorem wiki_index_php_ef4ff11b08 : Prop := by
  sorry
