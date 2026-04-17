-- 2021 AMC 12A Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_6

-- Problem (LaTeX):
/-
A deck of cards has only red cards and black cards. The probability of a randomly chosen card being red is $\frac13$ . When $4$ black cards are added to the deck, the probability of choosing red becomes $\frac14$ . How many cards were in the deck originally? $\textbf{(A) }6 \qquad \textbf{(B) }9 \qquad \textbf{(C) }12 \qquad \textbf{(D) }15 \qquad \textbf{(E) }18$
-/

-- Solution/Answer (LaTeX):
/-
If the probability of choosing a red card is $\frac{1}{3}$ , the red and black cards are in ratio $1:2$ . This means at the beginning there are $x$ red cards and $2x$ black cards. After $4$ black cards are added, there are $2x+4$ black cards. This time, the probability of choosing a red card is $\frac{1}{4}$ so the ratio of red to black cards is $1:3$ . This means in the new deck the number of black cards is also $3x$ for the same $x$ red cards. So, $3x = 2x + 4$ and $x=4$ meaning there are $4$ red cards in the deck at the start and $2(4) = 8$ black cards. So, the answer is $8+4 = 12 = \boxed{\textbf{(C) }12}$ . --abhinavg0627
-/

import Mathlib.Tactic

theorem wiki_index_php_3f6d329c09 : Prop := by
  sorry
