-- 2023 AIME I Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AIME_I_Problems/Problem_13

-- Problem (LaTeX):
/-
Each face of two noncongruent parallelepipeds is a rhombus whose diagonals have lengths $\sqrt{21}$ and $\sqrt{31}$ .
The ratio of the volume of the larger of the two polyhedra to the volume of the smaller is $\frac{m}{n}$ , where $m$ and $n$ are relatively prime positive integers. Find $m + n$ . A parallelepiped is a solid with six parallelogram faces
such as the one shown below. [asy] unitsize(2cm); pair o = (0, 0), u = (1, 0), v = 0.8*dir(40), w = dir(70); draw(o--u--(u+v)); draw(o--v--(u+v), dotted); draw(shift(w)*(o--u--(u+v)--v--cycle)); draw(o--w); draw(u--(u+w)); draw(v--(v+w), dotted); draw((u+v)--(u+v+w)); [/asy]
-/

-- Solution/Answer (LaTeX):
/-
Denote $\alpha = \tan^{-1} \frac{\sqrt{21}}{\sqrt{31}}$ .
Denote by $d$ the length of each side of a rhombus. Now, we put the solid to the 3-d coordinate space.
We put the bottom face on the $x-O-y$ plane.
For this bottom face, we put a vertex with an acute angle $2 \alpha$ at the origin, denoted as $O$ .
For two edges that are on the bottom face and meet at $O$ , we put one edge on the positive side of the $x$ -axis. The endpoint is denoted as $A$ . Hence, $A = \left( d , 0 , 0 \right)$ .
We put the other edge in the first quadrant of the $x-O-y$ plane. The endpoint is denoted as $B$ . Hence, $B = \left( d \cos 2 \alpha , d \sin 2 \alpha , 0 \right)$ . For the third edge that has one endpoint $O$ , we denote by $C$ its second endpoint.
We denote $C = \left( u , v , w \right)$ .
Without loss of generality, we set $w > 0$ .
Hence, \[ u^2 + v^2 + w^2 = d^2 . \hspace{1cm} (1) \] We have \begin{align*} \cos \angle AOC & = \frac{\overrightarrow{OA} \cdot \overrightarrow{OC}}{|OA| \cdot |OC|} \\ & = \frac{u}{d} , \hspace{1cm} (2) \end{align*} and \begin{align*} \cos \angle BOC & = \frac{\overrightarrow{OB} \cdot \overrightarrow{OC}}{|OB| \cdot |OC|} \\ & = \frac{u \cos 2 \alpha + v \sin 2 \alpha}{d} . \hspace{1cm} (3) \end{align*} Case 1: $\angle AOC = \angle BOC = 2 \alpha$ or $2 \left( 90^\circ - \alpha \right)$ . By solving (2) and (3), we get \begin{align*} u & = \pm d \cos 2 \alpha , \\ v & = \pm d \cos 2 \alpha \frac{1 - \cos 2 \alpha}{\sin 2 \alpha} \\ & = \pm d \cos 2 \alpha \tan \alpha . \end{align*} Plugging these into (1), we get \begin{align*} w & = d \sqrt{1 - \cos^2 2 \alpha - \cos^2 2 \alpha \tan^2 \alpha} \\ & = d \sqrt{\sin^2 2 \alpha - \cos^2 2 \alpha \tan^2 \alpha} . \hspace{1cm} (4) \end{align*} Case 2: $\angle AOC = 2 \alpha$ and $\angle BOC = 2 \left( 90^\circ - \alpha \right)$ , or $\angle BOC = 2 \alpha$ and $\angle AOC = 2 \left( 90^\circ - \alpha \right)$ . By solving (2) and (3), we get \begin{align*} u & = \pm d \cos 2 \alpha , \\ v & = \mp d \cos 2 \alpha \frac{1 + \cos 2 \alpha}{\sin 2 \alpha} \\ & = \mp d \cos 2 \alpha \cot \alpha . \end{align*} Plugging these into (1), we get \begin{align*} w & = d \sqrt{1 - \cos^2 2 \alpha - \cos^2 2 \alpha \cot^2 \alpha} \\ & = d \sqrt{\sin^2 2 \alpha - \cos^2 2 \alpha \cot^2 \alpha} . \hspace{1cm} (5) \end{align*} We notice that $(4) > (5)$ . Thus, (4) (resp. (5)) is the parallelepiped with a larger (resp. smaller) height. Therefore, the ratio of the volume of the larger parallelepiped to the smaller one is \begin{align*} \frac{(4)}{(5)} & = \frac{\sqrt{\sin^2 2 \alpha - \cos^2 2 \alpha \tan^2 \alpha}} {\sqrt{\sin^2 2 \alpha - \cos^2 2 \alpha \cot^2 \alpha}} \\ & = \sqrt{\frac{\tan^2 2 \alpha - \tan^2 \alpha}{\tan^2 2 \alpha - \cot^2 \alpha}} . \end{align*} Recall that $\tan \alpha = \frac{\sqrt{21}}{\sqrt{31}}$ .
Thus, $\tan 2 \alpha = \frac{2 \tan \alpha}{1 - \tan^2 \alpha} = \frac{\sqrt{21 \cdot 31}}{5}$ .
Plugging this into the equation above, we get \begin{align*} \frac{(4)}{(5)} & = \frac{63}{62}. \end{align*} Therefore, the answer is $63 + 62 = \boxed{\textbf{(125) }}$ . ~Steven Chen (Professor Chen Education Palace, www.professorchenedu.com)
-/

import Mathlib.Tactic

theorem wiki_index_php_68e69a86e0 : Prop := by
  sorry
