# Hash Optimization Strategy

In algorithm problems, **we often reduce the time complexity of algorithms by replacing linear search with hash-based search**. Let's use an algorithm problem to deepen our understanding.

!!! question

    Given an integer array `nums` and a target value `target`, find two elements in the array whose sum is `target`, and return their indices. Any solution will do.

## Linear Search: Trading Time for Space

Consider directly traversing all possible combinations. As shown in the figure below, we use nested loops and check in each iteration whether the sum of two integers is `target`. If so, return their indices.

![Linear search solution for two sum](replace_linear_by_hashing.assets/two_sum_brute_force.png)

The code is shown below:

```src
[file]{two_sum}-[class]{}-[func]{two_sum_brute_force}
```

This method has a time complexity of $O(n^2)$ and a space complexity of $O(1)$, making it very time-consuming on large inputs.

## Hash-Based Search: Trading Space for Time

Consider using a hash table whose keys are array elements and whose values are their indices. Traverse the array and perform the steps shown in the figure below in each iteration:

1. Check if the number `target - nums[i]` is in the hash table. If so, directly return the indices of these two elements.
2. Add the key-value pair `nums[i]` and index `i` to the hash table.

=== "<1>"
    ![Hash table solution for two sum](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png)

=== "<2>"
    ![two_sum_hashtable_step2](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png)

=== "<3>"
    ![two_sum_hashtable_step3](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png)

The implementation is shown below and requires only a single loop:

```src
[file]{two_sum}-[class]{}-[func]{two_sum_hash_table}
```

This method reduces the time complexity from $O(n^2)$ to $O(n)$ through hash-based search, greatly improving runtime efficiency.

Since an additional hash table needs to be maintained, the space complexity is $O(n)$. **Nevertheless, this method offers a more balanced overall time-space trade-off, making it the optimal solution to this problem**.
