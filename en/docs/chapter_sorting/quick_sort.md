# Quick Sort

<u>Quick sort (quick sort)</u> is a sorting algorithm based on the divide-and-conquer strategy, which operates efficiently and is widely applied.

The core operation of quick sort is "sentinel partitioning", which aims to: select a certain element in the array as the "pivot", move all elements smaller than the pivot to its left, and move elements larger than the pivot to its right. Specifically, the flow of sentinel partitioning is shown in the figure below.

1. Select the leftmost element of the array as the pivot, and initialize two pointers `i` and `j` pointing to the two ends of the array.
2. Set up a loop in which `i` (`j`) is used in each round to find the first element larger (smaller) than the pivot, and then swap these two elements.
3. Loop through step `2.` until `i` and `j` meet, and finally swap the pivot to the boundary line of the two sub-arrays.

=== "<1>"
    ![Sentinel partitioning steps](quick_sort.assets/pivot_division_step1.png)

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

After sentinel partitioning is complete, the original array is divided into three parts: left sub-array, pivot, right sub-array, satisfying "any element in left sub-array $\leq$ pivot $\leq$ any element in right sub-array". Therefore, we next only need to sort these two sub-arrays.

!!! note "Divide-and-conquer strategy of quick sort"

    The essence of sentinel partitioning is to simplify the sorting problem of a longer array into the sorting problems of two shorter arrays.

```src
[file]{quick_sort}-[class]{quick_sort}-[func]{partition}
```

## Algorithm Flow

The overall flow of quick sort is shown in the figure below.

1. First, perform one "sentinel partitioning" on the original array to obtain the unsorted left sub-array and right sub-array.
2. Then, recursively perform "sentinel partitioning" on the left sub-array and right sub-array respectively.
3. Continue recursively until the sub-array length is 1, at which point sorting of the entire array is complete.

![Quick sort flow](quick_sort.assets/quick_sort_overview.png)

```src
[file]{quick_sort}-[class]{quick_sort}-[func]{quick_sort}
```

## Algorithm Characteristics

- **Time complexity of $O(n \log n)$, non-adaptive sorting**: In the average case, the number of recursive levels of sentinel partitioning is $\log n$, and the total number of loops at each level is $n$, using $O(n \log n)$ time overall. In the worst case, each round of sentinel partitioning divides an array of length $n$ into two sub-arrays of length $0$ and $n - 1$, at which point the number of recursive levels reaches $n$, the number of loops at each level is $n$, and the total time used is $O(n^2)$.
- **Space complexity of $O(n)$, in-place sorting**: In the case where the input array is completely reversed, the worst recursive depth reaches $n$, using $O(n)$ stack frame space. The sorting operation is performed on the original array without the aid of an additional array.
- **Non-stable sorting**: In the last step of sentinel partitioning, the pivot may be swapped to the right of equal elements.

## Why Is Quick Sort Fast

From the name, we can see that quick sort should have certain advantages in terms of efficiency. Although the average time complexity of quick sort is the same as "merge sort" and "heap sort", quick sort is usually more efficient, mainly for the following reasons.

- **The probability of the worst case occurring is very low**: Although the worst-case time complexity of quick sort is $O(n^2)$, which is not as stable as merge sort, in the vast majority of cases, quick sort can run with a time complexity of $O(n \log n)$.
- **High cache utilization**: When performing sentinel partitioning operations, the system can load the entire sub-array into the cache, so element access efficiency is relatively high. Algorithms like "heap sort" require jump-style access to elements, thus lacking this characteristic.
- **Small constant coefficient of complexity**: Among the three algorithms mentioned above, quick sort has the smallest total number of operations such as comparisons, assignments, and swaps. This is similar to the reason why "insertion sort" is faster than "bubble sort".

## Pivot Optimization

**Quick sort may have reduced time efficiency for certain inputs**. Take an extreme example: suppose the input array is completely reversed. Since we select the leftmost element as the pivot, after sentinel partitioning is complete, the pivot is swapped to the rightmost end of the array, causing the left sub-array length to be $n - 1$ and the right sub-array length to be $0$. If we recurse down like this, each round of sentinel partitioning will have a sub-array length of $0$, the divide-and-conquer strategy fails, and quick sort degrades to a form approximate to "bubble sort".

To avoid this situation as much as possible, **we can optimize the pivot selection strategy in sentinel partitioning**. For example, we can randomly select an element as the pivot. However, if luck is not good and we select a non-ideal pivot every time, efficiency is still not satisfactory.

It should be noted that programming languages usually generate "pseudo-random numbers". If we construct a specific test case for a pseudo-random number sequence, the efficiency of quick sort may still degrade.

For further improvement, we can select three candidate elements in the array (usually the first, last, and middle elements of the array), **and use the median of these three candidate elements as the pivot**. In this way, the probability that the pivot is "neither too small nor too large" will be greatly increased. Of course, we can also select more candidate elements to further improve the robustness of the algorithm. After adopting this method, the probability of time complexity degrading to $O(n^2)$ is greatly reduced.

Example code is as follows:

```src
[file]{quick_sort}-[class]{quick_sort_median}-[func]{partition}
```

## Recursive Depth Optimization

**For certain inputs, quick sort may occupy more space**. Taking a completely ordered input array as an example, let the length of the sub-array in recursion be $m$. Each round of sentinel partitioning will produce a left sub-array of length $0$ and a right sub-array of length $m - 1$, which means that the problem scale reduced per recursive call is very small (only one element is reduced), and the height of the recursion tree will reach $n - 1$, at which point $O(n)$ size of stack frame space is required.

To prevent the accumulation of stack frame space, we can compare the lengths of the two sub-arrays after each round of sentinel sorting is complete, **and only recurse on the shorter sub-array**. Since the length of the shorter sub-array will not exceed $n / 2$, this method can ensure that the recursion depth does not exceed $\log n$, thus optimizing the worst-case space complexity to $O(\log n)$. The code is as follows:

```src
[file]{quick_sort}-[class]{quick_sort_tail_call}-[func]{quick_sort}
```
