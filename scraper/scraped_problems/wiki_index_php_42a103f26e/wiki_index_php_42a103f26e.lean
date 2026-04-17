-- 2019 AIME I Problems/Problem 6
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_AIME_I_Problems/Problem_6

-- Problem (LaTeX):
/-
In convex quadrilateral $KLMN$ side $\overline{MN}$ is perpendicular to diagonal $\overline{KM}$ , side $\overline{KL}$ is perpendicular to diagonal $\overline{LN}$ , $MN = 65$ , and $KL = 28$ . The line through $L$ perpendicular to side $\overline{KN}$ intersects diagonal $\overline{KM}$ at $O$ with $KO = 8$ . Find $MO$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $\angle MKN=\alpha$ and $\angle LNK=\beta$ . Let $P$ be the project of $L$ onto line $NK$ . Note $\angle KLP=\beta$ . Then, $KP=28\sin\beta=8\cos\alpha$ .
Furthermore, $KN=\frac{65}{\sin\alpha}=\frac{28}{\sin\beta} \Rightarrow 65\sin\beta=28\sin\alpha$ . Dividing the equations gives \[\frac{65}{28}=\frac{28\sin\alpha}{8\cos\alpha}=\frac{7}{2}\tan\alpha\Rightarrow \tan\alpha=\frac{65}{98}\] Thus, $MK=\frac{MN}{\tan\alpha}=98$ , so $MO=MK-KO=\boxed{090}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_42a103f26e : Prop := by
  sorry
