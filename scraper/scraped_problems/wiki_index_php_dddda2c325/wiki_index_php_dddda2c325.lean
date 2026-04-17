-- 2022 AIME II Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_II_Problems/Problem_1

-- Problem (LaTeX):
/-
Adults made up $\frac5{12}$ of the crowd of people at a concert. After a bus carrying $50$ more people arrived, adults made up $\frac{11}{25}$ of the people at the concert. Find the minimum number of adults who could have been at the concert after the bus arrived.
-/

-- Solution/Answer (LaTeX):
/-
Let $x$ be the number of people at the party before the bus arrives. We know that $x\equiv 0\pmod {12}$ , as $\frac{5}{12}$ of people at the party before the bus arrives are adults. Similarly, we know that $x + 50 \equiv 0 \pmod{25}$ , as $\frac{11}{25}$ of the people at the party are adults after the bus arrives. $x + 50 \equiv 0 \pmod{25}$ can be reduced to $x \equiv 0 \pmod{25}$ , and since we are looking for the minimum amount of people, $x$ is $300$ . That means there are $350$ people at the party after the bus arrives, and thus there are $350 \cdot \frac{11}{25} = \boxed{154}$ adults at the party. ~eamo
-/

import Mathlib.Tactic

theorem wiki_index_php_dddda2c325 : Prop := by
  sorry
