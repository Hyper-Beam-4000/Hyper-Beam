-- 2020 AIME II Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_II_Problems/Problem_10

-- Problem (LaTeX):
/-
Find the sum of all positive integers $n$ such that when $1^3+2^3+3^3+\cdots +n^3$ is divided by $n+5$ , the remainder is $17$ .
-/

-- Solution/Answer (LaTeX):
/-
The formula for the sum of cubes, also known as Nicomachus's Theorem, is as follows: \[1^3+2^3+3^3+\dots+k^3=(1+2+3+\dots+k)^2=\left(\frac{k(k+1)}{2}\right)^2\] for any positive integer $k$ . So let's apply this to this problem. Let $m=n+5$ . Then we have \begin{align*} 1^3+2^3+3^3+\dots+(m-5)^3&\equiv 17 \mod m \\ \left(\frac{(m-5)(m-4)}{2}\right)^2&\equiv 17 \mod m \\ \left(\dfrac{m(m-9)+20}2\right)^2&\equiv 17\mod m \\ \left(m(m-9)+20\right)^2&\equiv 4\cdot 17\mod m \\ \left(20\right)^2&\equiv 68\mod m \\ 332 &\equiv 0 \mod m \\ \end{align*} So, $m\in\{83,166,332\}$ . Testing the cases, only $332$ fails. This leaves $78+161=\boxed{239}$ . $\LaTeX$ and formatting adjustments and intermediate steps for clarification by Technodoggo.
-/

import Mathlib.Tactic

theorem wiki_index_php_e0d1a3bacf : Prop := by
  sorry
