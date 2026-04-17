-- 2020 AMC 10A Problems/Problem 25
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12A_Problems/Problem_23

-- Problem (LaTeX):
/-
Jason rolls three fair standard six-sided dice. Then he looks at the rolls and chooses a subset of the dice (possibly empty, possibly all three dice) to reroll. After rerolling, he wins if and only if the sum of the numbers face up on the three dice is exactly $7.$ Jason always plays to optimize his chances of winning. What is the probability that he chooses to reroll exactly two of the dice? $\textbf{(A) } \frac{7}{36} \qquad\textbf{(B) } \frac{5}{24} \qquad\textbf{(C) } \frac{2}{9} \qquad\textbf{(D) } \frac{17}{72} \qquad\textbf{(E) } \frac{1}{4}$
-/

-- Solution/Answer (LaTeX):
/-
Consider the probability that rolling two dice gives a sum of $s$ , where $s \leq 7$ . There are $s - 1$ pairs that satisfy this, namely $(1, s - 1), (2, s - 2), \ldots, (s - 1, 1)$ , out of $6^2 = 36$ possible pairs. The probability is $\frac{s - 1}{36}$ . Therefore, if one die has a value of $a$ and Jason rerolls the other two dice, then the probability of winning is $\frac{7 - a - 1}{36} = \frac{6 - a}{36}$ . In order to maximize the probability of winning, $a$ must be minimized. This means that if Jason rerolls two dice, he must choose the two dice with the maximum values. Thus, we can let $a \leq b \leq c$ be the values of the three dice. Consider the case when $a + b < 7$ . If $a + b + c = 7$ , then we do not need to reroll any dice. Otherwise,
if we reroll one die, we can reroll any one dice in the hope that we get the value that makes the sum of the three dice $7$ . This happens with probability $\frac16$ . If we reroll two dice, we will roll the two maximum dice, and the probability of winning is $\frac{6 - a}{36}$ , as stated above. However, $\frac16 > \frac{6 - a}{36}$ , so rolling one die is always better than rolling two dice if $a + b < 7$ . Now consider the case where $a + b \geq 7$ . Rerolling one die will not help us win since the sum of the three dice will always be greater than $7$ . If we reroll two dice, the probability of winning is, once again, $\frac{6 - a}{36}$ . To find the probability of winning if we reroll all three dice, we can let each dice have $1$ dot and find the number of ways to distribute the remaining $4$ dots. By stars and bars, there are ${6\choose2} = 15$ ways to do this, making the probability of winning $\frac{15}{6^3} = \frac5{72}$ . In order for rolling two dice to be more favorable than rolling three dice, $\frac{6 - a}{36} > \frac5{72} \rightarrow a \leq 3$ . Thus, rerolling two dice is optimal if and only if $a \leq 3$ and $a + b \geq 7$ . The possible triplets $(a, b, c)$ that satisfy these conditions, and the number of ways they can be permuted, are $(3, 4, 4) \rightarrow 3$ ways. $(3, 4, 5) \rightarrow 6$ ways. $(3, 4, 6) \rightarrow 6$ ways. $(3, 5, 5) \rightarrow 3$ ways. $(3, 5, 6) \rightarrow 6$ ways. $(3, 6, 6) \rightarrow 3$ ways. $(2, 5, 5) \rightarrow 3$ ways. $(2, 5, 6) \rightarrow 6$ ways. $(2, 6, 6) \rightarrow 3$ ways. $(1, 6, 6) \rightarrow 3$ ways. There are $3 + 6 + 6 + 3 + 6 + 3 + 3 + 6 + 3 + 3 = 42$ ways in which rerolling two dice is optimal, out of $6^3 = 216$ possibilities, Therefore, the probability that Jason will reroll two dice is $\frac{42}{216} = \boxed{\textbf{(A) } \frac{7}{36}}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_1eb4942bc0 : Prop := by
  sorry
