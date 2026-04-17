-- 2025 AMC 12B Problems/Problem 24
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_24

-- Problem (LaTeX):
/-
How many real numbers satisfy the equation $\sin(20\pi x) = \log_{20}(x)$ ? $\textbf{(A) } 199 \qquad \textbf{(B) } 200 \qquad \textbf{(C) } 398 \qquad \textbf{(D) } 399 \qquad \textbf{(E) } 400$
-/

-- Solution/Answer (LaTeX):
/-
Let $f(x)=\sin(20\pi x)$ and $g(x)=\log_{20}(x)$ . Note that $g$ passes through $\left(\frac{1}{20},-1\right)$ and $(1,0)$ and $(20,1)$ ; these are the extrema and midpoint of $f$ . We want to find the number of intersections of $f$ and $g$ . Let an occurrence of sine passing under the $x$ -axis a down-dip , and similarly define an up-dip . We find that the period of $f$ is $\frac{1}{10}$ , so between $x=\frac{1}{20}$ and $x=1$ the number of periods is $9.5$ . The first period indeed counts, so effectively we have $10$ down-dips in this interval. Each down-dip contributes $2$ to the total, so we have $20$ total intersections. From $x=1$ to $x=20$ , there are $190$ periods, each of which also contributes $2$ to the total due to the up-dips. Therefore, this case contributes $380$ points to the total. But $(1,0)$ is counted in both cases, so the total is $20+380-1=\boxed{\textbf{(D) } 399}$ . ~ eevee9406
-/

import Mathlib.Tactic

theorem wiki_index_php_c8c6d09917 : Prop := by
  sorry
