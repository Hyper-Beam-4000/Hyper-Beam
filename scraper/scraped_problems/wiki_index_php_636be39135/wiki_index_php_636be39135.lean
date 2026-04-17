-- 2022 AIME II Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_II_Problems/Problem_2

-- Problem (LaTeX):
/-
Azar, Carl, Jon, and Sergey are the four players left in a singles tennis tournament. They are randomly assigned opponents in the semifinal matches, and the winners of those matches play each other in the final match to determine the winner of the tournament. When Azar plays Carl, Azar will win the match with probability $\frac23$ . When either Azar or Carl plays either Jon or Sergey, Azar or Carl will win the match with probability $\frac34$ . Assume that outcomes of different matches are independent. The probability that Carl will win the tournament is $\frac{p}{q}$ , where $p$ and $q$ are relatively prime positive integers. Find $p+q$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $A$ be Azar, $C$ be Carl, $J$ be Jon, and $S$ be Sergey. The $4$ circles represent the $4$ players, and the arrow is from the winner to the loser with the winning probability as the label. This problem can be solved by using $2$ cases. $\textbf{Case 1:}$ $C$ 's opponent for the semifinal is $A$ The probability $C$ 's opponent is $A$ is $\frac13$ . Therefore the probability $C$ wins the semifinal in this case is $\frac13 \cdot \frac13$ . The other semifinal game is played between $J$ and $S$ , it doesn't matter who wins because $C$ has the same probability of winning either one. The probability of $C$ winning in the final is $\frac34$ , so the probability of $C$ winning the tournament in case 1 is $\frac13 \cdot \frac13 \cdot \frac34$ $\textbf{Case 2:}$ $C$ 's opponent for the semifinal is $J$ or $S$ It doesn't matter if $C$ 's opponent is $J$ or $S$ because $C$ has the same probability of winning either one. The probability $C$ 's opponent is $J$ or $S$ is $\frac23$ . Therefore the probability $C$ wins the semifinal in this case is $\frac23 \cdot \frac34$ . The other semifinal game is played between $A$ and $J$ or $S$ . In this case it matters who wins in the other semifinal game because the probability of $C$ winning $A$ and $J$ or $S$ is different. $\textbf{Case 2.1:}$ $C$ 's opponent for the final is $A$ For this to happen, $A$ must have won $J$ or $S$ in the semifinal, the probability is $\frac34$ . Therefore, the probability that $C$ won $A$ in the final is $\frac34 \cdot \frac13$ . $\textbf{Case 2.2:}$ $C$ 's opponent for the final is $J$ or $S$ For this to happen, $J$ or $S$ must have won $A$ in the semifinal, the probability is $\frac14$ . Therefore, the probability that $C$ won $J$ or $S$ in the final is $\frac14 \cdot \frac34$ . In Case 2 the probability of $C$ winning the tournament is $\frac23 \cdot \frac34 \cdot (\frac34 \cdot \frac13 + \frac14 \cdot \frac34)$ Adding case 1 and case 2 together we get $\frac13 \cdot \frac13 \cdot \frac34 + \frac23 \cdot \frac34 \cdot (\frac34 \cdot \frac13 + \frac14 \cdot \frac34) = \frac{29}{96},$ so the answer is $29 + 96 = \boxed{\textbf{125}}$ . ~ isabelchen
-/

import Mathlib.Tactic

theorem wiki_index_php_636be39135 : Prop := by
  sorry
