-- 2020 AMC 12A Problems/Problem 17
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12A_Problems/Problem_17

-- Problem (LaTeX):
/-
The vertices of a quadrilateral lie on the graph of $y=\ln{x}$ , and the $x$ -coordinates of these vertices are consecutive positive integers. The area of the quadrilateral is $\ln{\frac{91}{90}}$ . What is the $x$ -coordinate of the leftmost vertex? $\textbf{(A) } 6 \qquad \textbf{(B) } 7 \qquad \textbf{(C) } 10 \qquad \textbf{(D) } 12 \qquad \textbf{(E) } 13$
-/

-- Solution/Answer (LaTeX):
/-
Let the coordinates of the quadrilateral be $(n,\ln(n)),(n+1,\ln(n+1)),(n+2,\ln(n+2)),(n+3,\ln(n+3))$ . We have by shoelace's theorem, that the area is \begin{align*} &\frac{\ln(n)(n+1) + \ln(n+1)(n+2) + \ln(n+2)(n+3)+n\ln(n+3)}{2} - \frac{\ln(n+1)(n) + \ln(n+2)(n+1) + \ln(n+3)(n+2)+\ln(n)(n+3)}{2} \\ &=\frac{\ln \left( \frac{n^{n+1}(n+1)^{n+2}(n+2)^{n+3}(n+3)^n}{(n+1)^n(n+2)^{n+1}(n+3)^{n+2}n^{n+3}}\right)}{2} \\ &= \ln \left( \sqrt{\frac{(n+1)^2(n+2)^2}{n^2(n+3)^2}} \right) \\ &= \ln \left(\frac{(n+1)(n+2)}{n(n+3)}\right) \\ &= \ln \left( \frac{91}{90} \right). \end{align*} We know that the numerator must have a factor of $13$ , so given the answer choices, $n$ is either $12$ or $11$ . If $n=11$ , the expression $\frac{(n+1)(n+2)}{n(n+3)}$ does not evaluate to $\frac{91}{90}$ , but if $n=12$ , the expression evaluates to $\frac{91}{90}$ . Hence, our answer is $\boxed{12}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_aaff703784 : Prop := by
  sorry
