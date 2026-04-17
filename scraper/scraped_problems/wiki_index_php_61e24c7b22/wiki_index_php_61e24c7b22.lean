-- 2017 AMC 12A Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AMC_12A_Problems/Problem_5

-- Problem (LaTeX):
/-
At a gathering of $30$ people, there are $20$ people who all know each other and $10$ people who know no one. People who know each other hug, and people who do not know each other shake hands. How many handshakes occur? $\textbf{(A)}\ 240\qquad\textbf{(B)}\ 245\qquad\textbf{(C)}\ 290\qquad\textbf{(D)}\ 480\qquad\textbf{(E)}\ 490$
-/

-- Solution/Answer (LaTeX):
/-
All of the handshakes will involve at least one person from the $10$ who knows no one. Label these ten people $A$ , $B$ , $C$ , $D$ , $E$ , $F$ , $G$ , $H$ , $I$ , $J$ . Person $A$ from the group of $10$ will initiate a handshake with everyone else ( $29$ people). Person $B$ initiates $28$ handshakes plus the one already counted from person $A$ . Person $C$ initiates $27$ new handshakes plus the two we already counted. This continues until person $J$ initiates $20$ handshakes plus the nine we already counted from $A$ ... $I$ . $29+28+27+26+25+24+23+22+21+20 = \boxed{(B)=\ 245}$
-/

import Mathlib.Tactic

theorem wiki_index_php_61e24c7b22 : Prop := by
  sorry
