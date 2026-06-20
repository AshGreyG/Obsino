---
tags:
  - computer-science
  - algorithm
date: 2026-03-17
---

+ [Codeforces Blog](https://codeforces.com/blog/entry/89629)

## 1 Lyndon Factorization

+ **Lyndon Word**:
  + A nonempty string that is strictly smaller in **lexicographic order** (字典序,
    就是字典排单词的顺序, 如 "adf" < "afa") than all of its **rotation** (这里指的
    是将原来的字符串循环向右移动, 如 adf -> dfa -> fad)
  + Lyndon word cannot be **factorized** (分解, 这里指的是不能再拆解为 2 个及以上
    的 Lyndon word)
+ **Lyndon Factorization** (Lyndon 分解)
  + Split the string into many lyndon words in such a way that the words in the
    sequence are in such way that the words in the sequence are in lexicographic
    non-increasing order. And that's called **Chen-Fox-Lyndon theorem**. It
    states that any string $S$ can be uniquely factored into a sequence of 
    Lyndon words $w_1,w_2,\cdots,w_k$

    $$
      S = w_1 w_2 \cdots w_k \space \text{where} \space w_1 \ge w_2 \ge \cdots
      w_k
    $$

+ **Duval**'s algorithm:
  + It uses three pointers to maintain a pre-Lyndon word (a prefix of Lyndon
    word)