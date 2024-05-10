# Bubble sort

<u>Bubble sort</u> achieves sorting by continuously comparing and swapping adjacent elements. This process resembles bubbles rising from the bottom to the top, hence the name bubble sort.

As shown in the figure below, the bubbling process can be simulated using element swap operations: starting from the leftmost end of the array and moving right, sequentially compare the size of adjacent elements. If "left element > right element," then swap them. After the traversal, the largest element will be moved to the far right end of the array.

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

Assuming the length of the array is $n$, the steps of bubble sort are shown in the figure below.

1. First, perform a "bubble" on $n$ elements, **swapping the largest element to its correct position**.
2. Next, perform a "bubble" on the remaining $n - 1$ elements, **swapping the second largest element to its correct position**.
3. Similarly, after $n - 1$ rounds of "bubbling," **the top $n - 1$ largest elements will be swapped to their correct positions**.
4. The only remaining element is necessarily the smallest and does not require sorting, thus the array sorting is complete.

![Bubble sort process](bubble_sort.assets/bubble_sort_overview.png)

Example code is as follows:

```src
[file]{bubble_sort}-[class]{}-[func]{bubble_sort}
```

## Efficiency optimization

We find that if no swaps are performed in a round of "bubbling," the array is already sorted, and we can return the result immediately. Thus, we can add a flag `flag` to monitor this situation and return immediately when it occurs.

Even after optimization, the worst-case time complexity and average time complexity of bubble sort remain at $O(n^2)$; however, when the input array is completely ordered, it can achieve the best time complexity of $O(n)$.

```src
[file]{bubble_sort}-[class]{}-[func]{bubble_sort_with_flag}
```

## Algorithm characteristics

- **Time complexity of $O(n^2)$, adaptive sorting**: The length of the array traversed in each round of "bubbling" decreases sequentially from $n - 1$, $n - 2$, $\dots$, $2$, $1$, totaling $(n - 1) n / 2$. With the introduction of `flag` optimization, the best time complexity can reach $O(n)$.
- **Space complexity of $O(1)$, in-place sorting**: Only a constant amount of extra space is used by pointers $i$ and $j$.
- **Stable sorting**: As equal elements are not swapped during the "bubbling".
