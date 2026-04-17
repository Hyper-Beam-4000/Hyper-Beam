-- 2017 AIME I Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_I_Problems/Problem_11

-- Problem (LaTeX):
/-
Consider arrangements of the $9$ numbers $1, 2, 3, \dots, 9$ in a $3 \times 3$ array. For each such arrangement, let $a_1$ , $a_2$ , and $a_3$ be the medians of the numbers in rows $1$ , $2$ , and $3$ respectively, and let $m$ be the median of $\{a_1, a_2, a_3\}$ . Let $Q$ be the number of arrangements for which $m = 5$ . Find the remainder when $Q$ is divided by $1000$ .
-/

-- Solution/Answer (LaTeX):
/-
Assume that $5 \in \{a_1, a_2, a_3\}$ , $m \neq 5$ , and WLOG, $\max{(a_1, a_2, a_3)} = 5$ . Then we know that the other two medians in $\{a_1, a_2, a_3\}$ and the smallest number of rows 1, 2, and 3 are all less than 5. But there are only 4 numbers less than 5 in $1, 2, 3, \dots, 9$ , a Contradiction. Thus, if $5 \in \{a_1, a_2, a_3\}$ , then $m = 5$ . WLOG, assume $5$ is in the upper left corner. One of the two other values in the top row needs to be below $5$ , and the other needs to be above $5$ . This can be done in $4\cdot4\cdot2=32$ ways.
The other $6$ can be arranged in $6!=720$ ways.
Finally, accounting for when $5$ is in every other space, our answer is $32\cdot720\cdot9$ , which is $207360$ . But we only need the last $3$ digits, so $\boxed{360}$ is our answer. ~Solution by SuperSaiyanOver9000, mathics42, edited by zhaohm
-/

import Mathlib.Tactic

theorem wiki_index_php_624976ba79 : Prop := by
  sorry
