-- 2022 AMC 12B Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12B_Problems/Problem_12

-- Problem (LaTeX):
/-
Kayla rolls four fair $6$ -sided dice. What is the probability that at least one of the numbers Kayla rolls is greater than $4$ and at least two of the numbers she rolls are greater than $2$ ? $\textbf{(A)}\ \frac{2}{3} \qquad \textbf{(B)}\ \frac{19}{27} \qquad \textbf{(C)}\ \frac{59}{81} \qquad \textbf{(D)}\ \frac{61}{81} \qquad \textbf{(E)}\ \frac{7}{9}$
-/

-- Solution/Answer (LaTeX):
/-
We will subtract from one the probability that the first condition is violated and the probability that only the second condition is violated, being careful not to double-count the probability that both conditions are violated. For the first condition to be violated, all four dice must read $4$ or less, which happens with probability $\left( \frac23 \right)^4 = \frac{16}{81}$ . For the first condition to be met but the second condition to be violated, at least one of the dice must read greater than $4$ , but less than two of the dice can read greater than $2$ . Therefore, one of the four die must read $5$ or $6$ , while the remaining three dice must read $2$ or less, which happens with probability ${4 \choose 1} \left(\frac13\right) \left(\frac13\right)^3 = 4 \cdot \frac13 \cdot \frac{1}{27} = \frac{4}{81}$ . Therefore, the overall probability of meeting both conditions is $1 - \frac{16}{81} - \frac{4}{81} = \boxed{\textbf{(D)}\ \frac{61}{81}}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_e2667f7fe0 : Prop := by
  sorry
