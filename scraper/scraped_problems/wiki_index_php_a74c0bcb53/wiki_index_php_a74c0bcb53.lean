-- 2024 AMC 12B Problems/Problem 20
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_20

-- Problem (LaTeX):
/-
Suppose $A$ , $B$ , and $C$ are points in the plane with $AB=40$ and $AC=42$ , and let $x$ be the length of the line segment from $A$ to the midpoint of $\overline{BC}$ . Define a function $f$ by letting $f(x)$ be the area of $\triangle ABC$ . Then the domain of $f$ is an open interval $(p,q)$ , and the maximum value $r$ of $f(x)$ occurs at $x=s$ . What is $p+q+r+s$ ? $\textbf{(A) }909\qquad \textbf{(B) }910\qquad \textbf{(C) }911\qquad \textbf{(D) }912\qquad \textbf{(E) }913\qquad$
-/

-- Solution/Answer (LaTeX):
/-
Let the midpoint of $BC$ be $M$ , and let the length $BM = CM = a$ . We know there are limits to the value of $x$ , and these limits can probably be found through the triangle inequality. But the triangle inequality relates the third side length $BC$ to $AC$ and $AB$ , and doesn't contain any information about the median. Therefore we're going to have to write the side $BC$ in terms of $x$ and then use the triangle inequality to find bounds on $x$ . We use Stewart's theorem to relate $BC$ to the median $AM$ : $man + dad = bmb + cnc$ . In this case $m = \frac{a}2$ , $n=\frac{a}2$ , $a = m+n$ , $d = x$ , $b = 42$ , $c = 40$ . Therefore we get the equation $2a^3 + 2ax^2 = a \cdot 42^2 + a \cdot 40^2$ $2a^2 + 2x^2 = 42^2 + 40^2$ . Notice that since $20-21-29$ is a pythagorean triple, this means $2a^2 + 2x^2 = 58^2$ . \[\implies a^2 = \frac{58^2}{2}-x^2\] \[\implies a = \sqrt{\frac{58^2}{2}-x^2}\] By triangle inequality, $2a+40>42 \implies a>1$ and $40+42>2a \implies a<41$ Let's tackle the first inequality: \[\sqrt{\frac{58^2}{2}-x^2}>1 \implies x^2 < \frac{58^2}{2}-1\] \[\implies x^2 < \frac{40^2+42^2}{2}-1 \implies x^2<41^2\] Here we use the property that $\frac{x^2+(x+2)^2}{2}-1 = (x+1)^2$ . Therefore in this case, $x<41$ . For the second inequality, \[\sqrt{\frac{58^2}{2}-x^2} < 41 \implies x^2 > \frac{58^2}{2}-41^2\] \[\implies x^2 > \frac{58^2}{2}-1 + 1 - 41^2\] \[\implies x^2 > 41^2 + 1 - 41^2 \implies x^2 > 1 \implies x > 1\] Therefore we have $1<x<41$ , so the domain of $f(x)$ is $(1,41)$ . The area of this triangle is $\frac{1}{2} 42 \cdot 40 \cdot \sin(\theta)$ . The maximum value of the area occurs when the triangle is right, i.e. $\theta = 90^{\circ}$ . Then the area is $\frac{1}{2} \cdot 40 \cdot 42 = 840$ . The length of the median of a right triangle is half the length of it's hypotenuse, which squared is $40^2+42^2 = 58^2$ . Thus the length of $x$ is $29$ . Our final answer is $1+41+840+29 = \boxed{\textbf{911 } (C)}$ ~KingRavi
-/

import Mathlib.Tactic

theorem wiki_index_php_a74c0bcb53 : Prop := by
  sorry
