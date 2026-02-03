import sys
from pathlib import Path

project_root = Path(__file__).parent.parent
from metrics.math_metrics import (
    proof_embedding_similarity, proof_embedding_similarity_batch
)

question = r"\\mathbb{N}\n\nf:\\mathbb{N}\\to\\mathbb{N}\n\nf(1000)\n\n\\underbrace{f(f(\\ldots f}_{f(n)\\text{ times}}(n)\\ldots))=\\frac{n^2}{f(f(n))}"
solution = r"f^r(x)\n\nf^{r-1}(x)\n\nf^1(x)=f(x)\n\n\\hfill \\break \\hfill \\break\n\nf(p)=f(q)\n\nf^2(p)=f^2(q)\n\nf^{f(p)}(p)=f^{f(q)}(q)\n\n\\implies p^2=f^2(p)\\cdot f^{f(p)}(p)=f^2(q)\\cdot f^{f(q)}(q)=q^2\n\n\\implies p=\\pm q\n\n\\implies p=q\n\np,q&gt;0\n\nf^r(b)=a\n\nf(a)=a\n\nf^r(b)=a=f^r(a)\n\nf^2(m)=f^{f(m)}(m)=m\n\nf(m)=m\n\nf(m)=k\n\nf^2(m)=m\n\nf(k)=m\n\nf^2(k)=k\n\n\\newline f^2(k)\\cdot f^{f(k)}(k)=k^2\n\nk\\neq0\n\nf^{f(k)}(k)=k\n\n\\implies f^m(k)=k\n\n\\implies f^{gcd(m, 2)}(k)=k\n\n\\implies f(k)=k\n\nf^2(m)\\cdot f^{f(m)}(m)=m^2\n\n(1) f^2(m)=k&lt;m\n\n(2) f^{f(m)}(m)=k&lt;m\n\n(3) f^2(m)=m\n\nf^{f(m)}(m)=m\n\nf(1000)\n\nf(1000)=x, f(x)=1000\n\nf(k)=k\n\n1000\n\nf^2(n)\\cdot f^{f(n)}(n)=n\\cdot n=n^2\n\nf(n)\n\nf^2(n)=n",

prompt = r"""You are solving a competition mathematics problem (USAMO/IMO level). Provide a rigorous, step-by-step proof in the most concise format possible.

FORMATTING REQUIREMENTS:
- Each logical step must be on a separate line
- Use LaTeX notation for all mathematical expressions
- Do NOT include explanations, commentary, or "we have" / "note that" phrases
- Do NOT include the word "solution" or any headers
- Just state the mathematical facts and logical deductions
- Use standard competition notation:
  * \sim for similarity
  * \measuredangle or \angle for angles
  * \cap for intersection
  * \cdot for multiplication
  * \overline{XY} for line segments
  * \square to mark the end of a proof section
- Be extremely terse - each line should be a single mathematical statement or equation
- Present steps in logical order leading to the conclusion

EXAMPLE FORMAT:
PE \cap DC = M

AP' \cdot AB = AD^2

BP' \cdot AB = CD^2

P = P'

ADP \sim ABD

BCP \sim BAC

\measuredangle APD = \measuredangle BDA = \measuredangle BCA = \measuredangle CPB

\square

Now solve the following problem in this exact format:

\mathbb{N}

f:\mathbb{N}\to\mathbb{N}

f(1000)

\underbrace{f(f(\ldots f}_{f(n)\text{ times}}(n)\ldots))=\frac{n^2}{f(f(n))}"""


gemini_pred = r"""f(n) = n \text{ satisfies the given equation:}

\underbrace{f(f(\ldots f}_{n\text{ times}}(n)\ldots)) = f^n(n) = n

\frac{n^2}{f(f(n))} = \frac{n^2}{n} = n

\text{We prove } f(n)=n \text{ is the unique solution:}

\text{Let } f(n) = f(m) \implies f^2(n) = f^2(m)

f^{f(n)}(n) = \frac{n^2}{f^2(n)} \implies f^{f(n)}(n) f^2(n) = n^2

f^{f(m)}(m) f^2(m) = m^2 \implies f^{f(m)}(m) f^2(m) = m^2

f(n)=f(m)=k \implies f^k(n) f(k) = n^2 \text{ and } f^k(m) f(k) = m^2

\frac{n^2}{m^2} = \frac{f^k(n)}{f^k(m)} = 1 \implies n=m \implies f \text{ is injective}

f(f(n)) \mid n^2

n=1 \implies f(f(1)) \mid 1 \implies f(f(1))=1

f(f(1))=1 \text{ and } f \text{ injective } \implies f(1)=1

\text{For prime } p, f(f(p)) \mid p^2 \implies f(f(p)) \in {1, p, p^2}

f(f(p)) \neq 1 \text{ (since } p \neq 1)

f(f(p)) = p^2 \implies f^{p^2}(p) = \frac{p^2}{p^2} = 1 \implies p=1 \text{ (contradiction)}

\therefore f(f(p)) = p \implies f^2(p) = p

f^{f(p)}(p) = \frac{p^2}{p} = p \implies f^{f(p)}(p) = p

\text{Let } f(p) = k \implies f(k) = p

f^k(p) = p \text{ and } f^2(p) = p

p=2 \implies k \in {2} \implies f(2)=2

p \text{ odd } \implies k=p \implies f(p)=p

f(p)=p \text{ for all primes } p

f(n)=n \text{ for all } n \in \mathbb{N}

f(1000) = 1000

\square"""

gpt_pred = r"""\underbrace{f(f(\ldots f}_{f(n)\text{ times}}(n)\ldots))\cdot f(f(n))=n^2
f(a)=f(b)\Rightarrow f^{f(a)}(a)=f^{f(b)}(b)=f^{f(a)-1}(f(a))
f(a)=f(b)\Rightarrow a^2=f^{f(a)}(a)\cdot f(f(a))=f^{f(b)}(b)\cdot f(f(b))=b^2
f(a)=f(b)\Rightarrow a=b
f\ \text{injective}
n=1:\ f^{f(1)}(1)=1/f(f(1))\in\mathbb{N}\Rightarrow f(f(1))=1
k=f(1)\Rightarrow f^{f(k)}(k)=f^{1}(k)=f(k)=1=k^2/f(f(k))=k^2/f(1)=k
f(k)=1\Rightarrow 1=k
f(1)=1
\text{Assume }m\text{ minimal with }f(m)\ne m
a=f(m)
a<m\Rightarrow f(a)=a
f^{a}(m)=m^2/a
f^{a-1}(f(m))=f^{a-1}(a)=a
f^{a}(m)=f^{a-1}(f(m))=a
a=m^2/a
a^2=m^2
a=m
\text{Contradiction}
a>m\Rightarrow f(a)\ge a>m
f^{a}(m)\cdot f(a)=m^2
f^{a}(m)\ge f(a)>m
\text{Contradiction}
f(m)=m\ \forall m\in\mathbb{N}
f(1000)=1000
\square"""

def test_gemini_3_Pro():
    predicted_proof = gemini_pred
    expected_proof = solution
    similarity = proof_embedding_similarity(predicted_proof, expected_proof)
    print(similarity)

def test_gpt_5_o1():
    predicted_proof = gpt_pred
    expected_proof = solution
    similarity = proof_embedding_similarity(predicted_proof, expected_proof)
    print(similarity)