-- 2023 AIME I Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AIME_I_Problems/Problem_6

-- Problem (LaTeX):
/-
Alice knows that $3$ red cards and $3$ black cards will be revealed to her one at a time in random order. Before each card is revealed, Alice must guess its color. If Alice plays optimally, the expected number of cards she will guess correctly is $\frac{m}{n},$ where $m$ and $n$ are relatively prime positive integers. Find $m+n.$
-/

-- Solution/Answer (LaTeX):
/-
We break the problem into stages, one for each card revealed, then further into cases based on the number of remaining unrevealed cards of each color. Since expected value is linear, the expected value of the total number of correct card color guesses across all stages is the sum of the expected values of the number of correct card color guesses at each stage; that is, we add the probabilities of correctly guessing the color at each stage to get the final answer (See https://brilliant.org/wiki/linearity-of-expectation/ ) At any stage, if there are $a$ unrevealed cards of one color and $b$ of the other color, and $a \geq b$ , then the optimal strategy is to guess the color with $a$ unrevealed cards, which succeeds with probability $\frac{a}{a+b}.$ Stage 1: There are always $3$ unrevealed cards of each color, so the probability of guessing correctly is $\frac{1}{2}$ . Stage 2: There is always a $3$ - $2$ split ( $3$ unrevealed cards of one color and $2$ of the other color), so the probability of guessing correctly is $\frac{3}{5}$ . Stage 3: There are now $2$ cases: The guess from Stage 2 was correct, so there is now a $2$ - $2$ split of cards and a $\frac{1}{2}$ probability of guessing the color of the third card correctly. The guess from Stage 2 was incorrect, so the split is $3$ - $1$ and the probability of guessing correctly is $\frac{3}{4}$ . Thus, the overall probability of guessing correctly is $\frac{3}{5} \cdot \frac{1}{2} + \frac{2}{5} \cdot \frac{3}{4} = \frac{3}{5}$ . Stage 4: This stage has $2$ cases as well: The guesses from both Stage 2 and Stage 3 were incorrect. This occurs with probability $\frac{2}{5} \cdot \frac{1}{4} = \frac{1}{10}$ and results in a $3$ - $0$ split and a certain correct guess at this stage. Otherwise, there must be a $2$ - $1$ split and a $\frac{2}{3}$ probability of guessing correctly. The probability of guessing the fourth card correctly is therefore $\frac{1}{10} \cdot 1 + \frac{9}{10} \cdot \frac{2}{3} = \frac{7}{10}$ . Stage 5: Yet again, there are $2$ cases: In Stage 4, there was a $2$ - $1$ split and the guess was correct. This occurs with probability $\frac{9}{10} \cdot \frac{2}{3} = \frac{3}{5}$ and results in a $1$ - $1$ split with a $\frac{1}{2}$ chance of a correct guess here. Otherwise, there must be a $2$ - $0$ split, making a correct guess certain. In total, the fifth card can be guessed correctly with probability $\frac{3}{5} \cdot \frac{1}{2} + \frac{2}{5} \cdot 1 = \frac{7}{10}$ . Stage 6: At this point, only $1$ card remains, so the probability of guessing its color correctly is $1$ . In conclusion, the expected value of the number of cards guessed correctly is \[\frac{1}{2} + \frac{3}{5} + \frac{3}{5} + \frac{7}{10} + \frac{7}{10} + 1 = \frac{5+6+6+7+7+10}{10} = \frac{41}{10},\] so the answer is $41 + 10 = \boxed{051}.$ ~OrangeQuail9
-/

import Mathlib.Tactic

theorem wiki_index_php_6dc9d48eff : Prop := by
  sorry
