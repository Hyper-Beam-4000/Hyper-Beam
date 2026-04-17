-- 2023 AIME I Problems/Problem 15
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2023_AIME_I_Problems/Problem_15

-- Problem (LaTeX):
/-
Find the largest prime number $p<1000$ for which there exists a complex number $z$ satisfying the real and imaginary part of $z$ are both integers; $|z|=\sqrt{p},$ and there exists a triangle whose three side lengths are $p,$ the real part of $z^{3},$ and the imaginary part of $z^{3}.$
-/

-- Solution/Answer (LaTeX):
/-
Assume that $z=a+bi$ . Then, \[z^3=(a^3-3ab^2)+(3a^2b-b^3)i\] Note that by the Triangle Inequality, \[|(a^3-3ab^2)-(3a^2b-b^3)|<p\implies |a^3+b^3-3ab^2-3a^2b|<a^2+b^2\] Thus, we know \[|a+b||a^2+b^2-4ab|<a^2+b^2\] Without loss of generality, assume $a>b$ (as otherwise, consider $i^3\overline z=b+ai$ ). If $|a/b|\geq 4$ , then \[17b^2\geq a^2+b^2>|a+b||a^2+b^2-4ab|\geq |b-4b||16b^2-16b^2+b^2|=3b^3\] `Thus, this means $b\leq\frac{17}3$ or $b\leq 5$ . Also note that the roots of $x^2-4x+1$ are $2\pm\sqrt 3$ , so thus if $b\geq 6$ , \[2\sqrt 3b=(2(2-\sqrt 3)-4)b<a<4b\] Note that \[1000>p=a^2+b^2\geq 12b^2+b^2=13b^2\] so $b^2<81$ , and $b<9$ . If $b=8$ , then $16\sqrt 3\leq a\leq 32$ . Note that $\gcd(a,b)=1$ , and $a\not\equiv b\pmod 2$ , so $a=29$ or $31$ . However, then $5\mid a^2+b^2$ , absurd. If $b=7$ , by similar logic, we have that $14\sqrt 3 <a< 28$ , so $a=26$ . However, once again, $5\mid a^2+b^2$ . If $b=6$ , by the same logic, $12\sqrt3<a<24$ , so $a=23$ , where we run into the same problem. Thus $b\leq 5$ indeed. If $b=5$ , note that \[(a+5)(a^2+25-20a)<a^2+25\implies a<20\] We note that $p=5^2+18^2=349$ works. Thus, we just need to make sure that if $b\leq 4$ , $a\leq 18$ . But this is easy, as \[p>(a+b)(a^2+b^2-4ab)\geq (4+18)(4^2+18^2-4\cdot 4\cdot 18)>1000\] absurd. Thus, the answer is $\boxed{349}$ .
-/

import Mathlib.Tactic

theorem wiki_index_php_97af443052 : Prop := by
  sorry
