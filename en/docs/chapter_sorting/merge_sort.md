# Merge Sort

<u>Merge sort (merge sort)</u> is a sorting algorithm based on the divide-and-conquer strategy, which includes the "divide" and "merge" phases shown in the figure below.

1. **Divide phase**: Recursively split the array from the midpoint, transforming the sorting problem of a long array into the sorting problems of shorter arrays.
2. **Merge phase**: When the sub-array length is 1, terminate the division and start merging, continuously merging two shorter sorted arrays into one longer sorted array until the process is complete.

![Divide and merge phases of merge sort](merge_sort.assets/merge_sort_overview.png)

## Algorithm Flow

As shown in the figure below, the "divide phase" recursively splits the array from the midpoint into two sub-arrays from top to bottom.

1. Calculate the array midpoint `mid`, recursively divide the left sub-array (interval `[left, mid]`) and right sub-array (interval `[mid + 1, right]`).
2. Recursively execute step `1.` until the sub-array interval length is 1, then terminate.

The "merge phase" merges the left sub-array and right sub-array into a sorted array from bottom to top. Note that merging starts from sub-arrays of length 1, and each sub-array in the merge phase is sorted.

=== "<1>"
    ![Merge sort steps](merge_sort.assets/merge_sort_step1.png)

=== "<2>"
    ![merge_sort_step2](merge_sort.assets/merge_sort_step2.png)

=== "<3>"
    ![merge_sort_step3](merge_sort.assets/merge_sort_step3.png)

=== "<4>"
    ![merge_sort_step4](merge_sort.assets/merge_sort_step4.png)

=== "<5>"
    ![merge_sort_step5](merge_sort.assets/merge_sort_step5.png)

=== "<6>"
    ![merge_sort_step6](merge_sort.assets/merge_sort_step6.png)

=== "<7>"
    ![merge_sort_step7](merge_sort.assets/merge_sort_step7.png)

=== "<8>"
    ![merge_sort_step8](merge_sort.assets/merge_sort_step8.png)

=== "<9>"
    ![merge_sort_step9](merge_sort.assets/merge_sort_step9.png)

=== "<10>"
    ![merge_sort_step10](merge_sort.assets/merge_sort_step10.png)

It can be observed that the recursive order of merge sort is consistent with the post-order traversal of a binary tree.

- **Post-order traversal**: First recursively traverse the left subtree, then recursively traverse the right subtree, and finally process the root node.
- **Merge sort**: First recursively process the left sub-array, then recursively process the right sub-array, and finally perform the merge.

The implementation of merge sort is shown in the code below. Note that the interval to be merged in `nums` is `[left, right]`, while the corresponding interval in `tmp` is `[0, right - left]`.

```src
[file]{merge_sort}-[class]{}-[func]{merge_sort}
```

## Algorithm Characteristics

- **Time complexity of $O(n \log n)$, non-adaptive sorting**: The division produces a recursion tree of height $\log n$, and the total number of merge operations at each level is $n$, so the overall time complexity is $O(n \log n)$.
- **Space complexity of $O(n)$, non-in-place sorting**: The recursion depth is $\log n$, using $O(\log n)$ size of stack frame space. The merge operation requires the aid of an auxiliary array, using $O(n)$ size of additional space.
- **Stable sorting**: In the merge process, the order of equal elements remains unchanged.

## Linked List Sorting

For linked lists, merge sort has significant advantages over other sorting algorithms, **and can optimize the space complexity of linked list sorting tasks to $O(1)$**.

- **Divide phase**: "Iteration" can be used instead of "recursion" to implement linked list division work, thus saving the stack frame space used by recursion.
- **Merge phase**: In linked lists, node insertion and deletion operations can be achieved by just changing references (pointers), so there is no need to create additional linked lists during the merge phase (merging two short ordered linked lists into one long ordered linked list).

The specific implementation details are quite complex, and interested readers can consult related materials for learning.
