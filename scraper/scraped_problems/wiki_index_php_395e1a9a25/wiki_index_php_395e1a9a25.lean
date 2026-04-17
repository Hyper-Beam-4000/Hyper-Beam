-- 2018 AIME I Problems/Problem 15
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_I_Problems/Problem_15

-- Problem (LaTeX):
/-
David found four sticks of different lengths that can be used to form three non-congruent convex cyclic quadrilaterals, $A,\text{ }B,\text{ }C$ , which can each be inscribed in a circle with radius $1$ . Let $\varphi_A$ denote the measure of the acute angle made by the diagonals of quadrilateral $A$ , and define $\varphi_B$ and $\varphi_C$ similarly. Suppose that $\sin\varphi_A=\tfrac{2}{3}$ , $\sin\varphi_B=\tfrac{3}{5}$ , and $\sin\varphi_C=\tfrac{6}{7}$ . All three quadrilaterals have the same area $K$ , which can be written in the form $\dfrac{m}{n}$ , where $m$ and $n$ are relatively prime positive integers. Find $m+n$ .
-/

-- Solution/Answer (LaTeX):
/-
Suppose our four sides lengths cut out arc lengths of $2a$ , $2b$ , $2c$ , and $2d$ , where $a+b+c+d=180^\circ$ . Then, we only have to consider which arc is opposite $2a$ . These are our three cases, so \[\varphi_A=a+c\] \[\varphi_B=a+b\] \[\varphi_C=a+d\] Our first case involves quadrilateral $ABCD$ with $\overarc{AB}=2a$ , $\overarc{BC}=2b$ , $\overarc{CD}=2c$ , and $\overarc{DA}=2d$ . Then, by Law of Sines, $AC=2\sin\left(\frac{\overarc{ABC}}{2}\right)=2\sin(a+b)$ and $BD=2\sin\left(\frac{\overarc{BCD}}{2}\right)=2\sin(a+d)$ . Therefore, \[K=\frac{1}{2}\cdot AC\cdot BD\cdot \sin(\varphi_A)=2\sin\varphi_A\sin\varphi_B\sin\varphi_C=\frac{24}{35},\] so our answer is $24+35=\boxed{059}$ . Note that the conditions of the problem are satisfied when the lengths of the four sticks are about $0.32, 0.91, 1.06, 1.82$ . By S.B.
-/

import Mathlib.Tactic

theorem wiki_index_php_395e1a9a25 : Prop := by
  sorry
