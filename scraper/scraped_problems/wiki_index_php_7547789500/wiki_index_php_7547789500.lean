-- 2021 AMC 12A Problems/Problem 16
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2021_AMC_12A_Problems/Problem_16

-- Problem (LaTeX):
/-
In the following list of numbers, the integer $n$ appears $n$ times in the list for $1 \leq n \leq 200$ . \[1, 2, 2, 3, 3, 3, 4, 4, 4, 4, \ldots, 200, 200, \ldots , 200\] What is the median of the numbers in this list? $\textbf{(A)} ~100.5 \qquad\textbf{(B)} ~134 \qquad\textbf{(C)} ~142 \qquad\textbf{(D)} ~150.5 \qquad\textbf{(E)} ~167$
-/

-- Solution/Answer (LaTeX):
/-
There are $1+2+..+199+200=\frac{(200)(201)}{2}=20100$ numbers in total. Let the median be $k$ . We want to find the median $k$ such that \[\frac{k(k+1)}{2}=20100/2,\] or \[k(k+1)=20100.\] Note that $\sqrt{20100} \approx 142$ . Plugging this value in as $k$ gives \[\frac{1}{2}(142)(143)=10153.\] $10153-142<10050$ , so $142$ is the $152$ nd and $153$ rd numbers, and hence, our desired answer. $\fbox{(C) 142}$ . Note that we can derive $\sqrt{20100} \approx 142$ through the formula \[\sqrt{n} = \sqrt{a+b} \approx \sqrt{a} + \frac{b}{2\sqrt{a} + 1},\] where $a$ is a perfect square less than or equal to $n$ . We set $a$ to $19600$ , so $\sqrt{a} = 140$ , and $b = 500$ . We then have $n \approx 140 + \frac{500}{2(140)+1} \approx 142$ . ~approximation by ciceronii Note by Fasolinka (use answer choices): Once you know that the answer is in the 140s range (200,000 is around 14^2 times 10^2) by the approximation, it is highly improbable for the answer to be anything but C.
-/

import Mathlib.Tactic

theorem wiki_index_php_7547789500 : Prop := by
  sorry
