-- 2022 AMC 10A Problems/Problem 22
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AMC_12A_Problems/Problem_19

-- Problem (LaTeX):
/-
Suppose that $13$ cards numbered $1, 2, 3, \ldots, 13$ are arranged in a row. The task is to pick them up in numerically increasing order, working repeatedly from left to right. In the example below, cards $1, 2, 3$ are picked up on the first pass, $4$ and $5$ on the second pass, $6$ on the third pass, $7, 8, 9, 10$ on the fourth pass, and $11, 12, 13$ on the fifth pass. For how many of the $13!$ possible orderings of the cards will the $13$ cards be picked up in exactly two passes? [asy] size(11cm); draw((0,0)--(2,0)--(2,3)--(0,3)--cycle); label("7", (1,1.5)); draw((3,0)--(5,0)--(5,3)--(3,3)--cycle); label("11", (4,1.5)); draw((6,0)--(8,0)--(8,3)--(6,3)--cycle); label("8", (7,1.5)); draw((9,0)--(11,0)--(11,3)--(9,3)--cycle); label("6", (10,1.5)); draw((12,0)--(14,0)--(14,3)--(12,3)--cycle); label("4", (13,1.5)); draw((15,0)--(17,0)--(17,3)--(15,3)--cycle); label("5", (16,1.5)); draw((18,0)--(20,0)--(20,3)--(18,3)--cycle); label("9", (19,1.5)); draw((21,0)--(23,0)--(23,3)--(21,3)--cycle); label("12", (22,1.5)); draw((24,0)--(26,0)--(26,3)--(24,3)--cycle); label("1", (25,1.5)); draw((27,0)--(29,0)--(29,3)--(27,3)--cycle); label("13", (28,1.5)); draw((30,0)--(32,0)--(32,3)--(30,3)--cycle); label("10", (31,1.5)); draw((33,0)--(35,0)--(35,3)--(33,3)--cycle); label("2", (34,1.5)); draw((36,0)--(38,0)--(38,3)--(36,3)--cycle); label("3", (37,1.5)); [/asy] $\textbf{(A) } 4082 \qquad \textbf{(B) } 4095 \qquad \textbf{(C) } 4096 \qquad \textbf{(D) } 8178 \qquad \textbf{(E) } 8191$
-/

-- Solution/Answer (LaTeX):
/-
For $1\leq k\leq 12,$ suppose that cards $1, 2, \ldots, k$ are picked up on the first pass. It follows that cards $k+1,k+2,\ldots,13$ are picked up on the second pass. Once we pick the spots for the cards on the first pass, there is only one way to arrange all $\boldsymbol{13}$ cards. For each value of $k,$ there are $\binom{13}{k}-1$ ways to pick the $k$ spots for the cards on the first pass: We exclude the arrangement [asy] size(11cm); draw((0,0)--(2,0)--(2,3)--(0,3)--cycle); label("1", (1,1.5)); draw((3,0)--(5,0)--(5,3)--(3,3)--cycle); label("2", (4,1.5)); draw((6,0)--(8,0)--(8,3)--(6,3)--cycle); label("3", (7,1.5)); draw((9,0)--(11,0)--(11,3)--(9,3)--cycle); label("4", (10,1.5)); draw((12,0)--(14,0)--(14,3)--(12,3)--cycle); label("5", (13,1.5)); draw((15,0)--(17,0)--(17,3)--(15,3)--cycle); label("6", (16,1.5)); draw((18,0)--(20,0)--(20,3)--(18,3)--cycle); label("7", (19,1.5)); draw((21,0)--(23,0)--(23,3)--(21,3)--cycle); label("8", (22,1.5)); draw((24,0)--(26,0)--(26,3)--(24,3)--cycle); label("9", (25,1.5)); draw((27,0)--(29,0)--(29,3)--(27,3)--cycle); label("10", (28,1.5)); draw((30,0)--(32,0)--(32,3)--(30,3)--cycle); label("11", (31,1.5)); draw((33,0)--(35,0)--(35,3)--(33,3)--cycle); label("12", (34,1.5)); draw((36,0)--(38,0)--(38,3)--(36,3)--cycle); label("13", (37,1.5)); [/asy] in which the cards are arranged such that the first pass consists of all $13$ cards. Therefore, the answer is \[\sum_{k=1}^{12}\left[\binom{13}{k}-1\right] = \left[\sum_{k=1}^{12}\binom{13}{k}\right]-12 = \left[\sum_{k=0}^{13}\binom{13}{k}\right]-14 = 2^{13} - 14 = \boxed{\textbf{(D) } 8178}.\] ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_12337fa469 : Prop := by
  sorry
