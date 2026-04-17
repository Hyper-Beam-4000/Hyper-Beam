-- 2024 AMC 10B Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_9

-- Problem (LaTeX):
/-
A dartboard is the region $B$ in the coordinate plane consisting of points $(x, y)$ such that $|x| + |y| \le 8$ . A target $T$ is the region where $(x^2 + y^2 - 25)^2 \le 49$ . A dart is thrown and lands at a random point in B. The probability that the dart lands in $T$ can be expressed as $\frac{m}{n} \cdot \pi$ , where $m$ and $n$ are relatively prime positive integers. What is $m + n$ ? $\textbf{(A) }39 \qquad \textbf{(B) }71 \qquad \textbf{(C) }73 \qquad \textbf{(D) }75 \qquad \textbf{(E) }135 \qquad$
-/

-- Solution/Answer (LaTeX):
/-
Inequalities of the form $|x|+|y| \le 8$ are well-known and correspond to a square in space with centre at origin and vertices at $(8, 0)$ , $(-8, 0)$ , $(0, 8)$ , $(0, -8)$ .
The diagonal length of this square is clearly $16$ , so it has an area of \[\frac{1}{2} \cdot 16 \cdot 16 = 128\] Now, \[(x^2 + y^2 - 25)^2 \le 49\] Converting to polar form, \[r^2 - 25 \le 7 \implies r \le \sqrt{32},\] and \[r^2 - 25 \ge -7\implies r\ge \sqrt{18}.\] The intersection of these inequalities is the circular region $T$ for which every circle in $T$ has a radius between $\sqrt{18}$ and $\sqrt{32}$ , inclusive. The area of such a region is thus $\pi(32-18)=14\pi.$ The requested probability is therefore $\frac{14\pi}{128} = \frac{7\pi}{64},$ yielding $(m,n)=(7,64).$ We have $m+n=7+64=\boxed{\textbf{(B)}\ 71}.$ -AbhiSood1234, countmath1
-/

import Mathlib.Tactic

theorem wiki_index_php_be2ff2fe2d : Prop := by
  sorry
