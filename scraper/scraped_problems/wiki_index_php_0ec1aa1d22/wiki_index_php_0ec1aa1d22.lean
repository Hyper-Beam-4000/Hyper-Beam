-- 2023 AMC 12B Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_1

-- Problem (LaTeX):
/-
Mrs. Jones is pouring orange juice into four identical glasses for her four sons. She fills the first three glasses completely but runs out of juice when the fourth glass is only $\frac{1}{3}$ full. What fraction of a glass must Mrs. Jones pour from each of the first three glasses into the fourth glass so that all four glasses will have the same amount of juice? $\textbf{(A) } \frac{1}{12} \qquad\textbf{(B) } \frac{1}{4} \qquad\textbf{(C) } \frac{1}{6} \qquad\textbf{(D) } \frac{1}{8} \qquad\textbf{(E) } \frac{2}{9}$
-/

-- Solution/Answer (LaTeX):
/-
The first three glasses each have a full glass. Let's assume that each glass has "1 unit" of juice. It won't matter exactly how much juice everyone has because we're dealing with ratios, and that wouldn't affect our answer. The fourth glass has a glass that is one third. So the total amount of juice will be $1+1+1+\dfrac{1}{3} = \dfrac{10}{3}$ . If we divide the total amount of juice by 4, we get $\dfrac{5}{6}$ , which should be the amount of juice in each glass. This means that each of the first three glasses will have to contribute $1 - \dfrac{5}{6} = \boxed{\textbf{(C) }\dfrac16}$ to the fourth glass. ~Sir Ian Seo the Great & lprado
-/

import Mathlib.Tactic

theorem wiki_index_php_0ec1aa1d22 : Prop := by
  sorry
