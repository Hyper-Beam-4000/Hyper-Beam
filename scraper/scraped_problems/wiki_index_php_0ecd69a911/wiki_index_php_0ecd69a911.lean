-- 2023 AMC 12A Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_13

-- Problem (LaTeX):
/-
In a table tennis tournament, every participant played every other participant exactly once. Although there were twice as many right-handed players as left-handed players, the number of games won by left-handed players was $40\%$ more than the number of games won by right-handed players. (There were no ties and no ambidextrous players.) What is the total number of games played? $\textbf{(A) }15\qquad\textbf{(B) }36\qquad\textbf{(C) }45\qquad\textbf{(D) }48\qquad\textbf{(E) }66$
-/

-- Solution/Answer (LaTeX):
/-
We know that the total amount of games must be the sum of games won by left and right handed players. Then, we can write $g = l + r$ , and since $l = 1.4r$ , $g = 2.4r$ . Given that $r$ and $g$ are both integers, $g/2.4$ also must be an integer. From here we can see that $g$ must be divisible by 12, leaving only answers B and D. Now we know the formula for how many games are played in this tournament is $n(n-1)/2$ , the sum of the first $n-1$ numbers. Now, setting 36 and 48 equal to the equation will show that two consecutive numbers must have a product of 72 or 96. Clearly, $72=8*9$ , so the answer is $\boxed{\textbf{(B) }36}$ . ~~ Antifreeze5420
-/

import Mathlib.Tactic

theorem wiki_index_php_0ecd69a911 : Prop := by
  sorry
