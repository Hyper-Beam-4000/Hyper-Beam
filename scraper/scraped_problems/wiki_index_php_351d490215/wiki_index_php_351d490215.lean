-- 2021 AIME II Problems/Problem 14
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AIME_II_Problems/Problem_14

-- Problem (LaTeX):
/-
Let $\Delta ABC$ be an acute triangle with circumcenter $O$ and centroid $G$ . Let $X$ be the intersection of the line tangent to the circumcircle of $\Delta ABC$ at $A$ and the line perpendicular to $GO$ at $G$ . Let $Y$ be the intersection of lines $XG$ and $BC$ . Given that the measures of $\angle ABC, \angle BCA,$ and $\angle XOY$ are in the ratio $13 : 2 : 17,$ the degree measure of $\angle BAC$ can be written as $\frac{m}{n},$ where $m$ and $n$ are relatively prime positive integers. Find $m+n$ .
-/

-- Solution/Answer (LaTeX):
/-
In this solution, all angle measures are in degrees. Let $M$ be the midpoint of $\overline{BC}$ so that $\overline{OM}\perp\overline{BC}$ and $A,G,M$ are collinear. Let $\angle ABC=13k,\angle BCA=2k$ and $\angle XOY=17k.$ Note that: Since $\angle OGX = \angle OAX = 90,$ quadrilateral $OGAX$ is cyclic by the Converse of the Inscribed Angle Theorem. It follows that $\angle OAG = \angle OXG,$ as they share the same intercepted arc $\widehat{OG}.$ Since $\angle OGY = \angle OMY = 90,$ quadrilateral $OGYM$ is cyclic by the supplementary opposite angles. It follows that $\angle OMG = \angle OYG,$ as they share the same intercepted arc $\widehat{OG}.$ It follows that $\angle OAG = \angle OXG,$ as they share the same intercepted arc $\widehat{OG}.$ It follows that $\angle OMG = \angle OYG,$ as they share the same intercepted arc $\widehat{OG}.$ Together, we conclude that $\triangle OAM \sim \triangle OXY$ by AA, so $\angle AOM = \angle XOY = 17k.$ Next, we express $\angle BAC$ in terms of $k.$ By angle addition, we have \begin{align*} \angle AOM &= \angle AOB + \angle BOM \\ &= 2\angle BCA + \frac12\angle BOC \hspace{10mm} &&\text{by Inscribed Angle Theorem and Perpendicular Bisector Property} \\ &= 2\angle BCA + \angle BAC. &&\text{by Inscribed Angle Theorem} \end{align*} Substituting back gives $17k=2(2k)+\angle BAC,$ from which $\angle BAC=13k.$ For the sum of the interior angles of $\triangle ABC,$ we get \begin{align*} \angle ABC + \angle BCA + \angle BAC &= 180 \\ 13k+2k+13k&=180 \\ 28k&=180 \\ k&=\frac{45}{7}. \end{align*} Finally, we obtain $\angle BAC=13k=\frac{585}{7},$ from which the answer is $585+7=\boxed{592}.$ ~Constance-variance ~MRENTHUSIASM
-/

import Mathlib.Tactic

theorem wiki_index_php_351d490215 : Prop := by
  sorry
