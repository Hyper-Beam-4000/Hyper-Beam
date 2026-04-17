-- 2019 AIME I Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AIME_I_Problems/Problem_10

-- Problem (LaTeX):
/-
For distinct complex numbers $z_1,z_2,\dots,z_{673}$ , the polynomial \[(x-z_1)^3(x-z_2)^3 \cdots (x-z_{673})^3\] can be expressed as $x^{2019} + 20x^{2018} + 19x^{2017}+g(x)$ , where $g(x)$ is a polynomial with complex coefficients and with degree at most $2016$ . The sum \[\left| \sum_{1 \le j <k \le 673} z_jz_k \right|\] can be expressed in the form $\frac{m}{n}$ , where $m$ and $n$ are relatively prime positive integers. Find $m+n$ .
-/

-- Solution/Answer (LaTeX):
/-
In order to begin this problem, we must first understand what it is asking for. The notation \[\left| \sum_{1 \le j <k \le 673} z_jz_k \right|\] simply asks for the absolute value of the sum of the product of the distinct unique roots of the polynomial taken two at a time or \[(z_1z_2+z_1z_3+ \dots + z_1z_{672}+z_1z_{673})+(z_2z_3+z_2z_4+ \dots +z_2z_{673}) + (z_3z_4+z_3z_5+ \dots +z_3z_{673}) + \dots +z_{672}z_{673}.\] Call this sum $S$ . Now we can begin the problem. Rewrite the polynomial as $P=(x-z_1)(x-z_1)(x-z_1)(x-z_2)(x-z_2)(x-z_2) \dots (x-z_{673})(x-z_{673})(x-z_{673})$ . Then we have that the roots of $P$ are $z_1,z_1,z_1,z_2,z_2,z_2, \dots , z_{673},z_{673},z_{673}$ . By Vieta's formulas, we have that the sum of the roots of $P$ is $(-1)^1 \cdot \dfrac{20}{1}=-20=z_1+z_1+z_1+z_2+z_2+z_2+ \dots + z_{673}+z_{673}+z_{673}=3(z_1+z_2+z_3+ \dots +z_{673})$ . Thus, $z_1+z_2+z_3+ \dots +z_{673}=- \dfrac{20}{3}.$ Similarly, we also have that the the sum of the roots of $P$ taken two at a time is $(-1)^2 \cdot \dfrac{19}{1} = 19.$ This is equal to $z_1^2+z_1^2+z_1^2+z_1z_2+z_1z_2+z_1z_2+ \dots = \\ 3(z_1^2+z_2^2+ \dots + z_{673}^2) + 9(z_1z_2+z_1z_3+z_1z_4+ \dots + z_{672}z_{673}) = 3(z_1^2+z_2^2+ \dots + z_{673}^2) + 9S.$ Now we need to find and expression for $z_1^2+z_2^2+ \dots + z_{673}^2$ in terms of $S$ . We note that $(z_1+z_2+z_3+ \dots +z_{673})^2= (-20/3)^2=\dfrac{400}{9} \\ =(z_1^2+z_2^2+ \dots + z_{673}^2)+2(z_1z_2+z_1z_3+z_1z_4+ \dots + z_{672}z_{673})=(z_1^2+z_2^2+ \dots + z_{673}^2)+2S.$ Thus, $z_1^2+z_2^2+ \dots + z_{673}^2= \dfrac{400}{9} -2S$ . Plugging this into our other Vieta equation, we have $3 \left( \dfrac{400}{9} -2S \right) +9S = 19$ . This gives $S = - \dfrac{343}{9} \Rightarrow \left| S \right| = \dfrac{343}{9}$ . Since 343 is relatively prime to 9, $m+n = 343+9 = \fbox{352}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_5e2b6a05c5 : Prop := by
  sorry
