-- 2018 AMC 12A Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_14

-- Problem (LaTeX):
/-
The solution to the equation $\log_{3x} 4 = \log_{2x} 8$ , where $x$ is a positive real number other than $\frac{1}{3}$ or $\frac{1}{2}$ , can be written as $\frac {p}{q}$ where $p$ and $q$ are relatively prime positive integers. What is $p + q$ ? $\textbf{(A) } 5 \qquad \textbf{(B) } 13 \qquad \textbf{(C) } 17 \qquad \textbf{(D) } 31 \qquad \textbf{(E) } 35$
-/

-- Solution/Answer (LaTeX):
/-
We apply the Change of Base Formula, then rearrange: \begin{align*} \frac{\log_2{4}}{\log_2{(3x)}}&=\frac{\log_2{8}}{\log_2{(2x)}} \\ \frac{2}{\log_2{(3x)}}&=\frac{3}{\log_2{(2x)}} \\ 3\log_2{(3x)}&=2\log_2{(2x)}. \\ \end{align*} By the logarithmic identity $n\log_b{a}=\log_b{\left(a^n\right)},$ it follows that \begin{align*} \log_2{\left[(3x)^3\right]}&=\log_2{\left[(2x)^2\right]} \\ (3x)^3&=(2x)^2 \\ 27x^3&=4x^2 \\ x&=\frac{4}{27}, \end{align*} from which the answer is $4+27=\boxed{\textbf{(D) } 31}.$ ~jeremylu (Fundamental Logic) ~MRENTHUSIASM (Reconstruction)
-/

import Mathlib.Tactic

theorem wiki_index_php_453cb76364 : Prop := by
  sorry
