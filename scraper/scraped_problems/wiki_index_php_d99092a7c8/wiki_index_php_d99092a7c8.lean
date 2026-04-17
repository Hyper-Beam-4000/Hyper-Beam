-- 2023 AMC 12A Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_5

-- Problem (LaTeX):
/-
Janet rolls a standard $6$ -sided die $4$ times and keeps a running total of the numbers she rolls. What is the probability that at some point, her running total will equal $3$ ? $\textbf{(A) }\frac{2}{9}\qquad\textbf{(B) }\frac{49}{216}\qquad\textbf{(C) }\frac{25}{108}\qquad\textbf{(D) }\frac{17}{72}\qquad\textbf{(E) }\frac{13}{54}$
-/

-- Solution/Answer (LaTeX):
/-
There are $3$ cases where the running total will equal $3$ : one roll; two rolls; or three rolls: Case 1: The chance of rolling a running total of $3$ , namely $(3)$ in exactly one roll is $\frac{1}{6}$ . Case 2: The chance of rolling a running total of $3$ in exactly two rolls, namely $(1, 2)$ and $(2, 1)$ is $\frac{1}{6}\cdot\frac{1}{6}\cdot2=\frac{1}{18}$ . Case 3: The chance of rolling a running total of 3 in exactly three rolls, namely $(1, 1, 1)$ is $\frac{1}{6}\cdot\frac{1}{6}\cdot\frac{1}{6}=\frac{1}{216}$ . Using the rule of sum we have $\frac{1}{6}+\frac{1}{18}+\frac{1}{216}=\boxed{\textbf{(B) }\frac{49}{216}}$ . ~walmartbrian ~andyluo ~DRBStudent ~MC_ADe
-/

import Mathlib.Tactic

theorem wiki_index_php_d99092a7c8 : Prop := by
  sorry
