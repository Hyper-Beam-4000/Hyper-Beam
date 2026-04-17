-- 2022 AMC 12A Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_3

-- Problem (LaTeX):
/-
Five rectangles, $A$ , $B$ , $C$ , $D$ , and $E$ , are arranged in a square as shown below. These rectangles have dimensions $1\times6$ , $2\times 4$ , $5\times6$ , $2\times7$ , and $2\times3$ , respectively. (The figure is not drawn to scale.) Which of the five rectangles is the shaded one in the middle? [asy] size(150); currentpen = black+1.25bp; fill((3,2.5)--(3,4.5)--(5.3,4.5)--(5.3,2.5)--cycle,gray); draw((0,0)--(7,0)--(7,7)--(0,7)--(0,0)); draw((3,0)--(3,4.5)); draw((0,4.5)--(5.3,4.5)); draw((5.3,7)--(5.3,2.5)); draw((7,2.5)--(3,2.5)); [/asy] $\textbf{(A) }A\qquad\textbf{(B) }B \qquad\textbf{(C) }C \qquad\textbf{(D) }D\qquad\textbf{(E) }E$
-/

-- Solution/Answer (LaTeX):
/-
The area of this square is equal to $6 + 8 + 30 + 14 + 6 = 64$ , and thus its side lengths are $8$ . The sum of the dimensions of the rectangles are $2 + 7 + 5 + 6 + 2 + 3 + 1 + 6 + 2 + 4 = 38$ . Thus, because the perimeter of the square is $32$ , the rectangle on the inside must have a perimeter of $6 \cdot 2 = 12$ . The only rectangle that works is $\boxed{\textbf{(B) }B}$ . ~mathboy100
-/

import Mathlib.Tactic

theorem wiki_index_php_52500e6a19 : Prop := by
  sorry
