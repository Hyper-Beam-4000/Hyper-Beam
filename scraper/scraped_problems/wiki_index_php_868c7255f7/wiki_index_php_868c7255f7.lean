-- 2017 AMC 12B Problems/Problem 25
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12B_Problems/Problem_25

-- Problem (LaTeX):
/-
A set of $n$ people participate in an online video basketball tournament. Each person may be a member of any number of $5$ -player teams, but no two teams may have exactly the same $5$ members. The site statistics show a curious fact: The average, over all subsets of size $9$ of the set of $n$ participants, of the number of complete teams whose members are among those $9$ people is equal to the reciprocal of the average, over all subsets of size $8$ of the set of $n$ participants, of the number of complete teams whose members are among those $8$ people. How many values $n$ , $9\leq n\leq 2017$ , can be the number of participants? $\textbf{(A) } 477 \qquad \textbf{(B) } 482 \qquad \textbf{(C) } 487 \qquad \textbf{(D) } 557 \qquad \textbf{(E) } 562$
-/

-- Solution/Answer (LaTeX):
/-
Let there be $T$ teams. For each team, there are ${n-5\choose 4}$ different subsets of $9$ players that includes a given full team, so the total number of team-(group of 9) pairs is \[T{n-5\choose 4}.\] Thus, the expected value of the number of full teams in a random set of $9$ players is \[\frac{T{n-5\choose 4}}{{n\choose 9}}.\] Similarly, the expected value of the number of full teams in a random set of $8$ players is \[\frac{T{n-5\choose 3}}{{n\choose 8}}.\] The condition is thus equivalent to the existence of a positive integer $T$ such that \[\frac{T{n-5\choose 4}}{{n\choose 9}}\frac{T{n-5\choose 3}}{{n\choose 8}} = 1.\] \[T^2\frac{(n-5)!(n-5)!8!9!(n-8)!(n-9)!}{n!n!(n-8)!(n-9)!3!4!} = 1\] \[T^2 = \big((n)(n-1)(n-2)(n-3)(n-4)\big)^2 \frac{3!4!}{8!9!}\] \[T^2 = \big((n)(n-1)(n-2)(n-3)(n-4)\big)^2 \frac{144}{7!7!8\cdot8\cdot9}\] \[T^2 = \big((n)(n-1)(n-2)(n-3)(n-4)\big)^2 \frac{1}{4\cdot7!7!}\] \[T = \frac{(n)(n-1)(n-2)(n-3)(n-4)}{2^5\cdot3^2\cdot5\cdot7}\] Note that this is always less than ${n\choose 5}$ , so as long as $T$ is integral, $n$ is a possibility. Thus, we have that this is equivalent to \[2^5\cdot3^2\cdot5\cdot7\big|(n)(n-1)(n-2)(n-3)(n-4).\] It is obvious that $5$ divides the RHS, and that $7$ does if $n\equiv 0,1,2,3,4\mod 7$ . Also, $3^2$ divides it if $n\not\equiv 5,8\mod 9$ . One can also bash out that $2^5$ divides it in $16$ out of the $32$ possible residues $\mod 32$ . Note that $2016 = 7*9*32$ so by using all numbers from $2$ to $2017$ , inclusive, it is clear that each possible residue $\mod 7,9,32$ is reached an equal number of times, so the total number of working $n$ in that range is $5\cdot 7\cdot 16 = 560$ . However, we must subtract the number of "working" $2\leq n\leq 8$ , which is $3$ . Thus, the answer is $\boxed{\textbf{(D) } 557}$ . Alternatively, it is enough to approximate by finding the floor of $2017 \cdot \frac57 \cdot \frac79 \cdot \frac12 - 3$ to get $\boxed{\textbf{(D) } 557}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_868c7255f7 : Prop := by
  sorry
