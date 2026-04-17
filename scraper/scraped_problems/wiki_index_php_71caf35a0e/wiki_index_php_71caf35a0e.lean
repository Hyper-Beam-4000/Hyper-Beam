-- 2021 AMC 12B Problems/Problem 20
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12B_Problems/Problem_20

-- Problem (LaTeX):
/-
Let $Q(z)$ and $R(z)$ be the unique polynomials such that \[z^{2021}+1=(z^2+z+1)Q(z)+R(z)\] and the degree of $R$ is less than $2.$ What is $R(z)?$ $\textbf{(A) }{-}z \qquad \textbf{(B) }{-}1 \qquad \textbf{(C) }2021\qquad \textbf{(D) }z+1 \qquad \textbf{(E) }2z+1$
-/

-- Solution/Answer (LaTeX):
/-
Let $z=s$ be a root of $z^2+z+1$ so that $s^2+s+1=0.$ It follows that \[(s-1)\left(s^2+s+1\right)=s^3-1=0,\] from which $s^3=1,$ but $s\neq1.$ Note that \begin{align*} s^{2021}+1 &= s^{3\cdot673+2}+1 \\ &= (s^3)^{673}\cdot s^2+1 \\ &= s^2+1 \\ &= \left(s^2+s+1\right)-s \\ &= -s. \end{align*} Since $z^{2021}+1=-z$ for each root $z=s$ of $z^2+z+1,$ the remainder when $z^{2021}+1$ is divided by $z^2+z+1$ is $R(z)=\boxed{\textbf{(A) }{-}z}.$ ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_71caf35a0e : Prop := by
  sorry
