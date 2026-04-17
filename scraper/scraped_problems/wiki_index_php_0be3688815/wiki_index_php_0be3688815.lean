-- 2025 AIME II Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AIME_II_Problems/Problem_2

-- Problem (LaTeX):
/-
Find the sum of all positive integers $n$ such that $n + 2$ divides the product $3(n + 3)(n^2 + 9)$ .
-/

-- Solution/Answer (LaTeX):
/-
$\frac{3(n+3)(n^{2}+9) }{n+2} \in \mathbb{Z}$ $\Rightarrow \frac{3(n+2+1)(n^{2}+9) }{n+2} \in \mathbb{Z}$ $\Rightarrow \frac{3(n+2)(n^{2}+9) +3(n^{2}+9)}{n+2} \in \mathbb{Z}$ $\Rightarrow 3(n^{2}+9)+\frac{3(n^{2}+9)}{n+2} \in \mathbb{Z}$ $\Rightarrow \frac{3(n^{2}-4+13)}{n+2} \in \mathbb{Z}$ $\Rightarrow \frac{3(n+2)(n-2)+39}{n+2} \in \mathbb{Z}$ $\Rightarrow 3(n-2)+\frac{39}{n+2} \in \mathbb{Z}$ $\Rightarrow \frac{39}{n+2} \in \mathbb{Z}$ Since $n + 2$ is positive, the positive factors of $39$ are $1$ , $3$ , $13$ , and $39$ . Therefore, $n = -1$ , $1$ , $11$ and $37$ . Since $n$ is positive, $n = 1$ , $11$ and $37$ . $1 + 11 + 37 = \framebox{049}$ is the correct answer ～ Tonyttian ~ Edited by aoum
-/

import Mathlib.Tactic

theorem wiki_index_php_0be3688815 : Prop := by
  sorry
