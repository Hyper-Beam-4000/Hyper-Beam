-- 2018 AIME II Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_II_Problems/Problem_7

-- Problem (LaTeX):
/-
Triangle $ABC$ has side lengths $AB = 9$ , $BC =$ $5\sqrt{3}$ , and $AC = 12$ . Points $A = P_{0}, P_{1}, P_{2}, ... , P_{2450} = B$ are on segment $\overline{AB}$ with $P_{k}$ between $P_{k-1}$ and $P_{k+1}$ for $k = 1, 2, ..., 2449$ , and points $A = Q_{0}, Q_{1}, Q_{2}, ... , Q_{2450} = C$ are on segment $\overline{AC}$ with $Q_{k}$ between $Q_{k-1}$ and $Q_{k+1}$ for $k = 1, 2, ..., 2449$ . Furthermore, each segment $\overline{P_{k}Q_{k}}$ , $k = 1, 2, ..., 2449$ , is parallel to $\overline{BC}$ . The segments cut the triangle into $2450$ regions, consisting of $2449$ trapezoids and $1$ triangle. Each of the $2450$ regions has the same area. Find the number of segments $\overline{P_{k}Q_{k}}$ , $k = 1, 2, ..., 2450$ , that have rational length.
-/

-- Solution/Answer (LaTeX):
/-
For each $k$ between $2$ and $2450$ , the area of the trapezoid with $\overline{P_kQ_k}$ as its bottom base is the difference between the areas of two triangles, both similar to $\triangle{ABC}$ . Let $d_k$ be the length of segment $\overline{P_kQ_k}$ . The area of the trapezoid with bases $\overline{P_{k-1}Q_{k-1}}$ and $P_kQ_k$ is $\left(\frac{d_k}{5\sqrt{3}}\right)^2 - \left(\frac{d_{k-1}}{5\sqrt{3}}\right)^2 = \frac{d_k^2-d_{k-1}^2}{75}$ times the area of $\triangle{ABC}$ . (This logic also applies to the topmost triangle if we notice that $d_0 = 0$ .) However, we also know that the area of each shape is $\frac{1}{2450}$ times the area of $\triangle{ABC}$ . We then have $\frac{d_k^2-d_{k-1}^2}{75} = \frac{1}{2450}$ . Simplifying, $d_k^2-d_{k-1}^2 = \frac{3}{98}$ . However, we know that $d_0^2 = 0$ , so $d_1^2 = \frac{3}{98}$ , and in general, $d_k^2 = \frac{3k}{98}$ and $d_k = \frac{\sqrt{\frac{3k}{2}}}{7}$ . The smallest $k$ that gives a rational $d_k$ is $6$ , so $d_k$ is rational if and only if $k = 6n^2$ for some integer $n$ .The largest $n$ such that $6n^2$ is less than $2450$ is $20$ , so $k$ has $\boxed{020}$ possible values. Solution by zeroman
-/

import Mathlib.Tactic

theorem wiki_index_php_e9ea105cd9 : Prop := by
  sorry
