-- 2019 AIME I Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AIME_I_Problems/Problem_12

-- Problem (LaTeX):
/-
Given $f(z) = z^2-19z$ , there are complex numbers $z$ with the property that $z$ , $f(z)$ , and $f(f(z))$ are the vertices of a right triangle in the complex plane with a right angle at $f(z)$ . There are positive integers $m$ and $n$ such that one such value of $z$ is $m+\sqrt{n}+11i$ . Find $m+n$ .
-/

-- Solution/Answer (LaTeX):
/-
Notice that we must have \[\frac{f(f(z))-f(z)}{f(z)-z}=-\frac{f(f(z))-f(z)}{z-f(z)}\in i\mathbb R .\] However, $f(t)-t=t(t-20)$ , so \begin{align*} \frac{f(f(z))-f(z)}{f(z)-z}&=\frac{(z^2-19z)(z^2-19z-20)}{z(z-20)}\\ &=\frac{z(z-19)(z-20)(z+1)}{z(z-20)}\\ &=(z-19)(z+1)\\ &=(z-9)^2-100. \end{align*} Then, the real part of $(z-9)^2$ is $100$ . Since $\text{Im}(z-9)=\text{Im}(z)=11$ , let $z-9=a+11i$ . Then, \[100=\text{Re}((a+11i)^2)=a^2-121\implies a=\pm\sqrt{221}.\] It follows that $z=9+\sqrt{221}+11i$ , and the requested sum is $9+221=\boxed{230}$ . (Solution by TheUltimate123)
-/

import Mathlib.Tactic

theorem wiki_index_php_0c0e218364 : Prop := by
  sorry
