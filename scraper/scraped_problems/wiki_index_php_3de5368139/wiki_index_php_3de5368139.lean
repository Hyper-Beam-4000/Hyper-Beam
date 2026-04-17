-- 2025 AMC 12B Problems/Problem 20
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_20

-- Problem (LaTeX):
/-
A frog hops along the number line according to the following rules: It starts at $0$ . If it is at $0$ , then it moves to $1$ with probability $\frac 12$ and disappears with probability $\frac 12$ . For $n=1,2,3,$ if it is at $n$ , then it moves to $n+1$ with probability $\frac 14,$ to $n-1$ with probability $\frac 14,$ and disappears with probability $\frac 12$ . What is the probability that the frog reaches $4?$ $\textbf{(A) } \frac1{101} \qquad \textbf{(B) } \frac 1{100} \qquad \textbf{(C) } \frac1{99} \qquad \textbf{(D) } \frac1{98} \qquad \textbf{(E) } \frac1{97}$
-/

-- Solution/Answer (LaTeX):
/-
We will solve this using states. Let $P_n$ be the probability of reaching $4$ , given that you start from $n$ . We want to find $P_0$ . Of course, $P_4 = 1$ . We also know that \[P_3 = \frac{1}{4}P_4 + \frac{1}{4}P_2\] \[P_2 = \frac{1}{4}P_3 + \frac{1}{4}P_1\] \[P_1 = \frac{1}{4}P_2 + \frac{1}{4}P_0\] \[P_0 = \frac{1}{2}P_1.\] Solving the system, we find that $P_1 = \frac{2}{97}$ and $P_0 = \boxed{\frac{1}{97}}.$ ~lprado
-/

import Mathlib.Tactic

theorem wiki_index_php_3de5368139 : Prop := by
  sorry
