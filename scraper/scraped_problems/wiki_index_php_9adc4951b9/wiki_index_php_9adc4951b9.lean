-- 2023 AMC 12B Problems/Problem 16
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12B_Problems/Problem_16

-- Problem (LaTeX):
/-
In the state of Coinland, coins have values $6,10,$ and $15$ cents. Suppose $x$ is the value in cents of the most expensive item in Coinland that cannot be purchased using these coins with exact change. What is the sum of the digits of $x?$ $\textbf{(A) }8\qquad\textbf{(B) }10\qquad\textbf{(C) }7\qquad\textbf{(D) }11\qquad\textbf{(E) }9$
-/

-- Solution/Answer (LaTeX):
/-
This problem asks to find largest $x$ that cannot be written as \[6 a + 10 b + 15 c = x, \hspace{1cm} (1)\] where $a, b, c \in \Bbb Z_+$ . Denote by $r \in \left\{ 0, 1 \right\}$ the remainder of $x$ divided by 2.
Modulo 2 on Equation (1), we get
By using modulus $m \in \left\{ 2, 3, 5 \right\}$ on the equation above, we get $c \equiv r \pmod{2}$ . Following from the Chicken McNugget Theorem , we have that any number that is no less than $(3-1)(5-1) = 8$ can be expressed in the form of $3a + 5b$ with $a, b \in \Bbb Z_+$ . Therefore, all even numbers that are at least equal to $2 \cdot 8 + 15 \cdot 0 = 16$ can be written in the form of Equation (1) with $a, b, c \in \Bbb Z_+$ .
All odd numbers that are at least equal to $2 \cdot 8 + 15 \cdot 1 = 31$ can be written in the form of Equation (1) with $a, b, c \in \Bbb Z_+$ . The above two cases jointly imply that all numbers that are at least 30 can be written in the form of Equation (1) with $a, b, c \in \Bbb Z_+$ . Next, we need to prove that 29 cannot be written in the form of Equation (1) with $a, b, c \in \Bbb Z_+$ . Because 29 is odd, we must have $c \equiv 1 \pmod{2}$ .
Because $a, b, c \in \Bbb Z_+$ , we must have $c = 1$ .
Plugging this into Equation (1), we get $3 a + 5 b = 7$ .
However, this equation does not have non-negative integer solutions. All analysis above jointly imply that the largest $x$ that has no non-negative integer solution to Equation (1) is 29.
Therefore, the answer is $2 + 9 = \boxed{\textbf{(D) 11}}$ . ~Steven Chen, www.professorchenedu.com
-/

import Mathlib.Tactic

theorem wiki_index_php_9adc4951b9 : Prop := by
  sorry
