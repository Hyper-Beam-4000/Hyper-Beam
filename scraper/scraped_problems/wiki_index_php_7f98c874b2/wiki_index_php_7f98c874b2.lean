-- 2021 AMC 12B Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12B_Problems/Problem_13

-- Problem (LaTeX):
/-
How many values of $\theta$ in the interval $0<\theta\le 2\pi$ satisfy \[1-3\sin\theta+5\cos3\theta = 0?\] $\textbf{(A) }2 \qquad \textbf{(B) }4 \qquad \textbf{(C) }5\qquad \textbf{(D) }6 \qquad \textbf{(E) }8$
-/

-- Solution/Answer (LaTeX):
/-
We rearrange to get \[5\cos3\theta = 3\sin\theta-1.\] We can graph two functions in this case: $y=5\cos{3x}$ and $y=3\sin{x} -1$ .
Using transformation of functions, we know that $5\cos{3x}$ is just a cosine function with amplitude $5$ and period $\frac{2\pi}{3}$ . Similarly, $3\sin{x} -1$ is just a sine function with amplitude $3$ and shifted $1$ unit downward: [asy] import graph; size(400,200,IgnoreAspect); real Sin(real t) {return 3*sin(t) - 1;} real Cos(real t) {return 5*cos(3*t);} draw(graph(Sin,0, 2pi),red,"$3\sin{x} -1 $"); draw(graph(Cos,0, 2pi),blue,"$5\cos{3x}$"); xaxis("$x$",BottomTop,LeftTicks); yaxis("$y$",LeftRight,RightTicks(trailingzero)); add(legend(),point(E),20E,UnFill); [/asy] So, we have $\boxed{\textbf{(D) }6}$ solutions. ~Jamess2022 (burntTacos)
-/

import Mathlib.Tactic

theorem wiki_index_php_7f98c874b2 : Prop := by
  sorry
