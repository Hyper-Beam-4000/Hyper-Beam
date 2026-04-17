-- 2018 AMC 12A Problems/Problem 19
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_19

-- Problem (LaTeX):
/-
Let $A$ be the set of positive integers that have no prime factors other than $2$ , $3$ , or $5$ . The infinite sum \[\frac{1}{1} + \frac{1}{2} + \frac{1}{3} + \frac{1}{4} + \frac{1}{5} + \frac{1}{6} + \frac{1}{8} + \frac{1}{9} + \frac{1}{10} + \frac{1}{12} + \frac{1}{15} + \frac{1}{16} + \frac{1}{18} + \frac{1}{20} + \cdots\] of the reciprocals of the elements of $A$ can be expressed as $\frac{m}{n}$ , where $m$ and $n$ are relatively prime positive integers. What is $m+n$ ? $\textbf{(A) } 16 \qquad \textbf{(B) } 17 \qquad \textbf{(C) } 19 \qquad \textbf{(D) } 23 \qquad \textbf{(E) } 36$
-/

-- Solution/Answer (LaTeX):
/-
Note that the fractions of the form $\frac{1}{2^a3^b5^c},$ where $a,b,$ and $c$ are nonnegative integers, span all terms of the infinite sum. Therefore, the infinite sum becomes \begin{align*} \sum_{a=0}^{\infty}\sum_{b=0}^{\infty}\sum_{c=0}^{\infty}\frac{1}{2^a3^b5^c} &= \left(\sum_{a=0}^{\infty}\frac{1}{2^a}\right)\cdot\left(\sum_{b=0}^{\infty}\frac{1}{3^b}\right)\cdot\left(\sum_{c=0}^{\infty}\frac{1}{5^c}\right) \\ &= \frac{1}{1-\frac12}\cdot\frac{1}{1-\frac13}\cdot\frac{1}{1-\frac15} \\ &= 2\cdot\frac32\cdot\frac54 \\ &= \frac{15}{4} \end{align*} by a product of geometric series, from which the answer is $15+4=\boxed{\textbf{(C) } 19}.$ ~athens2016 ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_ceb4bc1a63 : Prop := by
  sorry
