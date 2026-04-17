-- 2018 USAMO Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_USAMO_Problems/Problem_3

-- Problem (LaTeX):
/-
For a given integer $n\ge 2,$ let $\{a_1,a_2,…,a_m\}$ be the set of positive integers less than $n$ that are relatively prime to $n.$ Prove that if every prime that divides $m$ also divides $n,$ then $a_1^k+a_2^k + \dots + a_m^k$ is divisible by $m$ for every positive integer $k.$
-/

-- Solution/Answer (LaTeX):
/-
https://maa.org/sites/default/files/pdf/AMC/usamo/2018/2018USAMO.pdf The integer m in the statement of the problem is ϕ(n), where ϕ is the Euler totient function.
Throughout our proof we write p
s
|| m, if s is the greatest power of p that divides m.
We begin with the following lemma:
Lemma 1. If p is a prime and p
s divides n for some positive integer s, then 1k + 2k + · · · + n
k
is
divisible by p
s−1
for any integer k ≥ 1.
2018 USAMO – Solutions 4
Proof. Let {a1, a2, . . . , am} be a complete reduced residue set modulo p
s and m = p
s−1
(p − 1).
First we prove by induction on s that for any positive integer k, a
k
1 + a
k
2 + · · · + a
k
m is divisible by
p
s−1
. The base case s = 1 is true. Suppose the statement holds for some value of s. Consider the
statement for s + 1. Note that
{a1, . . . , am, ps + a1, . . . , ps + am, . . . , ps
(p − 1) + a1, . . . , ps
(p − 1) + am}
is a complete reduced residue set modulo p
s+1. Therefore, the desired sum of k-th powers is equal
to
a
k
1 + · · · + a
k
m + · · · + (p
s
(p − 1) + a1)
k + · · · + (p
s
(p − 1) + am)
k ≡ p(a
k
1 + · · · + a
k
m) ≡ 0 (mod p
s
),
where we have used the induction hypothesis for the second congruence. This gives the induction
step.
Now we are ready to prove the lemma. Because numbers from 1 to n can be split into blocks of
consecutive numbers of length p
s
, it is enough to show that 1k + 2k +· · · + (p
s
)
k
is divisible by p
s−1
for any positive integer k. We use induction on s. The statement is true for s = 1. Assume the
statement is true for s − 1. The sum
1
k + 2k + · · · + (p
s
)
k = a
k
1 + a
k
2 + · · · + a
k
m + p
k
�
1
k + 2k + · · · + (p
s−1
)
k
�
is divisible by p
s−1
, because p
s−1
| a
k
1 + · · · + a
k
m and by the induction hypothesis p
s−2
| 1
k + · · · +
(p
s−1
)
k
.
Now we proceed to prove a second lemma, from which the statement of the problem will immediately
follow:
Lemma 2. Suppose p is a prime dividing n. Let {a1, . . . , am} be a complete reduced residue set
mod n, and define s by p
s
|| m. Then p
s divides a
k
1 + · · · + a
k
m for any integer k ≥ 1.
Proof. We fix p, and use induction on the number of prime factors of n (counted by multiplicity)
that are different from p. If there are no prime factors other than p, then n = p
s+1
, m = p
s
(p − 1),
and we proved in Lemma 1 that a
k
1 +· · ·+a
k
m is divisible by p
s
. Now suppose the statement is true
for n. We show that it is true for nq, where q is a prime not equal to p.
Case 1. q divides n. We have p
s
|| ϕ(n) and p
s
|| ϕ(nq), because ϕ(nq) = qϕ(n). If {a1, a2, . . . , am}
is a complete reduced residue set modulo n, then
{a1, . . . , am, n + a1, . . . , n + am, . . . , n(q − 1) + a1, . . . , n(q − 1) + am}
is a complete reduced residue set modulo nq. The new sum of k-th powers is equal to
a
k
1 + · · · + a
k
m + · · · + (n(q − 1) + a1)
k + · · · + (n(q − 1) + am)
k = mnk
�
1
k + · · · + (q − 1)k
�
+
2018 USAMO – Solutions 5
�
k
1
�
n
k−1
�
1
k−1 + · · · + (q − 1)k−1
�
(a1 + · · · + am) + · · · + q(a
k
1 + · · · + a
k
m).
This sum is divisible by p
s because p
s
|| m and p
s
| a
j
1 + a
j
2 + · · · + a
j
m for any positive integer j.
Case 2. q doesn’t divide n. Suppose p
b
|| q − 1, where b ≥ 0. Note that ϕ(nq) = ϕ(n)(q − 1), so
p
s
|| ϕ(n) and p
s+b
|| ϕ(nq). Let {a1, . . . , am} be a complete reduced residue set modulo n. The
complete reduced residue set modulo nq consists of the mq numbers
{a1, . . . , am, n + a1, . . . , n + am, . . . , n(q − 1) + a1, . . . , n(q − 1) + am}
with the m elements {qa1, qa2, . . . , qam} removed.
The new sum of k-th powers is equal to
a
k
1 + · · · + a
k
m + · · · + (n(q − 1) + a1)
k + · · · + (n(q − 1) + am)
k − q
k
(a
k
1 + · · · + a
k
m) =
mnk
�
1
k + · · · + (q − 1)k
�
+
�
k
1
�
n
k−1
�
1
k−1 + · · · + (q − 1)k−1
�
(a1 + · · · + am) + · · ·
· · · +
�
k
k − 1
�
n (1 + · · · + (q − 1)) (a
k−1
1 + · · · + a
k−1
m ) + q(a
k
1 + · · · + a
k
m) − q
k
(a
k
1 + · · · + a
k
m).
Each term
�
k
j
�
n
k−j
�
1
k−j + · · · + (q − 1)k−j
�
(a
j
1 + · · · + a
j
m),
for 0 ≤ j ≤ k − 1, is divisible by p
s+b because p | n
k−j
, p
s
| a
j
1 + · · · + a
j
m, and p
b−1
| 1
k−j + · · · +
(q − 1)k−j by Lemma 1.
Also (q
k − q)(a
k
1 + · · · + a
k
m) is divisible by p
s+b because p
b
| q − 1 | q
k − q and p
s
| a
k
1 + · · · + a
k
m.
Thus p
s+b divides our sum and our proof is complete.
Remark. In fact, one can also show the converse statement: if {a1, a2, . . . , am} is as defined in
the problem and a
k
1 + a
k
2 + · · · + a
k
m is divisible by m for every positive integer k, then every prime
that divides m also divides n.
-/

import Mathlib.Tactic

theorem wiki_index_php_e55c36ef1b : Prop := by
  sorry
