-- 2018 AIME I Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2018_AIME_I_Problems/Problem_6

-- Problem (LaTeX):
/-
Let $N$ be the number of complex numbers $z$ with the properties that $|z|=1$ and $z^{6!}-z^{5!}$ is a real number. Find the remainder when $N$ is divided by $1000$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $a=z^{120}$ . This simplifies the problem constraint to $a^6-a \in \mathbb{R}$ . This is true if $\text{Im}(a^6)=\text{Im}(a)$ . Let $\theta$ be the angle $a$ makes with the positive x-axis. Note that there is exactly one $a$ for each angle $0\le\theta<2\pi$ . We are given $\sin\theta = \sin{6\theta}$ . Note that $\sin \theta = \sin (\pi - \theta)$ and $\sin \theta = \sin (\theta + 2\pi)$ . We can use these facts to create two types of solutions: \[\sin \theta = \sin ((2m + 1)\pi - \theta)\] which implies that $(2m+1)\pi-\theta = 6\theta$ and reduces to $\frac{(2m + 1)\pi}{7} = \theta$ . There are 7 solutions for this. \[\sin \theta = \sin (2n\pi + \theta)\] which implies that $2n\pi+\theta=6\theta$ and reduces to $\frac{2n\pi}{5} = \theta$ . There are 5 solutions for this, totaling 12 values of $a$ . For each of these solutions for $a$ , there are necessarily $120$ solutions for $z$ . Thus, there are $12\cdot 120=1440$ solutions for $z$ , yielding an answer of $\boxed{440}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_541ea9bbdf : Prop := by
  sorry
