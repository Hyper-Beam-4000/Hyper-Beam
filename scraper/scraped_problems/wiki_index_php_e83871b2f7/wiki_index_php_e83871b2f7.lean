-- 2023 AMC 12B Problems/Problem 18
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_18

-- Problem (LaTeX):
/-
Last academic year Yolanda and Zelda took different courses that did not necessarily administer the same number of quizzes during each of the two semesters. Yolanda's average on all the quizzes she took during the first semester was $3$ points higher than Zelda's average on all the quizzes she took during the first semester. Yolanda's average on all the quizzes she took during the second semester was $18$ points higher than her average for the first semester and was again $3$ points higher than Zelda's average on all the quizzes Zelda took during her second semester. Which one of the following statements cannot possibly be true? $\textbf{(A)}$ Yolanda's quiz average for the academic year was $22$ points higher than Zelda's. $\textbf{(B)}$ Zelda's quiz average for the academic year was higher than Yolanda's. $\textbf{(C)}$ Yolanda's quiz average for the academic year was $3$ points higher than Zelda's. $\textbf{(D)}$ Zelda's quiz average for the academic year equaled Yolanda's. $\textbf{(E)}$ If Zelda had scored $3$ points higher on each quiz she took, then she would have had the same average for the academic year as Yolanda.
-/

-- Solution/Answer (LaTeX):
/-
Denote by $A_i$ the average of person with initial $A$ in semester $i \in \left\{1, 2 \right\}$ Thus, $Y_1 = Z_1 + 3$ , $Y_2 = Y_1 + 18$ , $Y_2 = Z_2 + 3$ . Denote by $A_{12}$ the average of person with initial $A$ in the full year.
Thus, $Y_{12}$ can be any number in $\left( Y_1 , Y_2 \right)$ and $Z_{12}$ can be any number in $\left( Z_1 , Z_2 \right)$ . Therefore, the impossible solution is $\boxed{\textbf{(A)}~\text{Yolanda's quiz average for the academic year was 22 points higher than Zelda's.}}$ ~Steven Chen (Professor Chen Education Palace, www.professorchenedu.com)
-/

import Mathlib.Tactic

theorem wiki_index_php_e83871b2f7 : Prop := by
  sorry
