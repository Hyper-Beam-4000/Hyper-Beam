-- 2018 AIME II Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_II_Problems/Problem_10

-- Problem (LaTeX):
/-
Find the number of functions $f(x)$ from $\{1, 2, 3, 4, 5\}$ to $\{1, 2, 3, 4, 5\}$ that satisfy $f(f(x)) = f(f(f(x)))$ for all $x$ in $\{1, 2, 3, 4, 5\}$ .
-/

-- Solution/Answer (LaTeX):
/-
Just to visualize solution 1. If we list all possible $(x,f(x))$ , from ${1,2,3,4,5}$ to ${1,2,3,4,5}$ in a specific order, we get $5 \cdot 5 = 25$ different $(x,f(x))$ 's.
Namely: \[(1,1) (1,2) (1,3) (1,4) (1,5)\] \[(2,1) (2,2) (2,3) (2,4) (2,5)\] \[(3,1) (3,2) (3,3) (3,4) (3,5)\] \[(4,1) (4,2) (4,3) (4,4) (4,5)\] \[(5,1) (5,2) (5,3) (5,4) (5,5)\] To list them in this specific order makes it a lot easier to solve this problem. We notice, In order to solve this problem at least one pair of $(x,x)$ where $x\in{1,2,3,4,5}$ must exist.In this case I rather "go backwards". First fixing $5$ pairs $(x,x)$ , (the diagonal of our table) and map them to the other fitting pairs $(x,f(x))$ . You can do this in $\frac{5!}{5!} = 1$ way. Then fixing $4$ pairs $(x,x)$ (The diagonal minus $1$ ) and map them to the other fitting pairs $(x,f(x))$ . You can do this in $4\cdot\frac{5!}{4!} = 20$ ways. Then fixing $3$ pairs $(x,x)$ (The diagonal minus $2$ ) and map them to the other fitting pairs $(x,f(x))$ . You can do this in $\tfrac{(5\cdot4\cdot3\cdot6\cdot3)}{3!2!} + \tfrac{(5\cdot4\cdot3\cdot6\cdot1)}{3!} = 150$ ways.
Fixing $2$ pairs $(x,x)$ (the diagonal minus $3$ ) and map them to the other fitting pairs $(x,f(x))$ . You can do this in $\frac{(5\cdot4\cdot6\cdot4\cdot2)}{2!3!} + \frac{(5\cdot4\cdot6\cdot4\cdot2)}{2!2!} + \frac{(5\cdot4\cdot6\cdot2\cdot1)}{2!2!} = 380$ ways.
Lastly, fixing $1$ pair $(x,x)$ (the diagonal minus $4$ ) and map them to the other fitting pairs $(x,f(x))$ . You can do this in $\tfrac{5!}{4!} + 4\cdot\tfrac{5!}{3!} + 5! = 205$ ways. So $1 + 20 + 150 + 380 + 205 = \framebox{756}$
-/

import Mathlib.Tactic

theorem wiki_index_php_8740bbb129 : Prop := by
  sorry
