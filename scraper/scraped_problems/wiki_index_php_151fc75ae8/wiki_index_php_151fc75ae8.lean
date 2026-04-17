-- 2018 AIME II Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_II_Problems/Problem_13

-- Problem (LaTeX):
/-
Misha rolls a standard, fair six-sided die until she rolls $1-2-3$ in that order on three consecutive rolls. The probability that she will roll the die an odd number of times is $\dfrac{m}{n}$ where $m$ and $n$ are relatively prime positive integers. Find $m+n$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $P_{odd}=\frac{m}{n}$ , with the subscript indicating an odd number of rolls. Then $P_{even}=1-\frac{m}{n}$ . The ratio of $\frac{P_{odd}}{P_{even}}$ is just $\frac{P_{odd}}{1-P_{odd}}$ . We see that $P_{odd}$ is the sum of $P_3$ , $P_5$ , $P_7$ ,... , while $P_{even}$ is the sum of $P_4$ , $P_6$ , $P_8$ ,... . $P_3$ , the probability of getting rolls of 1-2-3 in exactly 3 rolls, is obviously $\frac{1}{216}$ . We set this probability of $P_3$ aside, meaning we totally remove the chance of getting 1-2-3 in 3 rolls. Now the ratio of $P_4+P_6+P_8+...$ to $P_5+P_7+P_9+...$ should be equal to the ratio of $\frac{P_{odd}}{P_{even}}$ , because in this case the 1st roll no longer matters, so we can disregard the very existence of it in counting how many times of rolls, and thus, 4 rolls, 6 rolls, 8 rolls... would become an odd number of rolls (while 5 rolls, 7 rolls, 9 rolls... would become even number of rolls). Notice $P_4+P_6+P_8+...=P_{even}$ , and also $P_5+P_7+P_9+...=P_{odd}-P_3=P_{odd}-\frac{1}{216}$ So we have $\frac{P_{even}}{P_{odd}-\frac{1}{216}}=\frac{P_{odd}}{P_{even}}$ . Finally, we get $P_{odd}=\frac{m}{n}=\frac{216}{431}$ .
Therefore, $m+n = \boxed{647}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_151fc75ae8 : Prop := by
  sorry
