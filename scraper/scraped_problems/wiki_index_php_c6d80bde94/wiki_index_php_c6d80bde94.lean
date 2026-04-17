-- 2021 AIME II Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AIME_II_Problems/Problem_4

-- Problem (LaTeX):
/-
There are real numbers $a, b, c,$ and $d$ such that $-20$ is a root of $x^3 + ax + b$ and $-21$ is a root of $x^3 + cx^2 + d.$ These two polynomials share a complex root $m + \sqrt{n} \cdot i,$ where $m$ and $n$ are positive integers and $i = \sqrt{-1}.$ Find $m+n.$
-/

-- Solution/Answer (LaTeX):
/-
By the Complex Conjugate Root Theorem, the imaginary roots for each of $x^3+ax+b$ and $x^3+cx^2+d$ are complex conjugates. Let $z=m+\sqrt{n}\cdot i$ and $\overline{z}=m-\sqrt{n}\cdot i.$ It follows that the roots of $x^3+ax+b$ are $-20,z,\overline{z},$ and the roots of $x^3+cx^2+d$ are $-21,z,\overline{z}.$ We know that \begin{align*} z+\overline{z}&=2m, & (1) \\ z\overline{z}&=m^2+n. & (2) \end{align*} Applying Vieta's Formulas to $x^3+ax+b,$ we have $-20+z+\overline{z}=0.$ Substituting $(1)$ into this equation, we get $m=10.$ Applying Vieta's Formulas to $x^3+cx^2+d,$ we have $-21z-21\overline{z}+z\overline{z}=0,$ or $-21(z+\overline{z})+z\overline{z}=0.$ Substituting $(1)$ and $(2)$ into this equation, we get $n=320.$ Finally, the answer is $m+n=\boxed{330}.$ ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_c6d80bde94 : Prop := by
  sorry
