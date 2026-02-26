---
tags:
  - computer-science
  - algorithm
book: Introduction to Algorithm
date: 2025-12-01
---

## 1 Asymptotic notation

+ [o] The function to which we apply asymptotic notation will usually characterize
  the running times of algorithms.
  + [o] $\Theta$-notation:

    $$
      \Theta(g(n)) := \{ f \mid
        \exists c_1, c_2 \in \mathbb{R}, n_0 \in \mathbb{N},
        \forall n > n_0, \\
        0 < c_1 g(n) \le f(n) \le c_2 g(n) \}
    $$

  + [o] $O$-notation:

    $$
      O(g(n)) := \{ f \mid 
        \exists c_1 \in \mathbb{R}, n_0 \in \mathbb{N},
        \forall n > n_0, \\
        0 < f(n) \le c_1 g(n) \}
    $$

  + [o] $\Omega$-notation:

    $$
      \Omega(g(n)) := \{ f \mid 
        \exists c_1 \in \mathbb{R}, n_0 \in \mathbb{N},
        \forall n > n_0, \\
        0 < c_1 g(n) \le f(n) \}
    $$

  + [o] $o$-notation:

    $$
      o(g(n)) := \left\{ f \mid
        \lim_{n \to +\infty} \frac{f(n)}{g(n)} = 0 \right\}
    $$

  + [o] $\omega$-notation:

    $$
      \omega(g(n)) := \left\{ f \mid
        \lim_{n \to +\infty} \frac{f(n)}{g(n)} = +\infty \right\}
    $$
