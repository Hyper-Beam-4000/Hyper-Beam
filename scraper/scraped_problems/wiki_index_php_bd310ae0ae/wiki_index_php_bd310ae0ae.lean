-- 2024 AIME II Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AIME_II_Problems/Problem_13

-- Problem (LaTeX):
/-
Let $\omega\neq 1$ be a $13$ th root of unity. Find the remainder when \[\prod_{k=0}^{12}(2-2\omega^k+\omega^{2k})\] is divided by $1000$ .
-/

-- Solution/Answer (LaTeX):
/-
\[\prod_{k=0}^{12} \left(2- 2\omega^k + \omega^{2k}\right) = \prod_{k=0}^{12} \left((1 - \omega^k)^2 + 1\right) = \prod_{k=0}^{12} \left((1 + i) - \omega^k)((1 - i) - \omega^k\right)\] Now, we consider the polynomial $x^{13} - 1$ whose roots are the 13th roots of unity. Taking our rewritten product from $0$ to $12$ , we see that both instances of $\omega^k$ cycle through each of the 13th roots. Then, our answer is: \[((1 + i)^{13} - 1)((1 - i)^{13} - 1)\] \[= (-64(1 + i) - 1)(-64(1 - i) - 1)\] \[= (65 + 64i)(65 - 64i)\] \[= 65^2 + 64^2\] \[= \boxed{\textbf{321}}\] ~Mqnic_
-/

import Mathlib.Tactic

theorem wiki_index_php_bd310ae0ae : Prop := by
  sorry
