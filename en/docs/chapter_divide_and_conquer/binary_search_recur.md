# Divide-and-conquer search

We have learned that search algorithms fall into two broad categories.

- **Brute-force search**: Traverses a data structure, taking $O(n)$ time.
- **Adaptive search**: Uses a particular organization of data or prior information to achieve $O(\log n)$ or even $O(1)$ time.

In fact, **search algorithms that run in $O(\log n)$ time are usually based on divide and conquer**, as seen in binary search and trees.

- Each step of binary search reduces the problem of finding a target in an array to a smaller problem of finding it in half of the array. This continues until the array is empty or the target is found.
- Trees exemplify divide and conquer. In data structures such as binary search trees, AVL trees, and heaps, various operations take $O(\log n)$ time.

Binary search uses divide and conquer in the following way.

- **The problem can be divided**: By comparing the middle element with the target, binary search recursively reduces the original problem of searching an array to the subproblem of searching half of that array.
- **The subproblems are independent**: Binary search handles only one subproblem at each step, unaffected by other subproblems.
- **The subproblem solutions need not be combined**: Binary search seeks a particular element, so there is no need to combine solutions. Solving the subproblem also solves the original problem.

Divide and conquer makes searching faster because brute-force search eliminates only one option per step, **whereas divide-and-conquer search can eliminate half the options**.

### Implementing binary search with divide and conquer

Earlier chapters implemented binary search iteratively. We will now implement it recursively using divide and conquer.

!!! question

    Given a sorted array `nums` of length $n$ with distinct elements, find the element `target`.

From a divide-and-conquer perspective, let $f(i, j)$ denote the subproblem for the search interval $[i, j]$.

Starting with the original problem $f(0, n-1)$, perform binary search as follows.

1. Calculate the midpoint $m$ of the search interval $[i, j]$ and use it to eliminate half the interval.
2. Recursively solve the subproblem of half the size, either $f(i, m-1)$ or $f(m+1, j)$.
3. Repeat steps `1.` and `2.`, returning when `target` is found or the interval is empty.

The figure below shows the divide-and-conquer process for finding $6$ in an array using binary search.

![Divide-and-conquer process for binary search](binary_search_recur.assets/binary_search_recur.png)

In the implementation, we define a recursive function `dfs()` to solve $f(i, j)$:

```src
[file]{binary_search_recur}-[class]{}-[func]{binary_search}
```
