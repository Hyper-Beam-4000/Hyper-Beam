-- 2018 AMC 10A Problems/Problem 24
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AMC_12A_Problems/Problem_18

-- Problem (LaTeX):
/-
Triangle $ABC$ with $AB=50$ and $AC=10$ has area $120$ . Let $D$ be the midpoint of $\overline{AB}$ , and let $E$ be the midpoint of $\overline{AC}$ . The angle bisector of $\angle BAC$ intersects $\overline{DE}$ and $\overline{BC}$ at $F$ and $G$ , respectively. What is the area of quadrilateral $FDBG$ ? $\textbf{(A) }60 \qquad \textbf{(B) }65 \qquad \textbf{(C) }70 \qquad \textbf{(D) }75 \qquad \textbf{(E) }80 \qquad$
-/

-- Solution/Answer (LaTeX):
/-
Let $BC = a$ , $BG = x$ , $GC = y$ , and the length of the perpendicular from $BC$ through $A$ be $h$ . By angle bisector theorem, we have that \[\frac{50}{x} = \frac{10}{y},\] where $y = -x+a$ . Therefore substituting we have that $BG=\frac{5a}{6}$ . By similar triangles, we have that $DF=\frac{5a}{12}$ , and the height of this trapezoid is $\frac{h}{2}$ . Then, we have that $\frac{ah}{2}=120$ . We wish to compute $\frac{5a}{8}\cdot\frac{h}{2}$ , and we have that it is $\boxed{\textbf{(D) }75}$ by substituting.
-/

import Mathlib.Tactic

theorem wiki_index_php_d87515398d : Prop := by
  sorry
