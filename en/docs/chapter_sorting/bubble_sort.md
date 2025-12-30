# Bubble Sort

<u>Bubble sort (bubble sort)</u> achieves sorting by continuously comparing and swapping adjacent elements. This process is like bubbles rising from the bottom to the top, hence the name bubble sort.

As shown in the figure below, the bubbling process can be simulated using element swap operations: starting from the leftmost end of the array and traversing to the right, compare the size of adjacent elements, and if "left element > right element", swap them. After completing the traversal, the largest element will be moved to the rightmost end of the array.

=== "<1>"
    ![Simulating bubble using element swap operation](bubble_sort.assets/bubble_operation_step1.png)

=== "<2>"
    ![bubble_operation_step2](bubble_sort.assets/bubble_operation_step2.png)

=== "<3>"
    ![bubble_operation_step3](bubble_sort.assets/bubble_operation_step3.png)

=== "<4>"
    ![bubble_operation_step4](bubble_sort.assets/bubble_operation_step4.png)

=== "<5>"
    ![bubble_operation_step5](bubble_sort.assets/bubble_operation_step5.png)

=== "<6>"
    ![bubble_operation_step6](bubble_sort.assets/bubble_operation_step6.png)

=== "<7>"
    ![bubble_operation_step7](bubble_sort.assets/bubble_operation_step7.png)

## Algorithm Flow

Assume the array has length $n$. The steps of bubble sort are shown in the figure below.

1. First, perform "bubbling" on $n$ elements, **swapping the largest element of the array to its correct position**.
2. Next, perform "bubbling" on the remaining $n - 1$ elements, **swapping the second largest element to its correct position**.
3. And so on. After $n - 1$ rounds of "bubbling", **the largest $n - 1$ elements have all been swapped to their correct positions**.
4. The only remaining element must be the smallest element, requiring no sorting, so the array sorting is complete.

![Bubble sort flow](bubble_sort.assets/bubble_sort_overview.png)

Example code is as follows:

```src
[file]{bubble_sort}-[class]{}-[func]{bubble_sort}
```

## Efficiency Optimization

We notice that if no swap operations are performed during a certain round of "bubbling", it means the array has already completed sorting and can directly return the result. Therefore, we can add a flag `flag` to monitor this situation and return immediately once it occurs.

After optimization, the worst-case time complexity and average time complexity of bubble sort remain $O(n^2)$; but when the input array is completely ordered, the best-case time complexity can reach $O(n)$.

```src
[file]{bubble_sort}-[class]{}-[func]{bubble_sort_with_flag}
```

## Algorithm Characteristics

- **Time complexity of $O(n^2)$, adaptive sorting**: The array lengths traversed in each round of "bubbling" are $n - 1$, $n - 2$, $\dots$, $2$, $1$, totaling $(n - 1) n / 2$. After introducing the `flag` optimization, the best-case time complexity can reach $O(n)$.
- **Space complexity of $O(1)$, in-place sorting**: Pointers $i$ and $j$ use a constant amount of extra space.
- **Stable sorting**: Since equal elements are not swapped during "bubbling".
