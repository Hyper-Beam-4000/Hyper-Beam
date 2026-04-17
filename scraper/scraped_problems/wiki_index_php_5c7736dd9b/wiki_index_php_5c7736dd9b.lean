-- 2025 AMC 12B Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_11

-- Problem (LaTeX):
/-
Nine athletes, no two of whom are the same height, try out for the basketball team. One at a time, they draw a wristband at random, without replacement, from a bag containing 3 blue bands, 3 red bands, and 3 green bands. They are divided into a blue group, a red group, and a green group. The tallest member of each group is named the group captain. What is the probability that the group captains are the three tallest athletes? $\textbf{(A) } \dfrac{2}{9} \qquad \textbf{(B) } \dfrac{2}{7} \qquad \textbf{(C) } \dfrac{9}{28} \qquad \textbf{(D) } \dfrac{1}{3} \qquad \textbf{(E) } \dfrac{3}{8}$
-/

-- Solution/Answer (LaTeX):
/-
We will arrange the nine athletes in a line, with the first three being in the blue group, the next three being in the red group, and the last three being in the green group. Suppose the three tallest athletes are named $A, B, C$ , in some order. We have $3!$ ways to choose which group each of these athletes can be in. We then have $3 \cdot 3 \cdot 3$ ways to determine which of the three positions in that group they can take. From here, we must distribute the remaining six athletes in the remaining six spaces, which can be done in $6!$ ways. There are therefore $6 \cdot 27 \cdot 6!$ favorable outcomes. There are also $9!$ total ways to arrange the athletes with no restrictions. Our answer is $\frac{6 \cdot 27 \cdot 6!}{9!} = \frac{6 \cdot 27}{9 \cdot 8 \cdot 7} = \boxed{\textbf{(C) }\frac{9}{28}}.$ ~lprado
-/

import Mathlib.Tactic

theorem wiki_index_php_5c7736dd9b : Prop := by
  sorry
