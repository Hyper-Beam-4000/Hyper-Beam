-- 2019 AIME II Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AIME_II_Problems/Problem_10

-- Problem (LaTeX):
/-
There is a unique angle $\theta$ between $0^{\circ}$ and $90^{\circ}$ such that for nonnegative integers $n$ , the value of $\tan{\left(2^{n}\theta\right)}$ is positive when $n$ is a multiple of $3$ , and negative otherwise. The degree measure of $\theta$ is $\tfrac{p}{q}$ , where $p$ and $q$ are relatively prime integers. Find $p+q$ .
-/

-- Solution/Answer (LaTeX):
/-
Note that if $\tan \theta$ is positive, then $\theta$ is in the first or third quadrant, so $0^{\circ} < \theta < 90^{\circ} \pmod{180^{\circ}}$ . Furthermore, the only way $\tan{\left(2^{n}\theta\right)}$ can be positive for all $n$ that are multiples of $3$ is when: \[2^0\theta \equiv 2^3\theta \equiv 2^6\theta \equiv ... \pmod{180^{\circ}}.\] (This is because if it isn't the same value, the terminal angle will gradually shift from the first quadrant into different quadrants, making the condition for positive tan untrue. This must also be true in order for $\theta$ to be unique.) This is the case if $2^3\theta \equiv 2^0\theta \pmod{180^{\circ}}$ , so $7\theta \equiv 0^{\circ} \pmod{180^{\circ}}$ . Therefore, recalling that $0^{\circ}<\theta<90^{\circ},$ the possible $\theta$ are: \[\frac{180}{7}^{\circ}, \frac{360}{7}^{\circ}, \frac{540}{7}^{\circ}.\] $\frac{180}{7}^{\circ}$ does not work since $\tan\left(2 \cdot \frac{180}{7}^{\circ}\right)$ is positive. $\frac{360}{7}^{\circ}$ does not work because $\tan\left(4 \cdot \frac{360}{7}^{\circ}\right)$ is positive. Thus, $\theta = \frac{540}{7}^{\circ}$ , and a quick check verifies that it does work. Our desired answer is $540 + 7 = \boxed{547}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_aff5e307ab : Prop := by
  sorry
