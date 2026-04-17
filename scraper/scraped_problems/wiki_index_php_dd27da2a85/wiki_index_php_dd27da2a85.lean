-- 2022 AMC 10B Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12B_Problems/Problem_7

-- Problem (LaTeX):
/-
Camila writes down five positive integers. The unique mode of these integers is $2$ greater than their median, and the median is $2$ greater than their arithmetic mean. What is the least possible value for the mode? $\textbf{(A)}\ 5 \qquad\textbf{(B)}\ 7 \qquad\textbf{(C)}\ 9 \qquad\textbf{(D)}\ 11 \qquad\textbf{(E)}\ 13$
-/

-- Solution/Answer (LaTeX):
/-
Let $M$ be the median. It follows that the two largest integers are both $M+2.$ Let $a$ and $b$ be the two smallest integers such that $a<b.$ The sorted list is \[a,b,M,M+2,M+2.\] Since the median is $2$ greater than their arithmetic mean, we have $\frac{a+b+M+(M+2)+(M+2)}{5}+2=M,$ or \[a+b+14=2M.\] Note that $a+b$ must be even. We minimize this sum so that the arithmetic mean, the median, and the unique mode are minimized. Let $a=1$ and $b=3,$ from which $M=9$ and $M+2=\boxed{\textbf{(D)}\ 11}.$ ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_dd27da2a85 : Prop := by
  sorry
