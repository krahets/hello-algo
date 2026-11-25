# Divide-and-conquer search

As we have seen, search algorithms fall into two broad categories.

- **Brute-force search** traverses the data structure and takes $O(n)$ time.
- **Adaptive search** exploits the way the data is organized or uses prior information. It can take as little as $O(\log n)$ or even $O(1)$ time.

In fact, **search algorithms that run in $O(\log n)$ time commonly use divide and conquer**. Examples include binary search and searches in trees.

- At each step, binary search reduces the problem of searching an array to that of searching one half of it. This continues until the search interval is empty or the target is found.
- Trees illustrate divide and conquer. In data structures such as binary search trees, AVL trees, and heaps, the various operations all take $O(\log n)$ time.

Here is how binary search uses divide and conquer.

- **The problem can be divided**. Comparing the middle element with the target recursively reduces a search of the whole array to a search of one half.
- **The subproblems are independent**. Each round of binary search handles just one subproblem, independently of the others.
- **There are no subproblem results to combine**. Binary search looks for a single element. Solving the remaining subproblem also solves the original problem.

Divide and conquer speeds up search because a brute-force scan rules out only one candidate per step, **whereas divide-and-conquer search can rule out half the candidates at once**.

### Implementing binary search with divide and conquer

In an earlier chapter, we implemented binary search iteratively. Now we will implement it recursively using divide and conquer.

!!! question

    Given a sorted array `nums` of length $n$ with distinct elements, find `target`.

Let $f(i, j)$ denote the subproblem of searching the closed interval $[i, j]$.

Start with the original problem $f(0, n-1)$ and perform binary search as follows.

1. Compute the midpoint $m$ of the search interval $[i, j]$ and use it to rule out half the interval.
2. Recursively solve the subproblem on the remaining half, either $f(i, m-1)$ or $f(m+1, j)$.
3. Repeat steps `1.` and `2.` until you find `target` or the interval is empty, then return.

The figure traces this divide-and-conquer search for $6$ in an array.

![Divide and conquer in binary search](binary_search_recur.assets/binary_search_recur.svg)

The implementation defines a recursive function `dfs()` to solve $f(i, j)$:

```src
[file]{binary_search_recur}-[class]{}-[func]{binary_search}
```
