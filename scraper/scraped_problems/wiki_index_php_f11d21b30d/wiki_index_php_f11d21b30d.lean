-- 2021 AMC 12A Problems/Problem 10
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_10

-- Problem (LaTeX):
/-
Two right circular cones with vertices facing down as shown in the figure below contain the same amount of liquid. The radii of the tops of the liquid surfaces are $3$ cm and $6$ cm. Into each cone is dropped a spherical marble of radius $1$ cm, which sinks to the bottom and is completely submerged without spilling any liquid. What is the ratio of the rise of the liquid level in the narrow cone to the rise of the liquid level in the wide cone? [asy] size(350); defaultpen(linewidth(0.8)); real h1 = 10, r = 3.1, s=0.75; pair P = (r,h1), Q = (-r,h1), Pp = s * P, Qp = s * Q; path e = ellipse((0,h1),r,0.9), ep = ellipse((0,h1*s),r*s,0.9); draw(ellipse(origin,r*(s-0.1),0.8)); fill(ep,gray(0.8)); fill(origin--Pp--Qp--cycle,gray(0.8)); draw((-r,h1)--(0,0)--(r,h1)^^e); draw(subpath(ep,0,reltime(ep,0.5)),linetype("4 4")); draw(subpath(ep,reltime(ep,0.5),reltime(ep,1))); draw(Qp--(0,Qp.y),Arrows(size=8)); draw(origin--(0,12),linetype("4 4")); draw(origin--(r*(s-0.1),0)); label("$3$",(-0.9,h1*s),N,fontsize(10)); real h2 = 7.5, r = 6, s=0.6, d = 14; pair P = (d+r-0.05,h2-0.15), Q = (d-r+0.05,h2-0.15), Pp = s * P + (1-s)*(d,0), Qp = s * Q + (1-s)*(d,0); path e = ellipse((d,h2),r,1), ep = ellipse((d,h2*s+0.09),r*s,1); draw(ellipse((d,0),r*(s-0.1),0.8)); fill(ep,gray(0.8)); fill((d,0)--Pp--Qp--cycle,gray(0.8)); draw(P--(d,0)--Q^^e); draw(subpath(ep,0,reltime(ep,0.5)),linetype("4 4")); draw(subpath(ep,reltime(ep,0.5),reltime(ep,1))); draw(Qp--(d,Qp.y),Arrows(size=8)); draw((d,0)--(d,10),linetype("4 4")); draw((d,0)--(d+r*(s-0.1),0)); label("$6$",(d-r/4,h2*s-0.06),N,fontsize(10)); [/asy] $\textbf{(A) }1:1 \qquad \textbf{(B) }47:43 \qquad \textbf{(C) }2:1 \qquad \textbf{(D) }40:13 \qquad \textbf{(E) }4:1$
-/

-- Solution/Answer (LaTeX):
/-
Initial Scenario Let the heights of the narrow cone and the wide cone be $h_1$ and $h_2,$ respectively. We have the following table: \[\begin{array}{cccccc} & \textbf{Base Radius} & \textbf{Height} & & \textbf{Volume} & \\ [2ex] \textbf{Narrow Cone} & 3 & h_1 & & \frac13\pi(3)^2h_1=3\pi h_1 & \\ [2ex] \textbf{Wide Cone} & 6 & h_2 & & \hspace{2mm}\frac13\pi(6)^2h_2=12\pi h_2 & \end{array}\] Equating the volumes gives $3\pi h_1=12\pi h_2,$ which simplifies to $\frac{h_1}{h_2}=4.$ Furthermore, by similar triangles: For the narrow cone, the ratio of the base radius to the height is $\frac{3}{h_1},$ which always remains constant. For the wide cone, the ratio of the base radius to the height is $\frac{6}{h_2},$ which always remains constant. Two solutions follow from here:
-/

import Mathlib.Tactic

theorem wiki_index_php_f11d21b30d : Prop := by
  sorry
