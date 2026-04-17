-- 2021 AMC 12A Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_5

-- Problem (LaTeX):
/-
When a student multiplied the number $66$ by the repeating decimal, \[\underline{1}.\underline{a} \ \underline{b} \ \underline{a} \ \underline{b}\ldots=\underline{1}.\overline{\underline{a} \ \underline{b}},\] where $a$ and $b$ are digits, he did not notice the notation and just multiplied $66$ times $\underline{1}.\underline{a} \ \underline{b}.$ Later he found that his answer is $0.5$ less than the correct answer. What is the $2$ -digit number $\underline{a} \ \underline{b}?$ $\textbf{(A) }15 \qquad \textbf{(B) }30 \qquad \textbf{(C) }45 \qquad \textbf{(D) }60 \qquad \textbf{(E) }75$
-/

-- Solution/Answer (LaTeX):
/-
We are given that $66\Bigl(\underline{1}.\overline{\underline{a} \ \underline{b}}\Bigr)-0.5=66\Bigl(\underline{1}.\underline{a} \ \underline{b}\Bigr),$ from which \begin{align*} 66\Bigl(\underline{1}.\overline{\underline{a} \ \underline{b}}\Bigr)-66\Bigl(\underline{1}.\underline{a} \ \underline{b}\Bigr)&=0.5 \\ 66\Bigl(\underline{1}.\overline{\underline{a} \ \underline{b}} - \underline{1}.\underline{a} \ \underline{b}\Bigr)&=0.5 \\ 66\Bigl(\underline{0}.\underline{0} \ \underline{0} \ \overline{\underline{a} \ \underline{b}}\Bigr)&=0.5 \\ 66\left(\frac{1}{100}\cdot\underline{0}.\overline{\underline{a} \ \underline{b}}\right)&=\frac12 \\ \underline{0}.\overline{\underline{a} \ \underline{b}}&=\frac{25}{33} \\ \underline{0}.\overline{\underline{a} \ \underline{b}}&=0.\overline{75} \\ \underline{a} \ \underline{b}&=\boxed{\textbf{(E) }75}. \end{align*} ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_116ba41c2c : Prop := by
  sorry
