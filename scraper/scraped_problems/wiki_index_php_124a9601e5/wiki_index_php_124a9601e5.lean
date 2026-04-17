-- 2020 AMC 10B Problems/Problem 24
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2020_AMC_12B_Problems/Problem_21

-- Problem (LaTeX):
/-
How many positive integers $n$ satisfy \[\dfrac{n+1000}{70} = \lfloor \sqrt{n} \rfloor?\] (Recall that $\lfloor x\rfloor$ is the greatest integer not exceeding $x$ .) $\textbf{(A) } 2 \qquad\textbf{(B) } 4 \qquad\textbf{(C) } 6 \qquad\textbf{(D) } 30 \qquad\textbf{(E) } 32$
-/

-- Solution/Answer (LaTeX):
/-
We can first consider the equation without a floor function: \[\dfrac{n+1000}{70} = \sqrt{n}\] Multiplying both sides by 70 and then squaring: \[n^2 + 2000n + 1000000 = 4900n\] Moving all terms to the left: \[n^2 - 2900n + 1000000 = 0\] Now we can determine the factors: \[(n-400)(n-2500) = 0\] This means that for $n = 400$ and $n = 2500$ , the equation will hold without the floor function. Now we can simply check the multiples of 70 around 400 and 2500 in the original equation, which we abbreviate as $L=R$ . For $n = 330$ , $L=19$ but $18^2 < 330 < 19^2$ so $R=18$ For $n = 400$ , $L=20$ and $R=20$ For $n = 470$ , $L=21$ , $R=21$ For $n = 540$ , $L=22$ but $540 > 23^2$ so $R=23$ Now we move to $n = 2500$ For $n = 2430$ , $L=49$ and $49^2 < 2430 < 50^2$ so $R=49$ For $n = 2360$ , $L=48$ and $48^2 < 2360 < 49^2$ so $R=48$ For $n = 2290$ , $L=47$ and $47^2 < 2360 < 48^2$ so $R=47$ For $n = 2220$ , $L=46$ but $47^2 < 2220$ so $R=47$ For $n = 2500$ , $L=50$ and $R=50$ For $n = 2570$ , $L=51$ but $2570 < 51^2$ so $R=50$ Therefore we have 6 total solutions, $n = 400, 470, 2290, 2360, 2430, 2500 = \boxed{\textbf{(C) 6}}$
-/

import Mathlib.Tactic

theorem wiki_index_php_124a9601e5 : Prop := by
  sorry
