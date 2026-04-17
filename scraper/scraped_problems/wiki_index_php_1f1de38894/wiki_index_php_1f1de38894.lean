-- 2018 AIME II Problems/Problem 15
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_II_Problems/Problem_15

-- Problem (LaTeX):
/-
Find the number of functions $f$ from $\{0, 1, 2, 3, 4, 5, 6\}$ to the integers such that $f(0) = 0$ , $f(6) = 12$ , and \[|x - y| \leq |f(x) - f(y)| \leq 3|x - y|\] for all $x$ and $y$ in $\{0, 1, 2, 3, 4, 5, 6\}$ .
-/

-- Solution/Answer (LaTeX):
/-
First, suppose $x = y + 1$ . Then, the inequality becomes $1 \leq |f(y + 1) - f(y)| \leq 3$ . In other words, the (positive) difference between consecutive function values is $1$ , $2$ , or $3$ . Let $d_k := f(k) - f(k - 1)$ . Note that $f(x) - f(y) = \sum_{k=y+1}^{x} d_k.$ Thus, $\sum_{k=1}^{6} d_k = f(6) - f(0) = 12$ . Note that at most one value of $d_k$ in $\left\{d_1, d_2, d_3, d_4, d_5, d_6\right\}$ can be negative. This is because the maximum value of $d_1 + d_2 + d_3 + d_4 + d_5 + d_6$ would be $3 + 3 + 3 + 3 - 1 - 1 = 10$ if more than one value of $d_k$ is negative. Plugging $x = y + 2$ into the original inequality yields $2 \leq |f(y + 2) - f(y)| \leq 6$ , which becomes $2 \leq \left|d_{y+2} + d_{y+1}\right| \leq 6$ . The only way for $d_{y+2} + d_{y+1}$ to be negative while satisfying this inequality is for $\left(d_{y+2}, d_{y+1}\right)$ to equal $(1, -3)$ or $(-3, 1)$ . However, this forces $d_1 + d_2 + d_3 + d_4 + d_5 + d_6 \leq 3 + 3 + 3 + 3 + 1 - 3 = 10 < 12$ , which is disallowed. Hence, we conclude that the following stronger inequality, $2 \leq d_{y + 2} + d_{y + 1} \leq 6,$ is always true. We now have two cases of functions to count. For future reference let $D$ be the (ordered) sequence $\left\{d_1, d_2, d_3, d_4, d_5, d_6\right\}$ . Case 1: There is exactly one instance of $d_k = -1$ . By the "stronger" inequality above, $d_{k-1} = 3$ if $k > 1$ , and $d_{k+1} = 3$ if $k < 6$ . If $2 \leq k \leq 5$ , then $D$ contains the subsequence $\left\{3, -1, 3\right\}$ , and the other three $d$ -values sum to $7$ , so they are either $3$ , $3$ , and $1$ in some order, or they are $2$ , $2$ , and $3$ in some order. Thus, each $k \in \{2, 3, 4, 5\}$ for which $d_k = -1$ produces $6$ sequences $D$ . If $k = 1$ or $k = 6$ , then $D$ begins with $\{-1, 3\}$ or ends with $\{3, -1\}$ , respectively. Either way, the remaining four $d$ -values sum to $10$ , so they can be any permutation of $\{3, 3, 2, 2\}$ (six permutations) or $\{3, 3, 3, 1\}$ (four permutations). Each of these vaues of $k$ yields $6 + 4 = 10$ sequences, so our total count for Case 1 is $4 \cdot 6 + 2 \cdot 10 = 44$ . Case 2: All values of $d$ are positive. Then, $D$ is a permutation of $\{3, 3, 3, 1, 1, 1\}$ , $\{3, 3, 2, 2, 1, 1\}$ , $\{3, 2, 2, 2, 2, 1\}$ , or $\{2, 2, 2, 2, 2, 2\}$ .
The number of ways to permute three $3$ s and three $1$ s is $\frac{6!}{3! \cdot 3!} = 20$ .
The number of ways to permute two $3$ s, two $2$ s, and two $1$ s is $\frac{6!}{2! \cdot 2! \cdot 2!} = 90$ .
The number of ways to permute one $3$ , four $2$ s, and one $1$ is $\frac{6!}{1! \cdot 4! \cdot 1!} = 30$ .
Finally, there is obviously only $1$ way to permute six $2$ s. Our total count for Case 2 is $20 + 90 + 30 + 1 = 141$ . To complete the justification that all of these $44 + 141 = \boxed{185}$ cases satisfy the original inequality, we leverage the fact that $\{f(x)\}_{x=0}^{6}$ is either monotonically increasing (Case 2) or the union of two monotonically increasing subsequences (Case 1). Consider any monotonically increasing subsequence that starts at $x = a$ and ends at $x = b$ . For $a < k \leq b$ , $d_k$ will be positive, allowing us to remove the absolute value bars from the original inequality: $x - y \leq f(x) - f(y) \leq 3(x - y).$ Now, the inequality is transitive; supposing $a \leq x_3 < x_2 < x_1 \leq b$ , if the inequality is satisfied at $(x, y) = \left(x_1, x_2\right)$ and at $(x, y) = \left(x_2, x_3\right)$ , then it is also satisfied at $(x, y) = \left(x_1, x_3\right)$ . If we ever have a decreasing part where $f(x + 1) < f(x)$ , then we can use some variant of the inequality $2 \leq f(x + 1) - f(x - 1) \leq 6$ , which we derived earlier. This is a specific case of $x - y \leq f(x) - f(y) \leq 3(x - y)$ , so we can finish off the argument by invoking transitivity. -kgator
-/

import Mathlib.Tactic

theorem wiki_index_php_1f1de38894 : Prop := by
  sorry
