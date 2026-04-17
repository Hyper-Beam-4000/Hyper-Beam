-- 2025 AMC 12B Problems/Problem 19
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_19

-- Problem (LaTeX):
/-
A rectangular grid of squares has $141$ rows and $91$ columns. Each square has room for two numbers. Horace and Vera each fill in the grid by putting the numbers from $1$ through $141 \times 91 = 12{,}831$ into the squares. Horace fills the grid horizontally: he puts $1$ through $91$ in order from left to right into row $1$ , puts $92$ through $182$ into row $2$ in order from left to right, and continues similarly through row $141$ . Vera fills the grid vertically: she puts $1$ through $141$ in order from top to bottom into column $1$ , then $142$ through $282$ into column $2$ in order from top to bottom, and continues similarly through column $91$ . How many squares get two copies of the same number? $\textbf{(A)}~7 \qquad \textbf{(B)}~10 \qquad \textbf{(C)}~11 \qquad \textbf{(D)}~12 \qquad \textbf{(E)}~19$
-/

-- Solution/Answer (LaTeX):
/-
Let's say $n$ is one of the numbers that got written twice in the same box. Suppose it is at column $x$ and row $y$ . We will write an expression for $n$ in terms of $x$ and $y$ in two ways: from Horace's perspective and Vera's perspective. From Horace's perspective, $n = (y-1)(141) + x$ . This is because there are $y-1$ full rows before $n$ , and we then need $x$ more numbers to reach $n$ . Similarly, Vera will say $n = (x-1)(91) + y$ . We now have the Diophantine equation \[(y-1)(141) + x = (x-1)(91)+y\] \[141y-141+x = 91x-91+y\] \[140y=90x+50\] \[14y = 9x + 5\] One such solution is, of course, $x=y=1$ . We find further solutions by adding $14$ to $x$ and $9$ to $y$ . For example, the second solution is $(15,10)$ . This continues until $(141,91)$ is reached. There are $\boxed{11}$ ordered pairs in this list. ~lprado
-/

import Mathlib.Tactic

theorem wiki_index_php_f1562ff24f : Prop := by
  sorry
