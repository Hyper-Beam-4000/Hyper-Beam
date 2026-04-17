-- 2021 AMC 12B Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12B_Problems/Problem_3

-- Problem (LaTeX):
/-
Suppose \[2+\frac{1}{1+\frac{1}{2+\frac{2}{3+x}}}=\frac{144}{53}.\] What is the value of $x?$ $\textbf{(A) }\frac34 \qquad \textbf{(B) }\frac78 \qquad \textbf{(C) }\frac{14}{15} \qquad \textbf{(D) }\frac{37}{38} \qquad \textbf{(E) }\frac{52}{53}$
-/

-- Solution/Answer (LaTeX):
/-
Subtracting $2$ from both sides and taking reciprocals gives $1+\frac{1}{2+\frac{2}{3+x}}=\frac{53}{38}$ . Subtracting $1$ from both sides and taking reciprocals again gives $2+\frac{2}{3+x}=\frac{38}{15}$ . Subtracting $2$ from both sides and taking reciprocals for the final time gives $\frac{x+3}{2}=\frac{15}{8}$ or $x=\frac{3}{4} \implies \boxed{\text{(A) } 3/4}$ . ~ OlympusHero
-/

import Mathlib.Tactic

theorem wiki_index_php_e4210dd0c5 : Prop := by
  sorry
