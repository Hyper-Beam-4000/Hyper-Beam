-- 2020 AMC 10B Problems/Problem 18
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_16

-- Problem (LaTeX):
/-
An urn contains one red ball and one blue ball. A box of extra red and blue balls lies nearby. George performs the following operation four times: he draws a ball from the urn at random and then takes a ball of the same color from the box and returns those two matching balls to the urn. After the four iterations the urn contains six balls. What is the probability that the urn contains three balls of each color? $\textbf{(A) } \frac16 \qquad \textbf{(B) }\frac15 \qquad \textbf{(C) } \frac14 \qquad \textbf{(D) } \frac13 \qquad \textbf{(E) } \frac12$
-/

-- Solution/Answer (LaTeX):
/-
Suppose that we have a deck, currently containing just one black card. We then insert $n$ red cards one-by-one into the deck at random positions. It is easy to see using induction, that the black card is randomly situated in the deck. Now, suppose that we have this deck again, with only one black card. Each time we pick a red ball, we place a card above the black card, and each time we pick a blue ball, we place a card below the black card. It is easy to see that the probability that the card is inserted into the top part of the deck is simply equal to the number of red balls divided by the total number of balls, and the probability that the card is inserted into the bottom part of the deck is equal to the number of blue balls divided by the total number of balls. Therefore, this is equivalent to inserting the card randomly into the deck. Finally, four more red cards will be inserted into the deck, and so the black card can be in five possible positions. Only one corresponds to having three balls of each type. Our probability is thus $\frac{1}{5}$ , and so the answer is $\boxed{\textbf{B}}$ . ~mathboy100
-/

import Mathlib.Tactic

theorem wiki_index_php_4d4a89d8bc : Prop := by
  sorry
