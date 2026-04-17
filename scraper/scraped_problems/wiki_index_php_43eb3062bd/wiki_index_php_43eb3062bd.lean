-- 2017 USAMO Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_USAMO_Problems/Problem_1

-- Problem (LaTeX):
/-
Prove that there are infinitely many distinct pairs $(a,b)$ of relatively prime positive integers $a>1$ and $b>1$ such that $a^b+b^a$ is divisible by $a+b$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $n=a+b$ . Since $gcd(a,b)=1$ , we know $gcd(a,n)=1$ . We can rewrite the condition as \[a^{n-a}+(n-a)^a \equiv 0 \mod{n}\] \[a^{n-a}\equiv-(-a)^a \mod{n}\] Assume $a$ is odd. Since we need to prove an infinite number of pairs exist, it suffices to show that infinitely many pairs with $a$ odd exist. Then we have \[a^{n-a}\equiv a^a \mod{n}\] \[1 \equiv a^{2a-n} \mod{n}\] We know by Euler's theorem that $a^{\varphi(n)} \equiv 1 \mod{n}$ , so if $2a-n=\varphi(n)$ we will have the required condition. This means $a=\frac{n+\varphi(n)}{2}$ . Let $n=2p$ where $p$ is a prime, $p\equiv 1\mod{4}$ . Then $\varphi(n) = 2p*\left(1-\frac{1}{2}\right)\left(1-\frac{1}{p}\right) = p-1$ , so \[a = \frac{2p+p-1}{2} = \frac{3p-1}{2}\] Note the condition that $p\equiv 1\mod{4}$ guarantees that $a$ is odd, since $3p-1 \equiv 2\mod{4}$ This makes $b = \frac{p+1}{2}$ . Now we need to show that $a$ and $b$ are relatively prime. We see that \[gcd\left(\frac{3p-1}{2},\frac{p+1}2\right)=\frac{gcd(3p-1,p+1)}{2}\] \[=\frac{gcd(p-3,4)}{2}=\frac22=1\] By the Euclidean Algorithm. Therefore, for all primes $p \equiv 1\mod{4}$ , the pair $\left(\frac{3p-1}{2},\frac{p+1}{2}\right)$ satisfies the criteria, so infinitely many such pairs exist.
-/

import Mathlib.Tactic

theorem wiki_index_php_43eb3062bd : Prop := by
  sorry
