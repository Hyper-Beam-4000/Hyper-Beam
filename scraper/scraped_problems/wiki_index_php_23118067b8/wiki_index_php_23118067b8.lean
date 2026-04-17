-- 2022 AMC 12B Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12B_Problems/Problem_14

-- Problem (LaTeX):
/-
The graph of $y=x^2+2x-15$ intersects the $x$ -axis at points $A$ and $C$ and the $y$ -axis at point $B$ . What is $\tan(\angle ABC)$ ? $\textbf{(A)}\ \frac{1}{7} \qquad \textbf{(B)}\ \frac{1}{4} \qquad \textbf{(C)}\ \frac{3}{7} \qquad \textbf{(D)}\ \frac{1}{2} \qquad \textbf{(E)}\ \frac{4}{7} \qquad$
-/

-- Solution/Answer (LaTeX):
/-
First, find $A=(-5,0)$ , $B=(0,-15)$ , and $C=(3,0)$ . Create vectors $\overrightarrow{BA}$ and $\overrightarrow{BC}.$ These can be reduced to $\langle -1, 3 \rangle$ and $\langle 1, 5 \rangle$ , respectively. Then, we can use the dot product to calculate the cosine of the angle (where $\theta=\angle ABC$ ) between them: \begin{align*} \langle -1, 3 \rangle \cdot \langle 1, 5 \rangle = 15-1 &= \sqrt{10}\sqrt{26}\cos(\theta),\\ \implies \cos (\theta) &= \frac{7}{\sqrt{65}}. \end{align*} Thus, \[\tan(\angle ABC) = \sqrt{\frac{65}{49}-1}= \boxed{\textbf{(E)}\ \frac{4}{7}}.\] ~Jackson La Vallee
-/

import Mathlib.Tactic

theorem wiki_index_php_23118067b8 : Prop := by
  sorry
