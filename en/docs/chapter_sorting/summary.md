# Summary

### Key takeaways

- Bubble sort sorts by swapping adjacent elements. Adding a flag to stop early improves its best-case time complexity to $O(n)$.
- Insertion sort inserts one element from the unsorted section into its correct position in the sorted section each round. Although its time complexity is $O(n^2)$, its low operation count makes it popular for small datasets.
- Quick sort sorts through partitioning. Repeatedly choosing the worst pivot can degrade its time complexity to $O(n^2)$. Median or random pivot selection reduces this risk. Recursing on the shorter subarray reduces recursion depth and improves space complexity to $O(\log n)$.
- Merge sort has division and merging phases, exemplifying divide and conquer. Sorting an array requires an auxiliary array and $O(n)$ space, while sorting a linked list can be optimized to use $O(1)$ space.
- Bucket sort has three steps: distribute data into buckets, sort within each bucket, and combine the results. It also uses divide and conquer and suits very large datasets. The key is distributing data evenly.
- Counting sort is a special case of bucket sort that sorts by counting occurrences. It suits large datasets with a limited value range and requires data that can be converted to positive integers.
- Radix sort sorts one digit at a time and requires data that can be represented as numbers with a fixed number of digits.
- Ideally, a sorting algorithm would be efficient, stable, in-place, and adaptive. As with other data structures and algorithms, however, no single sorting algorithm meets all these requirements. In practice, choose one according to the data's properties.
- The figure below compares common sorting algorithms in efficiency, stability, in-place operation, and adaptiveness.

![Comparison of sorting algorithms](summary.assets/sorting_algorithms_comparison.png)

### Q & A

**Q**: When is stability necessary in a sorting algorithm?

We often sort objects by one of their attributes. For example, students have names and heights, and we want a multilevel sort. First sort by name to obtain `(A, 180) (B, 185) (C, 170) (D, 170)`, then sort by height. An unstable algorithm may produce `(D, 170) (C, 170) (A, 180) (B, 185)`.

Students D and C have switched positions, breaking the ordering by name. This is not what we want.

**Q**: Can the right-to-left and left-to-right scans in partitioning be reversed?

No. When the leftmost element is the pivot, the right-to-left scan must come first. This may seem counterintuitive, so let us examine why.

The final step of `partition()` swaps `nums[left]` and `nums[i]`. Afterward, every element to the left of the pivot must be `<=` the pivot, **so `nums[left] >= nums[i]` must hold before that swap**. If we scan left to right first and fail to find a larger element, **the loop stops at `i == j`, where it is possible that `nums[j] == nums[i] > nums[left]`**. The final swap would then move an element larger than the pivot to the far left, causing partitioning to fail.

For example, given `[0, 0, 0, 0, 1]`, scanning left to right first produces `[1, 0, 0, 0, 0]` after partitioning, which is incorrect.

Conversely, if we choose `nums[right]` as the pivot, we must scan left to right first.

**Q**: In the recursion-depth optimization for quick sort, why does choosing the shorter subarray keep the depth at most $\log n$?

Recursion depth is the number of recursive calls that have not yet returned. Each partition divides the array into two subarrays. After the optimization, the subarray chosen for recursion is at most half the original length. Even in the worst case, where it is always exactly half, the depth is $\log n$.

In the original quick sort, we may repeatedly recurse on the larger subarray, with lengths $n$, $n - 1$, $\dots$, $2$, and $1$ in the worst case, giving depth $n$. The optimization prevents this.

**Q**: If all array elements are equal, does quick sort take $O(n^2)$ time? How can we handle this degeneration?

Yes. In this case, consider partitioning into three sections: elements smaller than, equal to, and greater than the pivot. Recurse only on the smaller and greater sections. If all elements are equal, a single partition then completes the sort.

**Q**: Why is bucket sort's worst-case time complexity $O(n^2)$?

In the worst case, all elements fall into one bucket. If an $O(n^2)$ algorithm is used to sort that bucket, the overall time complexity is $O(n^2)$.
