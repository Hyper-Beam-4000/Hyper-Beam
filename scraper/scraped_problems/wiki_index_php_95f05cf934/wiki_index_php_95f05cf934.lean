-- 2025 AIME I Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AIME_I_Problems/Problem_12

-- Problem (LaTeX):
/-
The set of points in $3$ -dimensional coordinate space that lie in the plane $x+y+z=75$ whose coordinates satisfy the inequalities \[x-yz<y-zx<z-xy\] forms three disjoint convex regions. Exactly one of those regions has finite area. The area of this finite region can be expressed in the form $a\sqrt{b},$ where $a$ and $b$ are positive integers and $b$ is not divisible by the square of any prime. Find $a+b.$
-/

-- Solution/Answer (LaTeX):
/-
Rewriting we have $z=75-x-y.$ From the inequality $x-yz<y-zx$ we can rewrite to get, \[x-y(75-x-y)< y-x(75-x-y).\] \[76x-76y+y^2-x^2<0.\] \[(76-x-y)(x-y)<0.\] Similarly from the inequality $y-zx<z-xy$ we rewrite to get, \[y-x(75-x-y)<(75-x-y)-xy.\] \[2y + 2xy + x^2 - 74x - 75 < 0.\] \[(x + 1)(2y + x - 75) < 0.\] Our next step is a visual which can be seen by roughly graphing the two inequalities. The first inequality is similar to a bow tie(you have to graph to see it lol) with bounds of $x-y=0$ and $76-x-y=0.$ The second one is a bow tie with edges of $x+1=0$ and $2y+x-75=0.$ Here is the region of our solutions. [asy] import graph; size(400, 400); real xmin = -250, xmax = 250; real ymin = -150, ymax = 150; draw((xmin,0)--(xmax,0), black+0.8bp, Arrow); draw((0,ymin)--(0,ymax), black+0.8bp, Arrow); pair A = (38, 38), B = (-10, -10), C = (-227, 151), D = (-10, 85/2), E = (25, 25); path L1 = (xmin, xmin)--(xmax, xmax); path L2 = (xmin, 76-xmin)--(xmax, 76-xmax); path L3 = ((-10, ymin)--(-10, ymax)); path L4 = (xmin, (75-xmin)/2)--(xmax, (75-xmax)/2); fill(B--D--E--cycle, lightgreen); draw(L1, blue); draw(L2, blue); draw(L3, red); draw(L4, red); dot(A, black); label("$(38,38)$", A, NE); dot(B, black); label("$(-1,-1)$", B, SE); dot(C, black); label("$(-227,151)$", C, NW); dot(D, black); label("$(-1,38)$", D, SW); dot(E, black); label("$(25,25)$", E, SE); [/asy] It is simple to find the intersections of those which are $(-1,38,38),(25,25,25)$ and $(-1,-1,77).$ The sidelengths of this triangle are $39\sqrt{2},26\sqrt{6},13\sqrt{6}$ which is a $30-60-90$ gives us an area of \[\frac{1}{2}(39\sqrt{2})(13\sqrt{6})=507\sqrt{3}\implies\boxed{510}.\] ~ mathkiddus ~plang2008~hashbrown2009
-/

import Mathlib.Tactic

theorem wiki_index_php_95f05cf934 : Prop := by
  sorry
