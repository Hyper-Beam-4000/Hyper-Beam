-- 2020 AMC 12A Problems/Problem 22
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12A_Problems/Problem_22

-- Problem (LaTeX):
/-
Let $(a_n)$ and $(b_n)$ be the sequences of real numbers such that \[ (2 + i)^n = a_n + b_ni \] for all integers $n\geq 0$ , where $i = \sqrt{-1}$ . What is \[\sum_{n=0}^\infty\frac{a_nb_n}{7^n}\,?\] $\textbf{(A) }\frac 38\qquad\textbf{(B) }\frac7{16}\qquad\textbf{(C) }\frac12\qquad\textbf{(D) }\frac9{16}\qquad\textbf{(E) }\frac47$
-/

-- Solution/Answer (LaTeX):
/-
Square the given equality to yield \[(3 + 4i)^n = (a_n + b_ni)^2 = (a_n^2 - b_n^2) + 2a_nb_ni,\] so $a_nb_n = \tfrac12\operatorname{Im}((3+4i)^n)$ and \[\sum_{n\geq 0}\frac{a_nb_n}{7^n} = \frac12\operatorname{Im}\left(\sum_{n\geq 0}\frac{(3+4i)^n}{7^n}\right) = \frac12\operatorname{Im}\left(\frac{1}{1 - \frac{3 + 4i}7}\right) = \boxed{\frac 7{16}}.\]
-/

import Mathlib.Tactic

theorem wiki_index_php_6969e63809 : Prop := by
  sorry
