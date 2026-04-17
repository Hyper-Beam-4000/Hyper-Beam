-- 2024 AMC 12B Problems/Problem 17
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_17

-- Problem (LaTeX):
/-
Integers $a$ and $b$ are randomly chosen without replacement from the set of integers with absolute value not exceeding $10$ . What is the probability that the polynomial $x^3 + ax^2 + bx + 6$ has $3$ distinct integer roots? $\textbf{(A) } \frac{1}{240} \qquad \textbf{(B) } \frac{1}{221} \qquad \textbf{(C) } \frac{1}{105} \qquad \textbf{(D) } \frac{1}{84} \qquad \textbf{(E) } \frac{1}{63}$ .
-/

-- Solution/Answer (LaTeX):
/-
Since $-10 \le a,b \le 10$ , there are 21 integers to choose from, and $P(21,2) = 21 \times 20 = 420$ equally likely ordered pairs $(a,b)$ . Applying Vieta's formulas, $x_1 \cdot x_2 \cdot x_3 = -6$ $x_1 + x_2+ x_3 = -a$ $x_1 \cdot x_2 + x_1 \cdot x_3 + x_3 \cdot x_2 = b$ Cases: (1) $(x_1,x_2,x_3) = (-1,1,6) , b = -1, a=-6$ valid (2) $(x_1,x_2,x_3) = ( 1,2,-3) , b = -7, a=0$ valid (3) $(x_1,x_2,x_3) = (1,-2,3) , b = -5, a=-2$ valid (4) $(x_1,x_2,x_3) = (-1,2,3) , b = 1, a=-4$ valid (5) $(x_1,x_2,x_3) = (-1,-2,-3) , b = 11$ invalid the total event space is $21 \cdot (21- 1)$ (choice of select a times choice of selecting b given no-replacement) hence, our answer is $\frac{4}{21 \cdot 20} = \boxed{\textbf{(C) }\frac{1}{105}}$ ~ luckuso
-/

import Mathlib.Tactic

theorem wiki_index_php_74c4dd8d6e : Prop := by
  sorry
