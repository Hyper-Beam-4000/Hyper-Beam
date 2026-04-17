-- 2021 AMC 12A Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_14

-- Problem (LaTeX):
/-
What is the value of \[\left(\sum_{k=1}^{20} \log_{5^k} 3^{k^2}\right)\cdot\left(\sum_{k=1}^{100} \log_{9^k} 25^k\right)?\] $\textbf{(A) }21 \qquad \textbf{(B) }100\log_5 3 \qquad \textbf{(C) }200\log_3 5 \qquad \textbf{(D) }2{,}200\qquad \textbf{(E) }21{,}000$
-/

-- Solution/Answer (LaTeX):
/-
We will apply the following logarithmic identity: \[\log_{p^n}{q^n}=\log_{p}{q},\] which can be proven by the Change of Base Formula: \[\log_{p^n}{q^n}=\frac{\log_{p}{q^n}}{\log_{p}{p^n}}=\frac{n\log_{p}{q}}{n}=\log_{p}{q}.\] Now, we simplify the expressions inside the summations: \begin{align*} \log_{5^k}{{3^k}^2}&=\log_{5^k}{(3^k)^k} \\ &=k\log_{5^k}{3^k} \\ &=k\log_{5}{3}, \end{align*} and \begin{align*} \log_{9^k}{25^k}&=\log_{3^{2k}}{5^{2k}} \\ &=\log_{3}{5}. \end{align*} Using these results, we evaluate the original expression: \begin{align*} \left(\sum_{k=1}^{20} \log_{5^k} 3^{k^2}\right)\cdot\left(\sum_{k=1}^{100} \log_{9^k} 25^k\right)&=\left(\sum_{k=1}^{20} k\log_{5}{3}\right)\cdot\left(\sum_{k=1}^{100} \log_{3}{5}\right) \\ &= \left(\log_{5}{3}\cdot\sum_{k=1}^{20} k\right)\cdot\left(\log_{3}{5}\cdot\sum_{k=1}^{100} 1\right) \\ &= \left(\sum_{k=1}^{20} k\right)\cdot\left(\sum_{k=1}^{100} 1\right) \\ &= \frac{21\cdot20}{2}\cdot100 \\ &= \boxed{\textbf{(E) }21{,}000}. \end{align*} ~MRENTHUSIASM (Solution) ~JHawk0224 (Proposal)
-/

import Mathlib.Tactic

theorem wiki_index_php_e4e73afcd4 : Prop := by
  sorry
