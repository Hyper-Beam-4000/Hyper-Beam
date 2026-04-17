-- 2025 AMC 12A Problems/Problem 21
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12A_Problems/Problem_21

-- Problem (LaTeX):
/-
There is a unique ordered triple $(a,k,m)$ of nonnegative integers such that \[\frac{4^a + 4^{a+k}+4^{a+2k}+\cdots + 4^{a+mk}}{2^a + 2^{a+k} + 2^{a+2k}+ \cdots + 2^{a+mk}} = 964.\] What is $a+k+m$ ? $\textbf{(A) } 8 \qquad \textbf{(B) } 9 \qquad \textbf{(C)} 10 \qquad \textbf{(D) } 11 \qquad \textbf{(E) } 12$
-/

-- Solution/Answer (LaTeX):
/-
The numerator can be written as $2^{2a} +2^{2a+2k}+...+2^{2a+2mk}$ , which is actually a sum of geometric series. This can be expressed as $2^{2a} \cdot \frac{1-2^{2k(m+1)}}{1-2^{2k}}$ . The denominator in the same way can be expressed as $2^a \cdot \frac{1-2^{k(m+1)}}{1-2^k}$ . Doing some algebra on the top and bottom we get: \begin{equation}
2^a \cdot \frac{1+2^{k(m+1)}}{1+2^k} = 964
\end{equation} The prime factorization of $964$ is $241 \cdot 2^2$ . Equating $2^a = 2^2$ , we get $a = 2$ . Next since $241$ is a prime number we equate the latter half of the product to $241$ .
\begin{equation}
\frac{1+2^{k(m+1)}}{1+2^k} = 241
\end{equation}
Doing some algebra we get, that $2^k(2^{km}-241) = 240$ The closest power of $2$ to $241$ is $256$ which is $2^8$ . So setting $km = 8$ , we get $2^8-241 = 15$ $2^k(15) = 240$ , $2^k = 16$ , $k = 4$ . This we know that if $k = 4$ , then $4m = 8$ , so $m = 2$ . Finally, we conclude that $a = 2$ , $m = 2$ , and $k = 4$ . $4+2+2 = 8$ , so the answer is $\fbox{A}$ ~MATHEMATICIAN635
~Minor Edits by MALICIOUSFISH23
~Minor edits by KINGFIREBOY Actually when it comes to $2^k(2^{km}-241) = 240$ ;
we can directly observe the answer by discovering $2^k$ is even and $2^{km}-241$ must be odd. So, the only available divisors of 240 is 16 and 15.
And we can have $m = 2$ , and $k = 4$ . ~DRA777
-/

import Mathlib.Tactic

theorem wiki_index_php_c42bb6793c : Prop := by
  sorry
