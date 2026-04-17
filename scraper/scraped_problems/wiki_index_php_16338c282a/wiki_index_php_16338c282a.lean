-- 2024 AMC 12B Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_6

-- Problem (LaTeX):
/-
The national debt of the United States is on track to reach $5\times10^{13}$ dollars by $2033$ . How many digits does this number of dollars have when written as a numeral in base $5$ ? (The approximation of $\log_{10} 5$ as $0.7$ is sufficient for this problem) $\textbf{(A) } 18 \qquad\textbf{(B) } 20 \qquad\textbf{(C) } 22 \qquad\textbf{(D) } 24 \qquad\textbf{(E) } 26$
-/

-- Solution/Answer (LaTeX):
/-
Generally, the number of digits of number $n$ in base $b$ is \[\lfloor \log_b n \rfloor + 1.\] In this question, it is $\lfloor \log_{5} (5\times 10^{13})\rfloor+1$ .
Note that \begin{align*} \log_{5} (5\times 10^{13}) &= 1+\frac{13}{\log_{10} 5} \\ &\approx 1+\frac{13}{0.7} \\ &\approx 19.5 \end{align*} Hence, our answer is $\fbox{\textbf{(B)} 20}$ ~tsun26 (small modification by notknowanything)
-/

import Mathlib.Tactic

theorem wiki_index_php_16338c282a : Prop := by
  sorry
