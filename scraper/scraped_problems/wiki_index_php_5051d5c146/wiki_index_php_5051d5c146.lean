-- 2024 AIME I Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AIME_I_Problems/Problem_5

-- Problem (LaTeX):
/-
Rectangles $ABCD$ and $EFGH$ are drawn such that $D,E,C,F$ are collinear. Also, $A,D,H,G$ all lie on a circle. If $BC=16$ , $AB=107$ , $FG=17$ , and $EF=184$ , what is the length of $CE$ ? [asy] import graph; unitsize(0.1cm); pair A = (0,0);pair B = (70,0);pair C = (70,16);pair D = (0,16);pair E = (3,16);pair F = (90,16);pair G = (90,33);pair H = (3,33); dot(A^^B^^C^^D^^E^^F^^G^^H); label("$A$", A, S);label("$B$", B, S);label("$C$", C, N);label("$D$", D, N);label("$E$", E, S);label("$F$", F, S);label("$G$", G, N);label("$H$", H, N); draw(E--D--A--B--C--E--H--G--F--C); [/asy]
-/

-- Solution/Answer (LaTeX):
/-
We use simple geometry to solve this problem. [asy] import graph; unitsize(0.1cm); pair A = (0,0);pair B = (107,0);pair C = (107,16);pair D = (0,16);pair E = (3,16);pair F = (187,16);pair G = (187,33);pair H = (3,33); label("$A$", A, SW);label("$B$", B, SE);label("$C$", C, N);label("$D$", D, NW);label("$E$", E, S);label("$F$", F, SE);label("$G$", G, NE);label("$H$", H, NW); draw(E--D--A--B--C--E--H--G--F--C); /*Diagram by Technodoggo*/ [/asy] We are given that $A$ , $D$ , $H$ , and $G$ are concyclic; call the circle that they all pass through circle $\omega$ with center $O$ . We know that, given any chord on a circle, the perpendicular bisector to the chord passes through the center; thus, given two chords, taking the intersection of their perpendicular bisectors gives the center. We therefore consider chords $HG$ and $AD$ and take the midpoints of $HG$ and $AD$ to be $P$ and $Q$ , respectively. [asy] import graph; unitsize(0.1cm); pair A = (0,0);pair B = (107,0);pair C = (107,16);pair D = (0,16);pair E = (3,16);pair F = (187,16);pair G = (187,33);pair H = (3,33); label("$A$", A, SW);label("$B$", B, SE);label("$C$", C, N);label("$D$", D, NW);label("$E$", E, S);label("$F$", F, SE);label("$G$", G, NE);label("$H$", H, NW); draw(E--D--A--B--C--E--H--G--F--C); pair P = (95, 33);pair Q = (0, 8); dot(A);dot(B);dot(C);dot(D);dot(E);dot(F);dot(G);dot(H);dot(P);dot(Q); label("$P$", P, N);label("$Q$", Q, W); draw(Q--(107,8));draw(P--(95,0)); pair O = (95,8); dot(O);label("$O$", O, NW); /*Diagram by Technodoggo*/ [/asy] We could draw the circumcircle, but actually it does not matter for our solution; all that matters is that $OA=OH=r$ , where $r$ is the circumradius. By the Pythagorean Theorem, $OQ^2+QA^2=OA^2$ . Also, $OP^2+PH^2=OH^2$ . We know that $OQ=DE+HP$ , and $HP=\dfrac{184}2=92$ ; $QA=\dfrac{16}2=8$ ; $OP=DQ+HE=8+17=25$ ; and finally, $PH=92$ . Let $DE=x$ . We now know that $OA^2=(x+92)^2+8^2$ and $OH^2=25^2+92^2$ . Recall that $OA=OH$ ; thus, $OA^2=OH^2$ . We solve for $x$ : \begin{align*}
(x+92)^2+8^2&=25^2+92^2 \\
(x+92)^2&=625+(100-8)^2-8^2 \\
&=625+10000-1600+64-64 \\
&=9025 \\
x+92&=95 \\
x&=3. \\
\end{align*} The question asks for $CE$ , which is $CD-x=107-3=\boxed{104}$ . ~Technodoggo
-/

import Mathlib.Tactic

theorem wiki_index_php_5051d5c146 : Prop := by
  sorry
