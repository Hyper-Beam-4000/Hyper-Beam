-- 2018 AMC 12B Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12B_Problems/Problem_7

-- Problem (LaTeX):
/-
What is the value of \[\log_37\cdot\log_59\cdot\log_711\cdot\log_913\cdots\log_{21}25\cdot\log_{23}27?\] $\textbf{(A) } 3 \qquad \textbf{(B) } 3\log_{7}23 \qquad \textbf{(C) } 6 \qquad \textbf{(D) } 9 \qquad \textbf{(E) } 10$
-/

-- Solution/Answer (LaTeX):
/-
From the Change of Base Formula, we have \[\frac{\prod_{i=3}^{13} \log (2i+1)}{\prod_{i=1}^{11}\log (2i+1)} = \frac{\log 25 \cdot \log 27}{\log 3 \cdot \log 5} = \frac{(2\log 5)\cdot(3\log 3)}{\log 3 \cdot \log 5} = \boxed{\textbf{(C) } 6}.\]
-/

import Mathlib.Tactic

theorem wiki_index_php_57fb329373 : Prop := by
  sorry
