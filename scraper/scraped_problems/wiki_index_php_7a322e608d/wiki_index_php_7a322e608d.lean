-- 2024 AMC 12B Problems/Problem 21
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_21

-- Problem (LaTeX):
/-
The measures of the smallest angles of three different right triangles sum to $90^\circ$ . All three triangles have side lengths that are primitive Pythagorean triples. Two of them are $3-4-5$ and $5-12-13$ . What is the perimeter of the third triangle? $\textbf{(A) } 40 \qquad\textbf{(B) } 126 \qquad\textbf{(C) } 154 \qquad\textbf{(D) } 176 \qquad\textbf{(E) } 208$
-/

-- Solution/Answer (LaTeX):
/-
Let $\alpha$ and $\beta$ be the smallest angles of the $3-4-5$ and $5-12-13$ triangles respectively. We have \[\tan(\alpha)=\frac{3}{4} \text{ and } \tan(\beta)=\frac{5}{12}\] Then \[\tan(\alpha+\beta)=\frac{\frac{3}{4}+\frac{5}{12}}{1-\frac{3}{4}\cdot\frac{5}{12}}=\frac{56}{33}\] Let $\theta$ be the smallest angle of the third triangle. Consider \[\tan{90^\circ}=\tan((\alpha+\beta)+\theta)=\frac{\frac{56}{33}+\tan{\theta}}{1-\frac{56}{33}\cdot\tan{\theta}}\] In order for this to be undefined, we need \[1-\frac{56}{33}\cdot\tan{\theta}=0\] so \[\tan{\theta}=\frac{33}{56}\] Hence the base side lengths of the third triangle are $33$ and $56$ . By the Pythagorean Theorem, the hypotenuse of the third triangle is $65$ , so the perimeter is $33+56+65=\boxed{\textbf{(C) }154}$ . ~ kafuu_chino
-/

import Mathlib.Tactic

theorem wiki_index_php_7a322e608d : Prop := by
  sorry
