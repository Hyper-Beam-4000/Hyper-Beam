-- 2022 AMC 10A Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_1

-- Problem (LaTeX):
/-
What is the value of \[3+\frac{1}{3+\frac{1}{3+\frac13}}?\] $\textbf{(A)}\ \frac{31}{10}\qquad\textbf{(B)}\ \frac{49}{15}\qquad\textbf{(C)}\ \frac{33}{10}\qquad\textbf{(D)}\ \frac{109}{33}\qquad\textbf{(E)}\ \frac{15}{4}$
-/

-- Solution/Answer (LaTeX):
/-
We have \begin{align*} 3+\frac{1}{3+\frac{1}{3+\frac13}} &= 3+\frac{1}{3+\frac{1}{\left(\frac{10}{3}\right)}} \\ &= 3+\frac{1}{3+\frac{3}{10}} \\ &= 3+\frac{1}{\left(\frac{33}{10}\right)} \\ &= 3+\frac{10}{33} \\ &= \boxed{\textbf{(D)}\ \frac{109}{33}}. \end{align*} ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_b5fb4594bd : Prop := by
  sorry
