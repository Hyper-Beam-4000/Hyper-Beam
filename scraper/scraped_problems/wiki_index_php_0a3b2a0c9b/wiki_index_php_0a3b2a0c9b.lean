-- 2025 AMC 12B Problems/Problem 18
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_18

-- Problem (LaTeX):
/-
Awnik repeatedly plays a game that has a probability of winning of $\frac{1}{3}$ . The outcomes of the games are independent. What is the expected value of the number of games he will play until he has both won and lost at least once? $\textbf{(A) } \frac{5}{2} \qquad \textbf{(B) } 3 \qquad \textbf{(C) } \frac{16}{5} \qquad \textbf{(D) } \frac{7}{2} \qquad \textbf{(E) } \frac{15}{4}$
-/

-- Solution/Answer (LaTeX):
/-
Let the probability of a win be $p$ and the probability of a loss be $q$ . If the first game is a win, then we must find the expected number of further games to get a loss, which will be $\frac{1}{q}$ . In addition to the first game played, there will be $1+\frac{1}{q}$ games played. Therefore, the expected number of games needed to get a win on game $1$ and then a loss is $(p)\left(1+\frac{1}{q}\right).$ Similarly, if the first game is a loss, we need to the find the expected number of further games to get a win, which will be $\frac{1}{p}$ . There will be a total of $1+\frac{1}{p}$ games played. Therefore, the expected number of games needed to get a loss on game $1$ and then a win is $(q)\left(1+\frac{1}{p}\right).$ The answer is \[(p)\left(1+\frac{1}{q}\right) + (q)\left(1+\frac{1}{p}\right)\] \[\left(\frac{1}{3}\right) \left(1+\frac{3}{2}\right) + \left(\frac{2}{3}\right)(1+3) = \frac{5}{6} + \frac{8}{3} = \boxed{\frac{7}{2}}.\] ~lprado
-/

import Mathlib.Tactic

theorem wiki_index_php_0a3b2a0c9b : Prop := by
  sorry
