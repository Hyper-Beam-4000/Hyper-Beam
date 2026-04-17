-- 2024 AMC 12A Problems/Problem 19
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_19

-- Problem (LaTeX):
/-
Cyclic quadrilateral $ABCD$ has lengths $BC=CD=3$ and $DA=5$ with $\angle CDA=120^\circ$ . What is the length of the shorter diagonal of $ABCD$ ? $\textbf{(A) }\frac{31}7 \qquad \textbf{(B) }\frac{33}7 \qquad \textbf{(C) }5 \qquad \textbf{(D) }\frac{39}7 \qquad \textbf{(E) }\frac{41}7 \qquad$
-/

-- Solution/Answer (LaTeX):
/-
[asy] import geometry; size(200); pair A = (-1.66, 0.33); pair B = (-9.61277, 1.19799); pair C = (-7.83974, 3.61798); pair D = (-4.88713, 4.14911); draw(circumcircle(A, B, C)); draw(A--C); draw(A--D); draw(C--D); draw(B--C); draw(A--B); label("$A$", A, E); label("$B$", B, W); label("$C$", C, NW); label("$D$", D, N); label("$7$", midpoint(A--C), SW); label("$5$", midpoint(A--D), NE); label("$3$", midpoint(C--D)+ dir(135)*0.3, N); label("$3$", midpoint(B--C)+dir(180)*0.3, NW); label("$8$", midpoint(A--B), S); markangle(Label("$60^\circ$", Relative(0.5)), A, B, C, radius=10); markangle(Label("$120^\circ$", Relative(0.5)), C, D, A, radius=10); [/asy] ~diagram by erics118 First, $\angle CBA=60 ^\circ$ by properties of cyclic quadrilaterals. Let $AC=u$ . Apply the Law of Cosines on $\triangle ACD$ : \[u^2=3^2+5^2-2(3)(5)\cos120^\circ\] \[u=7\] Let $AB=v$ . Apply the Law of Cosines on $\triangle ABC$ : \[7^2=3^2+v^2-2(3)(v)\cos60^\circ\] \[v=\frac{3\pm13}{2}\] \[v=8\] By Ptolemy’s Theorem , \[AB \cdot CD+AD \cdot BC=AC \cdot BD\] \[8 \cdot 3+5 \cdot 3=7BD\] \[BD=\frac{39}{7}\] Since $\frac{39}{7}<7$ ,
The answer is $\boxed{\textbf{(D) }\frac{39}{7}}$ . ~lptoggled,eevee9406, meh494
-/

import Mathlib.Tactic

theorem wiki_index_php_2d4c3048de : Prop := by
  sorry
