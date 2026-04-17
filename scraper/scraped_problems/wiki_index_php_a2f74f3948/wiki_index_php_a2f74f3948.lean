-- 2025 AMC 12B Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AMC_12B_Problems/Problem_13

-- Problem (LaTeX):
/-
A circle has been divided into 6 sectors of different sizes. Then 2 of the sectors are painted red, 2 painted green, and 2 painted blue so that no two neighboring sectors are painted the same color. One such coloring is shown below. [asy] /* Made by Mathemagician108 */ unitsize(1.7cm); pair O = (0, 0); real R = 2; pair A = (R, 0); pair B = (0.5*R, 0.866*R); pair C = (0, R); pair D = (-R, 0); pair E = (-0.954*R, -0.3*R); pair F = (-0.22*R, -0.975*R); path sector1 = O -- A .. arc(O,A,B) -- cycle; path sector2 = O -- B .. arc(O,B,C) -- cycle; path sector3 = O -- C .. arc(O,C,D) -- cycle; path sector4 = O -- D .. arc(O,D,E) -- cycle; path sector5 = O -- E .. arc(O,E,F) -- cycle; path sector6 = O -- F .. arc(O,F,A) -- cycle; pen r = rgb(255, 120, 120); pen g = rgb(120, 255, 120); pen b = rgb(120, 120, 255); filldraw(sector1, g); filldraw(sector2, r); filldraw(sector3, b); filldraw(sector4, r); filldraw(sector5, g); filldraw(sector6, b); draw(circle(O, R)); defaultpen(fontsize(12pt)); label("green", (0.57*R, 0.32*R)); label("red", (0.16*R, 0.63*R)); label("blue", (-0.45*R, 0.45*R)); label("red", (-0.69*R, -0.1*R)); label("green", (-0.45*R, -0.5*R)); label("blue", (0.39*R, -0.49*R)); [/asy] How many different colorings are possible? $\textbf{(A)}~12\qquad\textbf{(B)}~16\qquad\textbf{(C)}~18\qquad\textbf{(D)}~24\qquad\textbf{(E)}~28$
-/

-- Solution/Answer (LaTeX):
/-
Create an arbitrary six slice circular diagram. The first slice has 3 options, and the second has 2, third has 2, fourth has 2, fifth has 2, and the sixth has only 1 color to be chosen. Understand that if \( \mathbb{X} \) is the set containing all possible cases of the circle, then \( \mathbb{X} \) has a correlation to another set, call it \( \mathbb{K} \), which contains all the colors. This can be quite easily sought as a rotation of one element in \( \mathbb{X} \) that accurately maps to another element in \( \mathbb{X} \) is considered the same. In simpler terms, to account for overlapping cases in \( \mathbb{X} \), one must divide by 2 (as two colorings that are rotated are considered different, and we don't want that as it defeats the purpose of "unique"). Then, multiplying out we have \( 3 \times 2^4 = 48 \). Dividing by 2 to account for overlap in \( \mathbb{X} \), we get \( 48/2 \) or $\boxed{\textbf{(D) } 24}$ ~Pinotation
-/

import Mathlib.Tactic

theorem wiki_index_php_a2f74f3948 : Prop := by
  sorry
