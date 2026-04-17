-- 2021 AMC 12B Problems/Problem 18
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12B_Problems/Problem_18

-- Problem (LaTeX):
/-
Let $z$ be a complex number satisfying $12|z|^2=2|z+2|^2+|z^2+1|^2+31.$ What is the value of $z+\frac 6z?$ $\textbf{(A) }-2 \qquad \textbf{(B) }-1 \qquad \textbf{(C) }\frac12\qquad \textbf{(D) }1 \qquad \textbf{(E) }4$
-/

-- Solution/Answer (LaTeX):
/-
Using the fact $z\bar{z}=|z|^2$ , the equation rewrites itself as \begin{align*} 12z\bar{z}&=2(z+2)(\bar{z}+2)+(z^2+1)(\bar{z}^2+1)+31 \\ -12z\bar{z}+2z\bar{z}+4(z+\bar{z})+8+z^2\bar{z}^2+(z^2+\bar{z}^2)+32&=0 \\ \left((z^2+2z\bar{z}+\bar{z}^2)+4(z+\bar{z})+4\right)+\left(z^2\bar{z}^2-12z\bar{z}+36\right)&=0 \\ (z+\bar{z}+2)^2+(z\bar{z}-6)^2&=0. \end{align*} As the two quantities in the parentheses are real, both quantities must equal $0$ so \[z+\frac6z=z+\bar{z}=\boxed{\textbf{(A) }-2}.\]
-/

import Mathlib.Tactic

theorem wiki_index_php_bb46dc177b : Prop := by
  sorry
