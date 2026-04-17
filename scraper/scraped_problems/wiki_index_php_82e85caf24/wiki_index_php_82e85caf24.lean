-- 2021 AMC 12A Problems/Problem 15
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_15

-- Problem (LaTeX):
/-
A choir director must select a group of singers from among his $6$ tenors and $8$ basses. The only requirements are that the difference between the number of tenors and basses must be a multiple of $4$ , and the group must have at least one singer. Let $N$ be the number of different groups that could be selected. What is the remainder when $N$ is divided by $100$ ? $\textbf{(A) } 47\qquad\textbf{(B) } 48\qquad\textbf{(C) } 83\qquad\textbf{(D) } 95\qquad\textbf{(E) } 96\qquad$
-/

-- Solution/Answer (LaTeX):
/-
Suppose that $t$ tenors and $b$ basses are selected. The requirements are $t\equiv b\pmod{4}$ and $(t,b)\neq(0,0).$ It follows that $b'=8-b$ basses are not selected. Since the ordered pairs $(t,b)$ and the ordered pairs $(t,b')$ have one-to-one correspondence, we consider the ordered pairs $(t,b')$ instead. The requirements become $t\equiv8-b'\pmod{4}$ and $(t,8-b')\neq(0,0),$ which simplify to $t+b'\equiv0\pmod{4}$ and $(t,b')\neq(0,8),$ respectively. As $t+b'\in\{0,4,8,12\},$ the total number of such groups is \begin{align*} N&=\binom{14}{0}+\binom{14}{4}+\left[\binom{14}{8}-1\right]+\binom{14}{12} \\ &=\binom{14}{0}+\binom{14}{4}+\left[\binom{14}{6}-1\right]+\binom{14}{2} \\ &=1+1001+[3003-1]+91 \\ &=4095, \end{align*} from which $N\equiv\boxed{\textbf{(D) } 95}\pmod{100}.$ ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_82e85caf24 : Prop := by
  sorry
