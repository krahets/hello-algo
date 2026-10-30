# Merge sort

<u>Merge sort</u> is a divide-and-conquer sorting algorithm with the “division” and “merging” phases shown below.

1. **Division**: recursively split the array at its midpoint, turning the problem of sorting a long array into problems of sorting shorter arrays.
2. **Merging**: stop dividing when a subarray has length 1, then repeatedly merge two shorter sorted arrays into one longer sorted array until the process is complete.

![The division and merging phases of merge sort](merge_sort.assets/merge_sort_overview.png)

## Algorithm steps

As shown below, the division phase works from the top down, recursively splitting each array into two subarrays at its midpoint.

1. Calculate the midpoint `mid`, then recursively divide the left subarray, `[left, mid]`, and the right subarray, `[mid + 1, right]`.
2. Repeat step `1.` recursively until each subarray has length 1.

The merging phase works from the bottom up, combining the left and right subarrays into a sorted array. Merging begins with subarrays of length 1, so every subarray involved in this phase is already sorted.

=== "<1>"
    ![Steps of merge sort](merge_sort.assets/merge_sort_step1.png)

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

Merge sort follows the same recursive order as a postorder traversal of a binary tree.

- **Postorder traversal**: recurse into the left subtree, then the right subtree, and finally process the root.
- **Merge sort**: recurse into the left subarray, then the right subarray, and finally merge them.

The implementation follows. The interval to merge in `nums` is `[left, right]`, while its corresponding interval in `tmp` is `[0, right - left]`.

```src
[file]{merge_sort}-[class]{}-[func]{merge_sort}
```

## Algorithm properties

- **Time complexity: $O(n \log n)$; not adaptive**. Division produces a recursion tree of height $\log n$. Merging performs a total of $n$ operations at each level, giving $O(n \log n)$ overall.
- **Space complexity: $O(n)$; not in-place**. The recursion depth is $\log n$, requiring $O(\log n)$ space for stack frames. Merging uses an auxiliary array requiring $O(n)$ extra space.
- **Stable**. Merging preserves the order of equal elements.

## Sorting linked lists

Merge sort has a significant advantage over other sorting algorithms for linked lists: **it can reduce the space complexity of sorting a linked list to $O(1)$**.

- **Division**: use iteration instead of recursion to divide the list, eliminating the space needed for recursive stack frames.
- **Merging**: inserting and deleting linked-list nodes requires only changing references or pointers. Merging two short sorted lists into a longer one therefore needs no additional list.

The implementation is fairly involved. Interested readers can consult further resources for details.
