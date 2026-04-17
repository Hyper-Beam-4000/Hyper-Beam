-- 2019 AIME II Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AIME_II_Problems/Problem_8

-- Problem (LaTeX):
/-
The polynomial $f(z)=az^{2018}+bz^{2017}+cz^{2016}$ has real coefficients not exceeding $2019$ , and $f\left(\tfrac{1+\sqrt{3}i}{2}\right)=2015+2019\sqrt{3}i$ . Find the remainder when $f(1)$ is divided by $1000$ .
-/

-- Solution/Answer (LaTeX):
/-
We have $\frac{1+\sqrt{3}i}{2} = \omega$ where $\omega = e^{\frac{i\pi}{3}}$ is a primitive 6th root of unity. Then we have \begin{align*} f(\omega) &= a\omega^{2018} + b\omega^{2017} + c\omega^{2016}\\ &= a\omega^2 + b\omega + c \end{align*} We wish to find $f(1) = a+b+c$ . We first look at the real parts. As $\text{Re}(\omega^2) = -\frac{1}{2}$ and $\text{Re}(\omega) = \frac{1}{2}$ , we have $-\frac{1}{2}a + \frac{1}{2}b + c = 2015 \implies -a+b + 2c = 4030$ . Looking at imaginary parts, we have $\text{Im}(\omega^2) = \text{Im}(\omega) = \frac{\sqrt{3}}{2}$ , so $\frac{\sqrt{3}}{2}(a+b) = 2019\sqrt{3} \implies a+b = 4038$ . As $a$ and $b$ do not exceed 2019, we must have $a = 2019$ and $b = 2019$ . Then $c = \frac{4030}{2} = 2015$ , so $f(1) = 4038 + 2015 = 6053 \implies f(1) \pmod{1000} = \boxed{053}$ . -scrabbler94
-/

import Mathlib.Tactic

theorem wiki_index_php_d7d1c8e807 : Prop := by
  sorry
