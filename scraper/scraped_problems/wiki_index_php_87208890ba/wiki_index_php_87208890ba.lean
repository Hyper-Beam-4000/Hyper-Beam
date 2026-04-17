-- 2018 AMC 12B Problems/Problem 17
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12B_Problems/Problem_17

-- Problem (LaTeX):
/-
Let $p$ and $q$ be positive integers such that \[\frac{5}{9} < \frac{p}{q} < \frac{4}{7}\] and $q$ is as small as possible. What is $q-p$ ? $\textbf{(A) } 7 \qquad \textbf{(B) } 11 \qquad \textbf{(C) } 13 \qquad \textbf{(D) } 17 \qquad \textbf{(E) } 19$
-/

-- Solution/Answer (LaTeX):
/-
More generally, let $a,b,c,d,p,$ and $q$ be positive integers such that $bc-ad=1$ and \[\frac ab < \frac pq < \frac cd.\] From $\frac ab < \frac pq,$ we have $bp-aq>0,$ or \[bp-aq\geq1. \hspace{15mm} (1)\] From $\frac pq < \frac cd,$ we have $cq-dp>0,$ or \[cq-dp\geq1. \hspace{15mm} (2)\] Since $bc-ad=1,$ note that: Multiplying $(1)$ by $d,$ multiplying $(2)$ by $b,$ and adding the results, we get $q\geq b+d.$ Multiplying $(1)$ by $c,$ multiplying $(2)$ by $a,$ and adding the results, we get $p\geq a+c.$ To minimize $q,$ we set $q=b+d,$ from which $p=a+c.$ Together, we can prove that \[\frac{a+c-1}{b+d}\leq\frac ab<\frac{a+c}{b+d}<\frac cd\leq\frac{a+c+1}{b+d}. \hspace{15mm} (\bigstar)\] For this problem, we have $a=5,b=9,c=4,$ and $d=7,$ so $p=a+c=9$ and $q=b+d=16.$ The answer is $q-p=\boxed{\textbf{(A) } 7}.$ Remark We will prove each part of the compound inequality in $(\bigstar):$ $\frac{a+c-1}{b+d}\leq\frac ab$ and $\frac cd\leq\frac{a+c+1}{b+d}$ Let $\frac ab=k,$ so $a=bk.$ The precondition $bc-ad=1$ becomes $bc-bdk=1,$ so $c-dk=\frac1b.$ It follows that \[\frac{a+c-1}{b+d}=\frac{bk+c-1}{b+d}=k+\frac{c-dk-1}{b+d}=k+\frac{\frac1b-1}{b+d}=k+\frac{1-b}{b(b+d)}\leq k.\] Moreover, the equality case occurs if and only if $b=1.$ We can prove $\frac cd\leq\frac{a+c+1}{b+d}$ by the same process. Similarly, the equality case occurs if and only if $d=1.$ $\frac ab<\frac{a+c}{b+d}<\frac cd$ Let $\frac ab=k_1$ and $\frac cd=k_2,$ so $a=bk_1$ and $c=dk_2.$ It follows that \begin{alignat*}{10} \frac{a+c}{b+d}&=\frac{bk_1+dk_2}{b+d}&&=k_1+\frac{dk_2-dk_1}{b+d}&&=k_1+\frac{d(k_2-k_1)}{b+d}&&>k_1, \\ \frac{a+c}{b+d}&=\frac{bk_1+dk_2}{b+d}&&=k_2+\frac{bk_1-bk_2}{b+d}&&=k_2+\frac{b(k_1-k_2)}{b+d}&&<k_2. \end{alignat*} Moreover, this part of $(\bigstar)$ is independent of the precondition $bc-ad=1.$ Let $\frac ab=k,$ so $a=bk.$ The precondition $bc-ad=1$ becomes $bc-bdk=1,$ so $c-dk=\frac1b.$ It follows that \[\frac{a+c-1}{b+d}=\frac{bk+c-1}{b+d}=k+\frac{c-dk-1}{b+d}=k+\frac{\frac1b-1}{b+d}=k+\frac{1-b}{b(b+d)}\leq k.\] Moreover, the equality case occurs if and only if $b=1.$ We can prove $\frac cd\leq\frac{a+c+1}{b+d}$ by the same process. Similarly, the equality case occurs if and only if $d=1.$ Let $\frac ab=k_1$ and $\frac cd=k_2,$ so $a=bk_1$ and $c=dk_2.$ It follows that \begin{alignat*}{10} \frac{a+c}{b+d}&=\frac{bk_1+dk_2}{b+d}&&=k_1+\frac{dk_2-dk_1}{b+d}&&=k_1+\frac{d(k_2-k_1)}{b+d}&&>k_1, \\ \frac{a+c}{b+d}&=\frac{bk_1+dk_2}{b+d}&&=k_2+\frac{bk_1-bk_2}{b+d}&&=k_2+\frac{b(k_1-k_2)}{b+d}&&<k_2. \end{alignat*} Moreover, this part of $(\bigstar)$ is independent of the precondition $bc-ad=1.$ ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_87208890ba : Prop := by
  sorry
