-- 2022 AIME I Problems/Problem 12
-- Source: AoPS Wiki
-- URL: https://artofproblemsolving.com/wiki/index.php?title=2022_AIME_I_Problems/Problem_12

-- Problem (LaTeX):
/-
For any finite set $X$ , let $| X |$ denote the number of elements in $X$ . Define \[S_n = \sum | A \cap B | ,\] where the sum is taken over all ordered pairs $(A, B)$ such that $A$ and $B$ are subsets of $\left\{ 1 , 2 , 3, \cdots , n \right\}$ with $|A| = |B|$ .
For example, $S_2 = 4$ because the sum is taken over the pairs of subsets \[(A, B) \in \left\{ (\emptyset, \emptyset) , ( \{1\} , \{1\} ), ( \{1\} , \{2\} ) , ( \{2\} , \{1\} ) , ( \{2\} , \{2\} ) , ( \{1 , 2\} , \{1 , 2\} ) \right\} ,\] giving $S_2 = 0 + 1 + 0 + 0 + 1 + 2 = 4$ .
Let $\frac{S_{2022}}{S_{2021}} = \frac{p}{q}$ , where $p$ and $q$ are relatively prime positive integers. Find the remainder when $p + q$ is divided by
1000.
-/

-- Solution/Answer (LaTeX):
/-
Let's try out for small values of $n$ to get a feel for the problem. When $n=1, S_n$ is obviously $1$ . The problem states that for $n=2, S_n$ is $4$ . Let's try it out for $n=3$ . Let's perform casework on the number of elements in $A, B$ . $\textbf{Case 1:} |A| = |B| = 1$ In this case, the only possible equivalencies will be if they are the exact same element, which happens $3$ times. $\textbf{Case 2:} |A| = |B| = 2$ In this case, if they share both elements, which happens $3$ times, we will get $2$ for each time, and if they share only one element, which also happens $6$ times, we will get $1$ for each time, for a total of $12$ for this case. $\textbf{Case 3:} |A| = |B| = 3$ In this case, the only possible scenario is that they both are the set $\{1,2,3\}$ , and we have $3$ for this case. In total, $S_3 = 18$ . Now notice, the number of intersections by each element $1 \ldots 3$ , or in general, $1 \ldots n$ is equal for each element because of symmetry - each element when $n=3$ adds $6$ to the answer. Notice that $6 = \binom{4}{2}$ - let's prove that $S_n = n \cdot \binom{2n-2}{n-1}$ (note that you can assume this and answer the problem if you're running short on time in the real test). Let's analyze the element $k$ - to find a general solution, we must count the number of these subsets that $k$ appears in. For $k$ to be in both $A$ and $B$ , we need both sets to contain $k$ and another subset of $1$ through $n$ not including $k$ . ( $A = \{k\} \cup A'| A' \subset \{1,2,\ldots,n\} \land A' \not \subset \{k\}$ and $B = \{k\} \cup B'| B' \subset \{1,2,\ldots,n\} \land B' \not \subset \{k\}$ ) For any $0\leq l \leq n-1$ that is the size of both $A'$ and $B'$ , the number of ways to choose the subsets $A'$ and $B'$ is $\binom{n-1}{l}$ for both subsets, so the total number of ways to choose the subsets are $\binom{n-1}{l}^2$ .
Now we sum this over all possible $l$ 's to find the total number of ways to form sets $A$ and $B$ that contain $k$ . This is equal to $\sum_{l=0}^{n-1} \binom{n-1}{l}^2$ . This is a simplification of Vandermonde's identity, which states that $\sum_{k=0}^{r} \binom{m}{k} \cdot \binom{n}{r-k} = \binom{m+n}{r}$ . Here, $m$ , $n$ and $r$ are all $n-1$ , so this sum is equal to $\binom{2n-2}{n-1}$ . Finally, since we are iterating over all $k$ 's for $n$ values of $k$ , we have $S_n = n \cdot \binom{2n-2}{n-1}$ , proving our claim. We now plug in $S_n$ to the expression we want to find. This turns out to be $\frac{2022 \cdot \binom{4042}{2021}}{2021 \cdot \binom{4040}{2020}}$ . Expanding produces $\frac{2022 \cdot 4042!\cdot 2020! \cdot 2020!}{2021 \cdot 4040! \cdot 2021! \cdot 2021!}$ . After cancellation, we have \[\frac{2022 \cdot 4042 \cdot 4041}{2021 \cdot 2021 \cdot 2021} \implies \frac{4044\cdot 4041}{2021 \cdot 2021}\] $4044$ and $4041$ don't have any common factors with $2021$ , so we're done with the simplification. We want to find $4044 \cdot 4041 + 2021^2 \pmod{1000} \equiv 44 \cdot 41 + 21^2 \pmod{1000} \equiv 1804+441 \pmod{1000} \equiv 2245 \pmod{1000} \equiv \boxed{245}$ ~KingRavi
~Edited by MY-2
-/

import Mathlib.Tactic

theorem wiki_index_php_7a928418ac : Prop := by
  sorry
