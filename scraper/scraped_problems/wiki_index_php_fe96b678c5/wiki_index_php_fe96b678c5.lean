-- 2024 AMC 10B Problems/Problem 3
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12B_Problems/Problem_3

-- Problem (LaTeX):
/-
For how many integer values of $x$ is $|2x| \leq 7 \pi$ $\textbf{(A) } 16 \qquad\textbf{(B) } 17 \qquad\textbf{(C) } 19 \qquad\textbf{(D) } 20 \qquad\textbf{(E) } 21$
-/

-- Solution/Answer (LaTeX):
/-
$\pi = 3.14159\dots$ is slightly less than $\dfrac{22}{7} = 3.\overline{142857}$ . So $7\pi \approx 21.9$ The inequality expands to be $-21.9 \le 2x \le 21.9$ . We find that $x$ can take the integer values between $-10$ and $10$ inclusive. There are $\boxed{\text{E. }21}$ such values. Note that if you did not know whether $\pi$ was greater than or less than $\dfrac{22}{7}$ , then you might perform casework. In the case that $\pi > \dfrac{22}{7}$ , the valid solutions are between $-11$ and $11$ inclusive: $23$ solutions. Since, $23$ is not an answer choice, we can be confident that $\pi < \dfrac{22}{7}$ , and that $\boxed{\text{E. } 21}$ is the correct answer. ~numerophile Test advice: If you are in the test and do not know if $\frac{22}{7}$ is bigger or smaller than $\pi$ , you can use the extremely sophisticated method of just dividing $\dfrac{22}{7}$ via long division. Once you get to $3.142$ you realise that you don't need to divide further since $\pi = 3.1416$ when rounded to 4 decimal places.Therefore, you do not include $11$ and $-11$ and the answer is 21. ~Rosiefork (first time using Latex)(and a complete noob)
-/

import Mathlib.Tactic

theorem wiki_index_php_fe96b678c5 : Prop := by
  sorry
