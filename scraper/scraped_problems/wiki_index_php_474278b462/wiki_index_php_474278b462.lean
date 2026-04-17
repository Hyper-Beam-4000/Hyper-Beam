-- 2018 AMC 12B Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12B_Problems/Problem_5

-- Problem (LaTeX):
/-
How many subsets of $\{2,3,4,5,6,7,8,9\}$ contain at least one prime number? $\textbf{(A) } 128 \qquad \textbf{(B) } 192 \qquad \textbf{(C) } 224 \qquad \textbf{(D) } 240 \qquad \textbf{(E) } 256$
-/

-- Solution/Answer (LaTeX):
/-
Since an element of a subset is either in or out, the total number of subsets of the $8$ -element set is $2^8 = 256$ . However, since we are only concerned about the subsets with at least $1$ prime in it, we can use complementary counting to count the subsets without a prime and subtract that from the total. Because there are $4$ non-primes, there are $2^8 -2^4 = \boxed{\textbf{(D) } 240}$ subsets with at least $1$ prime.
-/

import Mathlib.Tactic

theorem wiki_index_php_474278b462 : Prop := by
  sorry
