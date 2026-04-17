-- 2024 AMC 10B Problems/Problem 18
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_14

-- Problem (LaTeX):
/-
How many different remainders can result when the $100$ th power of an integer is
divided by $125$ ? $\textbf{(A) } 1 \qquad\textbf{(B) } 2 \qquad\textbf{(C) } 5 \qquad\textbf{(D) } 25 \qquad\textbf{(E) } 125$
-/

-- Solution/Answer (LaTeX):
/-
First note that the Euler's totient function of $125$ is $100$ . We can set up two cases, which depend on whether a number is relatively prime to $125.$ If $n$ is relatively prime to $125$ , then $n^{100} \equiv 1 \pmod{125}$ because of Euler's Totient Theorem . If $n$ is not relatively prime to $125$ , it must have a factor of $5$ . Express $n$ as $5m$ , where $m$ is some integer. Then $n^{100} \equiv (5m)^{100} \equiv 5^{100}\cdot m^{100} \equiv 125 \cdot 5^{97} \cdot m^{100} \equiv 0 \pmod{125}$ . Therefore, $n^{100}$ can only be congruent to $0$ or $1 \pmod{125}$ . Our answer is $\boxed{2}$ . ~lprado
-/

import Mathlib.Tactic

theorem wiki_index_php_d1864a388e : Prop := by
  sorry
