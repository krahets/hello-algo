# Bubble sort

<u>Bubble sort</u> sorts by repeatedly comparing and swapping adjacent elements. The process resembles bubbles rising from the bottom to the top, which gives the algorithm its name.

As shown below, we can simulate bubbling through swaps. Scan from the left end of the array to the right, comparing each pair of adjacent elements. If the left element is greater than the right, swap them. After the scan, the largest element has moved to the far right.

=== "<1>"
    ![Simulating bubbling through element swaps](bubble_sort.assets/bubble_operation_step1.png)

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

## Algorithm steps

For an array of length $n$, bubble sort proceeds as shown below.

1. First, perform a bubbling pass over all $n$ elements, **moving the largest element to its correct position**.
2. Next, perform a pass over the remaining $n - 1$ elements, **moving the second-largest element to its correct position**.
3. Continue in this way. After $n - 1$ passes, **the largest $n - 1$ elements are all in their correct positions**.
4. The one remaining element must be the smallest and needs no further sorting. The array is now sorted.

![The bubble sort process](bubble_sort.assets/bubble_sort_overview.png)

An implementation follows:

```src
[file]{bubble_sort}-[class]{}-[func]{bubble_sort}
```

## Improving efficiency

If a bubbling pass performs no swaps, the array is already sorted and we can return immediately. We can therefore add a variable `flag` to detect this situation and stop as soon as it occurs.

With this optimization, the worst-case and average time complexities remain $O(n^2)$. However, a fully sorted input achieves the best-case time complexity of $O(n)$.

```src
[file]{bubble_sort}-[class]{}-[func]{bubble_sort_with_flag}
```

## Algorithm properties

- **Time complexity: $O(n^2)$; adaptive**. Successive passes traverse $n - 1$, $n - 2$, $\dots$, $2$, and $1$ positions, totaling $(n - 1) n / 2$. With the `flag` optimization, the best-case time complexity is $O(n)$.
- **Space complexity: $O(1)$; in-place**. Pointers $i$ and $j$ use constant extra space.
- **Stable**. Equal elements are not swapped during a bubbling pass.
