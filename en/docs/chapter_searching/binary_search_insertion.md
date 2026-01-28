# Binary Search Insertion Point

Binary search can not only be used to search for target elements but also to solve many variant problems, such as searching for the insertion position of a target element.

## Case Without Duplicate Elements

!!! question

    Given a sorted array `nums` of length $n$ and an element `target`, where the array contains no duplicate elements. Insert `target` into the array `nums` while maintaining its sorted order. If the array already contains the element `target`, insert it to its left. Return the index of `target` in the array after insertion. An example is shown in the figure below.

![Binary search insertion point example data](binary_search_insertion.assets/binary_search_insertion_example.png)

If we want to reuse the binary search code from the previous section, we need to answer the following two questions.

**Question 1**: When the array contains `target`, is the insertion point index the same as that element's index?

The problem requires inserting `target` to the left of equal elements, which means the newly inserted `target` replaces the position of the original `target`. In other words, **when the array contains `target`, the insertion point index is the index of that `target`**.

**Question 2**: When the array does not contain `target`, what is the insertion point index?

Further consider the binary search process: When `nums[m] < target`, $i$ moves, which means pointer $i$ is approaching elements greater than or equal to `target`. Similarly, pointer $j$ is always approaching elements less than or equal to `target`.

Therefore, when the binary search ends, we must have: $i$ points to the first element greater than `target`, and $j$ points to the first element less than `target`. **It's easy to see that when the array does not contain `target`, the insertion index is $i$**. The code is shown below:

```src
[file]{binary_search_insertion}-[class]{}-[func]{binary_search_insertion_simple}
```

## Case with Duplicate Elements

!!! question

    Based on the previous problem, assume the array may contain duplicate elements, with everything else remaining the same.

Suppose there are multiple `target` elements in the array. Ordinary binary search can only return the index of one `target`, **and cannot determine how many `target` elements are to the left and right of that element**.

The problem requires inserting the target element at the leftmost position, **so we need to find the index of the leftmost `target` in the array**. Initially, consider implementing this through the steps shown in the figure below:

1. Perform binary search to obtain the index of any `target`, denoted as $k$.
2. Starting from index $k$, perform linear traversal to the left, and return when the leftmost `target` is found.

![Linear search for insertion point of duplicate elements](binary_search_insertion.assets/binary_search_insertion_naive.png)

Although this method works, it includes linear search, resulting in a time complexity of $O(n)$. When the array contains many duplicate `target` elements, this method is very inefficient.

Now consider extending the binary search code. As shown in the figure below, the overall process remains unchanged: calculate the midpoint index $m$ in each round, then compare `target` with `nums[m]`, divided into the following cases:

- When `nums[m] < target` or `nums[m] > target`, it means `target` has not been found yet, so use the ordinary binary search interval narrowing operation to **make pointers $i$ and $j$ approach `target`**.
- When `nums[m] == target`, it means elements less than `target` are in the interval $[i, m - 1]$, so use $j = m - 1$ to narrow the interval, thereby **making pointer $j$ approach elements less than `target`**.

After the loop completes, $i$ points to the leftmost `target`, and $j$ points to the first element less than `target`, **so index $i$ is the insertion point**.

=== "<1>"
    ![Steps for binary search insertion point of duplicate elements](binary_search_insertion.assets/binary_search_insertion_step1.png)

=== "<2>"
    ![binary_search_insertion_step2](binary_search_insertion.assets/binary_search_insertion_step2.png)

=== "<3>"
    ![binary_search_insertion_step3](binary_search_insertion.assets/binary_search_insertion_step3.png)

=== "<4>"
    ![binary_search_insertion_step4](binary_search_insertion.assets/binary_search_insertion_step4.png)

=== "<5>"
    ![binary_search_insertion_step5](binary_search_insertion.assets/binary_search_insertion_step5.png)

=== "<6>"
    ![binary_search_insertion_step6](binary_search_insertion.assets/binary_search_insertion_step6.png)

=== "<7>"
    ![binary_search_insertion_step7](binary_search_insertion.assets/binary_search_insertion_step7.png)

=== "<8>"
    ![binary_search_insertion_step8](binary_search_insertion.assets/binary_search_insertion_step8.png)

Observe the following code: the operations for branches `nums[m] > target` and `nums[m] == target` are the same, so the two can be merged.

Even so, we can still keep the conditional branches expanded, as the logic is clearer and more readable.

```src
[file]{binary_search_insertion}-[class]{}-[func]{binary_search_insertion}
```

!!! tip

    The code in this section all uses the "closed interval" approach. Interested readers can implement the "left-closed right-open" approach themselves.

Overall, binary search is simply about setting search targets for pointers $i$ and $j$ separately. The target could be a specific element (such as `target`) or a range of elements (such as elements less than `target`).

Through continuous binary iterations, both pointers $i$ and $j$ gradually approach their preset targets. Ultimately, they either successfully find the answer or stop after crossing the boundaries.
