-- 2025 AMC 12A Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12A_Problems/Problem_12

-- Problem (LaTeX):
/-
The harmonic mean of a collection of numbers is the reciprocal of the arithmetic mean of the reciprocals of the numbers in the collection. For example, the harmonic mean of $4,4,$ and $5$ is \[\frac{1}{\frac{1}{3}(\frac{1}{4}+\frac{1}{4}+\frac{1}{5})}=\frac{30}{7}.\] What is the harmonic mean of all the real roots of the $4050$ th degree polynomial \[\prod_{k=1}^{2025} (kx^2-4x-3)=(x^2-4x-3)(2x^2-4x-3)(3x^2-4x-3)...(2025x^2-4x-3)?\] $\textbf{(A)}~-\frac{5}{3}\qquad\textbf{(B)}~-\frac{3}{2}\qquad\textbf{(C)}~-\frac{6}{5}\qquad\textbf{(D)}~-\frac{5}{6}\qquad\textbf{(E)}~-\frac{2}{3}$
-/

-- Solution/Answer (LaTeX):
/-
We will need to determine the sum of the reciprocals of the roots. To find the sum of the reciprocals of the roots $p,q$ of the quadratic $ax^2+bx+c$ , we use Vieta's formulas. Recall that $p+q = -b/a$ and $pq = c/a$ . Therefore, \[\frac{1}{p} + \frac{1}{q} = \frac{p+q}{pq} = \frac{\frac{-b}{a}}{\frac{c}{a}} = \frac{-b}{a} \cdot \frac{a}{c} = \frac{-b}{c},\] which doesn't depend on $a$ . The sum of the reciprocals of the roots of the quadratic $x^2-4x-3$ is $\frac{-(-4)}{-3} = -4/3.$ The same is true for every quadratic in the form $ax^2-4x-3$ . The sum of all the reciprocals of the roots of $ax^2+bx+c$ is $2025 \cdot \left(-\frac{4}{3}\right).$ Because we have $2025$ quadratics, there are $2 \cdot 2025 = 4050$ total roots. Our answer is $\frac{1}{\frac{1}{4050}\cdot \frac{-4\cdot 2025}{3}} =\boxed{(B)\ -\dfrac{3}{2}}$ . ~lprado ~some edits by i_am_not_suk_at_math, zoyashaikh, keanu31415 (minor latex edits)
-/

import Mathlib.Tactic

theorem wiki_index_php_ff26861b73 : Prop := by
  sorry
