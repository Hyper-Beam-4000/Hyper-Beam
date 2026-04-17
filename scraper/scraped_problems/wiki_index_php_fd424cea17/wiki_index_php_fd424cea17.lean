-- 2020 AIME I Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_I_Problems/Problem_4

-- Problem (LaTeX):
/-
Let $S$ be the set of positive integers $N$ with the property that the last four digits of $N$ are $2020,$ and when the last four digits are removed, the result is a divisor of $N.$ For example, $42,020$ is in $S$ because $4$ is a divisor of $42,020.$ Find the sum of all the digits of all the numbers in $S.$ For example, the number $42,020$ contributes $4+2+0+2+0=8$ to this total.
-/

-- Solution/Answer (LaTeX):
/-
We note that any number in $S$ can be expressed as $a(10,000) + 2,020$ for some integer $a$ . The problem requires that $a$ divides this number, and since we know $a$ divides $a(10,000)$ , we need that $a$ divides 2020. Each number contributes the sum of the digits of $a$ , as well as $2 + 0 + 2 +0 = 4$ . Since $2020$ can be prime factorized as $2^2 \cdot 5 \cdot 101$ , it has $(2+1)(1+1)(1+1) = 12$ factors. So if we sum all the digits of all possible $a$ values, and add $4 \cdot 12 = 48$ , we obtain the answer. Now we list out all factors of $2,020$ , or all possible values of $a$ . $1,2,4,5,10,20,101,202,404,505,1010,2020$ . If we add up these digits, we get $45$ , for a final answer of $45+48=\boxed{093}$ . -molocyxu
-/

import Mathlib.Tactic

theorem wiki_index_php_fd424cea17 : Prop := by
  sorry
