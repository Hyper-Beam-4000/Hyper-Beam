-- 2017 AMC 12A Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12A_Problems/Problem_10

-- Problem (LaTeX):
/-
Chloe chooses a real number uniformly at random from the interval $[ 0,2017 ]$ . Independently, Laurent chooses a real number uniformly at random from the interval $[ 0 , 4034 ]$ . What is the probability that Laurent's number is greater than Chloe's number? $\textbf{(A)}\ \dfrac{1}{2} \qquad\textbf{(B)}\ \dfrac{2}{3} \qquad\textbf{(C)}\ \dfrac{3}{4} \qquad\textbf{(D)}\ \dfrac{5}{6} \qquad\textbf{(E)}\ \dfrac{7}{8}$
-/

-- Solution/Answer (LaTeX):
/-
Suppose Laurent's number is in the interval $[ 0, 2017 ]$ . Then, by symmetry, the probability of Laurent's number being greater is $\dfrac{1}{2}$ . Next, suppose Laurent's number is in the interval $[ 2017, 4034 ]$ . Then Laurent's number will be greater with a probability of $1$ . Since each case is equally likely, the probability of Laurent's number being greater is $\dfrac{1 + \frac{1}{2}}{2} = \dfrac{3}{4}$ , so the answer is $\boxed{C}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_4ca91b9c82 : Prop := by
  sorry
