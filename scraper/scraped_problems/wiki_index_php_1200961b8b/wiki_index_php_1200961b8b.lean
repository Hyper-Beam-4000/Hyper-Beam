-- 2017 AMC 10B Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12B_Problems/Problem_4

-- Problem (LaTeX):
/-
Samia set off on her bicycle to visit her friend, traveling at an average speed of $17$ kilometers per hour. When she had gone half the distance to her friend's house, a tire went flat, and she walked the rest of the way at $5$ kilometers per hour. In all it took her $44$ minutes to reach her friend's house. In kilometers rounded to the nearest tenth, how far did Samia walk? $\textbf{(A)}\ 2.0\qquad\textbf{(B)}\ 2.2\qquad\textbf{(C)}\ 2.8\qquad\textbf{(D)}\ 3.4\qquad\textbf{(E)}\ 4.4$
-/

-- Solution/Answer (LaTeX):
/-
Let's call the distance that Samia had to travel in total as $2x$ , so that we can avoid fractions. We know that the length of the bike ride and how far she walked are equal, so they are both $\frac{2x}{2}$ , or $x$ . She bikes at a rate of $17$ kph, so she travels the distance she bikes in $\frac{x}{17}$ hours. She walks at a rate of $5$ kph, so she travels the distance she walks in $\frac{x}{5}$ hours. The total time is $\frac{x}{17}+\frac{x}{5} = \frac{22x}{85}$ . This is equal to $\frac{44}{60} = \frac{11}{15}$ of an hour. Solving for $x$ , we have: \[\frac{22x}{85} = \frac{11}{15}\] \[\frac{2x}{85} = \frac{1}{15}\] \[30x = 85\] \[6x = 17\] \[x = \frac{17}{6}\] Since $x$ is the distance of how far Samia traveled by both walking and biking, and we want to know how far Samia walked to the nearest tenth, we have that Samia walked about $\boxed{\bold{(C)} 2.8}$ . ~ Lukiebear
-/

import Mathlib.Tactic

theorem wiki_index_php_1200961b8b : Prop := by
  sorry
