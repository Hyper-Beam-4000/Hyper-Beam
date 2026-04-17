-- 2025 AIME I Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2025_AIME_I_Problems/Problem_10

-- Problem (LaTeX):
/-
The $27$ cells of a $3 \times 9$ grid are filled in using the numbers $1$ through $9$ so that each row contains $9$ different numbers, and each of the three $3 \times 3$ blocks heavily outlined in the example below contains $9$ different numbers, as in the first three rows of a Sudoku puzzle. [asy] unitsize(20); add(grid(9,3)); draw((0,0)--(9,0)--(9,3)--(0,3)--cycle, linewidth(2)); draw((3,0)--(3,3), linewidth(2)); draw((6,0)--(6,3), linewidth(2)); real a = 0.5; label("5",(a,a)); label("6",(1+a,a)); label("1",(2+a,a)); label("8",(3+a,a)); label("4",(4+a,a)); label("7",(5+a,a)); label("9",(6+a,a)); label("2",(7+a,a)); label("3",(8+a,a)); label("3",(a,1+a)); label("7",(1+a,1+a)); label("9",(2+a,1+a)); label("5",(3+a,1+a)); label("2",(4+a,1+a)); label("1",(5+a,1+a)); label("6",(6+a,1+a)); label("8",(7+a,1+a)); label("4",(8+a,1+a)); label("4",(a,2+a)); label("2",(1+a,2+a)); label("8",(2+a,2+a)); label("9",(3+a,2+a)); label("6",(4+a,2+a)); label("3",(5+a,2+a)); label("1",(6+a,2+a)); label("7",(7+a,2+a)); label("5",(8+a,2+a)); [/asy] The number of different ways to fill such a grid can be written as $p^a \cdot q^b \cdot r^c \cdot s^d$ where $p$ , $q$ , $r$ , and $s$ are distinct prime numbers and $a$ , $b$ , $c$ , $d$ are positive integers. Find $p \cdot a + q \cdot b + r \cdot c + s \cdot d$ .
-/

-- Solution/Answer (LaTeX):
/-
We will fill out the grid row by row. Note that there are $9!=2^7\cdot 3^4\cdot 5\cdot 7$ ways to fill out the first row. For the second row, we will consider a little casework. WLOG let the first row be $123 | 456 | 789$ (bars indicate between the $3\times 3$ squares). Case 1: Every number from the first square goes to the second square. Then there is $1$ way along with $6^3$ orderings giving us $6^3$ cases. Case 2: Two of the first numbers go in the second square and the last number goes in the third. This results in $3\cdot3\cdot3$ ways to put the numbers along with $6^3$ orderings. Thus there are $27\cdot 6^3$ cases. Note that we didn't consider $2$ cases but these are symmetric so the number of ways to fill the second row is $56\cdot 6^3$ . There is $1$ way to place the last numbers in with $6^3$ orderings. Thus there are $2^7\cdot 3^4\cdot 5\cdot 7 \cdot 56\cdot 6^3 \cdot 6^3 = 2^{16}\cdot 3^{10}\cdot 5^1\cdot 7^2$ ways to fill out our mini Sudoku puzzle. Thus the answer is $2\cdot 16+3\cdot 10 + 5\cdot 1+7\cdot 2 = \boxed{081}.$ ~ zhenghua
-/

import Mathlib.Tactic

theorem wiki_index_php_106a49523f : Prop := by
  sorry
