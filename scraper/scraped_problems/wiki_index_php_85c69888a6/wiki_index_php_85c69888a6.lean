-- 2025 AIME I Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AIME_I_Problems/Problem_2

-- Problem (LaTeX):
/-
On $\triangle ABC$ points $A$ , $D$ , $E$ , and $B$ lie in that order on side $\overline{AB}$ with $AD = 4$ , $DE = 16$ , and $EB = 8$ . Points $A$ , $F$ , $G$ , and $C$ lie in that order on side $\overline{AC}$ with $AF = 13$ , $FG = 52$ , and $GC = 26$ . Let $M$ be the reflection of $D$ through $F$ , and let $N$ be the reflection of $G$ through $E$ . Quadrilateral $DEGF$ has area $288$ . Find the area of heptagon $AFNBCEM$ . [asy] unitsize(14); pair A = (0, 9), B = (-6, 0), C = (12, 0), D = (5A + 2B)/7, E = (2A + 5B)/7, F = (5A + 2C)/7, G = (2A + 5C)/7, M = 2F - D, N = 2E - G; filldraw(A--F--N--B--C--E--M--cycle, lightgray); draw(A--B--C--cycle); draw(D--M); draw(N--G); dot(A); dot(B); dot(C); dot(D); dot(E); dot(F); dot(G); dot(M); dot(N); label("$A$", A, dir(90)); label("$B$", B, dir(225)); label("$C$", C, dir(315)); label("$D$", D, dir(135)); label("$E$", E, dir(135)); label("$F$", F, dir(45)); label("$G$", G, dir(45)); label("$M$", M, dir(45)); label("$N$", N, dir(135)); [/asy]
-/

-- Solution/Answer (LaTeX):
/-
Note that the triangles outside $\triangle ABC$ have the same height as the unshaded triangles in $\triangle ABC$ . Since they have the same bases, the area of the heptagon is the same as the area of triangle $ABC$ . Therefore, we need to calculate the area of $\triangle ABC$ . Denote the length of $DF$ as $x$ and the altitude of $A$ to $DF$ as $h$ . Since $\triangle ADF \sim \triangle AEG$ , $EG = 5x$ and the altitude of $DFGE$ is $4h$ . The area $[DFGE] = \frac{5x + x}{2} \cdot 4h = 3x \cdot 4h = 12xh = 288 \implies xh = 24$ . The area of $\triangle ABC$ is equal to $\frac{1}{2} 7x \cdot 7h = \frac{1}{2} 49xh = \frac{1}{2} 49 \cdot 24 = \frac{1}{2} 1176 = \boxed{588}$ . ~alwaysgonnagiveyouup
-/

import Mathlib.Tactic

theorem wiki_index_php_85c69888a6 : Prop := by
  sorry
