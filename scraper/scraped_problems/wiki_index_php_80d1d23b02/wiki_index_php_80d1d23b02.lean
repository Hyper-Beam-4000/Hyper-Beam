-- 2018 AMC 12B Problems/Problem 22
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12B_Problems/Problem_22

-- Problem (LaTeX):
/-
Consider polynomials $P(x)$ of degree at most $3$ , each of whose coefficients is an element of $\{0, 1, 2, 3, 4, 5, 6, 7, 8, 9\}$ . How many such polynomials satisfy $P(-1) = -9$ ? $\textbf{(A) } 110 \qquad \textbf{(B) } 143 \qquad \textbf{(C) } 165 \qquad \textbf{(D) } 220 \qquad \textbf{(E) } 286$
-/

-- Solution/Answer (LaTeX):
/-
Suppose that $P(x)=ax^3+bx^2+cx+d.$ This problem is equivalent to counting the ordered quadruples $(a,b,c,d),$ where all of $a,b,c,$ and $d$ are integers from $0$ through $9$ such that \[P(-1)=-a+b-c+d=-9.\] Let $a'=9-a$ and $c'=9-c.$ Note that both of $a'$ and $c'$ are integers from $0$ through $9.$ Moreover, the ordered quadruples $(a,b,c,d)$ and the ordered quadruples $(a',b,c',d)$ have one-to-one correspondence. We rewrite the given equation as $(9-a)+b+(9-c)+d=9,$ or \[a'+b+c'+d=9.\] By the stars and bars argument, there are $\binom{9+4-1}{4-1}=\boxed{\textbf{(D) } 220}$ ordered quadruples $(a',b,c',d).$ ~pieater314159 ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_80d1d23b02 : Prop := by
  sorry
