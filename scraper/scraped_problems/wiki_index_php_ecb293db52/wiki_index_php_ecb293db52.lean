-- 2018 AMC 12B Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12B_Problems/Problem_6

-- Problem (LaTeX):
/-
Suppose $S$ cans of soda can be purchased from a vending machine for $Q$ quarters. Which of the following expressions describes the number of cans of soda that can be purchased for $D$ dollars, where $1$ dollar is worth $4$ quarters? $\textbf{(A) } \frac{4DQ}{S} \qquad \textbf{(B) } \frac{4DS}{Q} \qquad \textbf{(C) } \frac{4Q}{DS} \qquad \textbf{(D) } \frac{DQ}{4S} \qquad \textbf{(E) } \frac{DS}{4Q}$
-/

-- Solution/Answer (LaTeX):
/-
Each can of soda costs $\frac QS$ quarters, or $\frac{Q}{4S}$ dollars. Therefore, $D$ dollars can purchase $\frac{D}{\left(\tfrac{Q}{4S}\right)}=\boxed{\textbf{(B) } \frac{4DS}{Q}}$ cans of soda. ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_ecb293db52 : Prop := by
  sorry
