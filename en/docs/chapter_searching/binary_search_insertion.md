# Binary search insertion

Binary search is not only used to search for target elements but also to solve many variant problems, such as searching for the insertion position of target elements.

## Case with no duplicate elements

!!! question

    Given a sorted array `nums` of length $n$ with unique elements and an element `target`, insert `target` into `nums` while maintaining its sorted order. If `target` already exists in the array, insert it to the left of the existing element. Return the index of `target` in the array after insertion. See the example shown in the figure below.

![Example data for binary search insertion point](binary_search_insertion.assets/binary_search_insertion_example.png)

If you want to reuse the binary search code from the previous section, you need to answer the following two questions.

**Question one**: If the array already contains `target`, would the insertion point be the index of existing element?

The requirement to insert `target` to the left of equal elements means that the newly inserted `target` will replace the original `target` position. In other words, **when the array contains `target`, the insertion point is indeed the index of that `target`**.

**Question two**: When the array does not contain `target`, at which index would it be inserted?

Let's further consider the binary search process: when `nums[m] < target`, pointer $i$ moves, meaning that pointer $i$ is approaching an element greater than or equal to `target`. Similarly, pointer $j$ is always approaching an element less than or equal to `target`.

Therefore, at the end of the binary, it is certain that: $i$ points to the first element greater than `target`, and $j$ points to the first element less than `target`. **It is easy to see that when the array does not contain `target`, the insertion point is $i$**. The code is as follows:

```src
[file]{binary_search_insertion}-[class]{}-[func]{binary_search_insertion_simple}
```

## Case with duplicate elements

!!! question

    Based on the previous question, assume the array may contain duplicate elements, all else remains the same.

When there are multiple occurrences of `target` in the array, a regular binary search can only return the index of one occurrence of `target`, **and it cannot determine how many occurrences of `target` are to the left and right of that position**.

The problem requires inserting the target element at the leftmost position, **so we need to find the index of the leftmost `target` in the array**. Initially consider implementing this through the steps shown in the figure below.

1. Perform a binary search to find any index of `target`, say $k$.
2. Starting from index $k$, conduct a linear search to the left until the leftmost occurrence of `target` is found, then return this index.

![Linear search for the insertion point of duplicate elements](binary_search_insertion.assets/binary_search_insertion_naive.png)

Although this method is feasible, it includes linear search, so its time complexity is $O(n)$. This method is inefficient when the array contains many duplicate `target`s.

Now consider extending the binary search code. As shown in the figure below, the overall process remains the same. In each round, we first calculate the middle index $m$, then compare the value of `target` with `nums[m]`, leading to the following cases.

- When `nums[m] < target` or `nums[m] > target`, it means `target` has not been found yet, thus use the normal binary search to narrow the search range, **bringing pointers $i$ and $j$ closer to `target`**.
- When `nums[m] == target`, it indicates that the elements less than `target` are in the range $[i, m - 1]$, therefore use $j = m - 1$ to narrow the range, **thus bringing pointer $j$ closer to the elements less than `target`**.

After the loop, $i$ points to the leftmost `target`, and $j$ points to the first element less than `target`, **therefore index $i$ is the insertion point**.

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

Observe the following code. The operations in the branches `nums[m] > target` and `nums[m] == target` are the same, so these two branches can be merged.

Even so, we can still keep the conditions expanded, as it makes the logic clearer and improves readability.

```src
[file]{binary_search_insertion}-[class]{}-[func]{binary_search_insertion}
```

!!! tip

    The code in this section uses "closed interval". If you are interested in "left-closed, right-open", try to implement the code on your own.

In summary, binary search essentially involves setting search targets for pointers $i$ and $j$. These targets could be a specific element (like `target`) or a range of elements (such as those smaller than `target`).

In the continuous loop of binary search, pointers $i$ and $j$ gradually approach the predefined target. Ultimately, they either find the answer or stop after crossing the boundary.
