-- 2020 AMC 12B Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_13

-- Problem (LaTeX):
/-
Which of the following is the value of $\sqrt{\log_2{6}+\log_3{6}}?$ $\textbf{(A) } 1 \qquad\textbf{(B) } \sqrt{\log_5{6}} \qquad\textbf{(C) } 2 \qquad\textbf{(D) } \sqrt{\log_2{3}}+\sqrt{\log_3{2}} \qquad\textbf{(E) } \sqrt{\log_2{6}}+\sqrt{\log_3{6}}$
-/

-- Solution/Answer (LaTeX):
/-
Recall that: $\log_b{(uv)}=\log_b u + \log_b v.$ $\log_b u\cdot\log_u b=1.$ We use these properties of logarithms to rewrite the original expression: \begin{align*} \sqrt{\log_2{6}+\log_3{6}}&=\sqrt{(\log_2{2}+\log_2{3})+(\log_3{2}+\log_3{3})} \\ &=\sqrt{2+\log_2{3}+\log_3{2}} \\ &=\sqrt{\left(\sqrt{\log_2{3}}+\sqrt{\log_3{2}}\right)^2} \\ &=\boxed{\textbf{(D) } \sqrt{\log_2{3}}+\sqrt{\log_3{2}}}. \end{align*} ~MRENTHUSIASM (Solution) ~JHawk0224 (Proposal)
-/

import Mathlib.Tactic

theorem wiki_index_php_fa8f1199ad : Prop := by
  sorry
