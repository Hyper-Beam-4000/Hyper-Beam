-- 2020 AMC 10B Problems/Problem 16
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_14

-- Problem (LaTeX):
/-
Bela and Jenn play the following game on the closed interval $[0, n]$ of the real number line, where $n$ is a fixed integer greater than $4$ . They take turns playing, with Bela going first. At his first turn, Bela chooses any real number in the interval $[0, n]$ . Thereafter, the player whose turn it is chooses a real number that is more than one unit away from all numbers previously chosen by either player. A player unable to choose such a number loses. Using optimal strategy, which player will win the game? $\textbf{(A)} \text{ Bela will always win.} \qquad \textbf{(B)} \text{ Jenn will always win.} \qquad \textbf{(C)} \text{ Bela will win if and only if }n \text{ is odd.} \\ \textbf{(D)} \text{ Jenn will win if and only if }n \text{ is odd.} \qquad \textbf{(E)} \text { Jenn will win if and only if } n>8.$
-/

-- Solution/Answer (LaTeX):
/-
We use game theory. Notice how they say Optimal Strategy. This means that each player plays the best move in any scene. We then solve through cases. We set \( n > 4 \), \( n \) is even. Say \( n = 10 \). Then, we see that Bela could pick either 3 or 4, and then Jenn would be forced to choose either 1(2), 5, or 6. But notice how you can only make one move, and 1 and \( [5,6] \) are on opposite sides. So therefore, Bela will always win. We set \( n > 4 \), \( n \) is odd. Say \( n = 9 \). This is even easier! Bela could just choose the middle, and then again, Jenn would be forced to pick a move that Bela could just replicate and win. So, Bela will also always win. Through deduction, our answer is $\boxed{\textbf{(A)} \text{ Bela will always win.}}$ $\textit{But that's just a theory, a game theory!}$ ~Pinotation
-/

import Mathlib.Tactic

theorem wiki_index_php_cd44a76823 : Prop := by
  sorry
