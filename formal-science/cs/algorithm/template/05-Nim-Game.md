---
tags:
  - computer-science
  - algorithm
date: 2026-03-26
---

## 1 Zermelo's Theorem

+ [ ] We consider that for a game, it meets the following characteristics:
  + The two go head-to-head and **take turns operating**;
  + Information is open and transparent;
  + There are no random factors;
  + It must end within a **limited number of steps**;
  + There is **no draw**.

+ [ ] **Zermelo's Theorem**: for such a game, there must be a winning strategy
  in the **first or second move** in any situation.

+ [ ] Definitions:
  + We call the current situation on the court as a **state**;
  + If one state can be changed to another state through the first step at this
    time, the latter is called the **successor** (后继) state of the former;
  + The state of first player winning (先手必胜) is called the winning position (
    必胜状态) and vice versa.

+ [ ] Conclusions:
  + **A state without a successor state** is a losing position. If the first
    player cannot operate this time, it will lose;
  + **At least one successor state is a losing position**. At this time, the
    first player can change the current state to this losing position. So the
    opponent will lose and he will win;
  + **All successor states are winning position is losing state**. No matter how
    the first player operates at this time, he will come to a losing position.

## 2 Nim Game

+ [ ] **Nim game** is a classical impartial combinatorial game where two players
  alternately remove objects from distinct heaps. Formal rules:

  + There are several heaps of stones
  + On a turn, a player picks exactly one non-empty heap and removes any positive
    number of stones from it
  + Under normal play, the player who takes the last stone wins.

+ [ ] We define the **nim sum** is the **XOR sum** of the number of all stone
  heaps $S = a_1 \oplus a_2 \oplus\cdots\oplus a_n$. If and only if the current
  $S = 0$ current state is winning position.

  + When $a_1 = a_2 = \cdots = a_n = 0$, there is no successor state. $S = 0$.
  + We need to prove for a state $S \neq 0$ we can find a strategy to use just
    an operation to change the state to a losing position $S = 0$. We only need
    to make one of $a_i$ to become the $S \oplus a_i$ and make this operation
    legal. Define $k$ as the highest digit of $S$ in binary (highest digit must
    be $1$), so there are must odd of $a_1 \sim a_n$ whose $k$-th digit is $1$
    in binary. Take an $a_i$ from them whose $k$-th digit is $1$. And the $k$-th
    digit of $S \oplus a_i$ is $0$, thus $a_i > S \oplus a_i$, this operation
    is legal.

    We know $S \oplus a_i = S \ominus a_i \oplus a_i \oplus a_i$, so

    $$
      S \ominus a_i \oplus (S \ominus a_i \oplus a_i \oplus a_i) = 0
    $$

  + We need to prove for a state $S = 0$, we cannot find a strategy to use
    just an operation to change the state to a winning position $S = 0$.
    Consider the $k$-th of $S$ in binary, it must be $0$. So there are even of
    $a_1 \sim a_n$ whose $k$-th digit is $1$. If we want to make $k$-th digit
    of the nim sum of next state still be $0$, we need to change at least $2$
    numbers' $k$-th digit. And that contradicts the rules of nim game.

## 3 Sprague-Grundy Theorem

+ [ ] **Sprague-Grundy theorem**: In any finite impartial combinatorial game
  with perfect information and no chance moves:

  + Every position has a non-negative integer called **Grundy number**;
  + The Grundy number of a position is defined the **mex of the Grundy numbers
    of all reachable next position** (here mex is the minimum excludant of
    the set of last Grundy numbers);
  + If a game **decomposes into several independent subgames**, the overall
    Grundy number is the **XOR sum** or **nim sum** of the Grundy numbers of
    all subgames;
  + A position is winning if its total nim sum is not $0$ and vice versa.
