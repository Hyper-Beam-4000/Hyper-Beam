-- 2022 AMC 12A Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_11

-- Problem (LaTeX):
/-
What is the product of all real numbers $x$ such that the distance on the number line between $\log_6x$ and $\log_69$ is twice the distance on the number line between $\log_610$ and $1$ ? $\textbf{(A) } 10 \qquad \textbf{(B) } 18 \qquad \textbf{(C) } 25 \qquad \textbf{(D) } 36 \qquad \textbf{(E) } 81$
-/

-- Solution/Answer (LaTeX):
/-
Let $a = 2 \cdot |\log_6 10 - 1| = |\log_6 9 - \log_6 x| = \left|\log_6 \frac{9}{x}\right|$ . $\pm a = \log_6 \frac{9}{x} \implies 6^{\pm a} = b^{\pm 1} = \frac{9}{x} \implies x = 9 \cdot b^{\pm 1}$ $9b^1 \cdot 9b^{-1} = \boxed{81}$ . ~ oinava
-/

import Mathlib.Tactic

theorem wiki_index_php_257dfaaa37 : Prop := by
  sorry
