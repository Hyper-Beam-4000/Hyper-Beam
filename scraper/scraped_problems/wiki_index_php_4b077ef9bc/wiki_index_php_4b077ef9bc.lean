-- 2025 AMC 12A Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12A_Problems/Problem_4

-- Problem (LaTeX):
/-
Agnes writes the following four statements on a blank piece of paper. $\bullet$ At least one of these statements is true. $\bullet$ At least two of these statements are true. $\bullet$ At least two of these statements are false. $\bullet$ At least one of these statements is false. Each statement is either true or false. How many false statements did Agnes write on the paper? $\textbf{(A) } 0 \qquad\textbf{(B) } 1 \qquad\textbf{(C) } 2 \qquad\textbf{(D) } 3 \qquad\textbf{(E) } 4$
-/

-- Solution/Answer (LaTeX):
/-
We first number all the statements: 1) At least one of these statements is true.
2) At least two of these statements are true.
3) At least two of these statements are false.
4) At least one of these statements is false. We can immediately see that statement 4 must be true, as it would contradict itself if it were false. Similarly, statement 1 must be true, as all the other statements must be false if it were false, which is contradictory because statement 4 is true. Since both 1 and 4 are true, statement 2 has to be true. Therefore, statement 3 is the only false statement, making the answer $\boxed{\text{(B) }1}$ .
-Rainjs
-/

import Mathlib.Tactic

theorem wiki_index_php_4b077ef9bc : Prop := by
  sorry
