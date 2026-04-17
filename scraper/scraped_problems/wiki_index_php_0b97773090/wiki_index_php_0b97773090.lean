-- 2020 AMC 10A Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12A_Problems/Problem_11

-- Problem (LaTeX):
/-
A frog sitting at the point $(1, 2)$ begins a sequence of jumps, where each jump is parallel to one of the coordinate axes and has length $1$ , and the direction of each jump (up, down, right, or left) is chosen independently at random. The sequence ends when the frog reaches a side of the square with vertices $(0,0), (0,4), (4,4),$ and $(4,0)$ . What is the probability that the sequence of jumps ends on a vertical side of the square? $\textbf{(A)}\ \frac12\qquad\textbf{(B)}\ \frac 58\qquad\textbf{(C)}\ \frac 23\qquad\textbf{(D)}\ \frac34\qquad\textbf{(E)}\ \frac 78$
-/

-- Solution/Answer (LaTeX):
/-
Drawing out the square, it's easy to see that if the frog goes to the left, it will immediately hit a vertical end of the square. Therefore, the probability of this happening is $\frac{1}{4} \cdot 1 = \frac{1}{4}$ . If the frog goes to the right, it will be in the center of the square at $(2,2)$ , and by symmetry (since the frog is equidistant from all sides of the square), the chance it will hit a vertical side of a square is $\frac{1}{2}$ . The probability of this happening is $\frac{1}{4} \cdot \frac{1}{2} = \frac{1}{8}$ . If the frog goes either up or down, it will hit a line of symmetry along the corner it is closest to and furthest to, and again, is equidistant relating to the two closer sides and also equidistant relating the two further sides. The probability for it to hit a vertical wall is $\frac{1}{2}$ . Because there's a $\frac{1}{2}$ chance of the frog going up or down, the total probability for this case is $\frac{1}{2} \cdot \frac{1}{2} = \frac{1}{4}$ and summing up all the cases, $\frac{1}{4} + \frac{1}{8} + \frac{1}{4} = \frac{5}{8} \implies \boxed{\textbf{(B) } \frac{5}{8}}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_0b97773090 : Prop := by
  sorry
