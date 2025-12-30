# Summary

### Key Review

- Bubble sort achieves sorting by swapping adjacent elements. By adding a flag to enable early return, we can optimize the best-case time complexity of bubble sort to $O(n)$.
- Insertion sort completes sorting by inserting elements from the unsorted interval into the correct position in the sorted interval each round. Although the time complexity of insertion sort is $O(n^2)$, it is very popular in small data volume sorting tasks because it involves relatively few unit operations.
- Quick sort is implemented based on sentinel partitioning operations. In sentinel partitioning, it is possible to select the worst pivot every time, causing the time complexity to degrade to $O(n^2)$. Introducing median pivot or random pivot can reduce the probability of such degradation. By preferentially recursing on the shorter sub-interval, the recursion depth can be effectively reduced, optimizing the space complexity to $O(\log n)$.
- Merge sort includes two phases: divide and merge, which typically embody the divide-and-conquer strategy. In merge sort, sorting an array requires creating auxiliary arrays, with a space complexity of $O(n)$; however, the space complexity of sorting a linked list can be optimized to $O(1)$.
- Bucket sort consists of three steps: distributing data into buckets, sorting within buckets, and merging results. It also embodies the divide-and-conquer strategy and is suitable for very large data volumes. The key to bucket sort is distributing data evenly.
- Counting sort is a special case of bucket sort, which achieves sorting by counting the number of occurrences of data. Counting sort is suitable for situations where the data volume is large but the data range is limited, and requires that data can be converted to positive integers.
- Radix sort achieves data sorting by sorting digit by digit, requiring that data can be represented as fixed-digit numbers.
- Overall, we hope to find a sorting algorithm that is efficient, stable, in-place, and adaptive, with good versatility. However, just like other data structures and algorithms, no sorting algorithm has been found so far that simultaneously possesses all these characteristics. In practical applications, we need to select the appropriate sorting algorithm based on the specific characteristics of the data.
- The figure below compares mainstream sorting algorithms in terms of efficiency, stability, in-place property, and adaptability.

![Sorting algorithm comparison](summary.assets/sorting_algorithms_comparison.png)

### Q & A

**Q**: In what situations is the stability of sorting algorithms necessary?

In reality, we may sort based on a certain attribute of objects. For example, students have two attributes: name and height. We want to implement multi-level sorting: first sort by name to get `(A, 180) (B, 185) (C, 170) (D, 170)`; then sort by height. Because the sorting algorithm is unstable, we may get `(D, 170) (C, 170) (A, 180) (B, 185)`.

It can be seen that the positions of students D and C have been swapped, and the orderliness of names has been disrupted, which is something we don't want to see.

**Q**: Can the order of "searching from right to left" and "searching from left to right" in sentinel partitioning be swapped?

No. When we use the leftmost element as the pivot, we must first "search from right to left" and then "search from left to right". This conclusion is somewhat counterintuitive; let's analyze the reason.

The last step of sentinel partitioning `partition()` is to swap `nums[left]` and `nums[i]`. After the swap is complete, the elements to the left of the pivot are all `<=` the pivot, **which requires that `nums[left] >= nums[i]` must hold before the last swap**. Suppose we first "search from left to right", then if we cannot find an element larger than the pivot, **we will exit the loop when `i == j`, at which point it may be that `nums[j] == nums[i] > nums[left]`**. In other words, the last swap operation will swap an element larger than the pivot to the leftmost end of the array, causing sentinel partitioning to fail.

For example, given the array `[0, 0, 0, 0, 1]`, if we first "search from left to right", the array after sentinel partitioning is `[1, 0, 0, 0, 0]`, which is incorrect.

Thinking deeper, if we select `nums[right]` as the pivot, then it's exactly the opposite - we must first "search from left to right".

**Q**: Regarding the optimization of recursion depth in quick sort, why can selecting the shorter array ensure that the recursion depth does not exceed $\log n$?

The recursion depth is the number of currently unreturned recursive methods. Each round of sentinel partitioning divides the original array into two sub-arrays. After recursion depth optimization, the length of the sub-array to be recursively processed is at most half of the original array length. Assuming the worst case is always half the length, the final recursion depth will be $\log n$.

Reviewing the original quick sort, we may continuously recurse on the longer array. In the worst case, it would be $n$, $n - 1$, $\dots$, $2$, $1$, with a recursion depth of $n$. Recursion depth optimization can avoid this situation.

**Q**: When all elements in the array are equal, is the time complexity of quick sort $O(n^2)$? How should this degenerate case be handled?

Yes. For this situation, consider partitioning the array into three parts through sentinel partitioning: less than, equal to, and greater than the pivot. Only recursively process the less than and greater than parts. Under this method, an array where all input elements are equal can complete sorting in just one round of sentinel partitioning.

**Q**: Why is the worst-case time complexity of bucket sort $O(n^2)$?

In the worst case, all elements are distributed into the same bucket. If we use an $O(n^2)$ algorithm to sort these elements, the time complexity will be $O(n^2)$.
