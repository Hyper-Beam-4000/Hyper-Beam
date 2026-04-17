-- 2022 AIME II Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_II_Problems/Problem_6

-- Problem (LaTeX):
/-
Let $x_1\leq x_2\leq \cdots\leq x_{100}$ be real numbers such that $|x_1| + |x_2| + \cdots + |x_{100}| = 1$ and $x_1 + x_2 + \cdots + x_{100} = 0$ . Among all such $100$ -tuples of numbers, the greatest value that $x_{76} - x_{16}$ can achieve is $\tfrac mn$ , where $m$ and $n$ are relatively prime positive integers. Find $m+n$ .
-/

-- Solution/Answer (LaTeX):
/-
To find the greatest value of $x_{76} - x_{16}$ , $x_{76}$ must be as large as possible, and $x_{16}$ must be as small as possible. If $x_{76}$ is as large as possible, $x_{76} = x_{77} = x_{78} = \dots = x_{100} > 0$ . If $x_{16}$ is as small as possible, $x_{16} = x_{15} = x_{14} = \dots = x_{1} < 0$ . The other numbers between $x_{16}$ and $x_{76}$ equal to $0$ . Let $a = x_{76}$ , $b = x_{16}$ . Substituting $a$ and $b$ into $|x_1| + |x_2| + \cdots + |x_{100}| = 1$ and $x_1 + x_2 + \cdots + x_{100} = 0$ we get: \[25a - 16b = 1\] \[25a + 16b = 0\] $a = \frac{1}{50}$ , $b = -\frac{1}{32}$ $x_{76} - x_{16} = a - b = \frac{1}{50} + \frac{1}{32} = \frac{41}{800}$ . $m+n = \boxed{\textbf{841}}$ ~ isabelchen
-/

import Mathlib.Tactic

theorem wiki_index_php_ef9bd315ab : Prop := by
  sorry
