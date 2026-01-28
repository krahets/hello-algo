# Hash Optimization Strategy

In algorithm problems, **we often reduce the time complexity of algorithms by replacing linear search with hash-based search**. Let's use an algorithm problem to deepen our understanding.

!!! question

    Given an integer array `nums` and a target element `target`, search for two elements in the array whose "sum" equals `target`, and return their array indices. Any solution will do.

## Linear Search: Trading Time for Space

Consider directly traversing all possible combinations. As shown in the figure below, we open a two-layer loop and judge in each round whether the sum of two integers equals `target`. If so, return their indices.

![Linear search solution for two sum](replace_linear_by_hashing.assets/two_sum_brute_force.png)

The code is shown below:

```src
[file]{two_sum}-[class]{}-[func]{two_sum_brute_force}
```

This method has a time complexity of $O(n^2)$ and a space complexity of $O(1)$, which is very time-consuming with large data volumes.

## Hash-Based Search: Trading Space for Time

Consider using a hash table where key-value pairs are array elements and element indices respectively. Loop through the array, performing the steps shown in the figure below in each round:

1. Check if the number `target - nums[i]` is in the hash table. If so, directly return the indices of these two elements.
2. Add the key-value pair `nums[i]` and index `i` to the hash table.

=== "<1>"
    ![Hash table solution for two sum](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png)

=== "<2>"
    ![two_sum_hashtable_step2](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png)

=== "<3>"
    ![two_sum_hashtable_step3](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png)

The implementation code is shown below, requiring only a single loop:

```src
[file]{two_sum}-[class]{}-[func]{two_sum_hash_table}
```

This method reduces the time complexity from $O(n^2)$ to $O(n)$ through hash-based search, greatly improving runtime efficiency.

Since an additional hash table needs to be maintained, the space complexity is $O(n)$. **Nevertheless, this method achieves a more balanced overall time-space efficiency, making it the optimal solution for this problem**.
