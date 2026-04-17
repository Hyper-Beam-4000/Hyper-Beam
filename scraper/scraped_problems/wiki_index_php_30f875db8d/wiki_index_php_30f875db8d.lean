-- 2022 AMC 12B Problems/Problem 24
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12B_Problems/Problem_24

-- Problem (LaTeX):
/-
The figure below depicts a regular $7$ -gon inscribed in a unit circle. [asy] import geometry; unitsize(3cm); draw(circle((0,0),1),linewidth(1.5)); for (int i = 0; i < 7; ++i) { for (int j = 0; j < i; ++j) { draw(dir(i * 360/7) -- dir(j * 360/7),linewidth(1.5)); } } for(int i = 0; i < 7; ++i) { dot(dir(i * 360/7),5+black); } [/asy] What is the sum of the $4$ th powers of the lengths of all $21$ of its edges and diagonals? $\textbf{(A) }49 \qquad \textbf{(B) }98 \qquad \textbf{(C) }147 \qquad \textbf{(D) }168 \qquad \textbf{(E) }196$
-/

-- Solution/Answer (LaTeX):
/-
There are $7$ segments whose lengths are $2 \sin \frac{\pi}{7}$ , $7$ segments whose lengths are $2 \sin \frac{2 \pi}{7}$ , $7$ segments whose lengths are $2 \sin \frac{3\pi}{7}$ . Therefore, the sum of the $4$ th powers of these lengths is \begin{align*} 7 \cdot 2^4 \sin^4 \frac{\pi}{7} + 7 \cdot 2^4 \sin^4 \frac{2 \pi}{7} + 7 \cdot 2^4 \sin^4 \frac{3 \pi}{7} & = \frac{7 \cdot 2^4}{(2i)^4} \left( e^{i \frac{\pi}{7}} - e^{i \frac{-\pi}{7}} \right)^4 + \frac{7 \cdot 2^4}{(2i)^4} \left( e^{i \frac{2 \pi}{7}} - e^{i \frac{-2 \pi}{7}} \right)^4 + \frac{7 \cdot 2^4}{(2i)^4} \left( e^{i \frac{3 \pi}{7}} - e^{i \frac{-3 \pi}{7}} \right)^4 \\ & = 7 \left( e^{i \frac{4 \pi}{7}} - 4 e^{i \frac{2 \pi}{7}} + 6 - 4 e^{- i \frac{2 \pi}{7}} + e^{- i \frac{4 \pi}{7}} \right) \\ & \quad + 7 \left( e^{i \frac{8 \pi}{7}} - 4 e^{i \frac{4 \pi}{7}} + 6 - 4 e^{- i \frac{4 \pi}{7}} + e^{- i \frac{8 \pi}{7}} \right) \\ & \quad + 7 \left( e^{i \frac{12 \pi}{7}} - 4 e^{i \frac{6 \pi}{7}} + 6 - 4 e^{- i \frac{6 \pi}{7}} + e^{- i \frac{12 \pi}{7}} \right) \\ & = 7 \left( e^{i \frac{4 \pi}{7}} + e^{i \frac{8 \pi}{7}} + e^{i \frac{12 \pi}{7}} + e^{-i \frac{4 \pi}{7}} + e^{-i \frac{8 \pi}{7}} + e^{-i \frac{12 \pi}{7}} \right) \\ & \quad - 7 \cdot 4 \left( e^{i \frac{2 \pi}{7}} + e^{i \frac{4 \pi}{7}} + e^{i \frac{6 \pi}{7}} + e^{-i \frac{2 \pi}{7}} + e^{-i \frac{4 \pi}{7}} + e^{-i \frac{6 \pi}{7}} \right) \\ & \quad + 7 \cdot 6 \cdot 3 \\ & = 7 \left( e^{i \frac{4 \pi}{7}} + e^{-i \frac{6 \pi}{7}} + e^{-i \frac{2 \pi}{7}} + e^{-i \frac{4 \pi}{7}} + e^{i \frac{6 \pi}{7}} + e^{i \frac{2 \pi}{7}} \right) \\ & \quad - 7 \cdot 4 \left( e^{i \frac{2 \pi}{7}} + e^{i \frac{4 \pi}{7}} + e^{i \frac{6 \pi}{7}} + e^{-i \frac{2 \pi}{7}} + e^{-i \frac{4 \pi}{7}} + e^{-i \frac{6 \pi}{7}} \right) \\ & \quad + 7 \cdot 6 \cdot 3 \\ & = -7 + 7 \cdot 4 + 7 \cdot 6 \cdot 3 \\ & = \boxed{\textbf{(C) }147}, \end{align*} where the fourth from the last equality follows from the property that \begin{align*} e^{i \frac{2 \pi}{7}} + e^{i \frac{4 \pi}{7}} + e^{i \frac{6 \pi}{7}} + e^{-i \frac{2 \pi}{7}} + e^{-i \frac{4 \pi}{7}} + e^{-i \frac{6 \pi}{7}} & = e^{-i \frac{6 \pi}{7}} \sum_{j=0}^6 e^{i \frac{2 \pi j}{7}} - 1 \\ & = 0 - 1 \\ & = -1 . \end{align*} ~Steven Chen (Professor Chen Education Palace, www.professorchenedu.com) ~edited by scinderella220
-/

import Mathlib.Tactic

theorem wiki_index_php_30f875db8d : Prop := by
  sorry
