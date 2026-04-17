-- 2020 AIME I Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_I_Problems/Problem_14

-- Problem (LaTeX):
/-
Let $P(x)$ be a quadratic polynomial with complex coefficients whose $x^2$ coefficient is $1.$ Suppose the equation $P(P(x))=0$ has four distinct solutions, $x=3,4,a,b.$ Find the sum of all possible values of $(a+b)^2.$
-/

-- Solution/Answer (LaTeX):
/-
Either $P(3) = P(4)$ or not. We first see that if $P(3) = P(4)$ it's easy to obtain by Vieta's that $(a+b)^2 = 49$ . Now, take $P(3) \neq P(4)$ and WLOG $P(3) = P(a), P(4) = P(b)$ . Now, consider the parabola formed by the graph of $P$ . It has vertex $\frac{3+a}{2}$ . Now, say that $P(x) = x^2 - (3+a)x + c$ . We note $P(3)P(4) = c = P(3)\left(4 - 4a + \frac{8a - 1}{2}\right) \implies a = \frac{7P(3) + 1}{8}$ . Now, we note $P(4) = \frac{7}{2}$ by plugging in again. Now, it's easy to find that $a = -2.5, b = -3.5$ , yielding a value of $36$ . Finally, we add $49 + 36 = \boxed{085}$ . ~awang11, charmander3333 Remark : We know that $c=\frac{8a-1}{2}$ from $P(3)+P(4)=3+a$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_8904cb9d6d : Prop := by
  sorry
