-- 2019 USAMO Problems/Problem 1
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2019_USAMO_Problems/Problem_1

-- Problem (LaTeX):
/-
Let $\mathbb{N}$ be the set of positive integers. A function $f:\mathbb{N}\to\mathbb{N}$ satisfies the equation \[\underbrace{f(f(\ldots f}_{f(n)\text{ times}}(n)\ldots))=\frac{n^2}{f(f(n))}\] for all positive integers $n$ . Given this information, determine all possible values of $f(1000)$ .
-/

-- Solution/Answer (LaTeX):
/-
Let $f^r(x)$ denote the result when $f$ is applied to $f^{r-1}(x)$ , where $f^1(x)=f(x)$ . $\hfill \break \hfill \break$ If $f(p)=f(q)$ , then $f^2(p)=f^2(q)$ and $f^{f(p)}(p)=f^{f(q)}(q)$ $\implies p^2=f^2(p)\cdot f^{f(p)}(p)=f^2(q)\cdot f^{f(q)}(q)=q^2$ $\implies p=\pm q$ $\implies p=q$ since $p,q>0$ . Therefore, $f$ is injective. It follows that $f^r$ is also injective. Lemma 1: If $f^r(b)=a$ and $f(a)=a$ , then $b=a$ . Proof: $f^r(b)=a=f^r(a)$ which implies $b=a$ by injectivity of $f^r$ . Lemma 2: If $f^2(m)=f^{f(m)}(m)=m$ , and $m$ is odd, then $f(m)=m$ . Proof: Let $f(m)=k$ . Since $f^2(m)=m$ , $f(k)=m$ . So, $f^2(k)=k$ . $\newline f^2(k)\cdot f^{f(k)}(k)=k^2$ . Since $k\neq0$ , $f^{f(k)}(k)=k$ $\implies f^m(k)=k$ $\implies f^{gcd(m, 2)}(k)=k$ $\implies f(k)=k$ This proves Lemma 2. I claim that $f(m)=m$ for all odd $m$ . Otherwise, let $m$ be the least counterexample. Since $f^2(m)\cdot f^{f(m)}(m)=m^2$ , either $(1) f^2(m)=k<m$ , contradicted by Lemma 1 since $k$ is odd and $f^2(k)=k$ . $(2) f^{f(m)}(m)=k<m$ , also contradicted by Lemma 1 by similar logic. $(3) f^2(m)=m$ and $f^{f(m)}(m)=m$ , which implies that $f(m)=m$ by Lemma 2.
This proves the claim. By injectivity, $f(1000)$ is not odd.
I will prove that $f(1000)$ can be any even number, $x$ . Let $f(1000)=x, f(x)=1000$ , and $f(k)=k$ for all other $k$ . If $n$ is equal to neither $1000$ nor $x$ , then $f^2(n)\cdot f^{f(n)}(n)=n\cdot n=n^2$ . This satisfies the given property. If $n$ is equal to $1000$ or $x$ , then $f^2(n)\cdot f^{f(n)}(n)=n\cdot n=n^2$ since $f(n)$ is even and $f^2(n)=n$ . This satisfies the given property.
-/

import Mathlib.Tactic

theorem wiki_index_php_a0e177557e : Prop := by
  -- TODO: translate LaTeX statement into Lean and complete proof
  sorry
