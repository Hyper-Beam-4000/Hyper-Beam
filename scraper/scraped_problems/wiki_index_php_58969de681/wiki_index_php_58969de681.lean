-- 2018 AMC 12A Problems/Problem 24
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_24

-- Problem (LaTeX):
/-
Alice, Bob, and Carol play a game in which each of them chooses a real number between $0$ and $1.$ The winner of the game is the one whose number is between the numbers chosen by the other two players. Alice announces that she will choose her number uniformly at random from all the numbers between $0$ and $1,$ and Bob announces that he will choose his number uniformly at random from all the numbers between $\tfrac{1}{2}$ and $\tfrac{2}{3}.$ Armed with this information, what number should Carol choose to maximize her chance of winning? $\textbf{(A) }\frac{1}{2}\qquad \textbf{(B) }\frac{13}{24} \qquad \textbf{(C) }\frac{7}{12} \qquad \textbf{(D) }\frac{5}{8} \qquad \textbf{(E) }\frac{2}{3}\qquad$
-/

-- Solution/Answer (LaTeX):
/-
The expected value of Alice's number is $\frac12\left(0+1\right)=\frac12,$ and the expected value of Bob's number is $\frac12\left(\frac12+\frac23\right)=\frac{7}{12}.$ To maximize her chance of winning, Carol should choose the midpoint between these two expected values. So, the answer is $\frac12\left(\frac12+\frac{7}{12}\right)=\boxed{\textbf{(B) }\frac{13}{24}}.$ Alternatively, once we recognize that the answer lies in the interval $\left(\frac12,\frac{7}{12}\right),$ we should choose $\textbf{(B)}$ since no other answer choices lie in this interval. ~Random_Guy ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_58969de681 : Prop := by
  sorry
