-- 2022 AIME I Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_I_Problems/Problem_9

-- Problem (LaTeX):
/-
Ellina has twelve blocks, two each of red ( $\textbf{R}$ ), blue ( $\textbf{B}$ ), yellow ( $\textbf{Y}$ ), green ( $\textbf{G}$ ), orange ( $\textbf{O}$ ), and purple ( $\textbf{P}$ ). Call an arrangement of blocks $\textit{even}$ if there is an even number of blocks between each pair of blocks of the same color. For example, the arrangement \[\textbf{R B B Y G G Y R O P P O}\] is even. Ellina arranges her blocks in a row in random order. The probability that her arrangement is even is $\frac{m}{n},$ where $m$ and $n$ are relatively prime positive integers. Find $m+n.$
-/

-- Solution/Answer (LaTeX):
/-
Consider this position chart: \[\textbf{1 2 3 4 5 6 7 8 9 10 11 12}\] Since there has to be an even number of spaces between each pair of the same color, spots $1$ , $3$ , $5$ , $7$ , $9$ , and $11$ contain some permutation of all $6$ colored balls. Likewise, so do the even spots, so the number of even configurations is $6! \cdot 6!$ (after putting every pair of colored balls in opposite parity positions, the configuration can be shown to be even). This is out of $\frac{12!}{(2!)^6}$ possible arrangements, so the probability is: \[\frac{6!\cdot6!}{\frac{12!}{(2!)^6}} = \frac{6!\cdot2^6}{7\cdot8\cdot9\cdot10\cdot11\cdot12} = \frac{2^4}{7\cdot11\cdot3} = \frac{16}{231},\] which is in simplest form. So, $m + n = 16 + 231 = \boxed{247}$ . ~Oxymoronic15
-/

import Mathlib.Tactic

theorem wiki_index_php_3b1d200873 : Prop := by
  sorry
