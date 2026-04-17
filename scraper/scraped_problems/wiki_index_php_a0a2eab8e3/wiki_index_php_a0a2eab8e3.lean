-- 2017 AIME I Problems/Problem 8
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2017_AIME_I_Problems/Problem_8

-- Problem (LaTeX):
/-
Two real numbers $a$ and $b$ are chosen independently and uniformly at random from the interval $(0, 75)$ . Let $O$ and $P$ be two points on the plane with $OP = 200$ . Let $Q$ and $R$ be on the same side of line $OP$ such that the degree measures of $\angle POQ$ and $\angle POR$ are $a$ and $b$ respectively, and $\angle OQP$ and $\angle ORP$ are both right angles. The probability that $QR \leq 100$ is equal to $\frac{m}{n}$ , where $m$ and $n$ are relatively prime positive integers. Find $m + n$ .
-/

-- Solution/Answer (LaTeX):
/-
Noting that $\angle OQP$ and $\angle ORP$ are right angles, we realize that we can draw a semicircle with diameter $\overline{OP}$ and points $Q$ and $R$ on the semicircle. Since the radius of the semicircle is $100$ , if $\overline{QR} \leq 100$ , then $\overarc{QR}$ must be less than or equal to $60^{\circ}$ . This simplifies the problem greatly. Since the degree measure of an angle on a circle is simply half the degree measure of its subtended arc, the problem is simply asking: Given $a, b$ such that $0<a, b<75$ , what is the probability that $|a-b| \leq 30$ ?
Through simple geometric probability, we get that $P = \frac{16}{25}$ . The answer is $16+25=\boxed{041}$ ~IYN~
Note: The Geometric probability can be easily be found through graphing on the x-y plane.
-/

import Mathlib.Tactic

theorem wiki_index_php_a0a2eab8e3 : Prop := by
  sorry
