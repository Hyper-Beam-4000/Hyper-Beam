-- 2020 AIME I Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AIME_I_Problems/Problem_11

-- Problem (LaTeX):
/-
For integers $a,b,c$ and $d,$ let $f(x)=x^2+ax+b$ and $g(x)=x^2+cx+d.$ Find the number of ordered triples $(a,b,c)$ of integers with absolute values not exceeding $10$ for which there is an integer $d$ such that $g(f(2))=g(f(4))=0.$
-/

-- Solution/Answer (LaTeX):
/-
There can be two different cases for this problem, either $f(2)=f(4)$ or not. If it is, note that by Vieta's formulas $a = -6$ . Then, $b$ can be anything. However, $c$ can also be anything, as we can set the root of $g$ (not equal to $f(2) = f(4)$ ) to any integer, producing a possible integer value of $d$ . Therefore there are $21^2 = 441$ in this case*. If it isn't, then $f(2),f(4)$ are the roots of $g$ . This means by Vieta's, that: \[f(2)+f(4) = -c \in [-10,10]\] \[20 + 6a + 2b \in [-10,10]\] \[3a + b \in [-15,-5].\] Solving these inequalities while considering that $a \neq -6$ to prevent $f(2) = f(4)$ , we obtain $69$ possible tuples and adding gives $441+69=\boxed{510}$ .
~awang11
-/

import Mathlib.Tactic

theorem wiki_index_php_0840f8bda1 : Prop := by
  sorry
