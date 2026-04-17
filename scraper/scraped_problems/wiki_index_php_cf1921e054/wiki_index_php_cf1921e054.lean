-- 2020 AIME II Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_II_Problems/Problem_3

-- Problem (LaTeX):
/-
The value of $x$ that satisfies $\log_{2^x} 3^{20} = \log_{2^{x+3}} 3^{2020}$ can be written as $\frac{m}{n}$ , where $m$ and $n$ are relatively prime positive integers. Find $m+n$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $\log _{2^x}3^{20}=\log _{2^{x+3}}3^{2020}=n$ . Based on the equation, we get $(2^x)^n=3^{20}$ and $(2^{x+3})^n=3^{2020}$ . Expanding the second equation, we get $8^n\cdot2^{xn}=3^{2020}$ . Substituting the first equation in, we get $8^n\cdot3^{20}=3^{2020}$ , so $8^n=3^{2000}$ . Taking the 100th root, we get $8^{\frac{n}{100}}=3^{20}$ . Therefore, $(2^{\frac{3}{100}})^n=3^{20}$ , and using the our first equation( $2^{xn}=3^{20}$ ), we get $x=\frac{3}{100}$ and the answer is $\boxed{103}$ .
~rayfish
-/

import Mathlib.Tactic

theorem wiki_index_php_cf1921e054 : Prop := by
  sorry
