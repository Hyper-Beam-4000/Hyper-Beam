-- 2024 AMC 10B Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_5

-- Problem (LaTeX):
/-
In the following expression, Melanie changed some of the plus signs to minus signs: \[1+3+5+7+...+97+99\] When the new expression was evaluated, it was negative. What is the least number of plus signs that Melanie could have changed to minus signs? $\textbf{(A) } 14 \qquad\textbf{(B) } 15 \qquad\textbf{(C) } 16 \qquad\textbf{(D) } 17 \qquad\textbf{(E) } 18$
-/

-- Solution/Answer (LaTeX):
/-
Recall that the sum of the first $n$ odd numbers is $n^2$ . Thus \[1 + 3 + 5 + 7+ \dots + 97 + 99 = 50^2 = 2500.\] If we want to minimize the number of sign flips to make the number negative, we must flip the signs corresponding to the values with largest absolute value. This will result in the inequality \[1 + 3 + 5 +\dots + (2n - 3) + (2n - 1) - (2n + 1) - (2n + 3)-\dots - 97 - 99 < 0.\] The positive section of the sum will contribute $n^2$ , and the negative section will contribute $-(2500-n^2) = (n^2 - 2500)$ . The inequality simplifies to \[n^2 + (n^2 - 2500) < 0\] \[2n^2 < 2500\] \[n^2 < 1250\] The greatest positive value of $n$ satisfying the inequality is $n = 35$ , corresponding to $35$ positive numbers, and $\boxed{\text{B. } 15}$ negatives. ALEX
-/

import Mathlib.Tactic

theorem wiki_index_php_13ce8036b0 : Prop := by
  sorry
