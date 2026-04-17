-- 2018 AIME I Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_I_Problems/Problem_9

-- Problem (LaTeX):
/-
Find the number of four-element subsets of $\{1,2,3,4,\dots, 20\}$ with the property that two distinct elements of a subset have a sum of $16$ , and two distinct elements of a subset have a sum of $24$ . For example, $\{3,5,13,19\}$ and $\{6,10,20,18\}$ are two such subsets.
-/

-- Solution/Answer (LaTeX):
/-
This problem is tricky because it is the capital of a few "bashy" calculations. Nevertheless, the process is straightforward. Call the set $\{a, b, c, d\}$ . Note that there are only two cases: 1 where $a + b = 16$ and $c + d = 24$ or 2 where $a + b = 16$ and $a + c = 24$ . Also note that there is no overlap between the two situations! This is because if they overlapped, adding the two equations of both cases and canceling out gives you $a=d$ , which cannot be true. Case 1.
This is probably the simplest: just make a list of possible combinations for $\{a, b\}$ and $\{c, d\}$ . We get $\{1, 15\}\dots\{7, 9\}$ for the first and $\{4, 20\}\dots\{11, 13\}$ for the second. That appears to give us $7*8=56$ solutions, right? NO. Because elements can't repeat, take out the supposed sets \[\{1, 15, 9, 15\}, \{2, 14, 10, 14\}, \{3, 13, 11, 13\}, \{4, 12, 4, 20\}, \{5, 11, 5, 19\},\] \[\{5, 11, 11, 13\}, \{6, 10, 6, 18\}, \{6, 10, 10, 14\}, \{7, 9, 9, 15\}, \{7, 9, 7, 17\}\] That's ten cases gone. So $46$ for Case 1. Case 2.
We can look for solutions by listing possible $a$ values and filling in the blanks. Start with $a=4$ , as that is the minimum. We find $\{4, 12, 20, ?\}$ , and likewise up to $a=15$ . But we can't have $a=8$ or $a=12$ because $a=b$ or $a=c$ , respectively! Now, it would seem like there are $10$ values for $a$ and $17$ unique values for each $?$ , giving a total of $170$ , but that is once again not true because there are some repeated values!
There are two cases of overcounting: case 1) (5,11,13,19) & (5.11.19.13) The same is for (6,10,14,18) and (7,9,15,17) case 2) those that have the same b and c values this case includes: (1,15,9,7) and (7,9,15,1) (2,14,10,6) and (6,10,14,2) (3,13,11,5) and (5,11,13,3) So we need to subtract 6 overcounts.
So, that's $164$ for Case 2. Total gives $\boxed{210}$ . -expiLnCalc
-/

import Mathlib.Tactic

theorem wiki_index_php_1c576f5961 : Prop := by
  sorry
