-- 2021 AMC 12A Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_3

-- Problem (LaTeX):
/-
The sum of two natural numbers is $17{,}402$ . One of the two numbers is divisible by $10$ . If the units digit of that number is erased, the other number is obtained. What is the difference of these two numbers? $\textbf{(A)} ~10{,}272\qquad\textbf{(B)} ~11{,}700\qquad\textbf{(C)} ~13{,}362\qquad\textbf{(D)} ~14{,}238\qquad\textbf{(E)} ~15{,}426$
-/

-- Solution/Answer (LaTeX):
/-
The units digit of a multiple of $10$ will always be $0$ . We add a $0$ whenever we multiply by $10$ . So, removing the units digit is equal to dividing by $10$ . Let the smaller number (the one we get after removing the units digit) be $a$ . This means the bigger number would be $10a$ . We know the sum is $10a+a = 11a$ so $11a=17402$ . So $a=1582$ . The difference is $10a-a = 9a$ . So, the answer is $9(1582) = \boxed{\textbf{(D)} ~14{,}238}$ . ~abhinavg0627
-/

import Mathlib.Tactic

theorem wiki_index_php_2d1bbbb301 : Prop := by
  sorry
