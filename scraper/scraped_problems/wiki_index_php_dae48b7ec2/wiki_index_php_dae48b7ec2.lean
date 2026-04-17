-- 2023 AIME II Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AIME_II_Problems/Problem_4

-- Problem (LaTeX):
/-
Let $x,y,$ and $z$ be real numbers satisfying the system of equations \begin{align*} xy + 4z &= 60 \\ yz + 4x &= 60 \\ zx + 4y &= 60. \end{align*} Let $S$ be the set of possible values of $x.$ Find the sum of the squares of the elements of $S.$
-/

-- Solution/Answer (LaTeX):
/-
We first subtract the second equation from the first, noting that they both equal $60$ . \begin{align*} xy+4z-yz-4x&=0 \\ 4(z-x)-y(z-x)&=0 \\ (z-x)(4-y)&=0 \end{align*} Case 1: Let $y=4$ . The first and third equations simplify to: \begin{align*} x+z&=15 \\ xz&=44 \end{align*} from which it is apparent that $x=4$ and $x=11$ are solutions. Case 2: Let $x=z$ . The first and third equations simplify to: \begin{align*} xy+4x&=60 \\ x^2+4y&=60 \end{align*} We subtract the following equations, yielding: \begin{align*} x^2+4y-xy-4x&=0 \\ x(x-4)-y(x-4)&=0 \\ (x-4)(x-y)&=0 \end{align*} We thus have $x=4$ and $x=y$ , substituting in $x=y=z$ and solving yields $x=6$ and $x=-10$ . Then, we just add the squares of the solutions (make sure not to double count the $4$ ), and get \[4^2+11^2+6^2+(-10)^2=16+121+36+100=\boxed{273}.\] ~SAHANWIJETUNGA
-/

import Mathlib.Tactic

theorem wiki_index_php_dae48b7ec2 : Prop := by
  sorry
