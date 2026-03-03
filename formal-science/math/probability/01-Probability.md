---
tags:
  - math
  - probability
date: 2026-02-27
---

## 1 Sample Space

+ [ ] Sample Space
  + [ ] The set of all possible outcomes of a statistical experiment is called
    the **sample space** and is represented by the symbol $\Omega$.
  + [ ] Each outcome in a sample space is called **element** or **sample point**.
  + [ ] More than one sample space can be used to describe the outcomes of an
    experiment. Use $\Omega_1 = \{1,2,3,4,5,6\}$ to denote **number showing on
    the top face**, and use $\Omega_2 = \{\mathsf{even}, \mathsf{odd}\}$ to
    denote **whether the number is even or odd**.

## 2 Events

+ [ ] Events
  + [ ] An **event** is a subset of a sample space, for example event $A$,
    $A \subseteq \Omega$. We use $\emptyset$ to denote a **null set** or
    **empty set**.
  + [ ] The **complement** of an event $A$ with respect to $\Omega$ is the subset
    of all elements of $\Omega$ that are not in $A$. We denote the complement of
    $A$ by the symbol $\overline{A}$
  + [ ] The **intersection** of two events $A$ and $B$ denoted by the symbol
    $A \cap B$, is the event containing all elements that common to $A$ and $B$.
  + [ ] Two events $A$ and $B$ are **mutually exclusive** or **disjoint**.
    If $A \cap B = \emptyset$, that is if $A$ and $B$ have no elements in common.
  + [ ] The **union** of the two events $A$ and $B$, denoted by the symbol
    $A \cup B$, is the event containing all the elements that belong to $A$ or
    $B$ or both.

## 3 Counting Sample Points

+ [ ] If an operation can be performed in $n_1$ ways, and if for each of these
  ways a second operation can be performed in $n_2$ ways, then the two operations
  can be performed together in $n_1n_2$ ways.

  => (**generalized multiplication**). If an operation can be performed in $n_1$
  ways, second operation can be performed in $n_2$ ways ..., $k$-th operation
  can be performed in $n_k$ ways, then the sequence of $k$ operations can be
  performed in $n_1n_2 \cdots n_k$ ways.

+ [ ] A **permutation** is an arrangement of all parts of a set of objects. The
  number of permutations of $n$ objects is $n! = n \times (n-1) \cdots \times 1$.

  => The number of permutations of $n$ distinct objects taken $r$ at a time is

  $$
    \binom{n}{r} = \phantom{a}_n P_r = \frac{n!}{(n - r)!}
  $$

  => Permutations that occur by arranging objects in a circle are called
  **circular permutations**. The number of permutations of $n$ distinct objects
  arranged in a circle is $(n - 1)!$.

  => The number of distinct permutations of $n$ things of which $n_1$ are of
  one kind and $n_2$ are of second kind, ..., $n_k$ of a $k$-th kind is

  $$
    \frac{n!}{n_1! n_2! \cdots n_k!}
  $$

  => The number of ways of partitioning a set of $n$ objects into $r$ cells with
  $n_1$ elements in the first cell, $n_2$ elements in the second, and so forth, is

  $$
    \binom{n}{n_1,n_2, \cdots, n_r} = \frac{n!}{n_1! n_2! \cdots n_r!}
  $$

  where $n_1 + n_2 + \cdots + n_r = n$

+ [ ] We are interested in the number of ways of selecting $r$ objects from $n$
  without regard to order. These selections are called **combinations**,
  *combination is actually a partition with two cells*, the one cell contains
  $r$ objects and the other cell containing the $(n - r)$ objects that are left.

## 4 Probability of an Event