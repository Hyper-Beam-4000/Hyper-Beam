-- 2020 AMC 10A Problems/Problem 16
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12A_Problems/Problem_16

-- Problem (LaTeX):
/-
A point is chosen at random within the square in the coordinate plane whose vertices are $(0, 0), (2020, 0), (2020, 2020),$ and $(0, 2020)$ . The probability that the point is within $d$ units of a lattice point is $\tfrac{1}{2}$ . (A point $(x, y)$ is a lattice point if $x$ and $y$ are both integers.) What is $d$ to the nearest tenth $?$ $\textbf{(A) } 0.3 \qquad \textbf{(B) } 0.4 \qquad \textbf{(C) } 0.5 \qquad \textbf{(D) } 0.6 \qquad \textbf{(E) } 0.7$
-/

-- Solution/Answer (LaTeX):
/-
We consider an individual one-by-one block. If we draw a quarter of a circle from each corner (where the lattice points are located), each with radius $d$ , the area covered by the circles should be $0.5$ . Because of this, and the fact that there are four circles, we write \[4 \cdot \frac{1}{4} \cdot \pi d^2 = \frac{1}{2}\] Solving for $d$ , we obtain $d = \frac{1}{\sqrt{2\pi}}$ , where with $\pi \approx 3$ , we get $d \approx \frac{1}{\sqrt{6}} \approx \dfrac{1}{2.5} = \dfrac{10}{25} = \dfrac{2}{5}$ , and from here, we see that $d \approx 0.4 \implies \boxed{\textbf{(B) } 0.4}.$ ~Crypthes ~ Minor Edits by BakedPotato66 $\textbf{Note:}$ To be more rigorous, note that $d<0.5$ since if $d\geq0.5$ then clearly the probability is greater than $\frac{1}{2}$ . This would make sure the above solution works, as if $d\geq0.5$ there is overlap with the quartercircles. $\textbf{- Emathmaster}$
-/

import Mathlib.Tactic

theorem wiki_index_php_98b905856e : Prop := by
  sorry
