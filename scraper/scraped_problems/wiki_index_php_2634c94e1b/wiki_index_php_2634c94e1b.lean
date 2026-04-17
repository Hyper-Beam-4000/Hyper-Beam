-- 2022 AIME I Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_I_Problems/Problem_7

-- Problem (LaTeX):
/-
Let $a,b,c,d,e,f,g,h,i$ be distinct integers from $1$ to $9.$ The minimum possible positive value of \[\dfrac{a \cdot b \cdot c - d \cdot e \cdot f}{g \cdot h \cdot i}\] can be written as $\frac{m}{n},$ where $m$ and $n$ are relatively prime positive integers. Find $m+n.$
-/

-- Solution/Answer (LaTeX):
/-
To minimize a positive fraction, we minimize its numerator and maximize its denominator. It is clear that $\frac{a \cdot b \cdot c - d \cdot e \cdot f}{g \cdot h \cdot i} \geq \frac{1}{7\cdot8\cdot9}.$ If we minimize the numerator, then $a \cdot b \cdot c - d \cdot e \cdot f = 1.$ Note that $a \cdot b \cdot c \cdot d \cdot e \cdot f = (a \cdot b \cdot c) \cdot (a \cdot b \cdot c - 1) \geq 6! = 720,$ so $a \cdot b \cdot c \geq 28.$ It follows that $a \cdot b \cdot c$ and $d \cdot e \cdot f$ are consecutive composites with prime factors no other than $2,3,5,$ and $7.$ The smallest values for $a \cdot b \cdot c$ and $d \cdot e \cdot f$ are $36$ and $35,$ respectively. So, we have $\{a,b,c\} = \{2,3,6\}, \{d,e,f\} = \{1,5,7\},$ and $\{g,h,i\} = \{4,8,9\},$ from which $\frac{a \cdot b \cdot c - d \cdot e \cdot f}{g \cdot h \cdot i} = \frac{1}{288}.$ If we do not minimize the numerator, then $a \cdot b \cdot c - d \cdot e \cdot f > 1.$ Note that $\frac{a \cdot b \cdot c - d \cdot e \cdot f}{g \cdot h \cdot i} \geq \frac{2}{7\cdot8\cdot9} > \frac{1}{288}.$ Together, we conclude that the minimum possible positive value of $\frac{a \cdot b \cdot c - d \cdot e \cdot f}{g \cdot h \cdot i}$ is $\frac{1}{288}.$ Therefore, the answer is $1+288=\boxed{289}.$ ~MRENTHUSIASM ~jgplay
-/

import Mathlib.Tactic

theorem wiki_index_php_2634c94e1b : Prop := by
  sorry
