---
tags:
  - computer-science
  - algorithm
date: 2026-01-21
---

## 1 01-Knapsack Problem

+ > There are $N$ items and a bag of capacity $V$. Taking $i$-th item into
  > the bag costs $C_i$, and gains $W_i$ points. We want to maximize points in
  > this bag.
+ [o] 01-Knapsack problem is the most basic knapsack problem and its feature is
  **every item can only be taken once**. If we define $\text{dp}[i,v]$ to denote
  the max points first $i$ items taken into a bag of capacity $v$ can have. Then
  the transformation equation is

  $$
    \text{dp}[i,v] = \max\{\text{dp}[i-1, v], \text{dp}[i-1,v-C_i] + W_i\}
  $$

  We can consider $i$-th item:
  + If we take $i$-th item, then total point is $\text{dp}[i-1,v-C_i] + W_i$;
  + If we don't take $i$-th item, then the point is equal to $\text{dp}[i-1,v]$;
  + We choose the max point in two cases.

+ [o] Python implementation :

  ``` python
  dp : List[List[int]] = []

  # initialization of dp

  for i in range(1, index + 1) :
      for j in range(1, v + 1) :
          if j >= cost[i] :
              dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - cost[i]] + value[i])
          else :
              dp[i][j] = dp[i - 1][j]
  ```

+ [o] The time complexity and space complexity are both $\Theta(VN)$. We can use a
  1-dimension array to optimize the space complexity to $\Theta(V)$.
  $\text{dp}[i,v]$ is produced by $\text{dp}[i-1,v]$ and $\text{dp}[i-1,v-C_i]$.
  Consider overwriting same array $\text{dp}[0..V]$ from end to start, then
  $\text{dp}[v-C_i]$ is same with $\text{dp}[i-1,v-C_i]$.

  ``` python
  dp : List[int] = [0] * (capacity + 1)

  # initialization of dp, capacity is the total volume

  for i in range(1, index + 1) :
      for j in range(v + 1, cost[i] - 1, -1) :
          dp[j] = max(dp[j], dp[j - cost[i]] + value[i])
  ```

+ [o] We can abstract the procedure as a pseudo code :
  + $\mathsf{01 Knapsack}(\mathcal{F}, C, W)$
    + Input
      + $\mathcal{F} = \{f_0,f_1, \cdots, f_n\}$ stores the middle state;
      + $C$ is the cost;
      + $W$ is the value.
    + Output
      + None. It only modifies the array $\mathcal{F}$.
    + Procedure
      + $\mathsf{for}\space v \leftarrow V \space \mathsf{to} \space C$
        + $\mathcal{F}[v] \leftarrow \max (\mathcal{F}[v], \mathcal{F}[v - C] + W)$

+ [o] Some problems need us to exactly fill a knapsack. Then we can initialize
  the `dp` array with $\mathcal{F}[0] = 0$ and $\mathcal{F}[1..V] = -\infty$.
  Initializing array $\mathcal{F}[1..V] = -\infty$ marks these states as "
  impossible / unreachable" at the start. Only when you find items that perfectly
  fill capacity `w` will `dp[w]` become a real value.

  ``` python
  INF = float("-inf")
  dp : List[int] = []
  dp[0] = 0

  for i in range(1, capacity + 1) :
      dp.append(INF)
  ```