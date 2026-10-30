# Optimizing with hashing

In algorithm problems, **we often reduce time complexity by replacing linear search with hash lookup**. Let us explore this strategy through a problem.

!!! question

    Given an integer array `nums` and a target value `target`, find two elements whose sum equals `target` and return their array indices. Any valid solution is acceptable.

## Linear search: trading time for space

Consider examining every possible pair directly. As shown below, use two nested loops and check whether the two integers sum to `target` each time. If they do, return their indices.

![Solving two sum with linear search](replace_linear_by_hashing.assets/two_sum_brute_force.png)

The code is as follows:

```src
[file]{two_sum}-[class]{}-[func]{two_sum_brute_force}
```

This approach takes $O(n^2)$ time and $O(1)$ space, making it very slow for large datasets.

## Hash lookup: trading space for time

Now use a hash table whose keys are array elements and whose values are their indices. Iterate through the array, performing the steps below each round.

1. Check whether `target - nums[i]` is in the hash table. If it is, return the indices of the two elements.
2. Add the key-value pair consisting of `nums[i]` and index `i` to the hash table.

=== "<1>"
    ![Solving two sum with an auxiliary hash table](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png)

=== "<2>"
    ![two_sum_hashtable_step2](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png)

=== "<3>"
    ![two_sum_hashtable_step3](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png)

The implementation below requires only one loop:

```src
[file]{two_sum}-[class]{}-[func]{two_sum_hash_table}
```

Hash lookup reduces the time complexity from $O(n^2)$ to $O(n)$, greatly improving efficiency.

Maintaining an additional hash table requires $O(n)$ space. **Even so, this approach offers a better balance of time and space efficiency, making it the optimal solution to this problem**.
