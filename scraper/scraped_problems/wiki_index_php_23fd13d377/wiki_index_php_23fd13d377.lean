-- 2017 AMC 10B Problems/Problem 17
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12B_Problems/Problem_11

-- Problem (LaTeX):
/-
Call a positive integer monotonous if it is a one-digit number or its digits, when read from left to right, form either a strictly increasing or a strictly decreasing sequence. For example, $3$ , $23578$ , and $987620$ are monotonous, but $88$ , $7434$ , and $23557$ are not. How many monotonous positive integers are there? $\textbf{(A)}\ 1024\qquad\textbf{(B)}\ 1524\qquad\textbf{(C)}\ 1533\qquad\textbf{(D)}\ 1536\qquad\textbf{(E)}\ 2048$
-/

-- Solution/Answer (LaTeX):
/-
Case 1: monotonous numbers with digits in ascending order There are $\sum_{n=1}^{9} \binom{9}{n}$ ways to choose n digits from the digits 1 to 9. For each of these ways, we can generate exactly one monotonous number by ordering the chosen digits in ascending order. Note that 0 is not included since it will always be a leading digit and that is not allowed. Also, $\emptyset$ (the empty set) isn't included because it doesn't generate a number. The sum is equivalent to $\sum_{n=0}^{9} \binom{9}{n} -\binom{9}{0} = 2^9 - 1 = 511.$ Case 2: monotonous numbers with digits in descending order There are $\sum_{n=1}^{10} \binom{10}{n}$ ways to choose n digits from the digits 0 to 9. For each of these ways, we can generate exactly one monotonous number by ordering the chosen digits in descending order. Note that 0 is included since we are allowed to end numbers with zeros. However, $\emptyset$ (the empty set) still isn't included because it doesn't generate a number. The sum is equivalent to $\sum_{n=0}^{10} \binom{10}{n} -\binom{10}{0} = 2^{10} - 1 = 1023.$ We discard the number 0 since it is not positive. Thus there are $1022$ here. Since the 1-digit numbers 1 to 9 satisfy both case 1 and case 2, we have overcounted by 9. Thus there are $511+1022-9=\boxed{\textbf{(B) } 1524}$ monotonous numbers.
-/

import Mathlib.Tactic

theorem wiki_index_php_23fd13d377 : Prop := by
  sorry
