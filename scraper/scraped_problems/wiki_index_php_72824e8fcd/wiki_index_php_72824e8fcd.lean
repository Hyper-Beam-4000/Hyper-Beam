-- 2018 USAMO Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_USAMO_Problems/Problem_1

-- Problem (LaTeX):
/-
Let $a,b,c$ be positive real numbers such that $a+b+c=4\sqrt[3]{abc}$ . Prove that \[2(ab+bc+ca)+4\min(a^2,b^2,c^2)\ge a^2+b^2+c^2.\]
-/

-- Solution/Answer (LaTeX):
/-
WLOG let $a \leq b \leq c$ . Add $2(ab+bc+ca)$ to both sides of the inequality and factor to get: \[4(a(a+b+c)+bc) \geq (a+b+c)^2\] \[\frac{4a\sqrt[3]{abc}+bc}{2} \geq 2\sqrt[3]{a^2b^2c^2}\] The last inequality is true by AM-GM. Since all these steps are reversible, the proof is complete. - It should actually be 4(a)(a+b+c) + 4bc which results in a wrong inequality by AM-GM Hence, the solution is wrong.
-/

import Mathlib.Tactic

theorem wiki_index_php_72824e8fcd : Prop := by
  sorry
