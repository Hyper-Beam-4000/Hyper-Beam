-- 2021 AIME I Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AIME_I_Problems/Problem_10

-- Problem (LaTeX):
/-
Consider the sequence $(a_k)_{k\ge 1}$ of positive rational numbers defined by $a_1 = \frac{2020}{2021}$ and for $k\ge 1$ , if $a_k = \frac{m}{n}$ for relatively prime positive integers $m$ and $n$ , then \[a_{k+1} = \frac{m + 18}{n+19}.\] Determine the sum of all positive integers $j$ such that the rational number $a_j$ can be written in the form $\frac{t}{t+1}$ for some positive integer $t$ .
-/

-- Solution/Answer (LaTeX):
/-
We know that $a_{1}=\tfrac{t}{t+1}$ when $t=2020$ so $1$ is a possible value of $j$ . Note also that $a_{2}=\tfrac{2038}{2040}=\tfrac{1019}{1020}=\tfrac{t}{t+1}$ for $t=1019$ . Then $a_{2+q}=\tfrac{1019+18q}{1020+19q}$ unless $1019+18q$ and $1020+19q$ are not relatively prime which happens when $q+1$ divides $18q+1019$ (by the Euclidean Algorithm), or $q+1$ divides $1001$ . Thus, the least value of $q$ is $6$ and $j=2+6=8$ . We know $a_{8}=\tfrac{1019+108}{1020+114}=\tfrac{1127}{1134}=\tfrac{161}{162}$ . Now $a_{8+q}=\tfrac{161+18q}{162+19q}$ unless $18q+161$ and $19q+162$ are not relatively prime which happens the first time $q+1$ divides $18q+161$ or $q+1$ divides $143$ or $q=10$ , and $j=8+10=18$ . We have $a_{18}=\tfrac{161+180}{162+190}=\tfrac{341}{352}=\tfrac{31}{32}$ . Now $a_{18+q}=\tfrac{31+18q}{32+19q}$ unless $18q+31$ and $19q+32$ are not relatively prime. This happens the first time $q+1$ divides $18q+31$ implying $q+1$ divides $13$ , which is prime so $q=12$ and $j=18+12=30$ . We have $a_{30}=\tfrac{31+216}{32+228}=\tfrac{247}{260}=\tfrac{19}{20}$ . We have $a_{30+q}=\tfrac{18q+19}{19q+20}$ , which is always reduced by EA, so the sum of all $j$ is $1+2+8+18+30=\boxed{059}$ . ~sugar_rush Remark 1 Whenever a fraction is in the form $\frac{t}{t+1}$ in lowest terms, the difference between the numerator and the denominator in the original fraction will always divide the numerator. We can model $a_j$ as $\frac{m+18k}{m+19k+1}$ (not necessarily simplified) if $a_{j-k}=\frac{m}{m+1}$ for integers $j$ and $k$ . We want the least $k$ such that $\gcd(k+1,{m+18k})\neq1$ . Let $d$ be a divisor of both $k+1$ and $m+18k$ , then $d\mid18k+18$ , so $d\mid{m-18}$ . This follows from the Euclidean Algorithm. ~ Magnetoninja Remark 2 The reason we look for the least $q$ in each case is because after that $q$ or $j$ value, the fraction will simplify to $m/n$ again and it won't follow the condition we defined. For example, in the $a_{2+q}=\tfrac{1019+18q}{1020+19q}$ case, after $j = 8$ , the equation becomes useless because the fraction has simplified to something different, so we "switch over" to $a_{8+q}=\tfrac{161+18q}{162+19q}.$ ~ grogg007
-/

import Mathlib.Tactic

theorem wiki_index_php_67804c2b1a : Prop := by
  sorry
