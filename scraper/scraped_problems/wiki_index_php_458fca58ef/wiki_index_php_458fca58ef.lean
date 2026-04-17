-- 2017 AMC 12A Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12A_Problems/Problem_7

-- Problem (LaTeX):
/-
Define a function on the positive integers recursively by $f(1) = 2$ , $f(n) = f(n-1) + 1$ if $n$ is even, and $f(n) = f(n-2) + 2$ if $n$ is odd and greater than $1$ . What is $f(2017)$ ? $\textbf{(A)}\ 2017 \qquad\textbf{(B)}\ 2018 \qquad\textbf{(C)}\ 4034 \qquad\textbf{(D)}\ 4035 \qquad\textbf{(E)}\ 4036$
-/

-- Solution/Answer (LaTeX):
/-
This is a recursive function, which means the function refers back to itself to calculate subsequent terms. To solve this, we must identify the base case, $f(1)=2$ . We also know that when $n$ is odd, $f(n)=f(n-2)+2$ . Thus we know that $f(2017)=f(2015)+2$ . Thus we know that n will always be odd in the recursion of $f(2017)$ , and we add $2$ each recursive cycle, which there are $1008$ of. Thus the answer is $1008*2+2=2018$ , which is answer $\boxed{\textbf{(B)}}$ .
Note that when you write out a few numbers, you find that $f(n)=n+1$ for any $n$ , so $f(2017)=2018$
-/

import Mathlib.Tactic

theorem wiki_index_php_458fca58ef : Prop := by
  sorry
