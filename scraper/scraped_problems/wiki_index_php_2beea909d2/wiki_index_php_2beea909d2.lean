-- 2018 AMC 12A Problems/Problem 20
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_20

-- Problem (LaTeX):
/-
Triangle $ABC$ is an isosceles right triangle with $AB=AC=3$ . Let $M$ be the midpoint of hypotenuse $\overline{BC}$ . Points $I$ and $E$ lie on sides $\overline{AC}$ and $\overline{AB}$ , respectively, so that $AI>AE$ and $AIME$ is a cyclic quadrilateral. Given that triangle $EMI$ has area $2$ , the length $CI$ can be written as $\frac{a-\sqrt{b}}{c}$ , where $a$ , $b$ , and $c$ are positive integers and $b$ is not divisible by the square of any prime. What is the value of $a+b+c$ ? $\textbf{(A) }9 \qquad \textbf{(B) }10 \qquad \textbf{(C) }11 \qquad \textbf{(D) }12 \qquad \textbf{(E) }13 \qquad$
-/

-- Solution/Answer (LaTeX):
/-
Observe that $\triangle{EMI}$ is isosceles right ( $M$ is the midpoint of diameter arc $EI$ since $m\angle MEI = m\angle MAI = 45^\circ$ ), so $MI=2,MC=\frac{3}{\sqrt{2}}$ . With $\angle{MCI}=45^\circ$ , we can use Law of Cosines to determine that $CI=\frac{3\pm\sqrt{7}}{2}$ . The same calculations hold for $BE$ also, and since $CI<BE$ , we deduce that $CI$ is the smaller root, giving the answer of $\boxed{\textbf{(D) }12}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_2beea909d2 : Prop := by
  sorry
