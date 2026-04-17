-- 2023 AIME II Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AIME_II_Problems/Problem_10

-- Problem (LaTeX):
/-
Let $N$ be the number of ways to place the integers $1$ through $12$ in the $12$ cells of a $2 \times 6$ grid so that for any two cells sharing a side, the difference between the numbers in those cells is not divisible by $3.$ One way to do this is shown below. Find the number of positive integer divisors of $N.$ \[\begin{array}{|c|c|c|c|c|c|} \hline \,1\, & \,3\, & \,5\, & \,7\, & \,9\, & 11 \\ \hline \,2\, & \,4\, & \,6\, & \,8\, & 10 & 12 \\ \hline \end{array}\]
-/

-- Solution/Answer (LaTeX):
/-
We replace the numbers which are $0 \pmod 3$ to $0$ , $1 \pmod 3$ to $1$ , and $2 \pmod 3$ to $2$ . Then, the problem is equivalent to arranging four $0$ 's, four $1$ 's, and four $2$ 's into the grid (and then multiplying by $4!^3$ to account for replacing the remainder numbers with actual numbers) such that no 2 of the same numbers are adjacent. Then, the numbers which are vertically connected must be different. Two 1s must be connected with two 2s, and two 1s must be connected with two 0s (vertically), as if there are less 1s connected with either, then there will be 2s or 0s which must be connected within the same number.
For instance if we did did: Then we would be left with one (0,2), and two remaining 0s which aren't supposed to be connected, so it is impossible. Similar logic works for why all 1s can't be connected with all 2s.
Thus, we are left with the problem of re-arranging two (1,2) pairs, two (1,0) pairs, two (2,0) pairs. Notice that the pairs can be re-arranged horizontally in any configuration, but when two pairs are placed adjacent there is only one configuration for the rightmost pair to be set after the leftmost one has been placed.
We have $\frac{6!}{2!2!2!}=90$ ways to horizontally re-arrange the pairs, with 2 ways to set the initial leftmost column. Thus, there are 180 ways to arrange the pairs. Accounting for the initial simplification of the problem with 1-12 $\rightarrow$ 0-3, we obtain the answer is: \[2488320=2^{11}\cdot3^5\cdot5^1\] The number of divisors is: $12\cdot6\cdot2=\boxed{144}.$ ~SAHANWIJETUNGA
-/

import Mathlib.Tactic

theorem wiki_index_php_6e8bd48dd1 : Prop := by
  sorry
