-- 2025 AIME I Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AIME_I_Problems/Problem_1

-- Problem (LaTeX):
/-
Find the sum of all integer bases $b>9$ for which $17_b$ is a divisor of $97_b.$
-/

-- Solution/Answer (LaTeX):
/-
We are tasked with finding the number of integer bases $b>9$ such that $\cfrac{9b+7}{b+7}\in\mathbb{Z}$ . Notice that \[\cfrac{9b+7}{b+7}=\cfrac{9b+63-56}{b+7}=\cfrac{9(b+7)-56}{b+7}=9-\cfrac{56}{b+7}\] so we need only $\cfrac{56}{b+7}\in\mathbb{Z}$ . Then $b+7$ is a factor of $56$ . The factors of $56$ are $1,2,4,7,8,14,28,56$ . Of these, only $8,14,28,56$ produce a positive $b$ , namely $b=1,7,21,49$ respectively. However, we are what are you looking at that $b>9$ , so only $b=21,49$ are solutions. Thus the answer is $070$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_b830d2d170 : Prop := by
  sorry
