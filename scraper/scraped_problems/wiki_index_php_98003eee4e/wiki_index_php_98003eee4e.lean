-- 2020 AIME II Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_II_Problems/Problem_11

-- Problem (LaTeX):
/-
Let $P(x) = x^2 - 3x - 7$ , and let $Q(x)$ and $R(x)$ be two quadratic polynomials also with the coefficient of $x^2$ equal to $1$ . David computes each of the three sums $P + Q$ , $P + R$ , and $Q + R$ and is surprised to find that each pair of these sums has a common root, and these three common roots are distinct. If $Q(0) = 2$ , then $R(0) = \frac{m}{n}$ , where $m$ and $n$ are relatively prime positive integers. Find $m + n$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $Q(x) = x^2 + ax + 2$ and $R(x) = x^2 + bx + c$ . We can write the following: \[P + Q = 2x^2 + (a - 3)x - 5\] \[P + R = 2x^2 + (b - 3)x + (c - 7)\] \[Q + R = 2x^2 + (a + b)x + (c + 2)\] Let the common root of $P+Q,P+R$ be $r$ ; $P+R,Q+R$ be $s$ ; and $P+Q,Q+R$ be $t$ . We then have that the roots of $P+Q$ are $r,t$ , the roots of $P + R$ are $r, s$ , and the roots of $Q + R$ are $s,t$ . By Vieta's, we have: \[r + t = \dfrac{3 - a}{2}\tag{1}\] \[r + s = \dfrac{3 - b}{2}\tag{2}\] \[s + t = \dfrac{-a - b}{2}\tag{3}\] \[rt = \dfrac{-5}{2}\tag{4}\] \[rs = \dfrac{c - 7}{2}\tag{5}\] \[st = \dfrac{c + 2}{2}\tag{6}\] Subtracting $(3)$ from $(1)$ , we get $r - s = \dfrac{3 + b}{2}$ . Adding this to $(2)$ , we get $2r = 3 \implies r = \dfrac{3}{2}$ . This gives us that $t = \dfrac{-5}{3}$ from $(4)$ . Substituting these values into $(5)$ and $(6)$ , we get $s = \dfrac{c-7}{3}$ and $s = \dfrac{-3c - 6}{10}$ . Equating these values, we get $\dfrac{c-7}{3} = \dfrac{-3c-6}{10} \implies c = \dfrac{52}{19} = R(0)$ . Thus, our answer is $52 + 19 = \boxed{071}$ . ~ TopNotchMath
-/

import Mathlib.Tactic

theorem wiki_index_php_98003eee4e : Prop := by
  sorry
