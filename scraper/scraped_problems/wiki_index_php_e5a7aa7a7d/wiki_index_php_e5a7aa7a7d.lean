-- 2024 AMC 12A Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_10

-- Problem (LaTeX):
/-
Let $\alpha$ be the radian measure of the smallest angle in a $3{-}4{-}5$ right triangle. Let $\beta$ be the radian measure of the smallest angle in a $7{-}24{-}25$ right triangle. In terms of $\alpha$ , what is $\beta$ ? $\textbf{(A) }\frac{\alpha}{3}\qquad \textbf{(B) }\alpha - \frac{\pi}{8}\qquad \textbf{(C) }\frac{\pi}{2} - 2\alpha \qquad \textbf{(D) }\frac{\alpha}{2}\qquad \textbf{(E) }\pi - 4\alpha\qquad$
-/

-- Solution/Answer (LaTeX):
/-
We are given that \[\tan\alpha=\frac{3}{4} \text{ and } \tan\beta=\frac{7}{24}.\] We have \begin{align*} \tan(\alpha+\beta) &= \frac{\tan\alpha+\tan\beta}{1-\tan\alpha\tan\beta} \\ &= \frac{\frac{3}{4}+\frac{7}{24}}{1-\frac{3}{4} \cdot \frac{7}{24}} \\ &= \frac{4}{3}. \end{align*} It follows that \begin{align*} \alpha+\beta&=\tan^{-1}\left(\frac{4}{3}\right) \\ &=\frac{\pi}{2}-\tan^{-1}\left(\frac{3}{4}\right) \\ &=\frac{\pi}{2}-\alpha. \end{align*} Therefore, the answer is \[\beta=\boxed{\textbf{(C) }\frac{\pi}{2}-2\alpha}.\] ~lptoggled
-/

import Mathlib.Tactic

theorem wiki_index_php_e5a7aa7a7d : Prop := by
  sorry
