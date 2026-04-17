-- 2024 AIME II Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AIME_II_Problems/Problem_11

-- Problem (LaTeX):
/-
Find the number of triples of nonnegative integers $(a,b,c)$ satisfying $a + b + c = 300$ and \[a^2b + a^2c + b^2a + b^2c + c^2a + c^2b = 6,000,000.\]
-/

-- Solution/Answer (LaTeX):
/-
$ab(a+b)+bc(b+c)+ac(a+c)=300(ab+bc+ac)-3abc=6000000$ $\implies 100(ab+bc+ac)-abc=2000000$ Note that $(100-a)(100-b)(100-c)=1000000-10000(a+b+c)+100(ab+bc+ac)-abc=0$ .
Thus, one of $a, b, c =100$ . There are $201$ cases for each but we need to subtract $2$ for $(100,100,100)$ . The answer is $\boxed{601}$ ~Bluesoul,Shen Kislay Kai, EaglesNRavens
-/

import Mathlib.Tactic

theorem wiki_index_php_dbd2ce1de2 : Prop := by
  sorry
