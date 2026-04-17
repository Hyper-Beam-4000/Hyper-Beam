-- 2021 AMC 12B Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12B_Problems/Problem_9

-- Problem (LaTeX):
/-
What is the value of \[\frac{\log_2 80}{\log_{40}2}-\frac{\log_2 160}{\log_{20}2}?\] $\textbf{(A) }0 \qquad \textbf{(B) }1 \qquad \textbf{(C) }\frac54 \qquad \textbf{(D) }2 \qquad \textbf{(E) }\log_2 5$
-/

-- Solution/Answer (LaTeX):
/-
\[\frac{\log_{2}{80}}{\log_{40}{2}}-\frac{\log_{2}{160}}{\log_{20}{2}}\] Note that $\log_{40}{2}=\frac{1}{\log_{2}{40}}$ , and similarly $\log_{20}{2}=\frac{1}{\log_{2}{20}}$ \[= \log_{2}{80}\cdot \log_{2}{40}-\log_{2}{160}\cdot \log_{2}{20}\] \[=(\log_{2}{4}+\log_{2}{20})(\log_{2}{2}+\log_{2}{20})-(\log_{2}{8}+\log_{2}{20})\log_{2}{20}\] \[=(2+\log_{2}{20})(1+\log_{2}{20})-(3+\log_{2}{20})\log_{2}{20}\] Expanding, \[2+2\log_{2}{20}+\log_{2}{20}+(\log_{2}{20})^2-3\log_{2}{20}-(\log_{2}{20})^2\] All the log terms cancel, so the answer is $2\implies\boxed{\text{(D)}}$ . ~ SoySoy4444
-/

import Mathlib.Tactic

theorem wiki_index_php_d299a13b9d : Prop := by
  sorry
