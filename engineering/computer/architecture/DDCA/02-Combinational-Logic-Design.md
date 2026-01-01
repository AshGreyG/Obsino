---
tags:
  - computer-engineering
  - computer-architecture
book: Digital Design and Computer Architecture Risc-V Edition
date: 2025-11-23
---

## 1 Introduction

+ [o] Element in circuit p.77
  + [o] wire (node in circuit)
    connects different gates
  + [o] input
    the wire connecting to the input, inputs can be denoted using
     $A_1, \cdots, A_n$
  + [o] output
    the wire connecting to the output, output can be denoted using
    other uppercase characters like $Y$, $X$ etc.
  + [o] internal
    wires connecting different gates, not connected to inputs or
    outputs
+ [o] Digital circuits classified as p.78
  + [o] **combinational**
    combine different gates as a circuit, and the output won't 
    affect the input.

    > A combinational circuit's output depend only on the current
    > values to compute the output. And it's memoryless

  + [o] **sequential**
    the output will be connected the inputs and affects inputs, the
    circuit is related to the time sequence

    > A sequential circuit's outputs depend on both current and
    > previous values of the inputs; it depends on the input
    > sequence. And it has memory

+ [o] Bus for simplify drawings using a single line with a slash
  through it p.78
  A bundle of multiple signals

## 2 Boolean Equations

+ [o] Terminology p.80
  + [o] **complement**
    Complement of TRUE is FALSE, and complement of FALSE is TRUE.
    If $A$ is a Boolean variable then its complement is denoted as
    $\overline{A}$
  + [o] **product** / **implicant** 
    Product of multiple Boolean variables is TRUE only all of these
    Boolean variables are TRUE, if one is FALSE then the result is
    FALSE. Product of $A_1, \cdots, A_n$ can be denoted as

    $$
        A_1 \cdot A_2 \cdot \cdots \cdot A_n
    $$

    + [o] **minterm**
      minterm is the a product of all Boolean variables like
      $A\overline{B}C$ is a minterm of input $A, B, C$
  + [o] **sum**
    Sum of multiple Boolean variables is FALSE only all of these
    Boolean variables are FALSE, if one is TRUE then the result is
    TRUE. Sum of $A_1, \cdots, A_n$ can be denoted as

    $$
        A_1 + A_2 + \cdots + A_n
    $$

    + [o] **maxterm**
      Similarly, maxterm is the sum of all Boolean variables (or
      its complement) like $A + \overline{B} + \overline{C}$ is a
      maxterm of input $A, B, C$
  + [o] precedence of these operations
    NOT > AND > OR
+ [o] **Sum-of-Products Form** p.81
  + [o] what is sigma notation $F(A_1, \cdots, A_n) = \Sigma(m_0, \cdots, m_{n - 1})$ 
    The notation can be viewed as a binary representation, for
    example for minterm $m_3$ of two Boolean variables $A, B$
    can be written as $AB$. **In sigma notation, $A$ represents
    $1$ and its complement $\overline{A}$ represents $0$**.
+ [o] **Product-of-Sums Form** p.82
  + [o] what is pi notation $F(A_1, \cdots, A_n) = \Pi(M_0, \cdots, M_{n - 1})$ 
    The notation can also be viewed as a binary representation, for
    example for maxterm $M_2$ of two Boolean variables $A, B$ can be
    written as $\overline{A} + \overline{B}$. **In pi notation, $A$
    represents $0$ and its complement $\overline{A}$ represents $1$**.

## 3 Boolean Algebra

+ [o] Axiom p.83
  + A1: $A = 1$ if $A \neq 0$ and $A = 0$ if $A \neq 1$
  + A2: $\overline{0} = 1$ and $\overline{1} = 0$
  + A3: $0 \cdot 0 = 0$ and $1 + 1 = 1$
  + A4: $1 \cdot 1 = 1$ and $0 + 0 = 0$
  + A5: $0 \cdot 1 = 1 \cdot 0 = 0$ and $1 + 0 = 0 + 1 = 1$
+ [o] Theorems of One Variable with their duality p.83
  + [o] **identity** $T_1$: $B \cdot 1 = B$ and $B + 0 = B$
  + [o] **null element** $T_2$: $B \cdot 0 = 0$ and $B + 1 = B$
  + [o] **idempotency** $T_3$: $B \cdot B = B$ and $B + B = B$
  + [o] **involution** $T_4$: $\overline{\overline{B}} = B$
  + [o] **complement** $T_5$: $B \cdot \overline{B} = 0$ and $B + \overline{B} = 1$
+ [o] Theorems of Several Variables with their duality p.84
  + [o] **commutativity** $T_6$: $A + B = B + A$ and $A \cdot B = B \cdot A$
  + [o] **associativity** $T_7$: $A \cdot (B \cdot C) = (A \cdot B) \cdot C$ and $A + (B + C) = (A + B) + C$
  + [o] **distributivity** $T_8$: $A \cdot (B + C) = A \cdot B + A \cdot C$ and $A + (B \cdot C) = (A + C) \cdot (A + B)$
  + [o] **covering** $T_9$: $B \cdot (B + C) = B$ and $B + (B \cdot C) = B$
  + [o] **combining** $T_{10}$: $B \cdot C + B \cdot \overline{C} = B$ and $(B + C) \cdot (B + \overline{C}) = B$
  + [o] **consensus** $T_{11}$: $B \cdot C + \overline{B} \cdot D + C \cdot D = B \cdot C + \overline{B} \cdot D$ and $(B + C) \cdot (\overline{B} + D) \cdot (C + D) = (B + C) \cdot (\overline{B} + D)$
  + [o] **De Morgan's** $T_{12}$:
    + $\overline{B_0 \cdot B_1 \cdots} = \overline{B_0} + \overline{B_1} + \cdots$
    + $\overline{B_0 + B_1 + \cdots} = \overline{B_0} \cdot \overline{B_1} \cdots$
+ [o] minimized Boolean equation in Sum-of-Products form
  Like $Y = A\overline{B} + BC$
  > We define an equation in sum-of-products form to be minimized
  > if it uses the fewest possible implicants. If there are several
  > equations with the same number of implicants, the minimal one is
  > the one with the fewest literal.
+ [?] prime implicant
  > The prime implicant cannot be combined with any other implicants
  > in the equation to form a new implicant with fewer literals
+ [o] N-input XOR p.92
  The output of N-input XOR is TRUE when there are odd numbers of
  value of inputs are TRUE. It's FALSE when there are even numbers
  of value of inputs are TRUE
+ [o] **bubble pushing** p.94
  derived from De Morgan's theorem 
  and it says that a NOR gate equals to two INV gates and an and
  gate. The inversion circles bubble from output to inputs
+ [o] Symbol X, contention p.95: **illegal value** or unknown
+ [o] Symbol Z, floating, big impedance p.96: **floating**
  + [i] tristate buffer
    <div style="display: flex; justify-content: space-between">
      <img
        src="_assets/image/co-ddca-01-tristate-buffer.png"
        style="width:40%"
      />
      <img
        src="_assets/image/co-ddca-01-tristate-buffer-low.png"
        style="width:40%"
      />
    </div>

    > The **tristate buffer** has three possible output state:
    > HIGH(1), LOW(0) and floating(Z). The tristate buffer has
    > an input A output Y and **enable** E. When the enable is
    > TRUE, the tristate buffer acts like normal buffer. When
    > the enable is FALSE, the tristate buffer acts not like
    > a part of the circuit.

## 4 Karnaugh Maps

+ [i] The order of karnaugh maps columns p.98
  In gray code order of **high digits**, only change for one bit:
  `00 -> 01 -> 11 -> 11`
  `000 -> 001 -> 011 -> 010 -> 110 -> 111 -> 101 -> 100`
+ [i] The order of karnaugh maps rows p.98
  In gray code order of **low digits**, only change for one bit
+ [i] **How to draw karnaugh maps and find the minimized expression**
  1. Use the fewest circles necessary to cover all the $1$'s
  2. All the squares in each circle must contain $1$'s
  3. Each circle must span a rectangular block that is the power
    of $2$ like $1, 2, 4, 8$ squares in **each direction**
  4. Each circle should be as large as possible
  5. A circle may wrap around the edges of the K-map
  6. A $1$ in a K-map may be circled multiple times if doing so allows fewer
    circles to be used.
  7. Some inputs won't affect outputs, they can be denoted as $X$ and it can be
    $1$ or $0$, used to eliminate boolean variables.

    <div style="display: flex; align-items: center; justify-content: center;">
      <img
        src="_assets/image/co-ddca-01-karnaugh-map.png"
        style="width:40%"
      />
    </div>

## 5 Combinational Building Blocks

+ [o] What is **multiplexer** p.106
  + Multiplexer can be used as **lookup tables** to perform logic functions.
    For example a 4:1 multiplexer has four data inputs and one output, two
    select signals are needed to choose among the four data inputs.

    <div style="display: flex; align-items: center; justify-content: center;">
      <img
        src="_assets/image/co-ddca-01-multiplexer.png"
        style="width:40%"
      />
    </div>

+ [o] Use $2^{N - 1}$-input multiplexer to implement XOR and AND
  function (any $N$-input logic functions)
  + Such as $2$-input AND function can be implemented by `00`, `01`, `10` pins
    input by $V_{\text{gnd}}$, `11` pin input by $V_{\text{cc}}$.
+ [o] What is **decoder** p.108
  + A decoder has $N$ inputs and $2^N$ outputs. It asserts exactly one of its
    outputs depending on the input combination, the outputs are called **one-hot**
    because exactly one is "hot" (TRUE)

    <div style="display: flex; align-items: center; justify-content: center;">
      <img
        src="_assets/image/co-ddca-01-decoder.png"
        style="width:40%"
      />
    </div>

## 6 Timing

+ [o] timing p.110: making the circuit run fast
+ [o] timing diagram
  + [o] rising edge: transition from LOW to HIGH
  + [o] falling edge: transition from HIGH to LOW
+ [o] **propagation delay** $t_{pd}$: the maximum time from when any input changes
  until the output or outputs reach their final value
+ [o] **contamination delay** $t_{cd}$: the minimum time from when any input
  changes until any output starts to change its value.

  <div style="display: flex; align-items: center; justify-content: center;">
    <img
      src="_assets/image/co-ddca-01-delay.png"
      style="width:40%"
    />
  </div>

+ [o] critical path p.111: the **longest** and **slowest** path in the circuit
  from inputs to outputs. This path is critical because it limits the speed at
  which the circuit operates.
+ [o] short path p.111: the **shortest** and **fastest** path in the circuit.
+ [o] **glitch** with time diagram p.116
  + It's possible that a single input transition can cause multiple transitions,
    these are called **glitches** or **hazards**.

    As long as we wait for the propagation delay to elapse before we depend on
    the output, glitches are not problem.

  + [o] relationship between K-map and glitch: **The transition across the boundary
    of two prime implicants in the K-map indicates a possible glitch. A glitch
    can occur when a change in a single variable across the boundary between
    two prime implicants in a K-map. We can eliminate the glitch by adding 
    redundant implicants to the K-map to cover these boundaries.**