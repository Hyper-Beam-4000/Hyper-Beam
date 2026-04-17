-- 2020 AIME I Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_I_Problems/Problem_10

-- Problem (LaTeX):
/-
Let $m$ and $n$ be positive integers satisfying the conditions $\quad\bullet\ \gcd(m+n,210)=1,$ $\quad\bullet\ m^m$ is a multiple of $n^n,$ and $\quad\bullet\ m$ is not a multiple of $n.$ Find the least possible value of $m+n.$
-/

-- Solution/Answer (LaTeX):
/-
Taking inspiration from $4^4 \mid 10^{10}$ we are inspired to take $n$ to be $p^2$ , the lowest prime not dividing $210$ , or $11 \implies n = 121$ . Now, there are $242$ factors of $11$ , so $11^{242} \mid m^m$ , and then $m = 11k$ for $k \geq 22$ . Now, $\gcd(m+n, 210) = \gcd(11+k,210) = 1$ . Noting $k = 26$ is the minimal that satisfies this, we get $(n,m) = (121,286)$ . Thus, it is easy to verify this is minimal and we get $\boxed{407}$ . ~awang11
-/

import Mathlib.Tactic

theorem wiki_index_php_09859ec54a : Prop := by
  sorry
