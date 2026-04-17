-- 2025 AIME II Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AIME_II_Problems/Problem_3

-- Problem (LaTeX):
/-
Four unit squares form a $2 \times 2$ grid. Each of the $12$ unit line segments forming the sides of the squares is colored either red or blue in such a way that each unit square has $2$ red sides and $2$ blue sides. One example is shown below (red is solid, blue is dashed). Find the number of such colorings.
-/

-- Solution/Answer (LaTeX):
/-
Let the red edges be "used" edges. In the digarams below, dashed lines are uncolored lines yet to be decided. Since all four center edges are common to both squares, we consider five distinct cases: $\textbf{Case 1:}$ All center edges are used. There is only one way to do this. [asy] pair A,B,C,D,E,F,G,H,I; A=(-1,-1);B=(-1,0);C=(-1,1);D=(0,-1);E=(0,0);F=(0,1);G=(1,-1);H=(1,0);I=(1,1); draw(A--C--I--G--cycle,dashed); draw(B--H,red); draw(D--F,red); [/asy] $\textbf{Case 2:}$ Three center edges are used, meaning two squares are missing an edge. For each square, there are 2 ways to choose an edge, resulting in $2 \times 2 = 4$ ways. Additionally, considering the rotational symmetry of the arrangement, there are 4 possible rotations, giving a total of $4 \times 4 = 16$ configurations. [asy] pair A,B,C,D,E,F,G,H,I; A=(-1,-1);B=(-1,0);C=(-1,1);D=(0,-1);E=(0,0);F=(0,1);G=(1,-1);H=(1,0);I=(1,1); draw(A--C--I--G--cycle,dashed); draw(B--H,red); draw(D--E,red);draw(E--F,dashed); [/asy] $\textbf{Case 3:}$ Two center edges are used. There are two sub-cases: $\textbf{Scenario 1:}$ The two selected sides are perpendicular to each other. The square diagonally opposite its adjacent square has only one choice, while the other two squares each have two choices. This gives a total of $1 \times 2 \times 2 = 4$ choices. Considering the 4 possible rotations, the total number of configurations is $4 \times 4 = 16$ . [asy] pair A,B,C,D,E,F,G,H,I; A=(-1,-1);B=(-1,0);C=(-1,1);D=(0,-1);E=(0,0);F=(0,1);G=(1,-1);H=(1,0);I=(1,1); draw(A--C--I--G--cycle,dashed); draw(B--E,red); draw(E--D,red);draw(E--F,dashed);draw(E--H,dashed); [/asy] $\textbf{Scenario 2:}$ The two selected sides are aligned along the same straight line. Each of the four squares has 2 choices, yielding $2^4 = 16$ possible choices. Taking into account the 2 possible rotations, the total number of configurations is $16 \times 2 = 32$ . [asy] pair A,B,C,D,E,F,G,H,I; A=(-1,-1);B=(-1,0);C=(-1,1);D=(0,-1);E=(0,0);F=(0,1);G=(1,-1);H=(1,0);I=(1,1); draw(A--C--I--G--cycle,dashed); draw(B--H,red); draw(D--F,dashed); [/asy] $\textbf{Case 4:}$ Only one center edge is used. This case is similar to Case 2, yielding 16 possible configurations. [asy] pair A,B,C,D,E,F,G,H,I; A=(-1,-1);B=(-1,0);C=(-1,1);D=(0,-1);E=(0,0);F=(0,1);G=(1,-1);H=(1,0);I=(1,1); draw(A--C--I--G--cycle,dashed); draw(B--E,red); draw(E--D,dashed);draw(E--F,dashed);draw(E--H,dashed); [/asy] $\textbf{Case 5:}$ No center edge is used. This is similar to Case 1, with only 1 possible configuration. [asy] pair A,B,C,D,E,F,G,H,I; A=(-1,-1);B=(-1,0);C=(-1,1);D=(0,-1);E=(0,0);F=(0,1);G=(1,-1);H=(1,0);I=(1,1); draw(A--C--I--G--cycle,dashed); draw(B--E,dashed); draw(E--D,dashed);draw(E--F,dashed);draw(E--H,dashed); [/asy] In conclusion, the total number of configurations is: \[1 + 16 + 16 + 32 + 16 + 1 = \boxed{\textbf{082}}\] ~ Athmyx ~ LaTeX by eevee9406 ~ Additional edits by aoum
-/

import Mathlib.Tactic

theorem wiki_index_php_f5cf1c36cf : Prop := by
  sorry
