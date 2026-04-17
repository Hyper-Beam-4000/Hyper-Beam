-- 2025 AMC 12A Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12A_Problems/Problem_13

-- Problem (LaTeX):
/-
Let $C = \{1, 2, 3, \dots, 13\}$ . Let $N$ be the greatest integer such that there exists a subset of $C$ with $N$ elements that does not contain five consecutive integers. Suppose $N$ integers are chosen at random from $C$ without replacement. What is the probability that the chosen elements do not include five consecutive integers? $\textbf{(A)}~\frac{3}{130} \qquad \textbf{(B)}~\frac{3}{143} \qquad \textbf{(C)}~\frac{5}{143} \qquad \textbf{(D)}~\frac{1}{26} \qquad \textbf{(E)}~\frac{5}{78}$
-/

-- Solution/Answer (LaTeX):
/-
We first find what $N$ is by figuring out how many numbers we need to take out of the set so that the set does not contain $5$ consecutive integers. Since $N$ must be maximized, we must minimize what numbers are removed, and we quickly find that taking two numbers out works. Consider taking out $5$ and $10$ . You are left with $\{1,2,3,4,6,7,8,9,11,12,13\}$ , which does not have a string of $5$ consecutive integers. There are only $3$ ways to take out two integers such that the resulting set meets our condition ( $5$ and $10$ , $5$ and $9$ , or $4$ and $9$ ), and ${\binom{13}{2}}=78$ total ways to choose such integers. Therefore, the probability is $\boxed{\dfrac{1}{26}}$ . ~Kevin Wang Minor edits ~aashrithm29 Very minor LaTeX edit ~ PerseverePlayer Note: An alternative way to come to the conclusion that there are only three possible subsets of length twelve is as follows: Let the two numbers removed from $C$ be $a$ and $b$ such that $a<b$ . Then, because we cannot have any sequence of five consecutive numbers, $a \leq 5$ , $b-a \leq 5$ , and $13 - b +1\leq 5$ . Then, graphing this system in the $ab$ plane, we easily see that there are only three solutions for $(a,b)$ : $(5,10), (4,9)$ , and $(5,9)$ . Then, simply proceed as described above. ~ 526
-/

import Mathlib.Tactic

theorem wiki_index_php_abc6aa9082 : Prop := by
  sorry
