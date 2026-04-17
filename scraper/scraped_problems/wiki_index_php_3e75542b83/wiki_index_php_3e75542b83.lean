-- 2025 AMC 12A Problems/Problem 17
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12A_Problems/Problem_17

-- Problem (LaTeX):
/-
The polynomial $(z + i)(z + 2i)(z + 3i) + 10$ has three roots in the complex plane, where $i = \sqrt{-1}$ . What is the area of the triangle formed by these three roots? $\textbf{(A)}~6 \qquad \textbf{(B)}~8 \qquad \textbf{(C)}~10 \qquad \textbf{(D)}~12 \qquad \textbf{(E)}~14$
-/

-- Solution/Answer (LaTeX):
/-
Noticing the symmetry, we begin with a substitution: $w = z+2i$ . We now have the polynomial $(w-i)(w)(w+i)+10$ . Expanding, we get \[w^3+w+10.\] Using the Rational Root Theorem, we notice that $-2$ is a root of this polynomial. Upon dividing the polynomial by $w+2$ , we get that \[w^3+w+10 = (w+2)(w^2-2w+5).\] Using the Quadratic Formula upon $w^2-2w+5$ , we get that the other two roots are $1+2i$ and $1-2i$ . From here, notice that the area of the triangle formed by the roots of this polynomial will be equal to that of the original polynomial because the substitution only shifted the graph $2i$ up, not affecting the distances between each root. Graphing the roots onto the complex plane, the vertical side of the triangle has length $4$ , with the altitude to that side having length $3$ . Therefore, the triangle has area $\frac{4 \cdot 3}{2} = \boxed{6}.$ ~lprado
-/

import Mathlib.Tactic

theorem wiki_index_php_3e75542b83 : Prop := by
  sorry
