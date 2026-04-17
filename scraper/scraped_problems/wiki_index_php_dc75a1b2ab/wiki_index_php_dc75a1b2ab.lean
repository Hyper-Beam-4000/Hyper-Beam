-- 2022 AIME I Problems/Problem 5
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_I_Problems/Problem_5

-- Problem (LaTeX):
/-
A straight river that is $264$ meters wide flows from west to east at a rate of $14$ meters per minute. Melanie and Sherry sit on the south bank of the river with Melanie a distance of $D$ meters downstream from Sherry. Relative to the water, Melanie swims at $80$ meters per minute, and Sherry swims at $60$ meters per minute. At the same time, Melanie and Sherry begin swimming in straight lines to a point on the north bank of the river that is equidistant from their starting positions. The two women arrive at this point simultaneously. Find $D$ .
-/

-- Solution/Answer (LaTeX):
/-
Define $m$ as the number of minutes they swim for. Let their meeting point be $A$ . Melanie is swimming against the current, so she must aim upstream from point $A$ , to compensate for this; in particular, since she is swimming for $m$ minutes, the current will push her $14m$ meters downstream in that time, so she must aim for a point $B$ that is $14m$ meters upstream from point $A$ . Similarly, Sherry is swimming downstream for $m$ minutes, so she must also aim at point $B$ to compensate for the flow of the current. If Melanie and Sherry were to both aim at point $B$ in a currentless river with the same dimensions, they would still both meet at that point simultaneously. Since there is no current in this scenario, the distances that Melanie and Sherry travel, respectively, are $80m$ and $60m$ meters. We can draw out this new scenario, with the dimensions that we have: [asy] unitsize(0.02cm); draw((0,0)--(0,264)--(550,264)--(550,0)--cycle); pair B = (198,264); dot(B^^(0,0)^^(550,0),linewidth(5)); draw((0,0)--B,dashed); draw((550,0)--B,dashed); label("$60m$", (0,0)--B, E); label("$80m$", (550,0)--B, W); label("$264$", (0,0)--(0,264), W); label("$\frac{D}{2} - 14m$", (0,264)--B, N); label("$\frac{D}{2} + 14m$", B--(550,264), N); label("$D$", (0,0)--(550,0), S); label("$B$", B, N); label("Downstream", (350,325), E); label("Upstream", (200,325), W); draw((225,325)--(325,325), Arrows); [/asy] (While it is indeed true that the triangle above with side lengths $60m$ , $80m$ and $D$ is a right triangle, we do not know this yet, so we cannot assume this based on the diagram.) By the Pythagorean Theorem, we have \begin{align*} 264^{2} + \left( \frac{D}{2} - 14m \right) ^{2} &= 3600m^{2} \\ 264^{2} + \left( \frac{D}{2} + 14m \right) ^{2} &= 6400m^{2}. \end{align*} Subtracting the first equation from the second gives us $28Dm = 2800m^{2}$ , so $D = 100m$ . Substituting this into our first equation, we have that \begin{align*}264^{2} + 36^{2} m^{2} &= 60^{2}m^{2} \\ 264^{2} &= 96 \cdot 24 \cdot m^{2} \\ 11^{2} &= 4 \cdot m^{2} \\ m &= \frac{11}{2}. \end{align*} So $D = 100m = \boxed{550}$ . ~ihatemath123
-/

import Mathlib.Tactic

theorem wiki_index_php_dc75a1b2ab : Prop := by
  sorry
