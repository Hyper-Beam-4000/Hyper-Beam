-- 2025 AMC 12A Problems/Problem 15
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12A_Problems/Problem_15

-- Problem (LaTeX):
/-
A set of numbers is called sum-free if whenever $x$ and $y$ are (not necessarily distinct) elements of the set, $x+y$ is not an element of the set. For example, $\{1,4,6\}$ and the empty set are sum-free, but $\{1,4,5\}$ is not. What is the greatest possible number of elements in a sum-free subset of $\{1,2,3,...,20\}$ ? $\textbf{(A) } 8 \qquad\textbf{(B) } 9 \qquad\textbf{(C) } 10 \qquad\textbf{(D) } 11 \qquad\textbf{(E) } 12$
-/

-- Solution/Answer (LaTeX):
/-
Let our subset be $\{11,12,13,...,20\}.$ If we add any element from the set $\{1,2,3,...,10\}$ to our current subset, we will have to remove at least one element from our subset. Hence, the maximum size of our subset is $\boxed{\text{(C) }10}$ . ~Tacos_are_yummy_1 ~nithins minor edit
-/

import Mathlib.Tactic

theorem wiki_index_php_3406b9f88a : Prop := by
  sorry
