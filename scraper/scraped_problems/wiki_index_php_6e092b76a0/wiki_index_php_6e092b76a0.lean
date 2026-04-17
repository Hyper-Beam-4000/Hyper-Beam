-- 2020 AIME II Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_II_Problems/Problem_6

-- Problem (LaTeX):
/-
Define a sequence recursively by $t_1 = 20$ , $t_2 = 21$ , and \[t_n = \frac{5t_{n-1}+1}{25t_{n-2}}\] for all $n \ge 3$ . Then $t_{2020}$ can be expressed as $\frac{p}{q}$ , where $p$ and $q$ are relatively prime positive integers. Find $p+q$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $t_n=\frac{s_n}{5}$ . Then, we have $s_n=\frac{s_{n-1}+1}{s_{n-2}}$ where $s_1 = 100$ and $s_2 = 105$ . By substitution, we find $s_3 = \frac{53}{50}$ , $s_4=\frac{103}{105\cdot50}$ , $s_5=\frac{101}{105}$ , $s_6=100$ , and $s_7=105$ . So $s_n$ has a period of $5$ . Thus $s_{2020}=s_5=\frac{101}{105}$ . So, $\frac{101}{105\cdot 5}\implies 101+525=\boxed{626}$ .
~mn28407
-/

import Mathlib.Tactic

theorem wiki_index_php_6e092b76a0 : Prop := by
  sorry
