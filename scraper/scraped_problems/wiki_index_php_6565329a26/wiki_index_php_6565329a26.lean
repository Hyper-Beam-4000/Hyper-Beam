-- 2022 AMC 12A Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_8

-- Problem (LaTeX):
/-
The infinite product \[\sqrt[3]{10} \cdot \sqrt[3]{\sqrt[3]{10}} \cdot \sqrt[3]{\sqrt[3]{\sqrt[3]{10}}} \cdots\] evaluates to a real number. What is that number? $\textbf{(A) }\sqrt{10}\qquad\textbf{(B) }\sqrt[3]{100}\qquad\textbf{(C) }\sqrt[4]{1000}\qquad\textbf{(D) }10\qquad\textbf{(E) }10\sqrt[3]{10}$
-/

-- Solution/Answer (LaTeX):
/-
We can write $\sqrt[3]{10}$ as $10 ^ \frac{1}{3}$ . Similarly, $\sqrt[3]{\sqrt[3]{10}} = (10 ^ \frac{1}{3}) ^ \frac{1}{3} = 10 ^ \frac{1}{3^2}$ . By continuing this, we get the form \[10 ^ \frac{1}{3} \cdot 10 ^ \frac{1}{3^2} \cdot 10 ^ \frac{1}{3^3} \cdots,\] which is \[10 ^ {\frac{1}{3} + \frac{1}{3^2} + \frac{1}{3^3} + \cdots}.\] Using the formula for an infinite geometric series $S = \frac{a}{1-r}$ , we get \[\frac{1}{3} + \frac{1}{3^2} + \frac{1}{3^3} + \cdots = \frac{\frac{1}{3}}{1-\frac{1}{3}} = \frac{1}{2}.\] Thus, our answer is $10 ^ \frac{1}{2} = \boxed{\textbf{(A) }\sqrt{10}}$ . - phuang1024
-/

import Mathlib.Tactic

theorem wiki_index_php_6565329a26 : Prop := by
  sorry
