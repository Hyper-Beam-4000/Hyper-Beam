-- 2018 AMC 10B Problems/Problem 21
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12B_Problems/Problem_19

-- Problem (LaTeX):
/-
Mary chose an even $4$ -digit number $n$ . She wrote down all the divisors of $n$ in increasing order from left to right: $1,2,\ldots,\dfrac{n}{2},n$ . At some moment Mary wrote $323$ as a divisor of $n$ . What is the smallest possible value of the next divisor written to the right of $323$ ? $\textbf{(A) } 324 \qquad \textbf{(B) } 330 \qquad \textbf{(C) } 340 \qquad \textbf{(D) } 361 \qquad \textbf{(E) } 646$
-/

-- Solution/Answer (LaTeX):
/-
Let $d$ be the next divisor written to the right of $323.$ If $\gcd(323,d)=1,$ then \[n\geq323d>323^2>100^2=10000,\] which contradicts the precondition that $n$ is a $4$ -digit number. It follows that $\gcd(323,d)>1.$ Since $323=17\cdot19,$ the smallest possible value of $d$ is $17\cdot20=\boxed{\textbf{(C) } 340},$ from which \[n=\operatorname{lcm}(323,d)=17\cdot19\cdot20=6460.\] ~MRENTHUSIASM ~tdeng
-/

import Mathlib.Tactic

theorem wiki_index_php_9094d851b3 : Prop := by
  sorry
