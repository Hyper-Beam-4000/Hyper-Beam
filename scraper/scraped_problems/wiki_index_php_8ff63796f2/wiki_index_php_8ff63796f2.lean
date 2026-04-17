-- 2024 AIME II Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AIME_II_Problems/Problem_2

-- Problem (LaTeX):
/-
A list of positive integers has the following properties: $\bullet$ The sum of the items in the list is $30$ . $\bullet$ The unique mode of the list is $9$ . $\bullet$ The median of the list is a positive integer that does not appear in the list itself. Find the sum of the squares of all the items in the list.
-/

-- Solution/Answer (LaTeX):
/-
The third condition implies that the list's size must be an even number, as if it were an odd number, the median of the list would surely appear in the list itself. Therefore, we can casework on what even numbers work. Say the size is 2. Clearly, this doesn't work as the only list would be $\{9, 9\}$ , which doesn't satisfy condition 1. If the size is 4, then we can have two $9$ s, and a remaining sum of $12$ . Since the other two values in the list must be distinct, and their sum must equal $30-18=12$ , we have that the two numbers are in the form $a$ and $12-a$ . Note that we cannot have both values greater than $9$ , and we cannot have only one value greater than $9$ , because this would make the median $9$ , which violates condition 3. Since the median of the list is a positive integer, this means that the greater of $a$ and $12-a$ must be an odd number. The only valid solution to this is $a=5$ . Thus, our answer is $5^2+7^2+9^2+9^2 = \boxed{236}$ . ~akliu
-/

import Mathlib.Tactic

theorem wiki_index_php_8ff63796f2 : Prop := by
  sorry
