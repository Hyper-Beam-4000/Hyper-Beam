-- 2021 AMC 12B Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12B_Problems/Problem_12

-- Problem (LaTeX):
/-
Suppose that $S$ is a finite set of positive integers. If the greatest integer in $S$ is removed from $S$ , then the average value (arithmetic mean) of the integers remaining is $32$ . If the least integer in $S$ is also removed, then the average value of the integers remaining is $35$ . If the greatest integer is then returned to the set, the average value of the integers rises to $40$ . The greatest integer in the original set $S$ is $72$ greater than the least integer in $S$ . What is the average value of all the integers in the set $S$ ? $\textbf{(A) }36.2 \qquad \textbf{(B) }36.4 \qquad \textbf{(C) }36.6\qquad \textbf{(D) }36.8 \qquad \textbf{(E) }37$
-/

-- Solution/Answer (LaTeX):
/-
We can then say that \( \frac{A+S(n)}{n+1} = 32 \), \( \frac{S(n)}{n} = 35 \), and \( \frac{B+S(n)}{n+1} = 40 \). Expanding gives us \( A+S(n) = 32n+32 \), \( S(n) = 35n \), and \( B+S(n) = 40n+40 \). Substituting \( S(n) = 35n \) to all gives us \( A+35n=32n+32 \) and \( B+35n=40n+40 \). Solving for \( A \) and \( B \) gives \( A=-3n+32 \) and \( B = 5n+40 \). We now need to find \( \frac{S(n)+A+B}{n+2} \). We substitute everything to get \( \frac{35n+(-3n+32)+(5n+40)}{n+2} \), or \( \frac{37n+72}{n+2} \). Say that the answer to this is \( Z \). Then, \( Z \) needs to be a number that makes \( n \) a positive integer. The only options that work is $\boxed{\textbf{(C) }36.6}$ and $\boxed{\textbf{(D) }36.8}$ . However, if 36.6 is an option, we get \( n=3 \). So that means that \(A\) is \(23\) and \(B\) is \(55\), and \( S(n)=105 \). But if there is \(3\) terms, then the middle number is \(105\), but we said that \( B \) is the largest number in the set, so therefore our answer cannot be $\boxed{\textbf{(C) }36.6}$ and is instead $\boxed{\textbf{(D) }36.8}$ and now, we're finished! ~Pinotation
-/

import Mathlib.Tactic

theorem wiki_index_php_b1850d88a5 : Prop := by
  sorry
