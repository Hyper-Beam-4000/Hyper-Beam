-- 2019 AMC 12B Problems/Problem 16
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AMC_12B_Problems/Problem_16

-- Problem (LaTeX):
/-
There are lily pads in a row numbered $0$ to $11$ , in that order. There are predators on lily pads $3$ and $6$ , and a morsel of food on lily pad $10$ . Fiona the frog starts on pad $0$ , and from any given lily pad, has a $\frac{1}{2}$ chance to hop to the next pad, and an equal chance to jump $2$ pads. What is the probability that Fiona reaches pad $10$ without landing on either pad $3$ or pad $6$ ? $\textbf{(A) } \frac{15}{256} \qquad \textbf{(B) } \frac{1}{16} \qquad \textbf{(C) } \frac{15}{128}\qquad \textbf{(D) } \frac{1}{8} \qquad \textbf{(E) } \frac14$
-/

-- Solution/Answer (LaTeX):
/-
Firstly, notice that if Fiona jumps over the predator on pad $3$ , she must land on pad $4$ . Similarly, she must land on $7$ if she makes it past $6$ . Thus, we can split the problem into $3$ smaller sub-problems, separately finding the probability Fiona skips $3$ , the probability she skips $6$ (starting at $4$ ) and the probability she doesn't skip $10$ (starting at $7$ ). Notice that by symmetry, the last of these three sub-problems is the complement of the first sub-problem, so the probability will be $1 - \text{the probability obtained in the first sub-problem}$ . In the analysis below, we call the larger jump a $2$ -jump, and the smaller a $1$ -jump. For the first sub-problem, consider Fiona's options. She can either go $1$ -jump, $1$ -jump, $2$ -jump, with probability $\frac{1}{8}$ , or she can go $2$ -jump, $2$ -jump, with probability $\frac{1}{4}$ . These are the only two options, so they together make the answer $\frac{1}{8}+\frac{1}{4}=\frac{3}{8}$ . We now also know the answer to the last sub-problem is $1-\frac{3}{8}=\frac{5}{8}$ . For the second sub-problem, Fiona must go $1$ -jump, $2$ -jump, with probability $\frac{1}{4}$ , since any other option would result in her death to a predator. Thus, since the three sub-problems are independent, the final answer is $\frac{3}{8} \cdot \frac{1}{4} \cdot \frac{5}{8} = \boxed{\textbf{(A) }\frac{15}{256}}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_253dfa2090 : Prop := by
  sorry
