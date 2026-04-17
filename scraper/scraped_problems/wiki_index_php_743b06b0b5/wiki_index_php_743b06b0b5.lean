-- 2017 AIME II Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_II_Problems/Problem_6

-- Problem (LaTeX):
/-
Find the sum of all positive integers $n$ such that $\sqrt{n^2+85n+2017}$ is an integer.
-/

-- Solution/Answer (LaTeX):
/-
Manipulating the given expression, $\sqrt{n^2+85n+2017}=\frac{1}{2}\sqrt{4n^2+340n+8068}=\frac{1}{2}\sqrt{(2n+85)^2+843}$ . The expression under the radical must be an square number for the entire expression to be an integer, so $(2n+85)^2+843=s^2$ . Rearranging, $s^2-(2n+85)^2=843$ . By difference of squares, $(s-(2n+85))(s+(2n+85))=1\times843=3\times281$ . It is easy to check that those are all the factor pairs of 843. Considering each factor pair separately, $2n+85$ is found to be $421$ and $139$ . The two values of $n$ that satisfy one of the equations are $168$ and $27$ . Summing these together gives us the answer ; $168+27=\boxed{195}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_743b06b0b5 : Prop := by
  sorry
