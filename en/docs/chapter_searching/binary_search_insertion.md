# Finding an insertion point with binary search

Binary search can do more than find a target element. It also solves many variations of the problem, such as finding where to insert a target.

## When there are no duplicates

!!! question

    Given a sorted array `nums` of length $n$ with no duplicate elements and a value `target`, insert `target` into `nums` while preserving its order. If `target` is already present, insert the new value to its left. Return the index of the newly inserted `target`, as illustrated below.

![Example data for finding an insertion point](binary_search_insertion.assets/binary_search_insertion_example.png)

To reuse the binary search code from the previous section, we need to answer two questions.

**Question 1**: If the array contains `target`, is the insertion index the index of that element?

The problem asks us to insert `target` to the left of the equal element, so the new `target` takes the original one's position. Thus, **if the array contains `target`, the insertion index is the index of that `target`**.

**Question 2**: If the array does not contain `target`, which index is the insertion point?

Consider the search process more closely. Pointer $i$ moves when `nums[m] < target`, so $i$ approaches elements greater than or equal to `target`. Similarly, pointer $j$ keeps approaching elements less than or equal to `target`.

When the search ends, $i$ points to the first element greater than `target`, and $j$ points to the rightmost element smaller than `target`. **Thus, when `target` is absent, the insertion index is $i$**. The code is as follows:

```src
[file]{binary_search_insertion}-[class]{}-[func]{binary_search_insertion_simple}
```

## When duplicates are present

!!! question

    Modify the previous problem to allow duplicate elements in the array. All other requirements remain the same.

If the array contains multiple occurrences of `target`, ordinary binary search can return the index of one occurrence, **but cannot determine how many more occurrences lie to its left or right**.

The target must be inserted as far left as possible, **so we need the index of the leftmost `target`**. One initial approach follows the steps below.

1. Run binary search to find the index of any `target`, denoted by $k$.
2. Starting at index $k$, scan leftward and return when the leftmost `target` is reached.

![Finding the insertion point among duplicates with a linear scan](binary_search_insertion.assets/binary_search_insertion_naive.png)

Although this works, it includes a linear search and therefore takes $O(n)$ time. It is inefficient when the array contains many occurrences of `target`.

Now consider extending binary search itself. As shown below, the overall process remains the same: each round calculates midpoint index $m$ and compares `target` with `nums[m]`. The cases are as follows.

- If `nums[m] < target` or `nums[m] > target`, we have not found `target`. Narrow the interval as in ordinary binary search, **bringing pointers $i$ and $j$ closer to `target`**.
- If `nums[m] == target`, elements smaller than `target` lie in $[i, m - 1]$. Narrow the interval by setting $j = m - 1$, **bringing pointer $j$ closer to elements smaller than `target`**.

When the loop finishes, $i$ points to the leftmost `target`, and $j$ points to the rightmost element smaller than `target`. **Index $i$ is therefore the insertion point**.

=== "<1>"
    ![Steps for finding an insertion point among duplicates](binary_search_insertion.assets/binary_search_insertion_step1.png)

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

In the code below, the branches for `nums[m] > target` and `nums[m] == target` perform the same operation, so they can be combined.

Even so, we can leave them separate to make the logic clearer and easier to read.

```src
[file]{binary_search_insertion}-[class]{}-[func]{binary_search_insertion}
```

!!! tip

    All the code in this section uses closed intervals. Interested readers can implement versions using left-closed, right-open intervals.

Viewed more broadly, binary search simply assigns a search goal to each of pointers $i$ and $j$. The goal may be a particular element, such as `target`, or a range of elements, such as those smaller than `target`.

As the interval is repeatedly halved, pointers $i$ and $j$ approach their assigned goals. Eventually they either find the answer or stop after crossing a boundary.
