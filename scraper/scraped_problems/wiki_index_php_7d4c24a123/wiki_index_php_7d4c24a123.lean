-- 2021 AMC 12B Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12B_Problems/Problem_6

-- Problem (LaTeX):
/-
An inverted cone with base radius $12 \mathrm{cm}$ and height $18 \mathrm{cm}$ is full of water. The water is poured into a tall cylinder whose horizontal base has radius of $24 \mathrm{cm}$ . What is the height in centimeters of the water in the cylinder? $\textbf{(A)} ~1.5 \qquad\textbf{(B)} ~3 \qquad\textbf{(C)} ~4 \qquad\textbf{(D)} ~4.5 \qquad\textbf{(E)} ~6$
-/

-- Solution/Answer (LaTeX):
/-
The volume of a cone is $\frac{1}{3} \cdot\pi \cdot r^2 \cdot h$ where $r$ is the base radius and $h$ is the height. The water completely fills up the cone so the volume of the water is $\frac{1}{3}\cdot18\cdot144\pi = 6\cdot144\pi$ . The volume of a cylinder is $\pi \cdot r^2 \cdot h$ so the volume of the water in the cylinder would be $24\cdot24\cdot\pi\cdot h$ . We can equate these two expressions because the water volume stays the same like this $24\cdot24\cdot\pi\cdot h = 6\cdot144\pi$ . We get $4h = 6$ and $h=\frac{6}{4}$ . So the answer is $\boxed{\textbf{(A)} ~1.5}.$ ~abhinavg0627
-/

import Mathlib.Tactic

theorem wiki_index_php_7d4c24a123 : Prop := by
  sorry
