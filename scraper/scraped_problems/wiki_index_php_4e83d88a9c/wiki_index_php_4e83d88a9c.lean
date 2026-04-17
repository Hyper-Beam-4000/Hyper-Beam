-- 2024 AMC 12B Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_11

-- Problem (LaTeX):
/-
Let $x_n = \sin^2(n^{\circ})$ . What is the mean of $x_1,x_2,x_3,\dots,x_{90}$ ? $\textbf{(A) } \frac{11}{45} \qquad\textbf{(B) } \frac{22}{45} \qquad\textbf{(C) } \frac{89}{180} \qquad\textbf{(D) } \frac{1}{2} \qquad\textbf{(E) } \frac{91}{180}$
-/

-- Solution/Answer (LaTeX):
/-
Add up $x_1$ with $x_{89}$ , $x_2$ with $x_{88}$ , and $x_i$ with $x_{90-i}$ . Notice \[x_i+x_{90-i}=\sin^2(i^{\circ})+\sin^2((90-i)^{\circ})=\sin^2(i^{\circ})+\cos^2(i^{\circ})=1\] by the Pythagorean identity. Since we can pair up $1$ with $89$ and keep going until $44$ with $46$ , we get \[x_1+x_2+\dots+x_{90}=44+x_{45}+x_{90}=44+\left(\frac{\sqrt{2}}{2}\right)^2+1^2=\frac{91}{2}\] Hence the mean is $\boxed{\textbf{(E) }\frac{91}{180}}$ ~kafuu_chino
-/

import Mathlib.Tactic

theorem wiki_index_php_4e83d88a9c : Prop := by
  sorry
