-- 2023 AMC 12A Problems/Problem 11
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AMC_12A_Problems/Problem_11

-- Problem (LaTeX):
/-
What is the degree measure of the acute angle formed by lines with slopes $2$ and $\frac{1}{3}$ ? $\textbf{(A)} ~30\qquad\textbf{(B)} ~37.5\qquad\textbf{(C)} ~45\qquad\textbf{(D)} ~52.5\qquad\textbf{(E)} ~60$
-/

-- Solution/Answer (LaTeX):
/-
Remind that $\text{slope}=\dfrac{\Delta y}{\Delta x}=\tan \theta$ where $\theta$ is the angle between the slope and $x$ -axis. $k_1=2=\tan \alpha$ , $k_2=\dfrac{1}{3}=\tan \beta$ . The angle formed by the two lines is $\alpha-\beta$ . $\tan(\alpha-\beta)=\dfrac{\tan\alpha-\tan\beta}{1+\tan\alpha\tan\beta}=\dfrac{2-1/3}{1+2\cdot 1/3}=1$ . Therefore, $\alpha-\beta=\boxed{\textbf{(C)} 45^\circ}$ . ~plasta
-/

import Mathlib.Tactic

theorem wiki_index_php_b3be3030ec : Prop := by
  sorry
