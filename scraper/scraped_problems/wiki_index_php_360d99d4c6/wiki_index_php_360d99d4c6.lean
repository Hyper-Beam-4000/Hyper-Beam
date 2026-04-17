-- 2022 AMC 10A Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_9

-- Problem (LaTeX):
/-
On Halloween $31$ children walked into the principal's office asking for candy. They
can be classified into three types: Some always lie; some always tell the truth; and
some alternately lie and tell the truth. The alternaters arbitrarily choose their first
response, either a lie or the truth, but each subsequent statement has the opposite
truth value from its predecessor. The principal asked everyone the same three
questions in this order. "Are you a truth-teller?" The principal gave a piece of candy to each of the $22$ children who answered yes. "Are you an alternater?" The principal gave a piece of candy to each of the $15$ children who answered yes. "Are you a liar?" The principal gave a piece of candy to each of the $9$ children who
answered yes. How many pieces of candy in all did the principal give to the children who always
tell the truth? $\textbf{(A) } 7 \qquad \textbf{(B) } 12 \qquad \textbf{(C) } 21 \qquad \textbf{(D) } 27 \qquad \textbf{(E) } 31$
-/

-- Solution/Answer (LaTeX):
/-
Note that: Truth-tellers would answer yes-no-no to the three questions in this order. Liars would answer yes-yes-no to the three questions in this order. Alternaters who responded truth-lie-truth would answer no-no-no to the three questions in this order. Alternaters who responded lie-truth-lie would answer yes-yes-yes to the three questions in this order. Suppose that there are $T$ truth-tellers, $L$ liars, and $A$ alternaters who responded lie-truth-lie. The conditions of the first two questions imply that \begin{align*} T+L+A&=22, \\ L+A&=15. \end{align*} Subtracting the second equation from the first, we have $T=22-15=\boxed{\textbf{(A) } 7}.$ Remark The condition of the third question is extraneous. However, we know that $A=9$ and $L=6,$ so there are $9$ alternaters who responded lie-truth-lie, $6$ liars, and $9$ alternaters who responded truth-lie-truth from this condition. ~sigma ~ orenbad ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_360d99d4c6 : Prop := by
  sorry
