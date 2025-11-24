-- 2019 USAMO Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_USAMO_Problems/Problem_4

-- Problem (LaTeX):
/-
(n+1)^2

S_{i,j}\subseteq\{1,2,\ldots,2n\}

0\leq i,j\leq n

\bullet

S_{i,j}

S_{i,j}\subseteq S_{k,l}

0\leq i\leq k\leq n

0\leq j\leq l\leq n
-/

-- Solution/Answer (LaTeX):
/-
(2n)!

S_{1, 0}, S_{2, 0}... S_{n, 0}, S_{n, 1}, S_{n, 2}... S_{n, n}

S_{1, 0}

2n-1

S_{2, 0}

2n-2

S_{3, 0}

S_{n-1, 1}

S_{n-1, 0}

S_{n, 1}

S_{n-1, 2}

S_{n-1, j}

(2n)!\cdot 2^{\left(n^2\right)}
-/

import Mathlib.Tactic

theorem wiki_index_php_e56ccba1fc : Prop := by
  -- TODO: translate LaTeX statement into Lean and complete proof
  sorry
