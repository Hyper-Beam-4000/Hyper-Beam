-- 2024 AIME I Problems/Problem 7
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AIME_I_Problems/Problem_7

-- Problem (LaTeX):
/-
Find the largest possible real part of \[(75+117i)z+\frac{96+144i}{z}\] where $z$ is a complex number with $|z|=4$ . Here $i = \sqrt{-1}$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $z=4e^{i\theta}$ . Then the expression becomes \[(300+468i)e^{i\theta}+(24+36i)e^{-i\theta}\] The real part of this comes out to be $(300\cos \theta - 468 \sin \theta)+(24\cos \theta + 36 \sin \theta) = (324\cos \theta - 432 \sin \theta)$ . Using Cauchy-Schwarz to maximize this, \[(324\cos \theta - 432 \sin \theta)^2 \leq (\cos ^2 \theta+\sin ^2 \theta)(324^2+432^2) = (1)(324^2+432^2) = 540^2\] This value is attainable. Thus, the maximum is $\boxed{540}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_9c8d12dfa9 : Prop := by
  sorry
