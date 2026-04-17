-- 2022 AMC 12B Problems/Problem 19
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12B_Problems/Problem_19

-- Problem (LaTeX):
/-
In $\triangle{ABC}$ medians $\overline{AD}$ and $\overline{BE}$ intersect at $G$ and $\triangle{AGE}$ is equilateral. Then $\cos(C)$ can be written as $\frac{m\sqrt p}n$ , where $m$ and $n$ are relatively prime positive integers and $p$ is a positive integer not divisible by the square of any prime. What is $m+n+p?$ $\textbf{(A) }44 \qquad \textbf{(B) }48 \qquad \textbf{(C) }52 \qquad \textbf{(D) }56 \qquad \textbf{(E) }60$
-/

-- Solution/Answer (LaTeX):
/-
Let $AG=AE=EG=2x$ . Since $E$ is the midpoint of $\overline{AC}$ , we must have $EC=2x$ . Since the centroid splits the median in a $2:1$ ratio, $GD=x$ and $BG=4x$ . Applying Law of Cosines on $\triangle ADC$ and $\triangle{}AGB$ yields $AB=\sqrt{28}x$ and $CD=BD=\sqrt{13}x$ . Finally, applying Law of Cosines on $\triangle ABC$ yields $\cos(C)=\frac{5}{2\sqrt{13}}=\frac{5\sqrt{13}}{26}$ . The requested sum is $5+13+26=44$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_9d218e4882 : Prop := by
  sorry
