-- 2021 AIME I Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AIME_I_Problems/Problem_12

-- Problem (LaTeX):
/-
Let $A_1A_2A_3\ldots A_{12}$ be a dodecagon ( $12$ -gon). Three frogs initially sit at $A_4,A_8,$ and $A_{12}$ . At the end of each minute, simultaneously, each of the three frogs jumps to one of the two vertices adjacent to its current position, chosen randomly and independently with both choices being equally likely. All three frogs stop jumping as soon as two frogs arrive at the same vertex at the same time. The expected number of minutes until the frogs stop jumping is $\frac mn$ , where $m$ and $n$ are relatively prime positive integers. Find $m+n$ .
-/

-- Solution/Answer (LaTeX):
/-
Define the distance between two frogs as the number of sides between them that do not contain the third frog. Let $E(a,b,c)$ denote the expected number of minutes until the frogs stop jumping, such that the distances between the frogs are $a,b,$ and $c$ (in either clockwise or counterclockwise order). Without the loss of generality, assume that $a\leq b\leq c.$ We wish to find $E(4,4,4).$ Note that: At any moment before the frogs stop jumping, the only possibilities for $(a,b,c)$ are $(4,4,4),(2,4,6),$ and $(2,2,8).$ $E(a,b,c)$ does not depend on the actual positions of the frogs, but depends on the distances between the frogs. At the end of each minute, each frog has $2$ outcomes. So, there are $2^3=8$ outcomes in total. We have the following system of equations: \begin{align*} E(4,4,4)&=1+\frac{2}{8}E(4,4,4)+\frac{6}{8}E(2,4,6), \\ E(2,4,6)&=1+\frac{4}{8}E(2,4,6)+\frac{1}{8}E(4,4,4)+\frac{1}{8}E(2,2,8), \\ E(2,2,8)&=1+\frac{2}{8}E(2,2,8)+\frac{2}{8}E(2,4,6). \end{align*} Rearranging and simplifying each equation, we get \begin{align*} E(4,4,4)&=\frac{4}{3}+E(2,4,6), &(1) \\ E(2,4,6)&=2+\frac{1}{4}E(4,4,4)+\frac{1}{4}E(2,2,8), &\hspace{12.75mm}(2) \\ E(2,2,8)&=\frac{4}{3}+\frac{1}{3}E(2,4,6). &(3) \end{align*} Substituting $(1)$ and $(3)$ into $(2),$ we obtain \[E(2,4,6)=2+\frac{1}{4}\left[\frac{4}{3}+E(2,4,6)\right]+\frac{1}{4}\left[\frac{4}{3}+\frac{1}{3}E(2,4,6)\right],\] from which $E(2,4,6)=4.$ Substituting this into $(1)$ gives $E(4,4,4)=\frac{16}{3}.$ Therefore, the answer is $16+3=\boxed{019}.$ ~Ross Gao ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_54671d914d : Prop := by
  sorry
