-- 2023 AMC 12A Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_4

-- Problem (LaTeX):
/-
How many digits are in the base-ten representation of $8^5 \cdot 5^{10} \cdot 15^5$ ? $\textbf{(A) } 14 \qquad\textbf{(B) }15 \qquad\textbf{(C) }16 \qquad\textbf{(D) }17 \qquad\textbf{(E) } 18$
-/

-- Solution/Answer (LaTeX):
/-
Prime factorizing this gives us $2^{15}\cdot3^{5}\cdot5^{15}=10^{15}\cdot3^5=243\cdot10^{15}$ . $10^{15}$ has $16$ digits and $243$ = $2.43*10^{2}$ gives us $3$ more digits. $16+2=\text{\boxed{\textbf{(E) }18}}$ $2.43*10^{17}$ has $18$ digits ~zhenghua
-/

import Mathlib.Tactic

theorem wiki_index_php_5140e4ca22 : Prop := by
  sorry
