-- 2024 AMC 12A Problems/Problem 25
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AMC_12A_Problems/Problem_25

-- Problem (LaTeX):
/-
A graph is $\textit{symmetric}$ about a line if the graph remains unchanged after reflection in that line. For how many quadruples of integers $(a,b,c,d)$ , where $|a|,|b|,|c|,|d|\le5$ and $c$ and $d$ are not both $0$ , is the graph of \[y=\frac{ax+b}{cx+d}\] symmetric about the line $y=x$ ? $\textbf{(A) }1282\qquad\textbf{(B) }1292\qquad\textbf{(C) }1310\qquad\textbf{(D) }1320\qquad\textbf{(E) }1330$
-/

-- Solution/Answer (LaTeX):
/-
Symmetric about the line $y=x$ implies that the inverse function $y^{-1}=y$ . Then we split the question into several cases to find the final answer. Case 1: $c=0$ Then $y=\frac{a}{d}x+\frac{b}{d}$ and $y^{-1}=\frac{d}{a}x-\frac{b}{a}$ .
Giving us $\frac{a}{d}=\frac{d}{a}$ and $\frac{b}{d}=-\frac{b}{a}$ Therefore, we obtain 2 subcases: $b\neq 0, a+d=0$ and $b=0, a^2=d^2$ Case 2: $c\neq 0$ Then $y^{-1}=\frac{b-dx}{cx-a}=\frac{(cx-a)(-\frac{d}{c})+b-\frac{ad}{c}}{cx-a}=-\frac{d}{c}+\frac{b-\frac{ad}{c}}{cx-a}$ And $y=\frac{(cx+d)(\frac{a}{c})+b-\frac{ad}{c}}{cx+d}=\frac{a}{c}+\frac{b-\frac{ad}{c}}{cx+d}$ So $\frac{a}{c}=-\frac{d}{c}$ , or $a=-d$ ( $c\neq 0$ ), and substitute that into $\frac{b-\frac{ad}{c}}{cx-a}=\frac{b-\frac{ad}{c}}{cx+d}$ gives us: $bc-ad\neq 0$ (Otherwise $y=\frac{a}{c}$ , $y^{-1}=-\frac{d}{c}=\frac{a}{c}$ , and is not symmetric about $y=x$ ) Therefore we get three cases: Case 1.1: $c= 0, b\neq 0, d\neq 0, a+d=0$ We have 10 choice of $b$ , 10 choice of $d$ and each choice of $d$ has one corresponding choice of $a$ . In total $10\times 10=100$ ways. Case 1.2: $c= 0, b = 0, d\neq 0, a^2=d^2$ We have 10 choice for $d$ ( $d\neq 0$ ), each choice of $d$ has 2 corresponding choice of $a$ , thus $10\times 2=20$ ways. Case 2: $c\neq 0, bc-ad\neq 0, a=-d$ $a=0$ : $10\times 10=100$ ways. $a=\pm 1$ : $(11\times 10-2)\times 2=216$ ways. $a=\pm 2$ : $(11\times 10-6)\times 2=208$ ways. $a=\pm 3$ : $(11\times 10-2)\times 2=216$ ways. $a=\pm 4$ : $(11\times 10-2)\times 2=216$ ways. $a=\pm 5$ : $(11\times 10-2)\times 2=216$ ways. In total $100+208+216\times 4= 1172$ ways. So the answer is $100+20+1172= \boxed{\textbf{(B) }1292}$ ~ERiccc
-/

import Mathlib.Tactic

theorem wiki_index_php_b7d538b40f : Prop := by
  sorry
