-- 2018 AMC 10A Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_7

-- Problem (LaTeX):
/-
For how many (not necessarily positive) integer values of $n$ is the value of $4000\cdot \left(\tfrac{2}{5}\right)^n$ an integer? $\textbf{(A) }3 \qquad \textbf{(B) }4 \qquad \textbf{(C) }6 \qquad \textbf{(D) }8 \qquad \textbf{(E) }9 \qquad$
-/

-- Solution/Answer (LaTeX):
/-
Note that \[4000\cdot \left(\frac{2}{5}\right)^n=\left(2^5\cdot5^3\right)\cdot \left(2\cdot5^{-1}\right)^n=2^{5+n}\cdot5^{3-n}.\] Since this expression is an integer, we need: $5+n\geq0,$ from which $n\geq-5.$ $3-n\geq0,$ from which $n\leq3.$ Taking the intersection gives $-5\leq n\leq3.$ So, there are $3-(-5)+1=\boxed{\textbf{(E) }9}$ integer values of $n.$ ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_055aae6124 : Prop := by
  sorry
