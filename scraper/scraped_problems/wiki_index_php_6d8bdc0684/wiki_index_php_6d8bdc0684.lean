-- 2023 AMC 12B Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_2

-- Problem (LaTeX):
/-
Carlos went to a sports store to buy running shoes. Running shoes were on sale, with prices reduced by $20\%$ on every pair of shoes. Carlos also knew that he had to pay a $7.5\%$ sales tax on the discounted price. He had $\$43$ dollars. What is the original (before discount) price of the most expensive shoes he could afford to buy? $\textbf{(A) }\$46\qquad\textbf{(B) }\$50\qquad\textbf{(C) }\$48\qquad\textbf{(D) }\$47\qquad\textbf{(E) }\$49$
-/

-- Solution/Answer (LaTeX):
/-
Let the price originally be \( x \). Then, after a \(20\) percent discount, the price is now \( x - \frac{1}{5}x = \frac{4}{5}x \). From the discounted price \( \frac{4}{5}x \), we now take \( \frac{7.5}{100} \) of \( \frac{4}{5}x \) and add it to \( \frac{4}{5}x \), giving us \( \frac{4}{5}x + \left(\frac{7.5}{100}\right)\left(\frac{4}{5}x\right) = \frac{4}{5}x + \frac{30}{500}x = \frac{4}{5}x + \frac{3}{50}x = \frac{43}{50}x \). Now we write the inequality \( \frac{43}{50}x \leq \$43 \) and multiply by \( \frac{50}{43} \) on both sides to get \( x \leq \$50 \). We want the greatest original price, which would be \($50\) or option choice \(B\). ~Pinotation
-/

import Mathlib.Tactic

theorem wiki_index_php_6d8bdc0684 : Prop := by
  sorry
