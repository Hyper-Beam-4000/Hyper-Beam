-- 2020 AMC 12B Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_1

-- Problem (LaTeX):
/-
What is the value in simplest form of the following expression? \[\sqrt{1} + \sqrt{1+3} + \sqrt{1+3+5} + \sqrt{1+3+5+7}\] $\textbf{(A) }5 \qquad \textbf{(B) }4 + \sqrt{7} + \sqrt{10} \qquad \textbf{(C) } 10 \qquad \textbf{(D) } 15 \qquad \textbf{(E) } 4 + 3\sqrt{3} + 2\sqrt{5} + \sqrt{7}$
-/

-- Solution/Answer (LaTeX):
/-
We have \[\sqrt{1} + \sqrt{1+3} + \sqrt{1+3+5} + \sqrt{1+3+5+7} = \sqrt{1} + \sqrt{4} + \sqrt{9} + \sqrt{16}\ = 1 + 2 + 3 + 4 = \boxed{\textbf{(C) } 10}.\] Note: This comes from the fact that the sum of the first $n$ odds is $n^2$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_279075036e : Prop := by
  sorry
