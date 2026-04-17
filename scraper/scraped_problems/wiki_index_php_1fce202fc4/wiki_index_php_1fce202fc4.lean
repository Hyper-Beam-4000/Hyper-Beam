-- 2018 USAMO Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_USAMO_Problems/Problem_6

-- Problem (LaTeX):
/-
Let $a_n$ be the number of permutations $(x_1, x_2, \dots, x_n)$ of the numbers $(1,2,\dots, n)$ such that the $n$ ratios $\frac{x_k}{k}$ for $1\le k\le n$ are all distinct. Prove that $a_n$ is odd for all $n\ge 1.$
-/

-- Solution/Answer (LaTeX):
/-
Write out the mapping of each $k$ to $x_k$ as follows: \[1\ \ 2\ \ 3\ \ \dots \ \ n\] \[x_1\ x_2\ x_3\ \dots \ x_n\] Now, consider what happens when the two rows are swapped (and the top-bottom pairs are reordered so that the top reads (1,2,3,...,n)). This will result in a new permutation if and only if $x_k = j$ does not imply $x_j = k$ for all $k,j$ in $(1,2,3,\dots,n)$ . I will denote this new permutation as $(y_1,y_2,y_3,\dots,y_n)$ . Notice that $(y_1,y_2,y_3,\dots,y_n)$ is a valid permutation if and only if $(x_1,x_2,x_3,\dots,x_n)$ is valid, because each fraction $\frac{y_k}{k}$ is the reciprocal of $\frac{x_k}{k}$ . This means that we need only consider the parity of number of cases in which $(y_1,y_2,y_3,\dots, y_n) = (x_1,x_2,x_3,\dots, x_n)$ , as there will be an even number of cases where $(y_1,y_2,y_3,\dots, y_n) \ne (x_1,x_2,x_3,\dots, x_n)$ . Let the number of valid permutations where $(y_1,y_2,y_3,\dots, y_n) = (x_1,x_2,x_3,\dots, x_n)$ be $b_n$ . Notice that the only permutations that have the property $x_{x_k}=k$ (which is an equivalent statement to the one given above) are those that are formed by taking pairs of elements and swapping their positions having the maximum number of pairs possible and having no two pairs both contain the same element. Some more necessary conditions will be outlined below after we split $n$ into two cases. Case 1: $n$ is odd. If $n$ is odd then there must be exactly one $k$ such that $x_k = k$ . This yields $b_n=n\cdot b_{n-1}$ * which has the same parity as $b_{n-1}$ , so we need only consider the parity of $b_n$ for odd $n$ . (* Note: This is wrong, as $b_n$ is only the number of valid involutions for $1,2,...,n$ , not $1,2,...,n+1$ with one number removed. ) Case 2: $n$ is even. If $n$ is even then can be no $k$ so that $x_k=k$ , or else there must be at least two distinct numbers $k$ and $j$ so that $x_k=k$ and $x_j=j$ which violates the given conditions. Denote a pair of numbers that are swapped to arrive at the final permutation as the pair $(a,b)$ . Then if a permutation yields an invalid arrangement there must be two pairs $(a,b)$ and $(c,d)$ such that $\frac{a^2}{b^2} = \frac{c^2}{d^2}$ . But notice that the two pairs $(a,c)$ and $(b,d)$ will also result in an invalid arrangement. So, there must be an even number of invalid arrangements ( Note: This proof doesn't work, as no specific pairing of invalid arrangements is constructed. Indeed, when three pairs all with the same fraction are present, this doesn't work. ), meaning the parity we desire is just the number of ways to separate $n$ objects into $\frac n2$ pairs! However, this is quite simply just $(n-1)(n-3)(n-5)\cdots(3)(1)$ , which is clearly the product of odd numbers. So we conclude that there are an odd number of valid permutations $(x_1,x_2,x_3,\dots,x_n)$ . $\blacksquare$
-/

import Mathlib.Tactic

theorem wiki_index_php_1fce202fc4 : Prop := by
  sorry
