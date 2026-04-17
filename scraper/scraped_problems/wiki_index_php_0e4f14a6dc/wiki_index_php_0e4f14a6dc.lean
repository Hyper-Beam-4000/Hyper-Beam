-- 2024 AMC 10A Problems/Problem 2
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_2

-- Problem (LaTeX):
/-
A model used to estimate the time it will take to hike to the top of the mountain on a trail is of the form $T=aL+bG,$ where $a$ and $b$ are constants, $T$ is the time in minutes, $L$ is the length of the trail in miles, and $G$ is the altitude gain in feet. The model estimates that it will take $69$ minutes to hike to the top if a trail is $1.5$ miles long and ascends $800$ feet, as well as if a trail is $1.2$ miles long and ascends $1100$ feet. How many minutes does the model estimates it will take to hike to the top if the trail is $4.2$ miles long and ascends $4000$ feet? $\textbf{(A) }240\qquad\textbf{(B) }246\qquad\textbf{(C) }252\qquad\textbf{(D) }258\qquad\textbf{(E) }264$
-/

-- Solution/Answer (LaTeX):
/-
Plug in the values into the equation to give you the following two equations:
\begin{align*}
69&=1.5a+800b, \\
69&=1.2a+1100b.
\end{align*}
Solving for the values $a$ and $b$ gives you that $a=30$ and $b=\frac{3}{100}$ . These values can be plugged back in showing that these values are correct.
Now, using the given length of the trail, $4.2$ , and the given vertical increase, $4000$ , we get a final answer of $\boxed{\textbf{(B) }246}.$ Solution by juwushu . Minor edits by ParticlePhysics and TigerSenju
-/

import Mathlib.Tactic

theorem wiki_index_php_0e4f14a6dc : Prop := by
  sorry
