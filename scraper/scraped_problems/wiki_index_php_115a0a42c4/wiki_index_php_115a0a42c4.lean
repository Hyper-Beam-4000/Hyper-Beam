-- 2022 AMC 12A Problems/Problem 16
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_16

-- Problem (LaTeX):
/-
A $\emph{triangular number}$ is a positive integer that can be expressed in the form $t_n = 1+2+3+\cdots+n$ , for some positive integer $n$ . The three smallest triangular numbers that are also perfect squares are $t_1 = 1 = 1^2$ , $t_8 = 36 = 6^2$ , and $t_{49} = 1225 = 35^2$ . What is the sum of the digits of the fourth smallest triangular number that is also a perfect square? $\textbf{(A) } 6 \qquad \textbf{(B) } 9 \qquad \textbf{(C) } 12 \qquad \textbf{(D) } 18 \qquad \textbf{(E) } 27$
-/

-- Solution/Answer (LaTeX):
/-
We have $t_n = \frac{n (n+1)}{2}$ .
If $t_n$ is a perfect square, then it can be written as $\frac{n (n+1)}{2} = k^2$ ,
where $k$ is a positive integer. Thus, $n (n+1) = 2 k^2$ . Rearranging, we get $(2n+1)^2-2(2k)^2=1$ , a Pell equation (see https://artofproblemsolving.com/wiki/index.php/Pell_equation ). So $\frac{2n+1}{2k}$ must be a truncation of the continued fraction for $\sqrt{2}$ : \begin{eqnarray*} 1+\frac12&=&\frac{2\cdot1+1}{2\cdot1}\\ 1+\frac1{2+\frac1{2+\frac12}}&=&\frac{2\cdot8+1}{2\cdot6}\\ 1+\frac1{2+\frac1{2+\frac1{2+\frac1{2+\frac12}}}}&=&\frac{2\cdot49+1}{2\cdot35}\\ 1+\frac1{2+\frac1{2+\frac1{2+\frac1{2+\frac1{2+\frac1{2+\frac12}}}}}}&=&\frac{2\cdot288+1}{2\cdot204} \end{eqnarray*} Therefore, $t_{288} = \frac{288\cdot289}{2} = 204^2 = 41616$ , so the answer is $4+1+6+1+6=\boxed{\textbf{(D) 18}}$ . - Steven Chen (Professor Chen Education Palace, www.professorchenedu.com) Edited by wzs26843545602
Edited by dad
-/

import Mathlib.Tactic

theorem wiki_index_php_115a0a42c4 : Prop := by
  sorry
