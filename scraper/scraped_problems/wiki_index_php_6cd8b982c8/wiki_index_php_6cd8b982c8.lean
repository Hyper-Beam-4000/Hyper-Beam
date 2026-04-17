-- 2017 AMC 12B Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12B_Problems/Problem_5

-- Problem (LaTeX):
/-
The data set $[6, 19, 33, 33, 39, 41, 41, 43, 51, 57]$ has median $Q_2 = 40$ , first quartile $Q_1 = 33$ , and third quartile $Q_3 = 43$ . An outlier in a data set is a value that is more than $1.5$ times the interquartile range below the first quartle ( $Q_1$ ) or more than $1.5$ times the interquartile range above the third quartile ( $Q_3$ ), where the interquartile range is defined as $Q_3 - Q_1$ . How many outliers does this data set have? $\textbf{(A)}\ 0\qquad\textbf{(B)}\ 1\qquad\textbf{(C)}\ 2\qquad\textbf{(D)}\ 3\qquad\textbf{(E)}\ 4$
-/

-- Solution/Answer (LaTeX):
/-
The interquartile range is defined as $Q3 - Q1$ , which is $43 - 33 = 10$ . $1.5$ times this value is $15$ , so all values more than $15$ below $Q1$ = $33 - 15 = 18$ is an outlier. The only one that fits this is $6$ . All values more than $15$ above $Q3 = 43 + 15 = 58$ are also outliers, of which there are none so there is only $\boxed{\textbf{(B) 1}}$ outlier in total.
-/

import Mathlib.Tactic

theorem wiki_index_php_6cd8b982c8 : Prop := by
  sorry
