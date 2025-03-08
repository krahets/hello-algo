# Bubble sort

<u>Bubble sort</u> works by continuously comparing and swapping adjacent elements. This process is like bubbles rising from the bottom to the top, hence the name "bubble sort."

As shown in the figure below, the bubbling process can be simulated using element swaps: start from the leftmost end of the array and move right, comparing each pair of adjacent elements. If the left element is greater than the right element, swap them. After the traversal, the largest element will have bubbled up to the rightmost end of the array.

=== "<1>"
    ![Simulating bubble process using element swap](bubble_sort.assets/bubble_operation_step1.png)

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

## Algorithm process

Assume the array has length $n$. The steps of bubble sort are shown in the figure below:

1. First, perform one "bubble" pass on $n$ elements, **swapping the largest element to its correct position**.
2. Next, perform a "bubble" pass on the remaining $n - 1$ elements, **swapping the second largest element to its correct position**.
3. Continue in this manner; after $n - 1$ such passes, **the largest $n - 1$ elements will have been moved to their correct positions**.
4. The only remaining element **must** be the smallest, so **no** further sorting is required. At this point, the array is sorted.

![Bubble sort process](bubble_sort.assets/bubble_sort_overview.png)

Example code is as follows:

```src
[file]{bubble_sort}-[class]{}-[func]{bubble_sort}
```

## Efficiency optimization

If no swaps occur during a round of "bubbling," the array is already sorted, so we can return immediately. To detect this, we can add a `flag` variable; whenever no swaps are made in a pass, we set the flag and return early.

Even with this optimization, the worst time complexity and average time complexity of bubble sort remains $O(n^2)$. However, if the input array is already sorted, the best-case time complexity can be as low as $O(n)$.

```src
[file]{bubble_sort}-[class]{}-[func]{bubble_sort_with_flag}
```

## Algorithm characteristics

- **Time complexity of $O(n^2)$, adaptive sorting.** Each round of "bubbling" traverses array segments of length $n - 1$, $n - 2$, $\dots$, $2$, $1$, which sums to $(n - 1) n / 2$. With a `flag` optimization, the best-case time complexity can reach $O(n)$ when the array is already sorted.
- **Space complexity of $O(1)$, in-place sorting.** Only a constant amount of extra space is used by pointers $i$ and $j$.
- **Stable sorting.** Because equal elements are not swapped during "bubbling," their original order is preserved, making this a stable sort.
