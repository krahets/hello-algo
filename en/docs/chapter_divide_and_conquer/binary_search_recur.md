# Divide and conquer search strategy

We have learned that search algorithms fall into two main categories.

- **Brute-force search**: It is implemented by traversing the data structure, with a time complexity of $O(n)$.
- **Adaptive search**: It utilizes a unique data organization form or prior information, and its time complexity can reach $O(\log n)$ or even $O(1)$.

In fact, **search algorithms with a time complexity of $O(\log n)$ are usually based on the divide-and-conquer strategy**, such as binary search and trees.

- Each step of binary search divides the problem (searching for a target element in an array) into a smaller problem (searching for the target element in half of the array), continuing until the array is empty or the target element is found.
- Trees represent the divide-and-conquer idea, where in data structures like binary search trees, AVL trees, and heaps, the time complexity of various operations is $O(\log n)$.

The divide-and-conquer strategy of binary search is as follows.

- **The problem can be divided**: Binary search recursively divides the original problem (searching in an array) into subproblems (searching in half of the array), achieved by comparing the middle element with the target element.
- **Subproblems are independent**: In binary search, each round handles one subproblem, unaffected by other subproblems.
- **The solutions of subproblems do not need to be merged**: Binary search aims to find a specific element, so there is no need to merge the solutions of subproblems. When a subproblem is solved, the original problem is also solved.

Divide-and-conquer can enhance search efficiency because brute-force search can only eliminate one option per round, **whereas divide-and-conquer can eliminate half of the options**.

### Implementing binary search based on divide-and-conquer

In previous chapters, binary search was implemented based on iteration. Now, we implement it based on divide-and-conquer (recursion).

!!! question

    Given an ordered array `nums` of length $n$, where all elements are unique, please find the element `target`.

From a divide-and-conquer perspective, we denote the subproblem corresponding to the search interval $[i, j]$ as $f(i, j)$.

Starting from the original problem $f(0, n-1)$, perform the binary search through the following steps.

1. Calculate the midpoint $m$ of the search interval $[i, j]$, and use it to eliminate half of the search interval.
2. Recursively solve the subproblem reduced by half in size, which could be $f(i, m-1)$ or $f(m+1, j)$.
3. Repeat steps `1.` and `2.`, until `target` is found or the interval is empty and returns.

The figure below shows the divide-and-conquer process of binary search for element $6$ in an array.

![The divide-and-conquer process of binary search](binary_search_recur.assets/binary_search_recur.png)

In the implementation code, we declare a recursive function `dfs()` to solve the problem $f(i, j)$:

```src
[file]{binary_search_recur}-[class]{}-[func]{binary_search}
```
