-- 2021 AMC 12A Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_2

-- Problem (LaTeX):
/-
Under what conditions is $\sqrt{a^2+b^2}=a+b$ true, where $a$ and $b$ are real numbers? $\textbf{(A) }$ It is never true. $\textbf{(B) }$ It is true if and only if $ab=0$ . $\textbf{(C) }$ It is true if and only if $a+b\ge 0$ . $\textbf{(D) }$ It is true if and only if $ab=0$ and $a+b\ge 0$ . $\textbf{(E) }$ It is always true.
-/

-- Solution/Answer (LaTeX):
/-
One can square both sides to get $a^{2}+b^{2}=a^{2}+2ab+b^{2}$ . Then, $0=2ab\implies ab=0$ . Also, it is clear that both sides of the equation must be nonnegative. The answer is $\boxed{\textbf{(D)}}$ . ~Jhawk0224
-/

import Mathlib.Tactic

theorem wiki_index_php_7392897a55 : Prop := by
  sorry
