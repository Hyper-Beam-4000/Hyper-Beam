-- 2023 AMC 12B Problems/Problem 20
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_20

-- Problem (LaTeX):
/-
Cyrus the frog jumps $2$ units in a direction, then $2$ more in another direction. What is the probability that he lands less than $1$ unit away from his starting position? $\textbf{(A)}~\frac{1}{6}\qquad\textbf{(B)}~\frac{1}{5}\qquad\textbf{(C)}~\frac{\sqrt{3}}{8}\qquad\textbf{(D)}~\frac{\arctan \frac{1}{2}}{\pi}\qquad\textbf{(E)}~\frac{2\arcsin \frac{1}{4}}{\pi}$
-/

-- Solution/Answer (LaTeX):
/-
Let Cyrus's starting position be $S$ . WLOG, let the place Cyrus lands at for his first jump be $O$ . From $O$ , Cyrus can reach all the points on $\odot O$ . The probability that Cyrus will land less than $1$ unit away from $S$ is $\frac{4 \alpha }{ 2 \pi}$ . \[\sin \alpha = \frac{ \frac12 }{2} = \frac14, \quad \alpha = \arcsin \frac14\] Therefore, the answer is \[\frac{4 \arcsin \frac14 }{ 2 \pi} = \boxed{\textbf{(E) } \frac{2 \arcsin \frac{1}{4}}{\pi}}\] ~ isabelchen
-/

import Mathlib.Tactic

theorem wiki_index_php_1b21a120ef : Prop := by
  sorry
