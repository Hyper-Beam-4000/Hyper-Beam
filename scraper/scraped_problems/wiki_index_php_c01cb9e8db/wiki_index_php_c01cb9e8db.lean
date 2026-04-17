-- 2024 USAMO Problems/Problem 4
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_USAMO_Problems/Problem_4

-- Problem (LaTeX):
/-
Let $m$ and $n$ be positive integers. A circular necklace contains $m n$ beads, each either red or blue. It turned out that no matter how the necklace was cut into $m$ blocks of $n$ consecutive beads, each block had a distinct number of red beads. Determine, with proof, all possible values of the ordered pair $(m, n)$ . Solution 1 We need to determine all possible positive integer pairs $(m, n)$ such that there exists a circular necklace of $mn$ beads, each colored red or blue, satisfying the following condition: No matter how the necklace is cut into $m$ blocks of $n$ consecutive beads, each block has a distinct number of red beads. Necessary Condition: 1. Maximum Possible Distinct Counts:
In a block of $n$ beads, the number of red beads can range from $0$ to $n$ .
Therefore, there are $n + 1$ possible distinct counts of red beads in a block.
Since we have $m$ blocks, the maximum number of distinct counts must be at least $m$ .
Thus, we must have: \[m \leq n + 1\] Sufficient Construction: We will show that for all positive integers $m$ and $n$ satisfying $m \leq n + 1$ , such a necklace exists. 1. Construct Blocks:
Create $m$ blocks, each containing $n$ beads. Assign to each block a unique number of red beads, ranging from $0$ to $m - 1$ . 2. Design the Necklace:
Arrange these $m$ blocks in a fixed order to form the necklace. Since the necklace is circular, cutting it at different points results in cyclic permutations of the blocks. 3. Verification:
In any cut, the sequence of blocks (and thus the counts of red beads) is a cyclic shift of the original sequence. Therefore, in each partition, the blocks will have distinct numbers of red beads. Example: Let's construct a necklace for $m = 3$ and $n = 2$ : Blocks:
Block 1: $0$ red beads (BB)
Block 2: $1$ red bead (RB)
Block 3: $2$ red beads (RR) Necklace Arrangement:
Place the blocks in order: BB-RB-RR. Verification:
Any cut of the necklace into $3$ blocks of $2$ beads will have blocks with red bead counts of $0$ , $1$ , and $2$ . Conclusion: All ordered pairs $(m, n)$ where $m \leq n + 1$ satisfy the condition.
Therefore, the possible values of $(m, n)$ are all positive integers such that $m \leq n + 1$ . Final Answer: Exactly all positive integers $m$ and $n$ with $m \leq n + 1$ ; these are all possible ordered pairs $(m, n)$ . ~ Athmyx Video Solution https://youtu.be/ZcdBpaLC5p0 [video contains problem 1 and problem 4] Let $m$ and $n$ be positive integers. A circular necklace contains $m n$ beads, each either red or blue. It turned out that no matter how the necklace was cut into $m$ blocks of $n$ consecutive beads, each block had a distinct number of red beads. Determine, with proof, all possible values of the ordered pair $(m, n)$ .
-/

-- Solution/Answer (LaTeX):
/-
We need to determine all possible positive integer pairs $(m, n)$ such that there exists a circular necklace of $mn$ beads, each colored red or blue, satisfying the following condition: No matter how the necklace is cut into $m$ blocks of $n$ consecutive beads, each block has a distinct number of red beads. Necessary Condition: 1. Maximum Possible Distinct Counts:
In a block of $n$ beads, the number of red beads can range from $0$ to $n$ .
Therefore, there are $n + 1$ possible distinct counts of red beads in a block.
Since we have $m$ blocks, the maximum number of distinct counts must be at least $m$ .
Thus, we must have: \[m \leq n + 1\] Sufficient Construction: We will show that for all positive integers $m$ and $n$ satisfying $m \leq n + 1$ , such a necklace exists. 1. Construct Blocks:
Create $m$ blocks, each containing $n$ beads. Assign to each block a unique number of red beads, ranging from $0$ to $m - 1$ . 2. Design the Necklace:
Arrange these $m$ blocks in a fixed order to form the necklace. Since the necklace is circular, cutting it at different points results in cyclic permutations of the blocks. 3. Verification:
In any cut, the sequence of blocks (and thus the counts of red beads) is a cyclic shift of the original sequence. Therefore, in each partition, the blocks will have distinct numbers of red beads. Example: Let's construct a necklace for $m = 3$ and $n = 2$ : Blocks:
Block 1: $0$ red beads (BB)
Block 2: $1$ red bead (RB)
Block 3: $2$ red beads (RR) Necklace Arrangement:
Place the blocks in order: BB-RB-RR. Verification:
Any cut of the necklace into $3$ blocks of $2$ beads will have blocks with red bead counts of $0$ , $1$ , and $2$ . Conclusion: All ordered pairs $(m, n)$ where $m \leq n + 1$ satisfy the condition.
Therefore, the possible values of $(m, n)$ are all positive integers such that $m \leq n + 1$ . Final Answer: Exactly all positive integers $m$ and $n$ with $m \leq n + 1$ ; these are all possible ordered pairs $(m, n)$ . ~ Athmyx
-/

import Mathlib.Tactic

theorem wiki_index_php_c01cb9e8db : Prop := by
  sorry
