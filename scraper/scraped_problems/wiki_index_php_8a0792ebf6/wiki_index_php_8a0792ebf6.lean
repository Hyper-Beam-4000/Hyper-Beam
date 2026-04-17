-- 2021 AMC 12A Problems/Problem 9
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_9

-- Problem (LaTeX):
/-
Which of the following is equivalent to \[(2+3)(2^2+3^2)(2^4+3^4)(2^8+3^8)(2^{16}+3^{16})(2^{32}+3^{32})(2^{64}+3^{64})?\] $\textbf{(A)} ~3^{127} + 2^{127} \qquad\textbf{(B)} ~3^{127} + 2^{127} + 2 \cdot 3^{63} + 3 \cdot 2^{63} \qquad\textbf{(C)} ~3^{128}-2^{128} \qquad\textbf{(D)} ~3^{128} + 2^{128} \qquad\textbf{(E)} ~5^{127}$
-/

-- Solution/Answer (LaTeX):
/-
By multiplying the entire equation by $3-2=1$ , all the terms will simplify by difference of squares, and the final answer is $\boxed{\textbf{(C)} ~3^{128}-2^{128}}$ . Additionally, we could also multiply the entire equation (we can let it be equal to $x$ ) by $2-3=-1$ . The terms again simplify by difference of squares. This time, we get $-x=2^{128}-3^{128} \Rightarrow x=3^{128}-2^{128}$ . Both solutions yield the same answer. Note: Also notice when you multiply it by the first pair $(2+3)$ , it immediately factors. Notice how it "domino" effects to the others, ultimately collapsing into $\boxed{\textbf{(C)} ~3^{128}-2^{128}}$ . ~BakedPotato66
~Note by hashbrown2009
-/

import Mathlib.Tactic

theorem wiki_index_php_8a0792ebf6 : Prop := by
  sorry
