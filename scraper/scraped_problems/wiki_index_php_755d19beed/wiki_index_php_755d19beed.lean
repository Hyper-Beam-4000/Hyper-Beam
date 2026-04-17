-- 2020 AMC 12B Problems/Problem 22
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_22

-- Problem (LaTeX):
/-
What is the maximum value of $\frac{(2^t-3t)t}{4^t}$ for real values of $t?$ $\textbf{(A)}\ \frac{1}{16} \qquad\textbf{(B)}\ \frac{1}{15} \qquad\textbf{(C)}\ \frac{1}{12} \qquad\textbf{(D)}\ \frac{1}{10} \qquad\textbf{(E)}\ \frac{1}{9}$
-/

-- Solution/Answer (LaTeX):
/-
We proceed by using AM-GM. We get $\frac{(2^t-3t) + 3t}{2}$ $\ge \sqrt{(2^t-3t)(3t)}$ . Thus, squaring gives us that $4^{t-1} \ge (2^t-3t)(3t)$ . Remembering what we want to find, we divide both sides of the inequality by the positive amount of $\frac{1}{3\cdot4^t}$ . We get the maximal values as $\boxed{(C) \frac{1}{12}}$ , and we are done.
-/

import Mathlib.Tactic

theorem wiki_index_php_755d19beed : Prop := by
  sorry
