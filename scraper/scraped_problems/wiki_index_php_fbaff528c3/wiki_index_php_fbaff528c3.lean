-- 2017 AIME II Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_II_Problems/Problem_11

-- Problem (LaTeX):
/-
Five towns are connected by a system of roads. There is exactly one road connecting each pair of towns. Find the number of ways there are to make all the roads one-way in such a way that it is still possible to get from any town to any other town using the roads (possibly passing through other towns on the way).
-/

-- Solution/Answer (LaTeX):
/-
It is obvious that any configuration of one-way roads which contains a town whose roads all lead into it or lead out of it cannot satisfy the given. We claim that any configuration which does not have a town whose roads all lead into it or lead out of it does satisfy the given conditions. Now we show that a loop of $3$ or more towns exist. Pick a town, then choose a neighboring town to travel to $5$ times. Of these $6$ towns visited, at least two of them must be the same; therefore there must exist a loop of $3$ or more towns because a loop of $2$ towns cannot exist. We want to show that the loop can be reached from any town, and any town can be reached from the loop. $\textbf{Case 1}$ . The loop has $5$ towns.
Clearly every town can be reached by going around the loop. $\textbf{Case 2}$ . The loop has $4$ towns.
The town not on the loop must have a road leading to it. This road comes from a town on the loop. Therefore this town can be reached from the loop. This town not on the loop must also have a road leading out of it. This road leads to a town on the loop. Therefore the loop can be reached from the town. $\textbf{Case 3}$ . The loop has $3$ towns.
There are two towns not on the loop; call them Town $A$ and Town $B$ . Without loss of generality assume $A$ leads to $B$ . Because a road must lead to $A$ , the town where this road comes from must be on the loop. Therefore $A$ and therefore $B$ can be reached from the loop. Because a road must lead out of $B$ , the town it leads to must be on the loop. Therefore the loop can be reached from $B$ and also $A$ . The number of good configurations is the total number of configurations minus the number of bad configurations. There are $2^{{5\choose2}}$ total configurations. To find the number of bad configurations in which a town exists such that all roads lead to it, there are $5$ ways to choose this town and $2^6$ ways to assign the six other roads that do not connect to this town. The same logic is used to find the number of bad configurations in which a town exists such that all roads lead out of it. It might be tempting to conclude that there are $5 \cdot 2^6+5 \cdot 2^6$ bad configurations, but the configurations in which there exists a town such that all roads lead to it and a town such that all roads lead out of it are overcounted. There are $5$ ways to choose the town for which all roads lead to it, $4$ ways to choose the town for which all roads lead out of it, and $2^3$ ways to assign the remaining $3$ roads not connected to either of these towns. Therefore, the answer is $2^{{5\choose2}}-(5 \cdot 2^6+5 \cdot 2^6-5\cdot 4 \cdot 2^3)=\boxed{544}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_fbaff528c3 : Prop := by
  sorry
