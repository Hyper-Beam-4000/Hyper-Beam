-- 2019 AMC 10B Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12B_Problems/Problem_2

-- Problem (LaTeX):
/-
Consider the statement, "If $n$ is not prime, then $n-2$ is prime." Which of the following values of $n$ is a counterexample to this statement? $\textbf{(A) } 11 \qquad \textbf{(B) } 15 \qquad \textbf{(C) } 19 \qquad \textbf{(D) } 21 \qquad \textbf{(E) } 27$
-/

-- Solution/Answer (LaTeX):
/-
Since a counterexample must be a value of $n$ which is not prime, $n$ must be composite, so we eliminate $\text{A}$ and $\text{C}$ . Now we subtract $2$ from the remaining answer choices, and we see that the only time $n-2$ is not prime is when $n = \boxed{\textbf{(E) }27}$ . ~IronicNinja minor edit (the inclusion of not) by AlcBoy1729
-/

import Mathlib.Tactic

theorem wiki_index_php_eb76396523 : Prop := by
  sorry
