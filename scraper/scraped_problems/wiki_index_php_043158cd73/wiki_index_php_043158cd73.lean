-- 2023 AMC 12B Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_9

-- Problem (LaTeX):
/-
What is the area of the region in the coordinate plane defined by $| | x | - 1 | + | | y | - 1 | \le 1$ ? $\text{(A)}\ 2 \qquad \text{(B)}\ 8 \qquad \text{(C)}\ 4 \qquad \text{(D)}\ 15 \qquad \text{(E)}\ 12$
-/

-- Solution/Answer (LaTeX):
/-
First consider, $|x-1|+|y-1| \le 1.$ We can see that it is a square with a side length of $\sqrt{2}$ (diagonal $2$ ). The area of the square is $\sqrt{2}^2 = 2.$ Next, we insert an absolute value sign into the equation and get $|x-1|+||y|-1| \le 1.$ This will double the square reflecting over x-axis. So now we have $2$ squares. Finally, we add one more absolute value and obtain $||x|-1|+||y|-1| \le 1.$ This will double the squares as we reflect the $2$ squares we already have over the y-axis. Concluding, we have $4$ congruent squares. Thus, the total area is $4\cdot2 =$ $\boxed{\text{(B) 8}}$ ~Technodoggo ~Minor formatting change: e_is_2.71828, mathkiddus ~Grammar and clarity: NSAoPS
j
-/

import Mathlib.Tactic

theorem wiki_index_php_043158cd73 : Prop := by
  sorry
