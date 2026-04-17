-- 2018 AMC 10A Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_4

-- Problem (LaTeX):
/-
Alice, Bob, and Charlie were on a hike and were wondering how far away the nearest town was. When Alice said, "We are at least $6$ miles away," Bob replied, "We are at most $5$ miles away." Charlie then remarked, "Actually the nearest town is at most $4$ miles away." It turned out that none of the three statements were true. Let $d$ be the distance in miles to the nearest town. Which of the following intervals is the set of all possible values of $d$ ? $\textbf{(A) } (0,4) \qquad \textbf{(B) } (4,5) \qquad \textbf{(C) } (4,6) \qquad \textbf{(D) } (5,6) \qquad \textbf{(E) } (5,\infty)$
-/

-- Solution/Answer (LaTeX):
/-
For each of the false statements, we identify its corresponding true statement. Note that: $\mathrm{False}\cap\mathrm{True}=\varnothing.$ $\mathrm{False}\cup\mathrm{True}=[0,\infty).$ We construct the following table: \[\begin{array}{c||c|c} & & \\ [-2.5ex] \textbf{Hiker} & \textbf{False Statement} & \textbf{True Statement} \\ [0.5ex] \hline & & \\ [-2ex] \textbf{Alice} & [6,\infty) & [0,6) \\ & & \\ [-2.25ex] \textbf{Bob} & [0,5] & (5,\infty) \\ & & \\ [-2.25ex] \textbf{Charlie} & [0,4] & (4,\infty) \end{array}\] Taking the intersection of the true statements, we have \[[0,6)\cap(5,\infty)\cap(4,\infty)=(5,6)\cap(4,\infty)=\boxed{\textbf{(D) } (5,6)}.\] ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_3594e64041 : Prop := by
  sorry
