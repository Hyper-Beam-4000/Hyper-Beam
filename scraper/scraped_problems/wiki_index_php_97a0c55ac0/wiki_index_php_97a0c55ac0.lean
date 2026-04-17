-- 2019 AIME I Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AIME_I_Problems/Problem_2

-- Problem (LaTeX):
/-
Jenn randomly chooses a number $J$ from $1, 2, 3,\ldots, 19, 20$ . Bela then randomly chooses a number $B$ from $1, 2, 3,\ldots, 19, 20$ distinct from $J$ . The value of $B - J$ is at least $2$ with a probability that can be expressed in the form $\frac{m}{n}$ where $m$ and $n$ are relatively prime positive integers. Find $m+n$ .
-/

-- Solution/Answer (LaTeX):
/-
$B-J \ne 0$ because $B \ne J$ , so the probability that $B-J < 0$ is $\frac{1}{2}$ by symmetry. The probability that $B-J = 1$ is $\frac{19}{20 \times 19} = \frac{1}{20}$ because there are 19 pairs: $(B,J) = (2,1), \ldots, (20,19)$ . The probability that $B-J \ge 2$ is $1-\frac{1}{2}-\frac{1}{20} = \frac{9}{20} \implies \boxed{029}$
-/

import Mathlib.Tactic

theorem wiki_index_php_97a0c55ac0 : Prop := by
  sorry
