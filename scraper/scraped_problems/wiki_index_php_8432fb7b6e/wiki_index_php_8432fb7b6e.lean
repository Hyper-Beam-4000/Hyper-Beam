-- 2024 AMC 12B Problems/Problem 15
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_15

-- Problem (LaTeX):
/-
A triangle in the coordinate plane has vertices $A(\log_21,\log_22)$ , $B(\log_23,\log_24)$ , and $C(\log_27,\log_28)$ . What is the area of $\triangle ABC$ ? $\textbf{(A) }\log_2\frac{\sqrt3}7\qquad \textbf{(B) }\log_2\frac3{\sqrt7}\qquad \textbf{(C) }\log_2\frac7{\sqrt3}\qquad \textbf{(D) }\log_2\frac{11}{\sqrt7}\qquad \textbf{(E) }\log_2\frac{11}{\sqrt3}\qquad$
-/

-- Solution/Answer (LaTeX):
/-
We rewrite: $A(0,1)$ $B(\log _{2} 3, 2)$ $C(\log _{2} 7, 3)$ . From here we setup Shoelace Theorem and obtain: $\frac{1}{2}(2(\log _{2} 3) - log _{2} 7)$ . Following log properties and simplifying gives $\boxed{\textbf{(B) }\log_2 \frac{3}{\sqrt{7}}}$ . ~MendenhallIsBald, ShortPeopleFartalot
-/

import Mathlib.Tactic

theorem wiki_index_php_8432fb7b6e : Prop := by
  sorry
