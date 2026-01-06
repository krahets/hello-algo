# Binary Search

<u>Binary search</u> is an efficient searching algorithm based on the divide-and-conquer strategy. It leverages the orderliness of data to reduce the search range by half in each round until the target element is found or the search interval becomes empty.

!!! question

    Given an array `nums` of length $n$ with elements arranged in ascending order and no duplicates, search for and return the index of element `target` in the array. If the array does not contain the element, return $-1$. An example is shown in the figure below.

![Binary search example data](binary_search.assets/binary_search_example.png)

As shown in the figure below, we first initialize pointers $i = 0$ and $j = n - 1$, pointing to the first and last elements of the array respectively, representing the search interval $[0, n - 1]$. Note that square brackets denote a closed interval, which includes the boundary values themselves.

Next, perform the following two steps in a loop:

1. Calculate the midpoint index $m = \lfloor {(i + j) / 2} \rfloor$, where $\lfloor \: \rfloor$ denotes the floor operation.
2. Compare `nums[m]` and `target`, which results in three cases:
    1. When `nums[m] < target`, it indicates that `target` is in the interval $[m + 1, j]$, so execute $i = m + 1$.
    2. When `nums[m] > target`, it indicates that `target` is in the interval $[i, m - 1]$, so execute $j = m - 1$.
    3. When `nums[m] = target`, it indicates that `target` has been found, so return index $m$.

If the array does not contain the target element, the search interval will eventually shrink to empty. In this case, return $-1$.

=== "<1>"
    ![Binary search process](binary_search.assets/binary_search_step1.png)

=== "<2>"
    ![binary_search_step2](binary_search.assets/binary_search_step2.png)

=== "<3>"
    ![binary_search_step3](binary_search.assets/binary_search_step3.png)

=== "<4>"
    ![binary_search_step4](binary_search.assets/binary_search_step4.png)

=== "<5>"
    ![binary_search_step5](binary_search.assets/binary_search_step5.png)

=== "<6>"
    ![binary_search_step6](binary_search.assets/binary_search_step6.png)

=== "<7>"
    ![binary_search_step7](binary_search.assets/binary_search_step7.png)

It's worth noting that since both $i$ and $j$ are of `int` type, **$i + j$ may exceed the range of the `int` type**. To avoid large number overflow, we typically use the formula $m = \lfloor {i + (j - i) / 2} \rfloor$ to calculate the midpoint.

The code is shown below:

```src
[file]{binary_search}-[class]{}-[func]{binary_search}
```

**Time complexity is $O(\log n)$**: In the binary loop, the interval is reduced by half each round, so the number of loops is $\log_2 n$.

**Space complexity is $O(1)$**: Pointers $i$ and $j$ use constant-size space.

## Interval Representation Methods

In addition to the closed interval mentioned above, another common interval representation is the "left-closed right-open" interval, defined as $[0, n)$, meaning the left boundary includes itself while the right boundary does not. Under this representation, the interval $[i, j)$ is empty when $i = j$.

We can implement a binary search algorithm with the same functionality based on this representation:

```src
[file]{binary_search}-[class]{}-[func]{binary_search_lcro}
```

As shown in the figure below, under the two interval representations, the initialization, loop condition, and interval narrowing operations of the binary search algorithm are all different.

Since both the left and right boundaries in the "closed interval" representation are defined as closed, the operations to narrow the interval through pointers $i$ and $j$ are also symmetric. This makes it less error-prone, **so the "closed interval" approach is generally recommended**.

![Two interval definitions](binary_search.assets/binary_search_ranges.png)

## Advantages and Limitations

Binary search performs well in both time and space aspects.

- Binary search has high time efficiency. With large data volumes, the logarithmic time complexity has significant advantages. For example, when the data size $n = 2^{20}$, linear search requires $2^{20} = 1048576$ loop rounds, while binary search only needs $\log_2 2^{20} = 20$ rounds.
- Binary search requires no extra space. Compared to searching algorithms that require additional space (such as hash-based search), binary search is more space-efficient.

However, binary search is not suitable for all situations, mainly for the following reasons:

- Binary search is only applicable to sorted data. If the input data is unsorted, sorting specifically to use binary search would be counterproductive, as sorting algorithms typically have a time complexity of $O(n \log n)$, which is higher than both linear search and binary search. For scenarios with frequent element insertions, maintaining array orderliness requires inserting elements at specific positions with a time complexity of $O(n)$, which is also very expensive.
- Binary search is only applicable to arrays. Binary search requires jump-style (non-contiguous) element access, and jump-style access has low efficiency in linked lists, making it unsuitable for linked lists or data structures based on linked list implementations.
- For small data volumes, linear search performs better. In linear search, each round requires only 1 comparison operation; while in binary search, it requires 1 addition, 1 division, 1-3 comparison operations, and 1 addition (subtraction), totaling 4-6 unit operations. Therefore, when the data volume $n$ is small, linear search is actually faster than binary search.
