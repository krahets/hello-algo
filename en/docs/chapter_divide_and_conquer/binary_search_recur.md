# Divide and conquer search strategy

We have learned from the [chapter 10.5](../chapter_searching/searching_algorithm_revisited.md) that search algorithms fall into two main categories.

- **Brute-force search**: It is implemented by traversing every element of a data structure, with a time complexity of $O(n)$.
- **Adaptive search**: It utilizes a unique data structure or prior information, with a time complexity of $O(\log n)$ or even $O(1)$.

In fact, **search algorithms with a time complexity of $O(\log n)$ are typically based on the divide-and-conquer strategy**, such as binary search and tree.

- Binary search divides the original problem (searching for a target element in an array) into a smaller subproblem (searching for a target element in half of the array) at each step. This process continues until the array is empty or the target element is found.
- Trees are a classic example of the divide-and-conquer paradigm. In data structures such as binary search trees, AVL trees, and heaps, the time complexity of operations is $O(\log n)$.

The divide-and-conquer strategy of binary search is characterized as follows.

- **Dividing the problem**: Binary search recursively divides the original problem (searching in the full array) into subproblems (searching in half of the array) by comparing the middle element with the target element.
- **Independence of subproblems**: Each round of binary search handle only one subproblem, unaffected by other subproblems.
- **No subproblem solution merging**: Binary search aims to find a specific element, so there is no need to merge the solutions of subproblems. Solving the subproblem inherently solves the original problem.

Divide-and-conquer improves search efficiency. This is because, in brute-force search, only one option can be eliminated per round. In contrast, **divide-and-conquer search eliminates half of the options in each round**.

### Implementing binary search based on divide-and-conquer

In previous chapters, binary search was implemented iteratively. Here, we will implement it using a divide-and-conquer (recursive) approach.

!!! question

    Given a sorted array `nums` of length $n$ with unique elements, find the index of element `target`.

From a divide-and-conquer perspective, we define $f(i, j)$ as the subproblem of the search interval $[i, j]$.

Starting from the original problem $f(0, n-1)$, the binary search proceeds as follows.

1. Calculate the midpoint $m$ of the search interval $[i, j]$ to eliminate half of the search space.
2. Recursively solve the subproblem on the reduced interval, either $f(i, m-1)$ or $f(m+1, j)$.
3. Repeat steps `1.` and `2.`, until `target` is found or the interval becomes empty.

The figure below shows the divide-and-conquer process of performing binary search for element $6$ in a sorted array.

![The divide-and-conquer process of binary search](binary_search_recur.assets/binary_search_recur.png)

In the implementation code, we declare a recursive function `dfs()` to solve the problem $f(i, j)$:

```src
[file]{binary_search_recur}-[class]{}-[func]{binary_search}
```
