-- 2021 AIME II Problems/Problem 15
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AIME_II_Problems/Problem_15

-- Problem (LaTeX):
/-
Let $f(n)$ and $g(n)$ be functions satisfying \[f(n) = \begin{cases}\sqrt{n} & \text{ if } \sqrt{n} \text{ is an integer}\\ 1 + f(n+1) & \text{ otherwise} \end{cases}\] and \[g(n) = \begin{cases}\sqrt{n} & \text{ if } \sqrt{n} \text{ is an integer}\\ 2 + g(n+2) & \text{ otherwise} \end{cases}\] for positive integers $n$ . Find the least positive integer $n$ such that $\tfrac{f(n)}{g(n)} = \tfrac{4}{7}$ .
-/

-- Solution/Answer (LaTeX):
/-
Consider what happens when we try to calculate $f(n)$ where n is not a square. If $k^2<n<(k+1)^2$ for (positive) integer k, recursively calculating the value of the function gives us $f(n)=(k+1)^2-n+f((k+1)^2)=k^2+3k+2-n$ . Note that this formula also returns the correct value when $n=(k+1)^2$ , but not when $n=k^2$ . Thus $f(n)=k^2+3k+2-n$ for $k^2<n \leq (k+1)^2$ . If $2 \mid (k+1)^2-n$ , $g(n)$ returns the same value as $f(n)$ . This is because the recursion once again stops at $(k+1)^2$ . We seek a case in which $f(n)<g(n)$ , so obviously this is not what we want. We want $(k+1)^2,n$ to have a different parity, or $n, k$ have the same parity. When this is the case, $g(n)$ instead returns $(k+2)^2-n+g((k+2)^2)=k^2+5k+6-n$ . Write $7f(n)=4g(n)$ , which simplifies to $3k^2+k-10=3n$ . Notice that we want the LHS expression to be divisible by 3; as a result, $k \equiv 1 \pmod{3}$ . We also want n to be strictly greater than $k^2$ , so $k-10>0, k>10$ . The LHS expression is always even (since $3k^2+k-10$ factors to $k(3k+1)-10$ , and one of $k$ and $3k+1$ will be even), so to ensure that $k$ and $n$ share the same parity, $k$ should be even. Then the least $k$ that satisfies these requirements is $k=16$ , giving $n=258$ . Indeed - if we check our answer, it works. Therefore, the answer is $\boxed{258}$ . -Ross Gao
-/

import Mathlib.Tactic

theorem wiki_index_php_eff3fa5e40 : Prop := by
  sorry
