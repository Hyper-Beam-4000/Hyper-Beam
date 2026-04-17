-- 2024 AMC 10A Problems/Problem 23
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_17

-- Problem (LaTeX):
/-
Integers $a$ , $b$ , and $c$ satisfy $ab + c = 100$ , $bc + a = 87$ , and $ca + b = 60$ . What is $ab + bc + ca$ ? $\textbf{(A) }212 \qquad \textbf{(B) }247 \qquad \textbf{(C) }258 \qquad \textbf{(D) }276 \qquad \textbf{(E) }284 \qquad$
-/

-- Solution/Answer (LaTeX):
/-
Subtracting the first two equations yields $(a-c)(b-1)=13$ . Notice that both factors are integers, so $b-1$ could equal one of $13,1,-1,-13$ and $b=14,2,0,-12$ . We consider each case separately: For $b=0$ , from the second equation, we see that $a=87$ . Then $87c=60$ , which is not possible as $c$ is an integer, so this case is invalid. For $b=2$ , we have $2c+a=87$ and $ca=58$ , which by experimentation on the factors of $58$ has no solution, so this is also invalid. For $b=14$ , we have $14c+a=87$ and $ca=46$ , which by experimentation on the factors of $46$ has no solution, so this is also invalid. Thus, we must have $b=-12$ , so $a=12c+87$ and $ca=72$ . Thus $c(12c+87)=72$ , so $c(4c+29)=24$ . We can simply trial and error this to find that $c=-8$ so then $a=-9$ . The answer is then $(-9)(-12)+(-12)(-8)+(-8)(-9)=108+96+72=\boxed{\textbf{(D) }276}$ . By Antony Huang ~Very Minor Edit by lucassf12
-/

import Mathlib.Tactic

theorem wiki_index_php_d5a5a7f9d8 : Prop := by
  sorry
