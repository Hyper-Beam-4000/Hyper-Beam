-- 2021 AMC 12A Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_4

-- Problem (LaTeX):
/-
Tom has a collection of $13$ snakes, $4$ of which are purple and $5$ of which are happy. He observes that all of his happy snakes can add, none of his purple snakes can subtract, and all of his snakes that can't subtract also can't add. Which of these conclusions can be drawn about Tom's snakes? $\textbf{(A) }$ Purple snakes can add. $\textbf{(B) }$ Purple snakes are happy. $\textbf{(C) }$ Snakes that can add are purple. $\textbf{(D) }$ Happy snakes are not purple. $\textbf{(E) }$ Happy snakes can't subtract.
-/

-- Solution/Answer (LaTeX):
/-
We are given that \begin{align*} \text{happy}&\Longrightarrow\text{can add}, &(1) \\ \text{purple}&\Longrightarrow\text{cannot subtract}, \hspace{15mm} &(2) \\ \text{cannot subtract}&\Longrightarrow\text{cannot add}. &(3) \end{align*} Two solutions follow from here:
-/

import Mathlib.Tactic

theorem wiki_index_php_0b8beb2e46 : Prop := by
  sorry
