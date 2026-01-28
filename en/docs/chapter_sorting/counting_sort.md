# Counting Sort

<u>Counting sort (counting sort)</u> achieves sorting by counting the number of elements, typically applied to integer arrays.

## Simple Implementation

Let's start with a simple example. Given an array `nums` of length $n$, where the elements are all "non-negative integers", the overall flow of counting sort is shown in the figure below.

1. Traverse the array to find the largest number, denoted as $m$, and then create an auxiliary array `counter` of length $m + 1$.
2. **Use `counter` to count the number of occurrences of each number in `nums`**, where `counter[num]` corresponds to the number of occurrences of the number `num`. The counting method is simple: just traverse `nums` (let the current number be `num`), and increase `counter[num]` by $1$ in each round.
3. **Since each index of `counter` is naturally ordered, this is equivalent to all numbers being sorted**. Next, we traverse `counter` and fill in `nums` in ascending order based on the number of occurrences of each number.

![Counting sort flow](counting_sort.assets/counting_sort_overview.png)

The code is as follows:

```src
[file]{counting_sort}-[class]{}-[func]{counting_sort_naive}
```

!!! note "Connection between counting sort and bucket sort"

    From the perspective of bucket sort, we can regard each index of the counting array `counter` in counting sort as a bucket, and the process of counting quantities as distributing each element to the corresponding bucket. Essentially, counting sort is a special case of bucket sort for integer data.

## Complete Implementation

Observant readers may have noticed that **if the input data is objects, step `3.` above becomes invalid**. Suppose the input data is product objects, and we want to sort the products by price (a member variable of the class), but the above algorithm can only give the sorting result of prices.

So how can we obtain the sorting result of the original data? We first calculate the "prefix sum" of `counter`. As the name suggests, the prefix sum at index `i`, `prefix[i]`, equals the sum of the first `i` elements of the array:

$$
\text{prefix}[i] = \sum_{j=0}^i \text{counter[j]}
$$

**The prefix sum has a clear meaning: `prefix[num] - 1` represents the index of the last occurrence of element `num` in the result array `res`**. This information is very critical because it tells us where each element should appear in the result array. Next, we traverse each element `num` of the original array `nums` in reverse order, performing the following two steps in each iteration.

1. Fill `num` into the array `res` at index `prefix[num] - 1`.
2. Decrease the prefix sum `prefix[num]` by $1$ to get the index for the next placement of `num`.

After the traversal is complete, the array `res` contains the sorted result, and finally `res` is used to overwrite the original array `nums`. The complete counting sort flow is shown in the figure below.

=== "<1>"
    ![Counting sort steps](counting_sort.assets/counting_sort_step1.png)

=== "<2>"
    ![counting_sort_step2](counting_sort.assets/counting_sort_step2.png)

=== "<3>"
    ![counting_sort_step3](counting_sort.assets/counting_sort_step3.png)

=== "<4>"
    ![counting_sort_step4](counting_sort.assets/counting_sort_step4.png)

=== "<5>"
    ![counting_sort_step5](counting_sort.assets/counting_sort_step5.png)

=== "<6>"
    ![counting_sort_step6](counting_sort.assets/counting_sort_step6.png)

=== "<7>"
    ![counting_sort_step7](counting_sort.assets/counting_sort_step7.png)

=== "<8>"
    ![counting_sort_step8](counting_sort.assets/counting_sort_step8.png)

The implementation code of counting sort is as follows:

```src
[file]{counting_sort}-[class]{}-[func]{counting_sort}
```

## Algorithm Characteristics

- **Time complexity of $O(n + m)$, non-adaptive sorting**: Involves traversing `nums` and traversing `counter`, both using linear time. Generally, $n \gg m$, and time complexity tends toward $O(n)$.
- **Space complexity of $O(n + m)$, non-in-place sorting**: Uses arrays `res` and `counter` of lengths $n$ and $m$ respectively.
- **Stable sorting**: Since elements are filled into `res` in a "right-to-left" order, traversing `nums` in reverse can avoid changing the relative positions of equal elements, thereby achieving stable sorting. In fact, traversing `nums` in forward order can also yield correct sorting results, but the result would be unstable.

## Limitations

By this point, you might think counting sort is very clever, as it can achieve efficient sorting just by counting quantities. However, the prerequisites for using counting sort are relatively strict.

**Counting sort is only suitable for non-negative integers**. If you want to apply it to other types of data, you need to ensure that the data can be converted to non-negative integers without changing the relative size relationships between elements. For example, for an integer array containing negative numbers, you can first add a constant to all numbers to convert them all to positive numbers, and then convert them back after sorting is complete.

**Counting sort is suitable for situations where the data volume is large but the data range is small**. For example, in the above example, $m$ cannot be too large, otherwise it will occupy too much space. And when $n \ll m$, counting sort uses $O(m)$ time, which may be slower than $O(n \log n)$ sorting algorithms.
