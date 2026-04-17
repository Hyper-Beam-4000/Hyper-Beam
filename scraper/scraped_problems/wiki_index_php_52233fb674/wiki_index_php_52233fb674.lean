-- 2022 AMC 12A Problems/Problem 25
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_25

-- Problem (LaTeX):
/-
A circle with integer radius $r$ is centered at $(r, r)$ . Distinct line segments of length $c_i$ connect points $(0, a_i)$ to $(b_i, 0)$ for $1 \le i \le 14$ and are tangent to the circle, where $a_i$ , $b_i$ , and $c_i$ are all positive integers and $c_1 \le c_2 \le \cdots \le c_{14}$ . What is the ratio $\frac{c_{14}}{c_1}$ for the least possible value of $r$ ? $\textbf{(A)} ~\frac{21}{5} \qquad\textbf{(B)} ~\frac{85}{13} \qquad\textbf{(C)} ~7 \qquad\textbf{(D)} ~\frac{39}{5} \qquad\textbf{(E)} ~17$
-/

-- Solution/Answer (LaTeX):
/-
Suppose that with a pair $(a_i,b_i)$ the circle is an excircle. Then notice that the hypotenuse must be $(r-x)+(r-y)$ , so it must be the case that \[a_i^2+b_i^2=(2r-a_i-b_i)^2.\] Similarly, if with a pair $(a_i,b_i)$ the circle is an incircle, the hypotenuse must be $(x-r)+(y-r)$ , leading to the same equation. Notice that this equation can be simplified through SFFT to \[(a_i-2r)(b_i-2r)=2r^2.\] Thus, we want the smallest $r$ such that this equation has at least $14$ distinct pairs $(a_i,b_i)$ for which this holds. The obvious choice to check is $r=6$ . In this case, since $2r^2=2^3\cdot 3^2$ has $12$ positive factors, we get $12$ pairs, and we get another two if the factors are $-8,-9$ or vice versa. One can check that for smaller values of $r$ , we do not even get close to $14$ possible pairs. When $r=6$ , the smallest possible $c$ -value is clearly when the factors are negative. When this occurs, $a_i=4, b_i=3$ (or vice versa), so the mimimal $c$ is $5$ . The largest possible $c$ -value occurs when the largest of $a_i$ and $b_i$ are maximized. This occurs when the factors are $72$ and $1$ , leading to $a_i=84, b_i=13$ (or vice-versa), leading to a maximal $c$ of $85$ . Hence the answer is $\frac{85}5=\boxed{17}$ . ~ bluelinfish
-/

import Mathlib.Tactic

theorem wiki_index_php_52233fb674 : Prop := by
  sorry
