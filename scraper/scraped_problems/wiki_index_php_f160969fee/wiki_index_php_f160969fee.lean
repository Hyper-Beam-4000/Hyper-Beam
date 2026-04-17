-- 2019 AMC 12A Problems/Problem 23
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12A_Problems/Problem_23

-- Problem (LaTeX):
/-
Define binary operations $\diamondsuit$ and $\heartsuit$ by \[a \, \diamondsuit \, b = a^{\log_{7}(b)} \qquad \text{and} \qquad a \, \heartsuit \, b = a^{\frac{1}{\log_{7}(b)}}\] for all real numbers $a$ and $b$ for which these expressions are defined. The sequence $(a_n)$ is defined recursively by $a_3 = 3\, \heartsuit\, 2$ and \[a_n = (n\, \heartsuit\, (n-1)) \,\diamondsuit\, a_{n-1}\] for all integers $n \geq 4$ . To the nearest integer, what is $\log_{7}(a_{2019})$ ? $\textbf{(A) } 8 \qquad \textbf{(B) } 9 \qquad \textbf{(C) } 10 \qquad \textbf{(D) } 11 \qquad \textbf{(E) } 12$
-/

-- Solution/Answer (LaTeX):
/-
First note that by log properties $a\diamondsuit b = 7^{(\log_7a)(\log_7b)}$ and $a \heartsuit b = 7^{\frac{\log_7a}{\log_7b}} = 7^{\log_ba}$ . Now, define $b_n = \log_7(a_n)$ . Thus $b_3 = \log_7(3\heartsuit 2) = \log_7(7^{\log_23}) = \log_23$ . Taking logs of both sides of the recursion and using the definition of $\diamondsuit$ gives $\log_7(a_n) = \log_7(7^{\log_7n\heartsuit (n-1)\log_7a_{n-1}})$ . The logs and the exponent cancel to $\log_7((n\heartsuit (n-1))^{\log_7(a_{n-1})})$ , and by the definition of $\heartsuit$ , ths is $\log_7(7^{(\log_{n-1}n)\log_7(a_{n-1})})$ , which quickly simplifies to $\log_7(a_{n-1})\log_{n-1}n$ $= b_{n-1}\log_{n-1}n$ . Thus $b_n = b_{n-1}\log_{n-1}n$ . From this, we have $b_4 = b_3\log_34 = \log_23\log_34 = \log_24$ , $b_5 = \log_45\log_24 = \log_25$ , and in general, $b_n = \log_2n$ . Finally, $\log_7(a_{2019}) = b_{2019}= \log_22019$ .
Since $2^{11} = 2048$ and $2019$ is slightly less than $2048$ , $\log_22019 \approx \boxed{\text{(D) }11}$ . - NamelyOrange
-/

import Mathlib.Tactic

theorem wiki_index_php_f160969fee : Prop := by
  sorry
