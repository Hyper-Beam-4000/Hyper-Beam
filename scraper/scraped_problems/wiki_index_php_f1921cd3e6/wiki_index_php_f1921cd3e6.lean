-- 2017 AIME II Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_II_Problems/Problem_1

-- Problem (LaTeX):
/-
Find the number of subsets of $\{1, 2, 3, 4, 5, 6, 7, 8\}$ that are subsets of neither $\{1, 2, 3, 4, 5\}$ nor $\{4, 5, 6, 7, 8\}$ .
-/

-- Solution/Answer (LaTeX):
/-
The number of subsets of a set with $n$ elements is $2^n$ . The total number of subsets of $\{1, 2, 3, 4, 5, 6, 7, 8\}$ is equal to $2^8$ . The number of sets that are subsets of at least one of $\{1, 2, 3, 4, 5\}$ or $\{4, 5, 6, 7, 8\}$ can be found using complementary counting. There are $2^5$ subsets of $\{1, 2, 3, 4, 5\}$ and $2^5$ subsets of $\{4, 5, 6, 7, 8\}$ . It is easy to make the mistake of assuming there are $2^5+2^5$ sets that are subsets of at least one of $\{1, 2, 3, 4, 5\}$ or $\{4, 5, 6, 7, 8\}$ , but the $2^2$ subsets of $\{4, 5\}$ are overcounted. There are $2^5+2^5-2^2$ sets that are subsets of at least one of $\{1, 2, 3, 4, 5\}$ or $\{4, 5, 6, 7, 8\}$ , so there are $2^8-(2^5+2^5-2^2)$ subsets of $\{1, 2, 3, 4, 5, 6, 7, 8\}$ that are subsets of neither $\{1, 2, 3, 4, 5\}$ nor $\{4, 5, 6, 7, 8\}$ . $2^8-(2^5+2^5-2^2)=\boxed{196}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_f1921cd3e6 : Prop := by
  sorry
