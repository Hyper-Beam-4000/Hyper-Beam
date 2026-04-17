-- 2017 AIME I Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_I_Problems/Problem_4

-- Problem (LaTeX):
/-
A pyramid has a triangular base with side lengths $20$ , $20$ , and $24$ . The three edges of the pyramid from the three corners of the base to the fourth vertex of the pyramid all have length $25$ . The volume of the pyramid is $m\sqrt{n}$ , where $m$ and $n$ are positive integers, and $n$ is not divisible by the square of any prime. Find $m+n$ .
-/

-- Solution/Answer (LaTeX):
/-
Let the triangular base be $\triangle ABC$ , with $\overline {AB} = 24$ . We find that the altitude to side $\overline {AB}$ is $16$ , so the area of $\triangle ABC$ is $(24*16)/2 = 192$ . Let the fourth vertex of the tetrahedron be $P$ , and let the midpoint of $\overline {AB}$ be $M$ . Since $P$ is equidistant from $A$ , $B$ , and $C$ , the line through $P$ perpendicular to the plane of $\triangle ABC$ will pass through the circumcenter of $\triangle ABC$ , which we will call $O$ . Note that $O$ is equidistant from each of $A$ , $B$ , and $C$ . Then, \[\overline {OM} + \overline {OC} = \overline {CM} = 16\] Let $\overline {OM} = d$ . Then $OC=OA=\sqrt{d^2+12^2}.$ Equation $(1)$ : \[d + \sqrt {d^2 + 144} = 16\] Squaring both sides, we have \[d^2 + 144 + 2d\sqrt {d^2+144} + d^2 = 256\] \[2d^2 + 2d\sqrt {d^2+144} = 112\] \[2d(d + \sqrt {d^2+144}) = 112\] Substituting with equation $(1)$ : \[2d(16) = 112\] \[d = 7/2\] We now find that $\sqrt{d^2 + 144} = 25/2$ . Let the distance $\overline {OP} = h$ . Using the Pythagorean Theorem on triangle $AOP$ , $BOP$ , or $COP$ (all three are congruent by SSS): \[25^2 = h^2 + (25/2)^2\] \[625 = h^2 + 625/4\] \[1875/4 = h^2\] \[25\sqrt {3} / 2 = h\] Finally, by the formula for volume of a pyramid, \[V = Bh/3\] \[V = (192)(25\sqrt{3}/2)/3\] This simplifies to $V = 800\sqrt {3}$ , so $m+n = \boxed {803}$ . NOTE : If you don’t know or remember the formula for the volume of a triangular pyramid, you can derive it using calculus as follows : Take a small triangular element in the pyramid. We know that it’s area is proportional to the height from the vertex to the base. Hence, we know that $\frac{A_{small element}}{A} = \frac{h^2}{H^2} \implies A_{small element} = \frac{Ah^2}{H^2}$ . Now integrate it taking the limits $0$ to $H$
-/

import Mathlib.Tactic

theorem wiki_index_php_27783a7fd1 : Prop := by
  sorry
