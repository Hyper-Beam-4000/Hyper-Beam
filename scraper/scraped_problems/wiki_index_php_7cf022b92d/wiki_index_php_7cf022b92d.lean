-- 2024 AMC 10A Problems/Problem 21
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_14

-- Problem (LaTeX):
/-
The numbers, in order, of each row and the numbers, in order, of each column of a $5 \times 5$ array of integers form an arithmetic progression of length $5$ . The numbers in positions $(5, 5), \,(2,4),\,(4,3),$ and $(3, 1)$ are $0, 48, 16,$ and $12$ , respectively. What number is in position $(1, 2)?$ \[\begin{bmatrix} . & ? &.&.&. \\ .&.&.&48&.\\ 12&.&.&.&.\\ .&.&16&.&.\\ .&.&.&.&0\end{bmatrix}\] $\textbf{(A) } 19 \qquad \textbf{(B) } 24 \qquad \textbf{(C) } 29 \qquad \textbf{(D) } 34 \qquad \textbf{(E) } 39$
-/

-- Solution/Answer (LaTeX):
/-
Start from the $0$ . Going up, let the common difference be $a$ , and going left, let the common difference be $b$ . Therefore, we have \[\begin{bmatrix} . & ? &.&.&4a \\ .&.&.&48&3a\\ 12&.&.&.&2a\\ .&.&16&.&a\\ 4b&3b&2b&b&0\end{bmatrix}\] Looking at the third column, we can see that the common difference going up is $16-2b$ . We fill this in: \[\begin{bmatrix} . & ? &64-6b&.&4a \\ .&.&48-4b&48&3a\\ 12&.&32-2b&.&2a\\ .&.&16&.&a\\ 4b&3b&2b&b&0\end{bmatrix}\] Looking at the second row, $48$ has two values beside it, so we can write \[48=\dfrac{48-4b+3a}{2}\rightarrow96=48-4b+3a\rightarrow48=-4b+3a,\] and we can do the same with the third row, which gives \[32-2b=\dfrac{12+2a}{2}\rightarrow32-2b=6+a\rightarrow26=a+2b.\] Now we have the system of equations \[48=-4b+3a\] \[26=a+2b,\] and solving it gives $a=20,b=3$ , therefore we can now fill in the grid with actual numbers. But before doing that, note that we're only looking for a value in the first row, and because we already have two known values in that row, we can find the common difference for that row and not focus on anything else. Focusing only on the first row yields \[\begin{bmatrix} . & ? &46&.&80\end{bmatrix}\] This means that the common difference from right to left is $\dfrac{80-46}{2}=17$ . Therefore, the desired value is $46-17=\boxed{\text{(C) }29}$ ~Tacos_are_yummy_1
-/

import Mathlib.Tactic

theorem wiki_index_php_7cf022b92d : Prop := by
  sorry
