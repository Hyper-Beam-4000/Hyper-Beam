-- 2023 AMC 12A Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_8

-- Problem (LaTeX):
/-
Maureen is keeping track of the mean of her quiz scores this semester. If Maureen scores an $11$ on the next quiz, her mean will increase by $1$ . If she scores an $11$ on each of the next three quizzes, her mean will increase by $2$ . What is the mean of her quiz scores currently? $\textbf{(A) }4\qquad\textbf{(B) }5\qquad\textbf{(C) }6\qquad\textbf{(D) }7\qquad\textbf{(E) }8$
-/

-- Solution/Answer (LaTeX):
/-
Let $a$ represent the amount of tests taken previously and $x$ the mean of the scores taken previously. We can write the following equations: \[\frac{ax+11}{a+1}=x+1\qquad (1)\] \[\frac{ax+33}{a+3}=x+2\qquad (2)\] Multiplying equation $(1)$ by $(a+1)$ and solving, we get: \[ax+11=ax+a+x+1\] \[11=a+x+1\] \[a+x=10\qquad (3)\] Multiplying equation $(2)$ by $(a+3)$ and solving, we get: \[ax+33=ax+2a+3x+6\] \[33=2a+3x+6\] \[2a+3x=27\qquad (4)\] Solving the system of equations for $(3)$ and $(4)$ , we find that $a=3$ and $x=\boxed{\textbf{(D) }7}$ . ~ Larry Page (Yes, it's really me)
-/

import Mathlib.Tactic

theorem wiki_index_php_0c13d4d7e5 : Prop := by
  sorry
