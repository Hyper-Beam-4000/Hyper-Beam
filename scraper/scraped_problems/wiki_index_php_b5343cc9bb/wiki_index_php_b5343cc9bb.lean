-- 2019 AIME II Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AIME_II_Problems/Problem_2

-- Problem (LaTeX):
/-
Lilypads $1,2,3,\ldots$ lie in a row on a pond. A frog makes a sequence of jumps starting on pad $1$ . From any pad $k$ the frog jumps to either pad $k+1$ or pad $k+2$ chosen randomly with probability $\tfrac{1}{2}$ and independently of other jumps. The probability that the frog visits pad $7$ is $\tfrac{p}{q}$ , where $p$ and $q$ are relatively prime positive integers. Find $p+q$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $P_n$ be the probability the frog visits pad $7$ starting from pad $n$ . Then $P_7 = 1$ , $P_6 = \frac12$ , and $P_n = \frac12(P_{n + 1} + P_{n + 2})$ for all integers $1 \leq n \leq 5$ . Working our way down, we find \[P_5 = \frac{3}{4}\] \[P_4 = \frac{5}{8}\] \[P_3 = \frac{11}{16}\] \[P_2 = \frac{21}{32}\] \[P_1 = \frac{43}{64}\] $43 + 64 = \boxed{107}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_b5343cc9bb : Prop := by
  sorry
