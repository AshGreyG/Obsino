---
tags:
  - computer-science
  - algorithm
book: Introduction to Algorithm
date: 2025-12-01
---

## 1 Maximum-subarray Problem

+ [o] Problem: consider an array $A[0..n - 1]$ whose elements may be negative, find
  its subarray $A[p..q]$ to maximize $\sum_{i = p}^q A[i]$. And you cannot use
  $O(n ^ 2)$ methods.

  + Divide and conquer method:
    + Principle: Suppose we want to find a maximum subarray of the subarray
      $A[\text{low}..\text{high}]$, divide-and-conquer suggests that we divide
      the subarray into two subarrays of as equal size as possible. We can find
      the midpoint $\text{mid}$ and consider the subarrays
      $A[\text{low}..\text{mid}]$ and $A[\text{mid} + 1..\text{high}]$.
    + Entirely in the subarray $A[\text{low}..\text{mid}]$, with
      $\text{low} \le i \le j \le \text{mid}$;
    + Entirely in the subarray $A[\text{mid} + 1..\text{high}]$, with
      $\text{mid} \le i \le j \le \text{high}$;
    + **Crossing the midpoint**, with
      $\text{low} \le i \le \text{mid} < j \le \text{high}$

      ``` python
      def find_max_crossing_subarray(
          array : List[int],
          low : int,
          mid : int,
          high : int
      ) -> Tuple[int, int, int] :
          left_sum = -inf
          left_max = 0
          right_sum = -inf
          right_max = 0

          temp_sum = 0
          for i in range(mid, low - 1, -1) :
              temp_sum += array[i]
              if temp_sum > left_sum :
                  left_sum = temp_sum
                  left_max = i

          temp_sum = 0
          for i in range(mid + 1, high + 1) :
              temp_sum += array[i]
              if temp_sum > right_sum :
                  right_sum = temp_sum
                  right_max = i

          return (left_max, right_max, left_sum + right_sum)
      ```

      this method is a $\Theta(n)$ procedure.
      Here $n = \text{high} - \text{low} + 1$.
    + Because the maximum subarray must appear at the left or at the right or
      crossing the midpoint. We can use `find_max_crossing_subarray` to calculate
      **candidate** crossing maximum subarray. The left and the right candidate
      maximum subarray can be calculated recursively:

      ``` python
      def find_maximum_subarray(
          array : List[int],
          low : int,
          high : int
      ) -> Tuple[int, int, int] :
          if high == low :
              return (low, high, array[low])
          else :
              mid = floor((low + high) / 2)
              left_low, left_high, left_sum \
                  = find_maximum_subarray(array, low, mid)
              right_low, right_high, right_sum \
                  = find_maximum_subarray(array, mid + 1, high)
              cross_low, cross_high, cross_sum \
                  = find_max_crossing_subarray(array, low, mid, high)

              if left_sum >= right_sum and left_sum >= cross_sum :
                  return (left_low, left_high, left_sum)
              elif right_sum >= left_sum and right_sum >= cross_sum :
                  return (right_low, right_high, right_sum)
              else :
                  return (cross_low, cross_high, cross_sum)
      ```

    + We make the simplified assumptions that the original problem size is the
      power of $2$ so that all subproblem sizes are integers. We denote $T(n)$
      the running time of `find_maximum_subarray`.

      Because we spend $T(n / 2)$ time solving the subproblem and there are two
      subproblems, so for the recursive case:

      $$
      \begin{aligned}
        T(n) & = 2 T\left(\frac{n}{2}\right) + \Theta(n) + \Theta(1) + \Theta(1) \\
          & = 2 T\left(\frac{n}{2}\right) + \Theta(n)
      \end{aligned}
      $$

## 2 Substitution method

+ [o] Principle is guess
+ [o] Guess for merge sort and divide-and-conquer method of maximum subarray:
  + Guess $T(n) = O(n\log n)$
  + Using substitution method:

    $$
    \begin{aligned}
      T(n) & \le 2\left(c \left\lfloor\frac{n}{2}\right\rfloor
        \log \left\lfloor\frac{n}{2}\right\rfloor \right) + n \\
        & \le cn \log\left\lfloor\frac{n}{2}\right\rfloor + n \\
        & \le cn (\log n - \log 2) + n \\
        & = cn\log n + (1 - c\log 2) n \\
        & \le cn\log n
    \end{aligned}
    $$

    holds for $c \ge 1$

## 3 Recursion-tree method

+ [o] In a **recursion tree** each node represents the cost of a single subproblem
  somewhere in the set of recursive function invocations.
  + [o] Example 1: $T(n) = 3T(\lfloor n / 4\rfloor) + \Theta(n^2)$
    + The recursion tree has $\log_4 n + 1$ levels, last level consisting
      $3^{\log_4 n} = 3^{\log_3 n / \log_3 4} = (3^{\log_3 n})^{1/\log_3 4}=n^{\log_4 3}$ operations $T(1)$, which costs time of complexity
      $\Theta(n^{\log_4 3})$:

      $$
      \begin{aligned}
        T(n) & = cn^2 + \frac{3}{16}cn^2 + \left(\frac{3}{16}\right)^2cn^2 +
          \cdots + \left(\frac{3}{16}\right)^{\log_4 n - 1}cn^2
          + \Theta(n^{\log_4 3}) \\
          & = \sum_{i = 0}^{\log_4 n - 1}\left(\frac{3}{16}\right)^icn^2
          + \Theta(n^{\log_4 3}) \\
          & = \frac{(3/16)^{\log_4 n} - 1}{(3/16) - 1}cn^2
          + \Theta(n^{\log_4 3})
      \end{aligned}
      $$

      Notice that 

      $$
        \lim_{n\to+\infty} \frac{16}{13}\left(1-\left(\frac{3}{16}\right)
          ^{\log_4 n}\right)cn^2 \bigg / n^2 = \frac{16}{13}c
      $$

      Hence we have $T(n) = O(n^2)$
  + [o] Example 2: $T(n) = T(n/3) + T(2n/3) + \Theta(n)$
    + The recursion tree has $\log_{3/2}n$ levels, each level costs $cn$ time, so
      total time is $\Theta(n\log_{3/2}n)$.

## 4 Master theorem method

+ [o] Master method describes the running time of an algorithm's recurrences of
  the form

  $$
    T(n) = a T\left(\frac{n}{b}\right) + f(n)
  $$

    + This describes the running time of an algorithm that divides a problem of
      size $n$ into $a$ subproblems and each of size $n/b$, where $a$ and $b$ are
      positive constants. The function $f(n)$ encompasses the cost of dividing the
      problem and combining the results of the subproblems.

+ [o] Master theorem:
  + Let $a \ge 1$ and $b \ge 1$ be constants, let $f(n)$ be a function and let
    $T(n)$ be defined on the nonnegative integers by the recurrence above, where
    we interpret $n/b$ to denote $\lfloor n/b \rfloor$ and 
    $\lceil n/b \rceil$. Then $T(n)$ has the following asymptotic bounds:

    1. If $f(n) = O(n^{\log_b a - \epsilon})$ for some constant $\epsilon > 0$,
      then $T(n) = \Theta(n^{\log_b a})$;
    2. If $f(n) = \Theta(n^{\log_b a})$, then $T(n) = \Theta(n^{\log_b a}\log n)$
    3. If $f(n) = \Omega(n^{\log_b a + \epsilon})$ for some constant $\epsilon > 0$
      and if $a f(n/b) \le c f(n)$ for some constant $c < 1$ and all sufficiently
      large $n$, then $T(n) = f(n)$

  + Important example: $T(n) = 2 T(n / 2) + n\log n$. We have $a=2$ and $b=2$,
    $f(n) = n\log n$. The problem is that $f$ is not **polynomially** larger than
    $n$. The ratio $f/n^{\log_b a} = \log n$ is asymptotically less than
    $n^\epsilon$ for any positive constant $\epsilon > 0$. Actually the time
    complexity is $\Theta(n \log^2 n)$.

+ [o] Proof of master theorem: This proof appears in two parts. The first part
  analyzes the master recurrence under the simplifying assumption that $T(n)$ is
  defined only on exact power of $b$ like $n = 1,b,b^2,\cdots$. The second part
  shows how to extend the analysis to all positive integers $n$.
  + Part 1: proof of exact powers
    1. Lemma 1:

      > Let $a \ge 1$ and $b > 1$ be constants, and let $f(n)$ be a nonnegative
      > function defined on exact power of $b$. Define $T(n)$ on exact power of $b$
      > by the recurrence
      >
      > $$
      > T(n) = 
      > \begin{cases}
      >   \Theta(1) & \text{if} \space n = 1 \\[10pt]
      >   \displaystyle{a T\left(\frac{n}{b}\right)} + f(n) & \text{if} \space
      >     n = b^i
      > \end{cases}
      > $$
      >
      > where $i$ is a positive integer, then
      >
      > $$
      >   T(n) = \Theta(n^{\log_b a}) + \sum_{j=0}^{\log_b n - 1} a^i
      >     f(n/b^j)
      > $$
  
      *Proof :* The root of this recursion tree has $f(n)$ cost, and it has $a$
      children, each with cost $f(n/b)$, and $i$ level has $a^i$ nodes, each has
      $f(n/b^i)$ cost
  
      <div style="display: flex; justify-content: space-between">
        <img
          src="_assets/image/algo-clrs-01-recursion-tree.png"
        />
      </div>

    2. Lemma 2

      > Let $a \ge 1$ and $b > 1$ be constants, and let $f(n)$ be a nonnegative
      > function defined on exact powers of $b$. A function $g(n)$ defined over
      > exact powers of $b$ by:
      >
      > $$
      >   g(n) = \sum_{j=0}^{\log_b n - 1} a^jf(n/b^j)
      > $$
      >
      > has the following asymptotic bounds for exact power of $b$ :
      >  1. If $f(n) = O(n^{\log_b a - \epsilon})$ for some constant $\epsilon > 0$
      >    then $g(n) = O(n^{\log_b a})$;
      >  2. If $f(n) = \Theta(n^{\log_b a})$, then $g(n) = \Theta(n^{\log_b a}\log n)$;
      >  3. If $f(n) = \Omega(n^{\log_b a + \epsilon})$ for some constant
      >    $\epsilon > 0$ and $af(n/b) \le cf(n)$ for some constant $c < 1$ and
      >    for all sufficiently large $n$ then $g(n) = \Theta(f(n))$.

      *Proof :*
      1. For case 1, we have $f(n) = O(n^{\log_b a - \epsilon})$, which implies
        that $f(n/b^j) = O((n / b^j)^{\log_b a - \epsilon})$, so let $g(n) = O(k(n))$ then

      $$
      \begin{aligned}
        k(n) & = \sum_{j = 0}^{\log_b n - 1} a^j
          \left(\frac{n}{b^j}\right)^{\log_b a - \epsilon} \\
          & = n^{\log_b a - \epsilon}\sum_{j=0}^{\log_b n - 1}
            a^j b^{-j(\log_b a - \epsilon)} \\
          & = n^{\log_b a - \epsilon}\sum_{j=0}^{\log_b n - 1}
            \left(\frac{ab^\epsilon}{b^{\log_b a}}\right)^j \\
          & = n^{\log_b a - \epsilon}\sum_{j=0}^{\log_b n - 1}
            (b^\epsilon)^j \\
          & = n^{\log_b a - \epsilon}
            \frac{(b^\epsilon)^{\log_b n} - 1}{b^\epsilon - 1} \\
          & = n^{\log_b a - \epsilon}
            \frac{n^\epsilon - 1}{b^\epsilon - 1} \\
          & = \frac{n^{\log_b a}}{b^\epsilon - 1} - 
            \frac{n^{\log_b a - \epsilon}}{b^\epsilon - 1}
      \end{aligned}
      $$

      hence we have $g(n) = O(n^{\log_b a})$

      2. For case 2, we have $f(n) = \Theta(n^{\log_b a})$, which implies that
        $f(n / b^j) = \Theta((n/b^j)^{\log_b a})$, so let $g(n)=\Theta(k(n))$ then

      $$
      \begin{aligned}
        k(n) & = \sum_{j=0}^{\log_b n - 1} a^j\left(
          \frac{n}{b^j}\right)^{\log_b a} \\
          & = n^{\log_b a} \sum_{j=0}^{\log_b n - 1} a^j b^{-j\log_b a} \\
          & = n^{\log_b a} \sum_{j=0}^{\log_b n - 1} a^j (b^{\log_b a})^{-j} \\
          & = n^{\log_b a} \sum_{j=0}^{\log_b n - 1} a^j a^{-j} \\
          & = n^{\log_b a} (\log_b n - 1)
      \end{aligned}
      $$

      hence we have $g(n) = \Theta(n^{\log_b a}\log n)$.

      3. For case 3, using recursion we know that $a^jf(n/b^j)\le c^jf(n)$, hence

      $$
        g(n) = \sum_{j=0}^{\log_b n - 1} a^j f(n/b^j) \le
          \sum_{j=0}^{\log_b n - 1} c^jf(n)
      $$

      series $\sum_{j=0}^\infty c^j = 1/(1-c)$, hence $g(n) = O(f(n))$.

  + Part 2: floors and ceilings

    To complete the proof of the master theorem, we must extend our analysis to the
    situation in which floors and ceilings appear in the master recurrence, which
    is defined by

    $$
      T(n) = a T\left(\left\lfloor\frac{n}{b}\right\rfloor\right) + f(n)
    $$

    or

    $$
      T(n) = a T\left(\left\lceil\frac{n}{b}\right\rceil\right) + f(n)
    $$

    We first denote a sequence of recursive invocations on the arguments:

    $$
    n_j =
    \begin{cases}
      n & \text{if} \space j = 0, \\
      \lceil n_{j-1} / b \rceil & \text{if} \space j > 0
    \end{cases}
    $$

    The recursion trees of exact power version and floors/ceilings version have no 
    difference on the number of nodes and its children in each level, but differs
    at the number of levels. Ceiling recurrence has $\lfloor \log_b n \rfloor$
    levels.

    Using inequality $\lceil x \rceil \le x + 1$ we can obtain

    $$
    \begin{aligned}
      n_0 & \le n \\
      n_1 & \le \frac{n}{b} + 1 \\
      n_2 & \le \frac{n}{b^2} + \frac{1}{b} + 1 \\
      \cdots \\
      n_j & \le \frac{n}{b^j} + \sum_{i=0}^{j-1}\frac{1}{b^i} < \frac{n}{b^j} + \sum_{i=0}^\infty\frac{1}{b^i} = \frac{n}{b^j} + \frac{b}{b - 1}
    \end{aligned}
    $$

    Letting $j=\lfloor\log_b n\rfloor$, so we have 

    $$
    \begin{aligned}
      n_{\lfloor \log_b n \rfloor} & < \frac{n}{b^{\lfloor \log_b n \rfloor}}
        + \frac{b}{b-1} \\
      & < \frac{n}{b^{\log_b n - 1}} + \frac{b}{b-1} \\
      & = \frac{n}{n / b} + \frac{b}{b-1} \\
      & = \frac{b^2}{b-1}
    \end{aligned}
    $$

    For case 3, if $af(\lceil n/b \rceil) \le c f(n)$ for $n > b + b/(b-1)$,
    where $c < 1$ is a constant, then it follows that $a^jf(n_j)\le c^jf(n_0)$,
    thus the case holds. For case 2, if we can prove that
    $f(n_j) = O((n/b^j)^{\log_b a})$, then case 2 holds. Observe that
    $j \le \lfloor\log_b n \rfloor$ which implies that $b^j / n \le 1$. And the
    bound $f(n) = O(n^{\log_b a})$ implies that there exists a constant $c > 0$
    that for all sufficiently large $n_j$ :

    $$
    \begin{aligned}
      f(n_j) & \le c\left(\frac{n}{b^j} + \frac{b}{b-1}\right)^{\log_b a} \\
        & = c\left(\frac{n}{b^j}\left(1 + \frac{b^j}{n}
          \frac{b}{b-1}\right)\right)^{\log_b a} \\
        & = c \frac{n^{\log_b a}}{a^j} \left(1 + \frac{b^j}{n}
          \frac{b}{b-1}\right)^{\log_b a} \\
        & \le c\left(1 + \frac{b}{b - 1}\right)^{\log_b a}
          \frac{n^{\log_b a}}{a^j} \\
        & = O((n/b^j)^{\log_b a})
    \end{aligned}
    $$

    thus case 2 holds. And the proof of case 1 is similar, we need to prove that
    $f(n_j) = O((n/b^j)^{\log_b a - \epsilon})$, and it's from

    $$
    \begin{aligned}
      f(n_j) & \le c\left(\frac{n}{b^j} + \frac{b}{b-1}
        \right)^{\log_b a - \epsilon} \\
        & = c\left(\frac{n}{b^j}\left(1 + \frac{b^j}{n}
          \frac{b}{b-1}\right)\right)^{\log_b a - \epsilon} \\
        & = c \left(\frac{n}{b^j}\right)^{\log_b a - \epsilon} 
          \left(1 + \frac{b^j}{n} \frac{b}{b-1}\right)^{\log_b a - \epsilon} \\
        & \le c\left(1 + \frac{b}{b - 1}\right)^{\log_b a - \epsilon}
          \left(\frac{n}{b^j}\right)^{\log_b a - \epsilon} \\
        & = O((n/b^j)^{\log_b a - \epsilon})
    \end{aligned}
    $$

+ [o] A special case of master theorem, if $f(n) = \Theta(n^{\log_b a}\log^k n)$,
  then the master recurrence has solution $T(n) = \Theta(n^{\log_b a}\log^{k+1}n)$.

  *Proof :* This proof needs Bernoulli's inequality:

  $$
  \begin{aligned}
    k(n) & = \sum_{j=0}^{\log_b n - 1} a^j \left(\frac{n}{b^j}\right)
      ^{\log_b a}\left(\log\left(\frac{n}{b^j}\right)\right)^k \\
      & = n^{\log_b a} \sum_{j=0}^{\log_b n - 1} a^j a^{-j}(\log n)^k
        \left(\log\left(\frac{n}{b^j}\right)\big/\log n\right)^k \\
      & = n^{\log_b a} \log^k n \sum_{j=0}^{\log_b n - 1}
        \left(1-\frac{j\log b}{\log n}\right)^k \\
      & > n^{\log_b a} \log^k n \sum_{j=0}^{\log_b n - 1}
        \left(1 - kj\frac{\log b}{\log n}\right) \\
      & = n^{\log_b a} \log^k n \left[\log_b n - k\frac{\log b}{\log n}
        \left(\frac{\log_b n(\log_b n - 1)}{2}\right)\right] \\
      & = n^{\log_b a} \log^k n \left[\log_b n - k
        \left(\frac{\log_b n - 1}{2}\right)\right] \\
      & = \Theta(n^{\log_b a}\log^{k + 1}n)
  \end{aligned}
  $$