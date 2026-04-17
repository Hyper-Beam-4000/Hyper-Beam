-- 2023 AMC 12B Problems/Problem 17
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_17

-- Problem (LaTeX):
/-
Triangle $ABC$ has side lengths in arithmetic progression, and the smallest side has length $6.$ If the triangle has an angle of $120^\circ,$ what is the area of $ABC$ ? $\textbf{(A) }12\sqrt{3}\qquad\textbf{(B) }8\sqrt{6}\qquad\textbf{(C) }14\sqrt{2}\qquad\textbf{(D) }20\sqrt{2}\qquad\textbf{(E) }15\sqrt{3}$
-/

-- Solution/Answer (LaTeX):
/-
The length of the side opposite to the angle with $120^\circ$ is longest.
We denote its value as $x$ . Because three side lengths form an arithmetic sequence, the middle-valued side length is $\frac{x + 6}{2}$ . Following from the law of cosines, we have \begin{align*} 6^2 + \left( \frac{x + 6}{2} \right)^2 - 2 \cdot 6 \cdot \frac{x + 6}{2} \cdot \cos 120^\circ = x^2 . \end{align*} By solving this equation, we get $x = 14$ .
Thus, $\frac{x + 6}{2} = 10$ . Therefore, the area of the triangle is \begin{align*} \frac{1}{2} \cdot 6 \cdot 10 \cdot \sin 120^\circ = \boxed{\textbf{(E) } 15 \sqrt{3}} . \end{align*} ~Steven Chen (Professor Chen Education Palace, www.professorchenedu.com)
-/

import Mathlib.Tactic

theorem wiki_index_php_6e8b9cbfc2 : Prop := by
  sorry
