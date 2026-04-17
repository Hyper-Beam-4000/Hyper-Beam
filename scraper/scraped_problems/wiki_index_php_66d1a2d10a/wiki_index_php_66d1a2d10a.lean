-- 2018 AMC 10B Problems/Problem 20
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12B_Problems/Problem_18

-- Problem (LaTeX):
/-
A function $f$ is defined recursively by $f(1)=f(2)=1$ and \[f(n)=f(n-1)-f(n-2)+n\] for all integers $n \geq 3$ . What is $f(2018)$ ? $\textbf{(A) } 2016 \qquad \textbf{(B) } 2017 \qquad \textbf{(C) } 2018 \qquad \textbf{(D) } 2019 \qquad \textbf{(E) } 2020$
-/

-- Solution/Answer (LaTeX):
/-
For all integers $n \geq 7,$ note that \begin{align*} f(n)&=f(n-1)-f(n-2)+n \\ &=[f(n-2)-f(n-3)+n-1]-f(n-2)+n \\ &=-f(n-3)+2n-1 \\ &=-[f(n-4)-f(n-5)+n-3]+2n-1 \\ &=-f(n-4)+f(n-5)+n+2 \\ &=-[f(n-5)-f(n-6)+n-4]+f(n-5)+n+2 \\ &=f(n-6)+6. \end{align*} It follows that \begin{align*} f(2018)&=f(2012)+6 \\ &=f(2006)+12 \\ &=f(2000)+18 \\ & \ \vdots \\ &=f(2018-6\cdot336)+6\cdot336 \\ &=f(2)+2016 \\ &=\boxed{\textbf{(B) } 2017}. \end{align*} ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_66d1a2d10a : Prop := by
  sorry
