-- 2021 AIME II Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AIME_II_Problems/Problem_13

-- Problem (LaTeX):
/-
Find the least positive integer $n$ for which $2^n + 5^n - n$ is a multiple of $1000$ .
-/

-- Solution/Answer (LaTeX):
/-
Recall that $1000$ divides this expression if $8$ and $125$ both divide it. It should be fairly obvious that $n \geq 3$ ; so we may break up the initial condition into two sub-conditions. (1) $5^n \equiv n \pmod{8}$ . Notice that the square of any odd integer is $1$ modulo $8$ (proof by plugging in $1^2,3^2,5^2,7^2$ into modulo $8$ ), so the LHS of this expression goes $5,1,5,1,\ldots$ , while the RHS goes $1,2,3,4,5,6,7,8,1,\ldots$ . The cycle length of the LHS is $2$ , RHS is $8$ , so the cycle length of the solution is $\operatorname{lcm}(2,8)=8$ . Indeed, the $n$ that solve this congruence are exactly those such that $n \equiv 5 \pmod{8}$ . (2) $2^n \equiv n \pmod{125}$ . This is extremely computationally intensive if we try to calculate all $2^1,2^2,\ldots,2^{100} \pmod{125}$ , so we take a divide-and-conquer approach instead. In order for this expression to be true, $2^n \equiv n \pmod{5}$ is necessary; it shouldn't take too long for us to go through the $20$ possible LHS-RHS combinations, considering that $n$ must be odd. We only need to test $10$ values of $n$ and obtain $n \equiv 3 \pmod{20}$ or $n \equiv 17 \pmod{20}$ . With this in mind we consider $2^n \equiv n \pmod{25}$ . By the Generalized Fermat's Little Theorem, $2^{20} \equiv 1 \pmod{25}$ , but we already have $n$ modulo $20$ . Our calculation is greatly simplified. The LHS's cycle length is $20$ and the RHS's cycle length is $25$ , from which their least common multiple is $100$ . In this step we need to test all the numbers between $1$ to $100$ that $n \equiv 3 \pmod{20}$ or $n \equiv 17 \pmod{20}$ . In the case that $n \equiv 3 \pmod{20}$ , the RHS goes $3,23,43,63,83$ , and we need $2^n \equiv n \equiv 2^3 \pmod{25}$ ; clearly $n \equiv 83 \pmod{100}$ . In the case that $n \equiv 17 \pmod{20}$ , by a similar argument, $n \equiv 97 \pmod{100}$ . In the final step, we need to calculate $2^{97}$ and $2^{83}$ modulo $125$ : Note that $2^{97}\equiv2^{-3}$ ; because $8\cdot47=376\equiv1\pmod{125},$ we get $2^{97} \equiv 47\pmod{125}$ . Note that $2^{83}$ is $2^{-17}=2^{-16}\cdot2^{-1}$ . We have \begin{align*} 2^{-1}&\equiv63, \\ 2^{-2}&\equiv63^2=3969\equiv-31, \\ 2^{-4}&\equiv(-31)^2=961\equiv-39, \\ 2^{-8}&\equiv1521\equiv21, \\ 2^{-16}&\equiv441, \\ 2^{-17}&\equiv63\cdot441\equiv7\cdot(-31)=-217\equiv33. \end{align*} This time, LHS cycle is $100$ , RHS cycle is $125$ , so we need to figure out $n$ modulo $500$ . It should be $n \equiv 283,297 \pmod{500}$ . Put everything together. By the second subcondition, the only candidates less than $1000$ are $283,297,783,797$ . Apply the first subcondition, $n=\boxed{797}$ is the desired answer. ~Ross Gao (Solution) ~MRENTHUSIASM (Minor Reformatting)
-/

import Mathlib.Tactic

theorem wiki_index_php_e0a8e84818 : Prop := by
  sorry
