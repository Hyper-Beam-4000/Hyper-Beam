-- 2022 AMC 10A Problems/Problem 24
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_24

-- Problem (LaTeX):
/-
How many strings of length $5$ formed from the digits $0$ , $1$ , $2$ , $3$ , $4$ are there such that for each $j \in \{1,2,3,4\}$ , at least $j$ of the digits are less than $j$ ? (For example, $02214$ satisfies this condition
because it contains at least $1$ digit less than $1$ , at least $2$ digits less than $2$ , at least $3$ digits less
than $3$ , and at least $4$ digits less than $4$ . The string $23404$ does not satisfy the condition because it
does not contain at least $2$ digits less than $2$ .) $\textbf{(A) }500\qquad\textbf{(B) }625\qquad\textbf{(C) }1089\qquad\textbf{(D) }1199\qquad\textbf{(E) }1296$
-/

-- Solution/Answer (LaTeX):
/-
For some $n$ , let there be $n+1$ parking spaces counterclockwise in a circle. Consider a string of $n$ integers $c_1c_2 \ldots c_n$ each between $0$ and $n$ , and let $n$ cars come into this circle so that the $i$ th car tries to park at spot $c_i$ , but if it is already taken then it instead keeps going counterclockwise and takes the next available spot. After this process, exactly one spot will remain empty. Then the strings of $n$ numbers between $0$ and $n-1$ that contain at least $k$ integers $<k$ for $1 \leq k \leq n$ are exactly the set of strings that leave spot $n$ empty. Also note for any string $c_1c_2 \ldots c_n$ , we can add $1$ to each $c_i$ (mod $n+1$ ) to shift the empty spot counterclockwise, meaning for each string there exists exactly one $j$ with $0 \leq j \leq n$ so that $(c_1+j)(c_2+j) \ldots (c_n+j)$ leaves spot $n$ empty. This gives there are $\frac{(n+1)^{n}}{n+1} = (n+1)^{n-1}$ such strings. Plugging in $n = 5$ gives $\boxed{\textbf{(E) }1296}$ such strings. ~oh54321
-/

import Mathlib.Tactic

theorem wiki_index_php_a53a86ca53 : Prop := by
  sorry
