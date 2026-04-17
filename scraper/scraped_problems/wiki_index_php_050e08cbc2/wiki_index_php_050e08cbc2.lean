-- 2024 AIME I Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AIME_I_Problems/Problem_12

-- Problem (LaTeX):
/-
Define $f(x)=|| x|-\tfrac{1}{2}|$ and $g(x)=|| x|-\tfrac{1}{4}|$ . Find the number of intersections of the graphs of \[y=4 g(f(\sin (2 \pi x))) \quad\text{ and }\quad x=4 g(f(\cos (3 \pi y))).\]
-/

-- Solution/Answer (LaTeX):
/-
If we graph $4g(f(x))$ , we see it forms a sawtooth graph that oscillates between $0$ and $1$ (for values of $x$ between $-1$ and $1$ , which is true because the arguments are between $-1$ and $1$ ). Thus by precariously drawing the graph of the two functions in the square bounded by $(0,0)$ , $(0,1)$ , $(1,1)$ , and $(1,0)$ , and hand-counting each of the intersections, we get $\boxed{385}$
-/

import Mathlib.Tactic

theorem wiki_index_php_050e08cbc2 : Prop := by
  sorry
