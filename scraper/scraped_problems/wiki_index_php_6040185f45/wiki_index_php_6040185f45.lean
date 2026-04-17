-- 2023 AMC 12A Problems/Problem 17
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_17

-- Problem (LaTeX):
/-
Flora the frog starts at 0 on the number line and makes a sequence of jumps to the right. In any one jump, independent of previous jumps, Flora leaps a positive integer distance $m$ with probability $\frac{1}{2^m}$ . What is the probability that Flora will eventually land at 10? $\textbf{(A)}~\frac{5}{512}\qquad\textbf{(B)}~\frac{45}{1024}\qquad\textbf{(C)}~\frac{127}{1024}\qquad\textbf{(D)}~\frac{511}{1024}\qquad\textbf{(E)}~\frac{1}{2}$
-/

-- Solution/Answer (LaTeX):
/-
Initially, the probability of landing at $10$ and landing past $10$ (summing the infinte series) are exactly the same. Landing before 10 repeats this initial condition, with a different irrelevant scaling factor. Therefore, the probability must be $\boxed{\textbf{(E)}~\frac12}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_6040185f45 : Prop := by
  sorry
