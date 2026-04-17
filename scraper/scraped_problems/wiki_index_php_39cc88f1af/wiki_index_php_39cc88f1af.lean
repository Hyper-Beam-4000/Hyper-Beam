-- 2025 AMC 12A Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12A_Problems/Problem_1

-- Problem (LaTeX):
/-
Andy and Betsy both live in Mathville. Andy leaves Mathville on his bicycle at $1{:}30$ , traveling due north at a steady $8$ miles per hour. Betsy leaves on her bicycle from the same point at $2{:}30$ , traveling due east at a steady $12$ miles per hour. At what time will they be exactly the same distance from their common starting point? $\textbf{(A) } 3{:}30 \qquad \textbf{(B) } 3{:}45 \qquad \textbf{(C) } 4{:}00 \qquad \textbf{(D) } 4{:}15 \qquad \textbf{(E) } 4{:}30$ == This page has some problems with rendering; thanks to everyone trying to fix it :)
==
-/

-- Solution/Answer (LaTeX):
/-
At $2{:}30$ , Andy is $8$ miles ahead. For every hour that they both travel, Betsy gains $4$ miles on Andy. Therefore, it will take her $2$ more hours to be the same distance from the starting point as Andy, which occurs at $\boxed{\textbf{(E) } 4{:}30}$ . $8h = 12(h-1)$ $\Rightarrow 8h = 12h - 12$ $\Rightarrow 4h = 12$ $\Rightarrow h = 3$ Since Andy started at $1{:}30$ , the catch-up time is $4{:}30$ .
Answer: $\textbf{(E)}$ . Alternatively, from Betsy's perspective: $8(h+1) = 12h$ $\Rightarrow 8h + 8 = 12h$ $\Rightarrow h = 2$ Same result: $\textbf{(E) } 4{:}30$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_39cc88f1af : Prop := by
  sorry
