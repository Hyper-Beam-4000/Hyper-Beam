-- 2018 AIME II Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_II_Problems/Problem_1

-- Problem (LaTeX):
/-
Points $A$ , $B$ , and $C$ lie in that order along a straight path where the distance from $A$ to $C$ is $1800$ meters. Ina runs twice as fast as Eve, and Paul runs twice as fast as Ina. The three runners start running at the same time with Ina starting at $A$ and running toward $C$ , Paul starting at $B$ and running toward $C$ , and Eve starting at $C$ and running toward $A$ . When Paul meets Eve, he turns around and runs toward $A$ . Paul and Ina both arrive at $B$ at the same time. Find the number of meters from $A$ to $B$ .
-/

-- Solution/Answer (LaTeX):
/-
We know that in the same amount of time given, Ina will run twice the distance of Eve, and Paul would run quadruple the distance of Eve. Let's consider the time it takes for Paul to meet Eve: Paul would've run 4 times the distance of Eve, which we can denote as $d$ . Thus, the distance between $B$ and $C$ is $4d+d=5d$ . In that given time, Ina would've run twice the distance $d$ , or $2d$ units. Now, when Paul starts running back towards $A$ , the same amount of time would pass since he will meet Ina at his starting point. Thus, we know that he travels another $4d$ units and Ina travels another $2d$ units. Therefore, drawing out the diagram, we find that $2d+2d+4d+d=9d=1800 \implies d=200$ , and distance between $A$ and $B$ is the distance Ina traveled, or $4d=4(200)=\boxed{800}$
-/

import Mathlib.Tactic

theorem wiki_index_php_b8cd65d3f5 : Prop := by
  sorry
