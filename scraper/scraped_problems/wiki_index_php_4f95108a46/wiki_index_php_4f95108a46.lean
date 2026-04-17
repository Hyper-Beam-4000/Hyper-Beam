-- 2017 AMC 12B Problems/Problem 22
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12B_Problems/Problem_22

-- Problem (LaTeX):
/-
Abby, Bernardo, Carl, and Debra play a game in which each of them starts with four coins. The game consists of four rounds. In each round, four balls are placed in an urn---one green, one red, and two white. The players each draw a ball at random without replacement. Whoever gets the green ball gives one coin to whoever gets the red ball. What is the probability that, at the end of the fourth round, each of the players has four coins? $\textbf{(A)}\quad \dfrac{7}{576} \qquad \qquad \textbf{(B)}\quad \dfrac{5}{192} \qquad\qquad \textbf{(C)}\quad \dfrac{1}{36} \qquad\qquad \textbf{(D)}\quad \dfrac{5}{144} \qquad\qquad\textbf{(E)}\quad \dfrac{7}{48}$
-/

-- Solution/Answer (LaTeX):
/-
It amounts to filling in a $4 \times 4$ matrix. Columns $C_1 - C_4$ are the random draws each round; rowof each player. Also, let $\%R_A$ be the number of nonzero elements in $R_A$ .
Sidenote: (Not the author)(What does -1, 1, and 0, and R notation represent)? WLOG, let $C_1 = \begin{pmatrix} 1\\-1\\0\\0\end{pmatrix}$ . Parity demands that $\%R_A$ and $\%R_B$ must equal $2$ or $4$ . Case 1: $\%R_A = 4$ and $\%R_B = 4$ . There are $\binom{3}{2}=3$ ways to place $2$ $-1$ 's in $R_A$ , so there are $3$ ways. Case 2: $\%R_A = 2$ and $\%R_B=4$ . There are $3$ ways to place the $-1$ in $R_A$ , $2$ ways to place the remaining $-1$ in $R_B$ (just don't put it under the $-1$ on top of it!), and $2$ ways for one of the other two players to draw the green ball. (We know it's green because Bernardo drew the red one.) We can just double to cover the case of $\%R_A = 4$ , $\%R_B = 2$ for a total of $24$ ways. Case 3: $\%R_A=\%R_B=2$ . There are three ways to place the $-1$ in $R_A$ . Now, there are two cases as to what happens next. Sub-case 3.1: The $1$ in $R_B$ goes directly under the $-1$ in $R_A$ . There's obviously $1$ way for that to happen. Then, there are $2$ ways to permute the two pairs of $1, -1$ in $R_C$ and $R_D$ . (Either the $1$ comes first in $R_C$ or the $1$ comes first in $R_D$ .) Sub-case 3.2: The $1$ in $R_B$ doesn't go directly under the $-1$ in $R_A$ . There are $2$ ways to place the $1$ , and $2$ ways to do the same permutation as in Sub-case 3.1.
Hence, there are $3(2+2 \cdot 2)=18$ ways for this case. There's a grand total of $45$ ways for this to happen, along with $12^3$ total cases. The probability we're asking for is thus $\frac{45}{(12^3)}= \boxed{\textbf{(B)}\frac{5}{192}}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_4f95108a46 : Prop := by
  sorry
