---
tags:
  - computer-science
  - algorithm
date: 2025-11-25
---

## 1 Compared Sort

+ [o] **Bubble Sort**
  + Time complexity: best $\Omega(n)$, average $\Theta(n^2)$, worst $O(n^2)$
  + Space complexity: $\Theta(1)$
  + Python implementation:

     ``` python
     def bubble_sort(array : List[int]) -> None :
        swapped = True
        while swapped :
            swapped = False
            for i in range(1, len(array)) :
                if array[i] < array[i - 1] :
                    array[i - 1], array[i] = array[i], array[i - 1]
                    swapped = True
     ```

  + Benchmark
    <div style="display: flex; justify-content: space-between">
      <img
        src="/_assets/svg/Bubble-Sort-Benchmark-Time.svg"
        style="width:49%"
      />
      <img
        src="/_assets/svg/Bubble-Sort-Benchmark-Memory.svg"
        style="width:49%"
      />
    </div>

+ [o] **Insertion Sort**
  + Time complexity: best $\Omega(n)$, average $\Theta(n^2)$, worst $O(n^2)$
  + Space complexity: $\Theta(1)$
  + Python implementation

    ``` python
    def insertion_sort(array : List[int]) -> None :
        i = 1
        while i < len(array) :
            j = i
            while j > 0 and array[j - 1] > array[j] :
                array[j - 1], array[j] = array[j], array[j - 1]
                j -= 1
            i += 1
    ```

  + Benchmark
    <div style="display: flex; justify-content: space-between">
      <img
        src="/_assets/svg/Insertion-Sort-Benchmark-Time.svg"
        style="width:49%"
      />
      <img
        src="/_assets/svg/Insertion-Sort-Benchmark-Memory.svg"
        style="width:49%"
      />
    </div>

+ [o] **Merge Sort**
  + Principle:
    + **Divide**: Divide the $n$-element sequence to be sorted into two
      subsequences of $n / 2$ elements each.
    + **Conquer**: Sort the two subsequences recursivly using merge sort.
    + **Combine**: Merge two subsequences to produce the sorted answer.
    + There is an important auxiliary procedure called $\text{Merge}(A,p,q,r)$,
      where $A$ is an array and $p,q,r$ are indices into the array such that
      $p \le q < r$. The procedure assumes that subarrays $A[p..q]$ and
      $A[q + 1..r]$ are in sorted order. It merges them to form a single sorted
      subarray that replaces the current $A[p..r]$
      + Principle of $\text{Merge}$: Choose the smaller of the two cards on top
        of the face-up piles, removing it from its pile and placing this card
        face down onto the output pile.
  + Time complexity: best $\Omega(n)$, average $\Theta(n\log n)$, worst
    $O(n\log n)$
  + Python implementation

    ``` python
    def merge_sort(array : List[int]) -> None :
        def merge(p : int, q : int, r : int) -> None :
            n1 = q - p + 1
            n2 = r - q
            left  : List[int] = [0] * (n1 + 1)
            right : List[int] = [0] * (n2 + 1)

            for i in range(n1) :
                left[i] = array[p + i]

            for i in range(n2) :
                right[i] = array[q + i + 1]

            left[n1]  = math.inf
            right[n2] = math.inf

            m = 0
            n = 0
            for k in range(p, r + 1) :
                if left[m] <= right[n] :
                    array[k] = left[m]
                    m += 1
                else :
                    array[k] = right[n]
                    n += 1

        def _merge_sort(p : int, r : int) -> None :
            if p < r :
                q = (p + r) // 2
                _merge_sort(p, q)
                _merge_sort(q + 1, r)
                merge(p, q, r)

        _merge_sort(0, len(array) - 1)
    ```
  + Appendix proof of time complexity: Merge sort is a divide-and-conquer algorithm
    and its recurrence equation is $T(n) = 2 T(n / 2) + \Theta(n)$, so according
    to [master theorem](formal-science/cs/algorithm/CLRS/02-Divide-and-Conquer.md#4%20Master%20theorem%20method)
    we know the average time complexity is $\Theta(n\log n)$.

+ [o] **Quick Sort**
  + Principle: Quick sort first chooses a **pivot**, then compares the left
    element and right element of pivot, if one is less than pivot then it will
    be placed at left of pivot, otherwise at right of pivot. Quick sort is a
    recursion algorithm, which deals with left sub-array and right sub-array
    recursively.
  + Time complexity: best $\Omega(n\log n)$, average $\Theta(n\log n)$, worst
    $O(n ^ 2)$
  + Space complexity: $\Theta(1)$
  + Python implementation

    ``` python
    def quick_sort(array : List[int]) -> None :
        def partition(left : int, right : int) -> int :
            pivot = random.randint(left, right)
            array[pivot], array[right] = array[right], array[pivot]
            pivot_value = array[right]

            i = left - 1
            for j in range(left, right) :
                if array[j] <= pivot_value :
                    i += 1
                    array[i], array[j] = array[j], array[i]

            array[i + 1], array[right] = array[right], array[i + 1]
            return i + 1

        def _quick_sort(left : int, right : int) -> None :
            if left < right :
                pivot = partition(left, right)
                _quick_sort(left, pivot - 1)
                _quick_sort(pivot + 1, right)

        _quick_sort(0, len(array) - 1)
    ```
  + Proof of time complexity:
    + best: When 

## 2 Un-compared Sort

+ [o] **Bucket Sort**
  + Principle: Bucket sort assumes that the input is in **linear
    distribution**, every element has same probability to fall in a
    bucket. Bucket sort divides the input array into $k$ part and
    each bucket represents a interval whose length is $n / k$. When
    a element is in this interval then it falls into this bucket.
    We can consider the input array has $n$ elements and
    there are $k$ buckets, each bucket of index $i$ has $n_i$ 
    elements. Here we have $\sum_{i = 1}^{k} n_i = n$. Assume the sort
    algorithm in bucket has complexity $f(n)$.
  + Time complexity:
    + best

    $$
      \boxed{\Theta\left(n + k + \min_{\{n_i\}}\sum_i f(n_i)\right) 
      \xrightarrow{k = \Theta(n)} \Theta(n) }
    $$

    + average

    $$
      \boxed{\Theta\left(n + k + k \cdot \mathbb{E}[f(n_1)] \right)
      \xrightarrow[\text{input in linear distribution}]{k = \Theta(n)} \Theta(n) }
    $$

    + worst

    $$
      \boxed{\Theta(n + k + f(n)) = \Theta(f(n))}
    $$

  + Space complexity: $\Theta(n + k)$
  + Python implementation

    ``` python
    def internal_sort(array : List[int]) -> None : ...
    def bucket_sort(array : List[int]) -> None :
        min_val = min(array)
        max_val = max(array)
        bucket_count = len(array)
        bucket_size = max((max_val - min_val + 1) // bucket_count, 1);
        buckets : List[List[int]] = [[] for _ in range(bucket_count)]

        for num in array :
            bucket_index = int((num - min_val) / bucket_size)
            bucket_index = min(bucket_index, bucket_count - 1)
            buckets[bucket_index].append(num)

        sorted_array = []
        for bucket in buckets :
            if bucket :
                internal_sort(bucket)
                sorted_array.extend(bucket)

        for i in range(len(array)) :
            array[i] = sorted_array[i]
    ```

  + Benchmark
    <div style="display: flex; justify-content: space-between">
      <img
        src="/_assets/svg/Bucket-Sort-Benchmark-Time.svg"
        style="width:49%"
      />
      <img
        src="/_assets/svg/Bucket-Sort-Benchmark-Memory.svg"
        style="width:49%"
      />
    </div>