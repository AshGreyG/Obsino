---
tags:
  - computer-engineering
  - computer-architecture
course: MIT-6.004-Spring-2017
url: https://ocw.mit.edu/courses/6-004-computation-structures-spring-2017/pages/c1/c1s1/
date: 2026-01-08
---

## 1 Concept of information and entropy

+ [o] We will be using a discrete random variable $X$ that can take on one of
  the N possible values from the set $\{x_1,x_2,\cdots,x_N\}$. The probability
  that $X$ will take on the value $x_1$ is given by probability $p_1$ and so on.
  **Information** is defined by:

  $$
    I(x_i) = \log_2 \frac{1}{p_i} \space \mathsf{bits}
  $$

  The more uncertainty is resolved, the more information we have received. But
  why $\log_2$ ? Information should have linear addition property, that is for
  sequence `xy`, its information should be $I(\mathsf{x}) + I(\mathsf{y})$.
  Only logarithmic function satisfies this.
+ [o] In information theory, the **entropy** $\mathbb{H}(x)$ is the average
  amount of information contained in each of data received about the value of
  $X$:

  $$
    \mathbb{H}(X) = \mathbb{E}(I(X)) = \sum_{i=1}^N p_i \log_2 \frac{1}{p_i}
  $$

  The entropy of a discrete random variable is average amount of information
  received when learning the value. So its probability is chosen as weight.
+ [o] Suppose we have a sequence of data describing a sequence of values of the
  random variable. If on the average we use less than bits transmit each piece
  of data in the sequence, we will not be sending enough information to resolve
  the uncertainty about the values. So **entropy defines the lower bound of the
  number of bits we need to transmit** (which is the length of final coding).

## 2 Encoding

+ [o] An **encoding** is an **unambiguous** mapping between bit strings and the
  set of possible data.
  + **Fixed-length encoding** is a map like `A => 01`, `B => 11` etc. Every
    data is encoded to the fixed-length bit string.
  + **Variable-length encoding** is a map that symbols are encoded using bit
    strings of different lengths like `A => 01` and `B => 000`. Carefully
    constructed variable-length encodings are useful for the efficient encodings
    of messages.
  + **We can represent an unambiguous encoding as a binary tree.** Labeling the
    branches from each tree node

    <div style="display: flex; justify-content: space-between">
      <img
        src="/_assets/image/co-mit6.004-spring-2017-01-encoding-binary-tree.png"
        style="100%"
      />
    </div>

    We can decode it by using successive bits of the encoding to identify a path
    from the root of tree, descending step-by-step until we come to leaf, then
    repeating the process starting at the root again, until all the bits in the
    encoded message have been consumed.
+ [o] How to choose encoding methods:
  + If all choices are equally likely, then a fixed-length code is often used.
    Such a code will use at least enough bits to represent the information
    content.

    $$
      \sum_{i=1}^N \frac{1}{N} \log_2 \left(\frac{1}{1/N}\right) = \log_2 N
    $$

    Fixed-length encodings have the advantage of supporting **random access**.
    But the resulting entropy is just $\log_2 N$.

    + ASCII is used to represent English text in computing and communication.
      ASCII has 94 printing characters so the entropy is $\log_2 94 = 6.556
      \space\mathsf{bits}$. So we would use 7 bits for each characters.
    + We can encode positive integers as a sequence of bits, each bits is assigned
      a weight. Ordered from right to left, these weights are increasing powers
      of 2. This can represent $[0, 2^N - 1]$.
    + Hexadecimal representation. `0b11010101 => 0xD5`.
    + We used a signed magnitude representation for decimal numbers, encoding the
      sign of the number (using `+` and `-`):

      ``` plaintext
      +---+---+---+---+---+---+---+---+---+
      | 1 | 1 | 1 | 1 | 0 | 1 | 0 | 0 | 1 |
      +---+---+---+---+---+---+---+---+---+
        ↑
        signed magnitude representation, 0 for +, 1 for -

      => -0b11101001 : -223
      ```

      but there are two representation of `0`: `+0` and `-0`. Now it can represent
      $[-2^{N-1}, 2^{N-1}-1]$. **More importantly, the circuitry for doing
      addition of signed-magnitude numbers is different than the circuit for
      doing subtraction** !
    + **Two's Complement Encoding**: Highest digit has negative weight:

      ``` plaintext
      +-------+-------+-----+----+
      | -2ᴺ⁻¹ | 2ᴺ⁻²  | ... | 2⁰ |
      +-------+-------+-----+----+
          ↑
          highest digit has negative weights
      ```

      Thus all negative numbers have a 1 in the high-order bit. For example, the
      most negative number is `0b1000...0` and it equals to $-2^{N-1}$. Most
      positive number is `0b0111...1` and it equals to $+2^{N-1}-1$. If all
      bits are `1` then `0b1111...1` equals to $-1$. If all bits are `0` then
      `0b0000...0` equals to $0$.

      `A+(-A) = 0 = 1+(-1)`, so to compute a negative representation of a value,
      we can get `-A = (-1 - A) + 1`. Notice `0b1111...1 + A` and `0b1111...1 - A`
      has same effect: **reverse every bit**. So `-A = ~Aᵢ + 1`.
  + If data comes not in equal probability, we can use **shorter encoding** for
    **high probability** data and **longer encoding** for **lower probability**.

    Consider the expected length of an encoding, computed by considering each
    $x_i$ to be encoded, and weighting the length of its encoding by $p_i$, the
    probability of its occurrence. Ideally we'd like the expected length of the
    encoding for the $x_i$ to match the entropy $\mathbb{H}(X)$.

    Example: consider sequence `BCBBABABBAAD`, its frequency graph is

    ``` plaintext
    A : 1/3   => encoded with 00
    B : 1/2   => encoded with 01
    C : 1/12  => encoded with 10
    D : 1/12  => encoded with 11

    BCBBABABBAAD => 011001010001000101000011
         ↑                     ↑
    19.509775 bits  22.906416 bits avg(L) = 2.00 bits/symbol

    A : 1/3   => encoded with 11
    B : 1/2   => encoded with 0
    C : 1/12  => encoded with 100
    D : 1/12  => encoded with 101

    BCBBABABBAAD => 01000011011001111101
         ↑                     ↑
    19.509775 bits  19.855489 bits avg(L) = 1.67 bits/symbol

    ℍ("BCBBABABBAAD") = 1.626 bits/symbol
    ```

  + We want to find a **systematic way** to generate the best-possible variable-
    length code. And that's **Huffman's Algorithm** ! Consider a discrete
    information source $\mathcal{X} = \{x_1, \cdots x_n\}$ and $p_i = \mathbb{P}[
    X = x_i]$ where $\sum_{i=1}^n p_i = 1$. Our destination is constructing a
    prefix code $C: \mathcal{X} \mapsto \{0,1\}^*$ to minimalize expected code
    length $L(C) = \sum_{i=1}^n p_i|C(x_i)|$.

    Define a **reduction** procedure: let $p_i = \min p_\mathcal{X}$ and
    $p_j = \text{second-min}\space p_\mathcal{X}$. Define a new symbol $x_{ij}
    =(x_i,x_j)$ and its probability is $p_{ij} = p_i + p_j$, and after reduction
    the discrete information source comes into

    $$
      \mathcal{X}'=(\mathcal{X} \backslash \{x_i, x_j\}) \cup \{x_{ij}\}
    $$

    so we can construct a recursive step to build a binary tree from a sequence
    of probabilities:

    $$
      T(\mathcal{X}) = \mathsf{node}(T(\mathcal{X}'), x_i \leftrightarrow 0,
      x_j \leftrightarrow 1)
    $$

    the pseudo code is:
    + $\mathsf{Huffman}(\mathcal{X}, \mathcal{P})$
      + Input
        + $\mathcal{X} = \{x_1, \cdots, x_n\}$
        + $\mathcal{P} = \{p_1, \cdots, p_n\}$
      + Output
        + A binary tree $T$
      + Procedure
        + $Q \leftarrow$ a empty priority queue
        + ▷ Priority queue is often implemented using min heap or max heap. Here
          $Q$ is a priority queue consisting huffman sub binary trees.
        + $\mathsf{for}\space x_i \in \mathcal{X}$ :
          + $Q.\mathsf{insert}(\mathsf{node}(x_i, p_i))$
        + $\mathsf{while}\space |Q| > 1$ :
          + $u \leftarrow Q.\mathsf{extract\_min}()$
          + $v \leftarrow Q.\mathsf{extract\_min}()$
          + $w \leftarrow \mathsf{node}(\mathsf{left}=u,\mathsf{right}=v)$
          + $w.p = u.p + v.p$
          + $Q.\mathsf{insert}(w)$
        + $\mathsf{return}\space Q.\mathsf{extract\_min}()$
  + To get a more efficient encoding we need to encode **sequences of choices**,
    not just each choice individually. This is the approach taken by most file
    compression algorithm. TODO: **Lempel-Ziv-Welch data compression algorithm**.
+ [ ] **Hamming Distance**: defined as the number of positions in which the
  corresponding digits differ in two encodings of the same length. For instance,
  hamming distance of `01000101` and `11000100` is $2$. Math language: set
  $\mathcal{X}=\{x_1,x_2,\cdots,x_n\}$ and $\mathcal{Y}=\{y_1,y_2,\cdots,y_n\}$,
  then

  $$
    d_H(\mathcal{X}, \mathcal{Y}) = |\{i \mid x_i \neq y_i\}|
  $$

  + We want to use **minimum hamming distance** to detect 1-bit error. A 
    **parity** can be added to any length message and is chosen to make the total 
    number of `1` bits even (which is called **even parity**)

    ``` plaintext
    0b011001010011 → original word with even parity
           ↓
    0b011000010011 → single-bit error (detected)
           ↓↓
    0b011000110011 → 2-bit error (not detected)
    ```

    We say that corrupted words have a **parity error**.