-- 2022 AIME I Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_I_Problems/Problem_2

-- Problem (LaTeX):
/-
Find the three-digit positive integer $\underline{a}\,\underline{b}\,\underline{c}$ whose representation in base nine is $\underline{b}\,\underline{c}\,\underline{a}_{\,\text{nine}},$ where $a,$ $b,$ and $c$ are (not necessarily distinct) digits.
-/

-- Solution/Answer (LaTeX):
/-
We are given that \[100a + 10b + c = 81b + 9c + a,\] which rearranges to \[99a = 71b + 8c.\] Taking both sides modulo $71,$ we have \begin{align*} 28a &\equiv 8c \pmod{71} \\ 7a &\equiv 2c \pmod{71}. \end{align*} The only solution occurs at $(a,c)=(2,7),$ from which $b=2.$ Therefore, the requested three-digit positive integer is $\underline{a}\,\underline{b}\,\underline{c}=\boxed{227}.$ ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_aaca33c4f8 : Prop := by
  sorry
