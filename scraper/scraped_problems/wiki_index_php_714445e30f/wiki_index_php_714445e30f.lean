-- 2018 AMC 12B Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12B_Problems/Problem_9

-- Problem (LaTeX):
/-
What is \[\sum^{100}_{i=1} \sum^{100}_{j=1} (i+j) ?\] $\textbf{(A) }100{,}100 \qquad \textbf{(B) }500{,}500\qquad \textbf{(C) }505{,}000 \qquad \textbf{(D) }1{,}001{,}000 \qquad \textbf{(E) }1{,}010{,}000 \qquad$
-/

-- Solution/Answer (LaTeX):
/-
Recall that the sum of the first $100$ positive integers is $\sum^{100}_{k=1} k = \frac{101\cdot100}{2}=5050.$ It follows that \begin{align*} \sum^{100}_{i=1} \sum^{100}_{j=1} (i+j) &= \sum^{100}_{i=1} \sum^{100}_{j=1}i + \sum^{100}_{i=1} \sum^{100}_{j=1}j \\ &= \sum^{100}_{i=1} (100i) + 100 \sum^{100}_{j=1}j \\ &= 100 \sum^{100}_{i=1}i + 100 \sum^{100}_{j=1}j \\ &= 100\cdot5050 + 100\cdot5050 \\ &= \boxed{\textbf{(E) }1{,}010{,}000}. \end{align*} ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_714445e30f : Prop := by
  sorry
