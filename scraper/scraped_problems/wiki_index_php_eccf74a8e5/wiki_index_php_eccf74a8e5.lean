-- 2022 AIME II Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_II_Problems/Problem_8

-- Problem (LaTeX):
/-
Find the number of positive integers $n \le 600$ whose value can be uniquely determined when the values of $\left\lfloor \frac n4\right\rfloor$ , $\left\lfloor\frac n5\right\rfloor$ , and $\left\lfloor\frac n6\right\rfloor$ are given, where $\lfloor x \rfloor$ denotes the greatest integer less than or equal to the real number $x$ .
-/

-- Solution/Answer (LaTeX):
/-
We need to find all numbers between $1$ and $600$ inclusive that are multiples of $4$ , $5$ , and/or $6$ which are also multiples of $4$ , $5$ , and/or $6$ when $1$ is added to them. We begin by noting that the LCM of $4$ , $5$ , and $6$ is $60$ . We can therefore simplify the problem by finding all such numbers described above between $1$ and $60$ and multiplying the quantity of such numbers by $10$ ( $600$ / $60$ = $10$ ). After making a simple list of the numbers between $1$ and $60$ and going through it, we see that the numbers meeting this condition are $4$ , $5$ , $15$ , $24$ , $35$ , $44$ , $54$ , and $55$ . This gives us $8$ numbers. $8$ * $10$ = $\boxed{080}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_eccf74a8e5 : Prop := by
  sorry
