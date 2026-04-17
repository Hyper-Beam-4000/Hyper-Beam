-- 2017 AMC 12B Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12B_Problems/Problem_10

-- Problem (LaTeX):
/-
At Typico High School, $60\%$ of the students like dancing, and the rest dislike it. Of those who like dancing, $80\%$ say that they like it, and the rest say that they dislike it. Of those who dislike dancing, $90\%$ say that they dislike it, and the rest say that they like it. What fraction of students who say they dislike dancing actually like it? $\textbf{(A)}\ 10\%\qquad\textbf{(B)}\ 12\%\qquad\textbf{(C)}\ 20\%\qquad\textbf{(D)}\ 25\%\qquad\textbf{(E)}\ \frac{100}{3}\%$
-/

-- Solution/Answer (LaTeX):
/-
WLOG, let there be $100$ students. $60$ of them like dancing, and $40$ do not. Of those who like dancing, $20\%$ , or $12$ of them say they dislike dancing. Of those who dislike dancing, $90\%$ , or $36$ of them say they dislike it. Thus, $\frac{12}{12+36} = \frac{12}{48} = \frac{1}{4} = 25\% \boxed{\textbf{(D)}}$
-/

import Mathlib.Tactic

theorem wiki_index_php_f95b23c28f : Prop := by
  sorry
