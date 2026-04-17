-- 2024 AMC 12B Problems/Problem 22
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_22

-- Problem (LaTeX):
/-
Let $\triangle{ABC}$ be a triangle with integer side lengths and the property that $\angle{B} = 2\angle{A}$ . What is the least possible perimeter of such a triangle? $\textbf{(A) }13 \qquad \textbf{(B) }14 \qquad \textbf{(C) }15 \qquad \textbf{(D) }16 \qquad \textbf{(E) }17 \qquad$
-/

-- Solution/Answer (LaTeX):
/-
Let $AB=c$ , $BC=a$ , $AC=b$ . According to the law of sines, \[\frac{b}{a}=\frac{\sin \angle B}{\sin \angle A}=2\cos \angle A\] According to the law of cosines, \[\cos \angle A=\frac{b^2+c^2-a^2}{2bc}\] Hence, \[\frac{b}{a}=\frac{b^2+c^2-a^2}{bc}\] This simplifies to $b^2=a(a+c)$ . We want to find the positive integer solution $(a, b, c)$ to this equation such that $a, b, c$ forms a triangle, and $a+b+c$ is minimized. We proceed by casework on the value of $b$ . Remember that $a<a+c$ . Case $1$ : $b=1$ Clearly, this case yields no valid solutions. Case $2$ : $b=2$ For this case, we must have $a=1$ and $c=3$ . However, $(1, 2, 3)$ does not form a triangle. Hence this case yields no valid solutions. Case $3$ : $b=3$ For this case, we must have $a=1$ and $c=8$ . However, $(1, 3, 8)$ does not form a triangle. Hence this case yields no valid solutions. Case $4$ : $b=4$ For this case, $a=1$ and $c=15$ , or $a=2$ and $c=6$ . As one can check, this case also yields no valid solutions Case $5$ : $b=5$ For this case, we must have $a=1$ and $c=24$ . There are no valid solutions Case $6$ : $b=6$ For this case, $a=2$ and $c=16$ , or $a=4$ and $c=5$ , or $a=3$ and $c=9$ . The only valid solution for this case is $(4, 6, 5)$ , which yields a perimeter of $15$ . When $b\ge 7$ , it is easy to see that $a+c>7$ . Hence $a+b+c>14$ , which means $a+b+c\ge15$ . Therefore, the answer is $\fbox{\textbf{(C) }15}$ ~tsun26
~infinitywasp (minor errors)
-/

import Mathlib.Tactic

theorem wiki_index_php_be8c1d8ad5 : Prop := by
  sorry
