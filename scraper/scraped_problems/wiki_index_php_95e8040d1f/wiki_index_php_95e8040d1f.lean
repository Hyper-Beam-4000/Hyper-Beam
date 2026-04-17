-- 2021 AMC 12B Problems/Problem 16
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12B_Problems/Problem_16

-- Problem (LaTeX):
/-
Let $g(x)$ be a polynomial with leading coefficient $1,$ whose three roots are the reciprocals of the three roots of $f(x)=x^3+ax^2+bx+c,$ where $1<a<b<c.$ What is $g(1)$ in terms of $a,b,$ and $c?$ $\textbf{(A) }\frac{1+a+b+c}c \qquad \textbf{(B) }1+a+b+c \qquad \textbf{(C) }\frac{1+a+b+c}{c^2}\qquad \textbf{(D) }\frac{a+b+c}{c^2} \qquad \textbf{(E) }\frac{1+a+b+c}{a+b+c}$
-/

-- Solution/Answer (LaTeX):
/-
Note that $f(1/x)$ has the same roots as $g(x)$ , if it is multiplied by some monomial so that the leading term is $x^3$ they will be equal. We have \[f(1/x) = \frac{1}{x^3} + \frac{a}{x^2}+\frac{b}{x} + c\] so we can see that \[g(x) = \frac{x^3}{c}f(1/x)\] Therefore \[g(1) = \frac{1}{c}f(1) = \boxed{\textbf{(A) }\frac{1+a+b+c}c}\]
-/

import Mathlib.Tactic

theorem wiki_index_php_95e8040d1f : Prop := by
  sorry
