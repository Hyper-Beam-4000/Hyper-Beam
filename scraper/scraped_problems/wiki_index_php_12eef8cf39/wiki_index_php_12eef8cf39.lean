-- 2017 AIME II Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_II_Problems/Problem_5

-- Problem (LaTeX):
/-
A set contains four numbers. The six pairwise sums of distinct elements of the set, in no particular order, are $189$ , $320$ , $287$ , $234$ , $x$ , and $y$ . Find the greatest possible value of $x+y$ .
-/

-- Solution/Answer (LaTeX):
/-
Let these four numbers be $a$ , $b$ , $c$ , and $d$ , where $a>b>c>d$ . $x+y$ needs to be maximized, so let $x=a+b$ and $y=a+c$ because these are the two largest pairwise sums. Now $x+y=2a+b+c$ needs to be maximized. Notice that $2a+b+c=3(a+b+c+d)-(a+2b+2c+3d)=3((a+c)+(b+d))-((a+d)+(b+c)+(b+d)+(c+d))$ . No matter how the numbers $189$ , $320$ , $287$ , and $234$ are assigned to the values $a+d$ , $b+c$ , $b+d$ , and $c+d$ , the sum $(a+d)+(b+c)+(b+d)+(c+d)$ will always be $189+320+287+234$ . Therefore we need to maximize $3((a+c)+(b+d))-(189+320+287+234)$ . The maximum value of $(a+c)+(b+d)$ is achieved when we let $a+c$ and $b+d$ be $320$ and $287$ because these are the two largest pairwise sums besides $x$ and $y$ . Therefore, the maximum possible value of $x+y=3(320+287)-(189+320+287+234)=\boxed{791}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_12eef8cf39 : Prop := by
  sorry
