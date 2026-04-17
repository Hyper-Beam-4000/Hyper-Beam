-- 2017 AMC 12A Problems/Problem 17
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12A_Problems/Problem_17

-- Problem (LaTeX):
/-
There are $24$ different complex numbers $z$ such that $z^{24}=1$ . For how many of these is $z^6$ a real number? $\textbf{(A)}\ 0 \qquad\textbf{(B)}\ 4 \qquad\textbf{(C)}\ 6 \qquad\textbf{(D)}\ 12 \qquad\textbf{(E)}\ 24$
-/

-- Solution/Answer (LaTeX):
/-
Note that these $z$ such that $z^{24}=1$ are $e^{\frac{ni\pi}{12}}$ for integer $0\leq n<24$ . So $z^6=e^{\frac{ni\pi}{2}}$ This is real if $\frac{n}{2}\in \mathbb{Z} \Leftrightarrow (n$ is even $)$ . Thus, the answer is the number of even $0\leq n<24$ which is $\boxed{(D)=\ 12}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_bf8f98bb20 : Prop := by
  sorry
