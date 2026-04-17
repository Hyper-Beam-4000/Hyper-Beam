-- 2017 AMC 12B Problems/Problem 15
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12B_Problems/Problem_15

-- Problem (LaTeX):
/-
Let $ABC$ be an equilateral triangle. Extend side $\overline{AB}$ beyond $B$ to a point $B'$ so that $BB'=3AB$ . Similarly, extend side $\overline{BC}$ beyond $C$ to a point $C'$ so that $CC'=3BC$ , and extend side $\overline{CA}$ beyond $A$ to a point $A'$ so that $AA'=3CA$ . What is the ratio of the area of $\triangle A'B'C'$ to the area of $\triangle ABC$ ? $\textbf{(A)}\ 9:1 \qquad\textbf{(B)}\ 16:1 \qquad\textbf{(C)}\ 25:1 \qquad\textbf{(D)}\ 36:1 \qquad\textbf{(E)}\ 37:1$
-/

-- Solution/Answer (LaTeX):
/-
Note that by symmetry, $\triangle A'B'C'$ is also equilateral. Therefore, we only need to find one of the sides of $A'B'C'$ to determine the area ratio. WLOG, let $AB = BC = CA = 1$ . Therefore, $BB' = 3$ and $BC' = 4$ . Also, $\angle B'BC' = 120^{\circ}$ , so by the Law of Cosines, $B'C' = \sqrt{37}$ . Therefore, the answer is $(\sqrt{37})^2 : 1^2 = \boxed{\textbf{(E) } 37}$
-/

import Mathlib.Tactic

theorem wiki_index_php_cd599e4ba3 : Prop := by
  sorry
