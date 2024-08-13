# Quick sort

<u>Quick sort</u> is a sorting algorithm based on the divide and conquer strategy, known for its efficiency and wide application.

The core operation of quick sort is "pivot partitioning," aiming to: select an element from the array as the "pivot," move all elements smaller than the pivot to its left, and move elements greater than the pivot to its right. Specifically, the pivot partitioning process is illustrated in the figure below.

1. Select the leftmost element of the array as the pivot, and initialize two pointers `i` and `j` at both ends of the array.
2. Set up a loop where each round uses `i` (`j`) to find the first element larger (smaller) than the pivot, then swap these two elements.
3. Repeat step `2.` until `i` and `j` meet, finally swap the pivot to the boundary between the two sub-arrays.

=== "<1>"
    ![Pivot division process](quick_sort.assets/pivot_division_step1.png)

=== "<2>"
    ![pivot_division_step2](quick_sort.assets/pivot_division_step2.png)

=== "<3>"
    ![pivot_division_step3](quick_sort.assets/pivot_division_step3.png)

=== "<4>"
    ![pivot_division_step4](quick_sort.assets/pivot_division_step4.png)

=== "<5>"
    ![pivot_division_step5](quick_sort.assets/pivot_division_step5.png)

=== "<6>"
    ![pivot_division_step6](quick_sort.assets/pivot_division_step6.png)

=== "<7>"
    ![pivot_division_step7](quick_sort.assets/pivot_division_step7.png)

=== "<8>"
    ![pivot_division_step8](quick_sort.assets/pivot_division_step8.png)

=== "<9>"
    ![pivot_division_step9](quick_sort.assets/pivot_division_step9.png)

After the pivot partitioning, the original array is divided into three parts: left sub-array, pivot, and right sub-array, satisfying "any element in the left sub-array $\leq$ pivot $\leq$ any element in the right sub-array." Therefore, we only need to sort these two sub-arrays next.

!!! note "Quick sort's divide and conquer strategy"

    The essence of pivot partitioning is to simplify a longer array's sorting problem into two shorter arrays' sorting problems.

```src
[file]{quick_sort}-[class]{quick_sort}-[func]{partition}
```

## Algorithm process

The overall process of quick sort is shown in the figure below.

1. First, perform a "pivot partitioning" on the original array to obtain the unsorted left and right sub-arrays.
2. Then, recursively perform "pivot partitioning" on both the left and right sub-arrays.
3. Continue recursively until the sub-array length reaches 1, thus completing the sorting of the entire array.

![Quick sort process](quick_sort.assets/quick_sort_overview.png)

```src
[file]{quick_sort}-[class]{quick_sort}-[func]{quick_sort}
```

## Algorithm features

- **Time complexity of $O(n \log n)$, non-adaptive sorting**: In average cases, the recursive levels of pivot partitioning are $\log n$, and the total number of loops per level is $n$, using $O(n \log n)$ time overall. In the worst case, each round of pivot partitioning divides an array of length $n$ into two sub-arrays of lengths $0$ and $n - 1$, reaching $n$ recursive levels, and using $O(n^2)$ time overall.
- **Space complexity of $O(n)$, in-place sorting**: In completely reversed input arrays, reaching the worst recursion depth of $n$, using $O(n)$ stack frame space. The sorting operation is performed on the original array without the aid of additional arrays.
- **Non-stable sorting**: In the final step of pivot partitioning, the pivot may be swapped to the right of equal elements.

## Why is quick sort fast

From its name, it is apparent that quick sort should have certain efficiency advantages. Although the average time complexity of quick sort is the same as "merge sort" and "heap sort," quick sort is generally more efficient, mainly for the following reasons.

- **Low probability of worst-case scenarios**: Although the worst time complexity of quick sort is $O(n^2)$, less stable than merge sort, in most cases, quick sort can operate under a time complexity of $O(n \log n)$.
- **High cache usage efficiency**: During the pivot partitioning operation, the system can load the entire sub-array into the cache, thus accessing elements more efficiently. In contrast, algorithms like "heap sort" need to access elements in a jumping manner, lacking this feature.
- **Small constant coefficient of complexity**: Among the mentioned algorithms, quick sort has the fewest total number of comparisons, assignments, and swaps. This is similar to why "insertion sort" is faster than "bubble sort."

## Pivot optimization

**Quick sort's time efficiency may decrease under certain inputs**. For example, if the input array is completely reversed, since we select the leftmost element as the pivot, after the pivot partitioning, the pivot is swapped to the array's right end, causing the left sub-array length to be $n - 1$ and the right sub-array length to be $0$. If this recursion continues, each round of pivot partitioning will have a sub-array length of $0$, and the divide and conquer strategy fails, degrading quick sort to a form similar to "bubble sort."

To avoid this situation, **we can optimize the strategy for selecting the pivot in the pivot partitioning**. For instance, we can randomly select an element as the pivot. However, if luck is not on our side, and we keep selecting suboptimal pivots, the efficiency is still not satisfactory.

It's important to note that programming languages usually generate "pseudo-random numbers". If we construct a specific test case for a pseudo-random number sequence, the efficiency of quick sort may still degrade.

For further improvement, we can select three candidate elements (usually the first, last, and midpoint elements of the array), **and use the median of these three candidate elements as the pivot**. This significantly increases the probability that the pivot is "neither too small nor too large". Of course, we can also select more candidate elements to further enhance the algorithm's robustness. Using this method significantly reduces the probability of time complexity degradation to $O(n^2)$.

Sample code is as follows:

```src
[file]{quick_sort}-[class]{quick_sort_median}-[func]{partition}
```

## Tail recursion optimization

**Under certain inputs, quick sort may occupy more space**. For a completely ordered input array, assume the sub-array length in recursion is $m$, each round of pivot partitioning produces a left sub-array of length $0$ and a right sub-array of length $m - 1$, meaning the problem size reduced per recursive call is very small (only one element), and the height of the recursion tree can reach $n - 1$, requiring $O(n)$ stack frame space.

To prevent the accumulation of stack frame space, we can compare the lengths of the two sub-arrays after each round of pivot sorting, **and only recursively sort the shorter sub-array**. Since the length of the shorter sub-array will not exceed $n / 2$, this method ensures that the recursion depth does not exceed $\log n$, thus optimizing the worst space complexity to $O(\log n)$. The code is as follows:

```src
[file]{quick_sort}-[class]{quick_sort_tail_call}-[func]{quick_sort}
```
