-- 2024 AIME II Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AIME_II_Problems/Problem_7

-- Problem (LaTeX):
/-
Let $N$ be the greatest four-digit positive integer with the property that whenever one of its digits is changed to $1$ , the resulting number is divisible by $7$ . Let $Q$ and $R$ be the quotient and remainder, respectively, when $N$ is divided by $1000$ . Find $Q+R$ .
-/

-- Solution/Answer (LaTeX):
/-
We note that by changing a digit to $1$ for the number $\overline{abcd}$ , we are subtracting the number by either $1000(a-1)$ , $100(b-1)$ , $10(c-1)$ , or $d-1$ . Thus, $1000a + 100b + 10c + d \equiv 1000(a-1) \equiv 100(b-1) \equiv 10(c-1) \equiv d-1 \pmod{7}$ . We can casework on $a$ backwards, finding the maximum value. (Note that computing $1000 \equiv 6 \pmod{7}, 100 \equiv 2 \pmod{7}, 10 \equiv 3 \pmod{7}$ greatly simplifies computation). Applying casework on $a$ , we can eventually obtain a working value of $\overline{abcd} = 5694 \implies \boxed{699}$ . ~akliu
-/

import Mathlib.Tactic

theorem wiki_index_php_e2e7c96cb8 : Prop := by
  sorry
