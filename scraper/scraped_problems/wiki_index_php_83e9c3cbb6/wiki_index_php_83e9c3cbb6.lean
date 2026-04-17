-- 2020 AMC 12B Problems/Problem 25
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_25

-- Problem (LaTeX):
/-
For each real number $a$ with $0 \leq a \leq 1$ , let numbers $x$ and $y$ be chosen independently at random from the intervals $[0, a]$ and $[0, 1]$ , respectively, and let $P(a)$ be the probability that \[\sin^2{(\pi x)} + \sin^2{(\pi y)} > 1\] What is the maximum value of $P(a)?$ $\textbf{(A)}\ \frac{7}{12} \qquad\textbf{(B)}\ 2 - \sqrt{2} \qquad\textbf{(C)}\ \frac{1+\sqrt{2}}{4} \qquad\textbf{(D)}\ \frac{\sqrt{5}-1}{2} \qquad\textbf{(E)}\ \frac{5}{8}$
-/

-- Solution/Answer (LaTeX):
/-
Let's start first by manipulating the given inequality. \[\sin^{2}{(\pi x)}+\sin^{2}{(\pi y)}>1\] \[\sin^{2}{(\pi x)}>1-\sin^{2}{(\pi y)}=\cos^{2}{(\pi y)}\] Let's consider the boundary cases: $\sin{(\pi x)}=\pm \cos{(\pi y)}$ . \[\sin{(\pi x)}=\pm \cos{(\pi y)}=\sin{(\tfrac 12 {\pi}\pm \pi y)}\] Solving the first case gives us \[y=\tfrac{1}{2}-x \quad \textrm{and} \quad y=x-\tfrac{1}{2}.\] Solving the second case gives us \[y=x+\tfrac{1}{2}\quad \textrm{and} \quad y=\tfrac{3}{2}-x.\] If we graph these equations in $[0,1]\times[0,1]$ , we get a rhombus shape. [asy] defaultpen(fontsize(9)+0.8); size(200); pen p=fontsize(10); pair A,B,C,D,A1,A2,B1,B2,C1,C2,D1,D2,I,L; A=MP("(0,0)",origin,down+left,p); B=MP("(1,0)",right,down+right,p); C=MP("(1,1)",right+up,up+right,p); D=MP("(0,1)",up,up+left,p); A1=MP("",extension(A,B,(0.5,0),(0,0.5)),2*down,p); dot(A1); A2=MP("",extension(A,D,(0.5,0),(0,0.5)),2*left,p); dot(A2); B1=MP("",extension(B,C,(0.5,0),(0,-0.5)),2*right,p); dot(B1); B2=MP("",extension(C,D,(0.5,1),(0,0.5)),2*up,p); dot(B2); real a=0.7; draw(A1--B1--B2--A2--cycle, gray+0.6); draw(a*right--a*right+up, royalblue); draw(A1--B2, royalblue+dashed); draw(A--B--C--D--A, black+1.2); dot("$(a,0)$",(a,0),down); dot("$(a,1)$",(a,1),up); [/asy] Testing points in each section tells us that the inside of the rhombus satisfies the inequality in the problem statement. From the region graph, notice that in order to maximize $P(a)$ , $a\geq\tfrac{1}{2}$ . We can solve the rest with geometric probability. Instead of maximizing $P(a)$ , we minimize $Q(a)=1-P(a)$ . $Q(a)$ consists of two squares (each broken into two triangles), one of area $\tfrac{1}{4}$ and another of area $(a-\tfrac 12)^2$ . To calculate $Q(a)$ , we divide this area by $a$ , so \[Q(a) = \frac{1}{a}\left(\frac{1}{4}+(a-\tfrac 12)^2\right) = \frac{1}{a}\left(\frac{1}{2}+a^2-a\right)= a+\frac 1{2a}-1.\] By AM-GM, $a+\frac{1}{2a}\geq 2\sqrt{\frac{a}{2a}}=\sqrt{2}$ , which we can achieve by setting $a=\frac{\sqrt{2}}{2}$ . Therefore, the maximum value of $P(a)$ is $1-\min(Q(a))$ , which is $1-(\sqrt{2}-1) =\boxed{\textbf{(B)}\ 2 - \sqrt{2}}$
-/

import Mathlib.Tactic

theorem wiki_index_php_83e9c3cbb6 : Prop := by
  sorry
