-- 2019 AIME I Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AIME_I_Problems/Problem_14

-- Problem (LaTeX):
/-
Find the least odd prime factor of $2019^8+1$ .
-/

-- Solution/Answer (LaTeX):
/-
We know that $2019^8 \equiv -1 \pmod{p}$ for some prime $p$ . We want to find the smallest odd possible value of $p$ . By squaring both sides of the congruence, we find $2019^{16} \equiv 1 \pmod{p}$ . Since $2019^{16} \equiv 1 \pmod{p}$ , the order of $2019$ modulo $p$ is a positive divisor of $16$ . However, if the order of $2019$ modulo $p$ is $1, 2, 4,$ or $8,$ then $2019^8$ will be equivalent to $1 \pmod{p},$ which contradicts the given requirement that $2019^8\equiv -1\pmod{p}$ . Therefore, the order of $2019$ modulo $p$ is $16$ . Because all orders modulo $p$ divide $\phi(p)$ , we see that $\phi(p)$ is a multiple of $16$ . As $p$ is prime, $\phi(p) = p\left(1 - \dfrac{1}{p}\right) = p - 1$ . Therefore, $p\equiv 1 \pmod{16}$ . The two smallest primes equivalent to $1 \pmod{16}$ are $17$ and $97$ . Because $16 | p - 1$ , and $p - 1 \geq 16$ , each possible value of $p$ must be verified by manual calculation to make sure that $p | 2019^8+1$ . As $2019^8 \not\equiv -1 \pmod{17}$ and $2019^8 \equiv -1 \pmod{97}$ , the smallest possible $p$ is thus $\boxed{097}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_e62fb2f9bf : Prop := by
  sorry
