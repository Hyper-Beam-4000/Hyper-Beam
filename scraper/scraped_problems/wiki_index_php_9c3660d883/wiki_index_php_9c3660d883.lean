-- 2019 AMC 10A Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12A_Problems/Problem_4

-- Problem (LaTeX):
/-
What is the greatest number of consecutive integers whose sum is $45?$ $\textbf{(A) } 9 \qquad\textbf{(B) } 25 \qquad\textbf{(C) } 45 \qquad\textbf{(D) } 90 \qquad\textbf{(E) } 120$
-/

-- Solution/Answer (LaTeX):
/-
We might at first think that the answer would be $9$ , because $1+2+3 \dots +n = 45$ when $n = 9$ . But note that the problem says that they can be integers, not necessarily positive. Observe also that every term in the sequence $-44, -43, \cdots, 44, 45$ cancels out except $45$ . Thus, the answer is, intuitively, $\boxed{\textbf{(D) } 90 }$ integers. Though impractical, a proof of maximality can proceed as follows: Let the desired sequence of consecutive integers be $a, a+1, \cdots, a+(N-1)$ , where there are $N$ terms, and we want to maximize $N$ . Then the sum of the terms in this sequence is $aN + \frac{(N-1)(N)}{2}=45$ . Rearranging and factoring, this reduces to $N(2a+N-1) = 90$ . Since $N$ must divide $90$ , and we know that $90$ is an attainable value of the sum, $90$ must be the maximum.
-/

import Mathlib.Tactic

theorem wiki_index_php_9c3660d883 : Prop := by
  sorry
