-- 2020 AMC 10A Problems/Problem 21
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12A_Problems/Problem_19

-- Problem (LaTeX):
/-
There exists a unique strictly increasing sequence of nonnegative integers $a_1 < a_2 < … < a_k$ such that \[\frac{2^{289}+1}{2^{17}+1} = 2^{a_1} + 2^{a_2} + … + 2^{a_k}.\] What is $k?$ $\textbf{(A) } 117 \qquad \textbf{(B) } 136 \qquad \textbf{(C) } 137 \qquad \textbf{(D) } 273 \qquad \textbf{(E) } 306$
-/

-- Solution/Answer (LaTeX):
/-
First, substitute $2^{17}$ with $x$ .
Then, the given equation becomes $\frac{x^{17}+1}{x+1}=x^{16}-x^{15}+x^{14}...-x^1+x^0$ by sum of powers factorization.
Now consider only $x^{16}-x^{15}$ . This equals $x^{15}(x-1)=x^{15} \cdot (2^{17}-1)$ .
Note that $2^{17}-1$ equals $2^{16}+2^{15}+...+1$ , by difference of powers factorization (or by considering the expansion of $2^{17}=2^{16}+2^{15}+...+2^{2}+2 + 2$ ).
Thus, we can see that $x^{16}-x^{15}$ forms the sum of 17 different powers of 2.
Applying the same method to each of $x^{14}-x^{13}$ , $x^{12}-x^{11}$ , ... , $x^{2}-x^{1}$ , we can see that each of the pairs forms the sum of 17 different powers of 2. This gives us $17 \cdot 8=136$ .
But we must count also the $x^0$ term.
Thus, Our answer is $136+1=\boxed{\textbf{(C) } 137}$ . ~seanyoon777
-/

import Mathlib.Tactic

theorem wiki_index_php_3f0e5faadd : Prop := by
  sorry
