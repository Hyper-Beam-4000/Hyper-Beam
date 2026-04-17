-- 2023 AMC 12B Problems/Problem 19
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_19

-- Problem (LaTeX):
/-
Each of $2023$ balls is randomly placed into one of $3$ bins. Which of the following is closest to the probability that each of the bins will contain an odd number of balls? $\textbf{(A) } \frac{2}{3} \qquad\textbf{(B) } \frac{3}{10} \qquad\textbf{(C) } \frac{1}{2} \qquad\textbf{(D) } \frac{1}{3} \qquad\textbf{(E) } \frac{1}{4}$
-/

-- Solution/Answer (LaTeX):
/-
Because each bin will have an odd number, they will have at least one ball. So we can put one ball in each bin prematurely. We then can add groups of 2 balls into each bin, meaning we now just have to spread 1010 pairs over 3 bins. This will force every bin to have an odd number of balls. Using stars and bars, we find that this is equal to $\binom{1012}{2}$ . This is equal to $\frac{1012\cdot1011}{2}$ . The total amount of ways would also be found using stars and bars. That would be $\binom{2023+3-1}{3-1} = \binom{2025}{2}$ . Dividing our two quantities, we get $\frac{1012 \cdot 1011 \cdot 2}{2 \cdot 2025 \cdot 2024}$ . We can roughly cancel $\frac{1012 \cdot 1011}{2025 \cdot 2024}$ to get $\frac{1}{4}$ . The 2 in the numerator and denominator also cancels out, so we're left with $\boxed{\frac{1}{4}}$ . ~lprado
-/

import Mathlib.Tactic

theorem wiki_index_php_0ae51c3a8f : Prop := by
  sorry
