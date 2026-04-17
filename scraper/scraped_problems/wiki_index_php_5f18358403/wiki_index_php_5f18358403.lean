-- 2017 AMC 12B Problems/Problem 16
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12B_Problems/Problem_16

-- Problem (LaTeX):
/-
The number $21!=51,090,942,171,709,440,000$ has over $60,000$ positive integer divisors. One of them is chosen at random. What is the probability that it is odd? $\textbf{(A)}\ \frac{1}{21} \qquad \textbf{(B)}\ \frac{1}{19} \qquad \textbf{(C)}\ \frac{1}{18} \qquad \textbf{(D)}\ \frac{1}{2} \qquad \textbf{(E)}\ \frac{11}{21}$
-/

-- Solution/Answer (LaTeX):
/-
We can consider a factor of $21!$ to be odd if it does not contain a $2$ ; hence, finding the exponent of $2$ in the prime factorization of $21!$ will help us find our answer. We can start off with all multiples of $2$ up to $21$ , which is $10$ . Then, we find multiples of $4$ , which is $5$ . Next, we look at multiples of $8$ , of which there are $2$ . Finally, we know there is only one multiple of $16$ in the set of positive integers up to $21$ . Now, we can add all of these to get $10+5+2+1=18$ . We know that, in the prime factorization of $21!$ , we have $2^{18}$ , and the only way to have an odd number is if there is not a $2$ in that number's prime factorization. This only happens with $2^{0}$ , which is only one of the 19 different exponents of 2 we could have (of which having each exponent is equally likely). Hence, we have $\boxed{\text{(B)} \dfrac{1}{19}}.$ Solution by: armang32324
-/

import Mathlib.Tactic

theorem wiki_index_php_5f18358403 : Prop := by
  sorry
