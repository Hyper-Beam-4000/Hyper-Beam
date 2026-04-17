-- 2024 AIME I Problems/Problem 13
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2024_AIME_I_Problems/Problem_13

-- Problem (LaTeX):
/-
Let $p$ be the least prime number for which there exists a positive integer $n$ such that $n^{4}+1$ is divisible by $p^{2}$ . Find the least positive integer $m$ such that $m^{4}+1$ is divisible by $p^{2}$ .
-/

-- Solution/Answer (LaTeX):
/-
If \(p=2\), then \(4\mid n^4+1\) for some integer \(n\). But \(\left(n^2\right)^2\equiv0\) or \(1\pmod4\), so it is impossible. Thus \(p\) is an odd prime. There are two ways to do the first part: First Method using FLT. For integer \(n\) such that \(p^2\mid n^4+1\), we have \(p\mid n^4+1\), hence \(p\nmid n^4-1\), but \(p\mid n^8-1\). By Fermat's Little Theorem , \(p\mid n^{p-1}-1\), so
\begin{equation*}
p\mid\gcd\left(n^{p-1}-1,n^8-1\right)=n^{\gcd(p-1,8)}-1.
\end{equation*}
Here, \(\gcd(p-1,8)\) mustn't be divide into \(4\) or otherwise \(p\mid n^{\gcd(p-1,8)}-1\mid n^4-1\), which contradicts. So \(\gcd(p-1,8)=8\), and so \(8\mid p-1\). The smallest such prime is clearly \(p=17=2\times8+1\). Second Method using orders. Notice that the order modulo $p^2$ of $n^4$ must be $8$ , so $8\mid\varphi(p^2)=p(p-1)$ . Hence $8\mid p-1$ , so $p\equiv 1\pmod{8}$ . The smallest such prime is $p=17$ . ~eevee9406 So we have to find the smallest positive integer \(m\) such that \(17\mid m^4+1\). We first find the remainder of \(m\) divided by \(17\) by doing
\begin{array}{|c|cccccccccccccccc|}
\hline
\vphantom{\tfrac11}x\bmod{17}&1&2&3&4&5&6&7&8&9&10&11&12&13&14&15&16\\\hline
\vphantom{\dfrac11}\left(x^4\right)+1\bmod{17}&2&0&14&2&14&5&5&0&0&5&5&14&2&14&0&2\\\hline
\end{array}
So \(m\equiv\pm2\), \(\pm8\pmod{17}\). If \(m\equiv2\pmod{17}\), let \(m=17k+2\), by the binomial theorem,
\begin{align*}
0&\equiv(17k+2)^4+1\equiv\mathrm {4\choose 1}(17k)(2)^3+2^4+1=17(1+32k)\pmod{17^2}\\[3pt]
\implies0&\equiv1+32k\equiv1-2k\pmod{17}.
\end{align*}
So the smallest possible \(k=9\), and \(m=155\). If \(m\equiv-2\pmod{17}\), let \(m=17k-2\), by the binomial theorem,
\begin{align*}
0&\equiv(17k-2)^4+1\equiv\mathrm {4\choose 1}(17k)(-2)^3+2^4+1=17(1-32k)\pmod{17^2}\\[3pt]
\implies0&\equiv1-32k\equiv1+2k\pmod{17}.
\end{align*}
So the smallest possible \(k=8\), and \(m=134\). If \(m\equiv8\pmod{17}\), let \(m=17k+8\), by the binomial theorem,
\begin{align*}
0&\equiv(17k+8)^4+1\equiv\mathrm {4\choose 1}(17k)(8)^3+8^4+1=17(241+2048k)\pmod{17^2}\\[3pt]
\implies0&\equiv241+2048k\equiv3+8k\pmod{17}.
\end{align*}
So the smallest possible \(k=6\), and \(m=110\). If \(m\equiv-8\pmod{17}\), let \(m=17k-8\), by the binomial theorem,
\begin{align*}
0&\equiv(17k-8)^4+1\equiv\mathrm {4\choose 1}(17k)(-8)^3+8^4+1=17(241-2048k)\pmod{17^2}\\[3pt]
\implies0&\equiv241-2048k\equiv3+9k\pmod{17}.
\end{align*}
So the smallest possible \(k=11\), and \(m=179\). In conclusion, the smallest possible \(m\) is \(\boxed{110}\). Solution by Quantum-Phantom
-/

import Mathlib.Tactic

theorem wiki_index_php_00a0e0953f : Prop := by
  sorry
