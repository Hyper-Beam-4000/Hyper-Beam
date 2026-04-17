-- 2025 AMC 12B Problems/Problem 17
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_17

-- Problem (LaTeX):
/-
Each of the $9$ squares in a ${3 \times 3}$ grid is to be colored red, blue, or yellow in such a way that each red square shares an edge with at least one blue square, each blue square shares an edge with at least one yellow square, and each yellow square shares an edge with at least one red square. Colorings that can be obtained from one another by rotations and/or reflections are considered the same. How many different colorings are possible? $\textbf{(A) } 3 \qquad \textbf{(B) } 9 \qquad \textbf{(C) } 12 \qquad \textbf{(D) } 18 \qquad \textbf{(E) } 27$
-/

-- Solution/Answer (LaTeX):
/-
Denote $1=\text{red}$ , $2=\text{blue}$ , $3=\text{yellow}$ . We need $1\to 2\to 3\to 1$ . WLOG place $1$ in the center $(0,0)$ , $2$ on the left edge $(-1,0)$ , $3$ on the top-left corner $(-1,1)$ . \[\begin{bmatrix} 3 & 0 & 0 \\ 2 & 1 & 0 \\ 0 & 0 & 0 \end{bmatrix}\] $3$ must see $1$ , so the top edge $(0,1)$ must also have $1$ . Then, $1$ must see $2$ , so the top-right corner $(1,1)$ becomes $2$ , which must see $3$ , so the right edge $(1,0)$ must have $3$ . \[\begin{bmatrix} 3 & 1 & 2 \\ 2 & 1 & 3 \\ 0 & 0 & 0 \end{bmatrix}\] Now this bottom-right corner can vary either as $1$ , $2$ or $3$ .
Cases on $(1,-1)$ :
If $1$ : \[\begin{bmatrix} 3 & 1 & 2 \\ 2 & 1 & 3 \\ 3 & 2 & 1 \end{bmatrix}\] but the 3 needs a 1 and does not have it, so there are $0$ cases.
If $2$ : \[\begin{bmatrix} 3 & 1 & 2 \\ 2 & 1 & 3 \\ b & a & 2 \end{bmatrix}\] if $a=1$ , $b$ can be $1$ or $3$ . If $a=2$ , $b=3$ , but the 3 needs a 1 and can't get it.
If $a=3$ , $b=1,2$ , so there are $4$ cases in total.
If $3$ : \[\begin{bmatrix} 3 & 1 & 2 \\ 2 & 1 & 3 \\ 2 & 1 & 3 \end{bmatrix}\] Since the 2 in the bottom left corner does not have a 3 nearby, there are $0$ cases. WLOG the center fixes a factor of $3$ , so the answer is $4\cdot 3=\boxed{\textbf{(C) } 12}$ . ~imosilver
- hey random question did u get silver in IMO ? W if u did ,lwky nice solution =)
~edited by Alex Tu
-/

import Mathlib.Tactic

theorem wiki_index_php_7f4152db07 : Prop := by
  sorry
