-- 2019 AMC 12B Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12B_Problems/Problem_13

-- Problem (LaTeX):
/-
A red ball and a green ball are randomly and independently tossed into bins numbered with the positive integers so that for each ball, the probability that it is tossed into bin $k$ is $2^{-k}$ for $k = 1,2,3....$ What is the probability that the red ball is tossed into a higher-numbered bin than the green ball? $\textbf{(A) } \frac{1}{4} \qquad\textbf{(B) } \frac{2}{7} \qquad\textbf{(C) } \frac{1}{3} \qquad\textbf{(D) } \frac{3}{8} \qquad\textbf{(E) } \frac{3}{7}$
-/

-- Solution/Answer (LaTeX):
/-
We see that the total probability will eventually sum to 1 from the infinite geometric series sum formula. Now, if the green ball goes into the \( k=1 \) bin with a \( 1/2 \) chance, then the red ball has a \( \frac{1}{4} + \frac{1}{8} + \frac{1}{16} + \dots = 1/2 \) chance to go to a higher bin. The combined probability is \( 1/2 \cdot 1/2 = 1/4 \). If the green ball goes into the \( k=2 \) bin with \( 1/4 \) chance, then the red ball has a \( 1/8 + 1/16 + \dots = 1/4 \) chance to go to a higher level bin. This probability is \( 1/4 \cdot 1/4 = 1/16 \). So our common ratio is \( 1/4 \), and we use the geometric series sum formula to get \( \frac{1/4}{1 - 1/4} = \) $\boxed{\textbf{(C) } \frac{1}{3}}$ . ~Pinotation
-/

import Mathlib.Tactic

theorem wiki_index_php_f86661b16f : Prop := by
  sorry
