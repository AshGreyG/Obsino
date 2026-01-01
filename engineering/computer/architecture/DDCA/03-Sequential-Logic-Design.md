---
tags:
  - computer-engineering
  - computer-architecture
book: Digital Design and Computer Architecture Risc-V Edition
date: 2025-12-14
---

## 1 Introduction

+ [o] Sequential logic might explicitly remember certain previous inputs or it
  might distill the prior inputs into a smaller amount of information called
  **state** of the system. The state of a digital sequential circuit is a set
  of bits called **state variables** that contain all the information about the
  past necessary to explain the future behavior of the circuit.
+ [o] **bistable** element p.130
  + [o] Explain two stable states and what is **metastable**. The inverters are 
    **cross-coupled**, meaning that the input of $I_1$ is the output of $I_2$
    and vice versa. Input is close to $V_\text{dd} / 2$.
  + [o] An element with $N$ stable states convey $\log_2 N$ bits of information,
    so a bistable stores 1 bit.
  + [o] Explain why bistable is not practical. No inputs to control the state.
+ [o] **SR Latch** p.132 cross-coupled NOR gates

    <div style="display: flex; justify-content: space-between">
      <img
        src="_assets/image/co-ddca-02-sr-latch.png"
        style="100%"
      />
    </div>

  + [o] Check its truth table:

    ```
    R  S  Q     Q'
    1  0  0     1
    0  1  1     0
    1  1  0     0
    0  0  Qprev Q'prev
    ```

  + [o] What is $Q_{\text{prev}}$ and $\overline{Q}_{\text{prev}}$, why we say
    it has memory. $Q_\text{prev}$ is the previous state of $Q$, and $\overline{Q}
    _\text{prev}$ is the previous state of $\overline{Q}$.
+ [o] **D Latch** p.134 (important: the function of data input $D$ and clock input
  $\text{CLK}$). D latch uses signal CLK to control its status.

    <div style="display: flex; justify-content: space-between">
      <img
        src="_assets/image/co-ddca-02-d-latch.png"
        style="100%"
      />
    </div>

  + [o] Check its truth table:

    ```
    CLK  D  R  S  Q      Q'
    0    x  0  0  Qprev  Q'prev
    1    1  0  1  1      0
    1    0  1  0  0      1
    ```

+ [o] **D flip-flop** p.135

    <div style="display: flex; justify-content: space-between">
      <img
        src="_assets/image/co-ddca-02-d-latch.png"
        style="100%"
      />
    </div>

  + [o] **leader** latch and **follower** latch (or master / slave)
  + It's also called **edge-triggered flip-flop** or **positive edge-triggered
    flip-flop**.
+ [o] **Register** p.135: An $N$-register is a bank of $N$ flip-flops that share
  a common CLK input so that all bits of the register are updated at the same
  time.
+ [o] **Enabled flip-flop** p.136, it has $\text{EN}$ input, usually use AND
  gate to combine input and $\text{EN}$.
+ [o] **Resettable flip-flop** p.137, it has $\text{RESET}$ input. A resettable
  flip-flop adds another input RESET. When RESET is FALSE, the resettable 
  flip-flop behaves like and ordinary D flip-flop. When RESET is TRUE, the
  resettable flip-flop ignores $D$ and resets the output to $0$.
  + [o] **synchronously resettable flip-flop**: reset themselves only on the
    rising edge of CLK.
  + [o] **asynchronously resettable flip-flop**: reset themselves as soon as
    the RESET becomes TRUE.
+ [o] Transistor level latch and flip-flop designs (use transmission gate):
  + [o] Transistor-level D latch p.138 in commercial circuit

    <div style="display: flex; justify-content: space-between">
      <img
        src="_assets/image/co-ddca-02-transmission-gate-d-latch.png"
        style="100%"
      />
    </div>

  + [o] Transistor-level D flip-flop in commercial circuit

    <div style="display: flex; justify-content: space-between">
      <img
        src="_assets/image/co-ddca-02-transmission-gate-d-flipflop.png"
        style="100%"
      />
    </div>

## 2 Synchronous Logic Design

+ [o] **unstable** / **astable** circuit p.140
  + [o] **Ring oscillator**: odd-coupled reverters
  + [o] **Race condition**: for a node it has multiple inputs and they arrive
    at same time.
+ [o] Adopting this discipline of always using registers in the feedback path
  leads us to the formal definition of a synchronous sequential circuit:

  A sequential circuit has a **finite set** of **discrete states** 
  $\{S_0,S_1,S_2,\cdots\}$. A synchronous sequential circuit has a clock 
  input whose rising edges indicate a sequence of times at which state
  transitions occur.

  + Use **current state** and **next state** to distinguish the state of the
    system at the present from the state to which it will enter on the next
    clock edge.
  + Circuit is defined by 1) **input**, 2) **output**, 3) **logic function**
    and 4) **timing specifications**.
  + Logic functional specification details the next state and the value of
    current state and the value of each output for each possible combination
    of current state and input values.
  + Timing specification consists of
    1. Maximum delay $t_{\text{pcq}}$ from clock rising edge to the first
      changing of outputs.
    2. Minimum delay $t_{\text{ccq}}$ from clock rising edge to the first
      changing of outputs.
    3. The setup time $t_{\text{setup}}$ before the clock rising edge.
    4. The hold time $t_{\text{hold}}$ after the clock rising edge.
+ [o] The rules of synchronous sequential circuit composition teach us that a
  circuit:
  1. Every circuit element is either a register or a combinational circuit.
  2. At least one circuit element is a register.
  3. All registers receive the same clock signal.
  4. Every cyclic path contains at least one register.
+ [o] We call the current state variable $S$, next state variable $S'$
+ [o] A flip-flop is the simplest synchronous sequential.

## 3 Finite State Machine

+ [o] Synchronous sequential circuit can be presented as a form called **finite
  state machine** (FSM).
  + Next state logic
  + Output logic
+ [o] **Moore machine**: outputs depend only on the current state of the machine.
+ [o] **Mealy machine**: outputs depend on both the current state and the current
  input.
+ [o] Encoding for states is important:
  + [o] One-hot encoding and one-cold encoding can shrink the amount of gates.
    One-hot encoding is code like `001`, `010` and `100`, only one bit is `1`.
    Because one-hot encoding can generate simpler boolean equations.
+ [o] Factoring state machines: divide a complex state machines to different
  independent modules.

## 4 Timing of Sequential Logic

+ [o] Sampling $D$ on the clock edge is a process that a flip-flop copies the
  input $D$ to the output $Q$ on the rising edge of the clock.
+ [o] A sequential element has an **aperture** time around the clock edge, during
  which the input must be stable for the flip-flop to produce a well-defined
  output. The aperture time of a sequential element is defined by a **setup**
  time and a **hold** time, before and after the clock edge, denoted as
  $t_{\text{setup}}$ and $t_{\text{hold}}$.
+ [o] We can think of time in discrete units called **clock cycles**. We can
  simplify write $A[n]$ to represent the value of signal $A$ at the end of $n$-
  th clock cycle. Clock cycle sets a limit on the speed of the system.
+ [o] In real systems, the clock does not reach all flip-flops at precisely the
  same time, this variation in time called **clock skew**, further increases the
  necessary clock period.
+ [o] When the clock rises, the output may start to change after the 
  **clock-to-Q contamination delay** $t_{\text{ccq}}$. The output must definitely
  settled to the final value within the **clock-to-Q propagation delay**
  $t_{\text{pcq}}$.
+ [o] The **clock period** or **cycle time** $T_c$ is the time between rising edge
  of a repetitive clock signal. Its reciprocal $1/T_c$ is called **clock
  frequency**.
  + For `register-processing-register` architecture showed in the picture

    <div style="display: flex; justify-content: space-between">
      <img
        src="_assets/image/co-ddca-02-timing-setup-constraint.png"
        style="100%"
      />
    </div>

    from picture we can get the inequality:

    $$
      T_c \ge t_\text{pcq} + t_\text{pd} + t_\text{setup}
    $$

    and that can be rewritten as $t_\text{pd} \le T_c - (t_\text{pcq} + 
    t_\text{setup})$, term $t_\text{pcq}+t_\text{setup}$ is called **sequencing
    overhead**. This rewritten inequality is also called **setup time 
    constraint** or **max-delay constraint**.
  + For `register-processing-register` above, the second register's input $D_2$
    must not change until some time $t_\text{hold}$ after the rising edge of
    the clock, so we have the inequality:

    $$
      t_\text{ccq} + t_\text{cd} \ge t_\text{hold}
    $$

    again we can rewrite the inequality to $t_\text{cd} \ge t_\text{hold} - 
    t_\text{ccq}$. And it's called the **hold time constraint** or **min-delay
    constraint**.

    <div style="display: flex; justify-content: space-between">
      <img
        src="_assets/image/co-ddca-02-timing-hold-constraint.png"
        style="100%"
      />
    </div>

+ [o] Clock skew: in reality there is some variation in this time, this variation
  in clock edges are called **clock skew** (the wire length from clock source
  to different registers are slightly different).

  + Because $t_\text{skew}$ should be added to the timing analysis, the setup
    constraint should be

    $$
      T_c \ge t_\text{pcq} + t_\text{pd} + t_\text{setup} + t_\text{skew}
    $$

    and that's $t_\text{pd} \le T_c - (t_\text{pcq} + t_\text{setup} + 
    t_\text{skew})$;
  + Similarly the hold constraint should be

    $$
      t_\text{ccq} + t_\text{cd} \ge t_\text{hold} + t_\text{skew}
    $$

    and that's $t_\text{cd} \ge t_\text{hold} + t_\text{skew} - t_\text{ccq}$.

  So clock skew decreases the propagation time and increases the contamination
  time. Designers should avoid clock skews.
+ [o] When a flip-flop samples an input that is changing during its aperture, the
  output $Q$ may temporarily take on a voltage between $0$ and $V_\text{dd}$ that
  is in the forbidden zone. This is called **metastable state**.
  + Every bistable device has a metastable state between the two stable states.
  + **Resolution time** is the time from metastable state to stable state.
    Denoted as $t_\text{res}$.
    + If the inputs changes outside the aperture, then $t_\text{res} = 
      t_\text{pcq}$.
    + If the inputs happens to change within the aperture, $t_\text{res}$ can be
      substantially longer:

      $$
        \mathbb{P}[t_\text{res} > t] = \frac{T_0}{T_c}\mathrm{e}^
        {-\frac{t}{\tau}}
      $$

      where $T_0$ (metastability resolution constant) and $\tau$ (metastability
      time constant) are characteristics of flip-flop. $T_0/T_c$ describes the
      probability that the input changes at a bad time (during the aperture time)
      and this probability decreases with the cycle time. $\tau$ indicates how
      fast the flip-flop moves away from metastable state.
+ [o] **Synchronizer** is a device that receives an asynchronous input $D$ and
  clock $\text{CLK}$, it produces an output $Q$. $Q$ has a valid logic with
  extremely high probability, If $D$ is stable during aperture, $Q$ should take
  on the same values as $D$, if $D$ changes during the aperture, $Q$ may take on
  either a HIGH or LOW value, but must not metastable. Synchronizer can be built
  with two flip-flops:

  <div style="display: flex; justify-content: space-between">
    <img
      src="_assets/image/co-ddca-02-synchronizer.png"
      style="100%"
    />
  </div>

  A synchronizer fails when its output $Q$ is in metastability. This may happen
  when $D_2$ has not resolved to a valid level by the time it must set up at
  flip-flop $F_2$, so $t_\text{res} > T_c - t_\text{setup}$, thus

  $$
    \mathbb{P}[\mathsf{failure}] = \frac{T_0}{T_c} \mathrm{e}^
    {-(T_c - t_\text{setup})/\tau}
  $$

  System reliability is usually measured in **mean time between failures** (MTBF)
  , it is the average  amount of time between failures of the system.

  $$
    \text{MBTF} = \frac{1}{\mathbb{P}[\mathsf{failure}] / \mathsf{{sec}}}
    = \frac{T_c \mathrm{e}^{(T_c - t_\text{setup}) / \tau}}{N T_0}
  $$
+ [o] Derivation of resolution time
  + A flip-flop output will be metastable after some time $t$, if the flip-flop
    samples a changing input (causing a metastable condition) and the output
    does not resolve to a valid level within that time after the clock edge:

    $$
      \mathbb{P}[t_\text{res} > t] = 
      \mathbb{P}[\mathsf{samples\space changing\space input}] \times
      \mathbb{P}[\mathsf{unresolved}]
    $$

  + The asynchronous input signals switch between $0$ and $1$ in some time
    $t_\text{switch}$. Sampling changing input happens at switch time, setup time
    or hold time:

    $$
      \mathbb{P}[\mathsf{samples\space changing\space input}] =
      \frac{t_\text{switch} + t_\text{setup} + t_\text{hold}}{T_c}
    $$

  + The time to resolve from metastability depends on the inner workings of the
    circuit, and this resolution time determines $\mathbb{P}[\mathsf{unresolved}]$
    , the probability that the flip-flop has not yet resolved to a valid logic
    level after time $t$.
  + A bistable device is often implemented as two **inverters**: it acts like a
    buffer. Consider it has a symmetric DC transfer characteristics with a
    **slope** of $k$. All real circuit also have some capacitance $C$ that must
    be charged up. Charging the capacitor through resistor causes a RC delay,
    preventing the bistable device switching instantaneously.
  + The metastable for this circuit is $v_\text{out}(t) = v_\text{in}(t) = 
    V_\text{dd} / 2$. The circuit may begin at time $0$ near metastability at
    $v_\text{out}(0) = V_\text{dd} / 2 + \Delta V$ for small offset $\Delta V$.
    Positive feedback will eventually drive $v_\text{out}(t)$ to $V_\text{dd}$
    if $\Delta V > 0$, vice versa.
  + The DC transfer characteristic is nonlinear but linear near the metastable
    point. If $v_\text{in} = V_\text{dd} / 2 + \Delta V / k$, then $v_\text{out}
    = V_\text{dd} / 2 + \Delta V$, so current through resistor is

    $$
      i(t) = \frac{v_\text{out}(t) - v_\text{in}(t)}{R}
    $$

    The capacitor charges at a rate:

    $$
      \frac{\mathrm{d} v_\text{in}(t)}{\mathrm{d}t} =
      \frac{\mathrm{d} Q}{\mathrm{d}t} \cdot \frac{1}{C} =
      \frac{i(t)}{C} =
      \frac{k - 1}{kRC}\Delta V =
      \frac{k - 1}{RC}\left[v_\text{out}(t) - \frac{V_\text{dd}}{2}\right]
    $$

    and this is a linear first-order differential equation. Solving this with
    the initial condition $v_\text{out}(0) = V_\text{dd} / 2 + \Delta V$ gives:

    $$
      v_\text{out}(t) = \frac{V_\text{dd}}{2} + \Delta V \mathrm{e}^
      {\frac{(k-1)t}{RC}}
    $$

    so $v_\text{out}$ moves exponentially away from metastable point $V_\text{dd}
    /2$ until it reaches at $V_\text{dd}$ or $0$. Then solve the equation above,
    we can get the resolution time is

    $$
      t_\text{res} = \frac{RC}{k - 1}\ln \frac{V_\text{dd}}{2|\Delta V|}
    $$

    thus for $\mathbb{P}[\mathsf{unresolved}]$ we have

    $$
    \begin{aligned}
      \mathbb{P}[\mathsf{unresolved}] & = 
      \mathbb{P}[\mathsf{initial\space offset} < \mathsf{resolved\space offset}] \\
      & = \mathbb{P}\left[\left|v_\text{in}(0) - \frac{V_\text{dd}}{2}\right|
      < \frac{\Delta V_\text{res}}{k}\right] \\
      & = \frac{2\Delta V_\text{res}}{k V_\text{dd}}
    \end{aligned}
    $$

  + Hence we have (let $\tau = RC / (k - 1)$):

    $$
      \mathbb{P}[t_\text{res} > t] = 
      \frac{t_\text{switch} + t_\text{setup} + t_\text{hold}}{kT_c}
      \mathrm{e}^{-\frac{t}{\tau}}
    $$

+ [o] Token: a group of inputs that are processed to produce a group of outputs.
+ [o] Latency: the time of a system required for one token to pass through the
  system from start to end.
+ [o] Throughput: the number of tokens that can be produced per unit time.
+ [o] The throughput can be improved by processing several tokens at the same
  time. This is called the **parallelisms** and it comes in two forms: **spatial**
  and **temporal**.
  + Spatial parallelism provides multiple copies of the hardware so that multiple
    tasks can be done at the same time;
  + Temporal parallelism, a task is broken into **stages** like an assembly line.
    Multiple tasks can be spread across the stages, multiple tasks can overlap.
    Temporal parallelism is commonly called **pipelining**.
  + The circuit cannot be divided into two exactly equal halves and because the
    registers introduce more sequencing overhead.