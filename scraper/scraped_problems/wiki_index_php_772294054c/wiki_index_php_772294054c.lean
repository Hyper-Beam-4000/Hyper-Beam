-- 2024 AMC 12A Problems/Problem 15
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_15

-- Problem (LaTeX):
/-
The roots of $x^3 + 2x^2 - x + 3$ are $p, q,$ and $r.$ What is the value of \[(p^2 + 4)(q^2 + 4)(r^2 + 4)?\] $\textbf{(A) } 64 \qquad \textbf{(B) } 75 \qquad \textbf{(C) } 100 \qquad \textbf{(D) } 125 \qquad \textbf{(E) } 144$
-/

-- Solution/Answer (LaTeX):
/-
You can factor $(p^2 + 4)(q^2 + 4)(r^2 + 4)$ as $(p+2i)(p-2i)(q+2i)(q-2i)(r+2i)(r-2i)$ . For any polynomial $f(x)$ , you can create a new polynomial $f(x+a)$ , which will have roots that instead have the value $a$ subtracted. Substituting $x-2i$ and $x+2i$ into $x$ for the first polynomial, gives you $10i-5$ and $-10i-5$ as $c$ for both equations. Multiplying $10i-5$ and $-10i-5$ together gives you $\boxed{\textbf{(D) }125}$ . -ev2028 ~Latex by eevee9406
-/

import Mathlib.Tactic

theorem wiki_index_php_772294054c : Prop := by
  sorry
