-- 2021 AIME II Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AIME_II_Problems/Problem_6

-- Problem (LaTeX):
/-
For any finite set $S$ , let $|S|$ denote the number of elements in $S$ . Find the number of ordered pairs $(A,B)$ such that $A$ and $B$ are (not necessarily distinct) subsets of $\{1,2,3,4,5\}$ that satisfy \[|A| \cdot |B| = |A \cap B| \cdot |A \cup B|\]
-/

-- Solution/Answer (LaTeX):
/-
By PIE, $|A|+|B|-|A \cap B| = |A \cup B|$ . Substituting into the equation and factoring, we get that $(|A| - |A \cap B|)(|B| - |A \cap B|) = 0$ , so therefore $A \subseteq B$ or $B \subseteq A$ . WLOG $A\subseteq B$ , then for each element there are $3$ possibilities, either it is in both $A$ and $B$ , it is in $B$ but not $A$ , or it is in neither $A$ nor $B$ . This gives us $3^{5}$ possibilities, and we multiply by $2$ since it could have also been the other way around. Now we need to subtract the overlaps where $A=B$ , and this case has $2^{5}=32$ ways that could happen. It is $32$ because each number could be in the subset or it could not be in the subset. So the final answer is $2\cdot 3^5 - 2^5 = \boxed{454}$ . ~math31415926535
-/

import Mathlib.Tactic

theorem wiki_index_php_e5d6596c38 : Prop := by
  sorry
