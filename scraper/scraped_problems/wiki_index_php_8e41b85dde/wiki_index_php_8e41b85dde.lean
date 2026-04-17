-- 2022 AIME II Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_II_Problems/Problem_10

-- Problem (LaTeX):
/-
Find the remainder when \[\binom{\binom{3}{2}}{2} + \binom{\binom{4}{2}}{2} + \dots + \binom{\binom{40}{2}}{2}\] is divided by $1000$ .
-/

-- Solution/Answer (LaTeX):
/-
We first write the expression as a summation. \begin{align*} \sum_{i=3}^{40} \binom{\binom{i}{2}}{2} & = \sum_{i=3}^{40} \binom{\frac{i \left( i - 1 \right)}{2}}{2} \\ & = \sum_{i=3}^{40} \frac{\frac{i \left( i - 1 \right)}{2} \left( \frac{i \left( i - 1 \right)}{2}- 1 \right)}{2} \\ & = \frac{1}{8} \sum_{i=3}^{40} i \left( i - 1 \right) \left( i \left( i - 1 \right) - 2 \right) \\ & = \frac{1}{8} \sum_{i=3}^{40} i(i - 1)(i^2-i-2) \\ & = \frac{1}{8} \sum_{i=3}^{40} i(i-1)(i+1)(i-2) \\ & = \frac{1}{8}\sum_{i=3}^{40} (i-2)(i-1)i(i+1) \\ & = \frac{1}{40}\sum_{i=3}^{40}[(i-2)(i-1)i(i+1)(i+2)-(i-3)(i-2)(i-1)i(i+1)]* \\ & = \frac{38\cdot39\cdot40\cdot41\cdot42-0}{40}\\ & = 38 \cdot 39 \cdot 41 \cdot 42 \\ & = \left( 40 - 2 \right) \left( 40 - 1 \right) \left( 40 + 1 \right) \left( 40 + 2 \right) \\ & = \left( 40^2 - 2^2 \right) \left( 40^2 - 1^2 \right) \\ & = \left( 40^2 - 4 \right) \left( 40^2 - 1 \right) \\ & = 40^4 - 40^2 \cdot 5 + 4 \\ & \equiv \boxed{004}\pmod{1000}\ \end{align*} $*(i-2)(i-1)i(i+1)=\frac{1}{5}[(i-2)(i-1)i(i+1)(i+2)-(i-3)(i-2)(i-1)i(i+1)]$ is how we force the expression to telescope.
~qyang
-/

import Mathlib.Tactic

theorem wiki_index_php_8e41b85dde : Prop := by
  sorry
