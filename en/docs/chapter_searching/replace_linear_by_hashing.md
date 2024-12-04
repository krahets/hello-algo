---
comments: true
---

# 10.4 &nbsp; Hash optimization strategies

In algorithm problems, **we often reduce the time complexity of an algorithm by replacing a linear search with a hash-based search**. Let's use an algorithm problem to deepen the understanding.

!!! question

    Given an integer array `nums` and a target element `target`, please search for two elements in the array whose "sum" equals `target`, and return their array indices. Any solution is acceptable.

## 10.4.1 &nbsp; Linear search: trading time for space

Consider traversing through all possible combinations directly. As shown in Figure 10-9, we initiate a nested loop, and in each iteration, we determine whether the sum of the two integers equals `target`. If so, we return their indices.

![Linear search solution for two-sum problem](replace_linear_by_hashing.assets/two_sum_brute_force.png){ class="animation-figure" }

<p align="center"> Figure 10-9 &nbsp; Linear search solution for two-sum problem </p>

The code is shown below:

=== "Python"

    ```python title="two_sum.py"
    def two_sum_brute_force(nums: list[int], target: int) -> list[int]:
        """Method one: Brute force enumeration"""
        # Two-layer loop, time complexity is O(n^2)
        for i in range(len(nums) - 1):
            for j in range(i + 1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i, j]
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* Method one: Brute force enumeration */
    vector<int> twoSumBruteForce(vector<int> &nums, int target) {
        int size = nums.size();
        // Two-layer loop, time complexity is O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return {i, j};
            }
        }
        return {};
    }
    ```

=== "Java"

    ```java title="two_sum.java"
    /* Method one: Brute force enumeration */
    int[] twoSumBruteForce(int[] nums, int target) {
        int size = nums.length;
        // Two-layer loop, time complexity is O(n^2)
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return new int[] { i, j };
            }
        }
        return new int[0];
    }
    ```

=== "C#"

    ```csharp title="two_sum.cs"
    [class]{two_sum}-[func]{TwoSumBruteForce}
    ```

=== "Go"

    ```go title="two_sum.go"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "Swift"

    ```swift title="two_sum.swift"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "JS"

    ```javascript title="two_sum.js"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "TS"

    ```typescript title="two_sum.ts"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "Dart"

    ```dart title="two_sum.dart"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "Rust"

    ```rust title="two_sum.rs"
    [class]{}-[func]{two_sum_brute_force}
    ```

=== "C"

    ```c title="two_sum.c"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "Kotlin"

    ```kotlin title="two_sum.kt"
    [class]{}-[func]{twoSumBruteForce}
    ```

=== "Ruby"

    ```ruby title="two_sum.rb"
    [class]{}-[func]{two_sum_brute_force}
    ```

=== "Zig"

    ```zig title="two_sum.zig"
    [class]{}-[func]{twoSumBruteForce}
    ```

This method has a time complexity of $O(n^2)$ and a space complexity of $O(1)$, which can be very time-consuming with large data volumes.

## 10.4.2 &nbsp; Hash search: trading space for time

Consider using a hash table, where the key-value pairs are the array elements and their indices, respectively. Loop through the array, performing the steps shown in Figure 10-10 during each iteration.

1. Check if the number `target - nums[i]` is in the hash table. If so, directly return the indices of these two elements.
2. Add the key-value pair `nums[i]` and index `i` to the hash table.

=== "<1>"
    ![Help hash table solve two-sum](replace_linear_by_hashing.assets/two_sum_hashtable_step1.png){ class="animation-figure" }

=== "<2>"
    ![two_sum_hashtable_step2](replace_linear_by_hashing.assets/two_sum_hashtable_step2.png){ class="animation-figure" }

=== "<3>"
    ![two_sum_hashtable_step3](replace_linear_by_hashing.assets/two_sum_hashtable_step3.png){ class="animation-figure" }

<p align="center"> Figure 10-10 &nbsp; Help hash table solve two-sum </p>

The implementation code is shown below, requiring only a single loop:

=== "Python"

    ```python title="two_sum.py"
    def two_sum_hash_table(nums: list[int], target: int) -> list[int]:
        """Method two: Auxiliary hash table"""
        # Auxiliary hash table, space complexity is O(n)
        dic = {}
        # Single-layer loop, time complexity is O(n)
        for i in range(len(nums)):
            if target - nums[i] in dic:
                return [dic[target - nums[i]], i]
            dic[nums[i]] = i
        return []
    ```

=== "C++"

    ```cpp title="two_sum.cpp"
    /* Method two: Auxiliary hash table */
    vector<int> twoSumHashTable(vector<int> &nums, int target) {
        int size = nums.size();
        // Auxiliary hash table, space complexity is O(n)
        unordered_map<int, int> dic;
        // Single-layer loop, time complexity is O(n)
        for (int i = 0; i < size; i++) {
            if (dic.find(target - nums[i]) != dic.end()) {
                return {dic[target - nums[i]], i};
            }
            dic.emplace(nums[i], i);
        }
        return {};
    }
    ```

=== "Java"

    ```java title="two_sum.java"
    /* Method two: Auxiliary hash table */
    int[] twoSumHashTable(int[] nums, int target) {
        int size = nums.length;
        // Auxiliary hash table, space complexity is O(n)
        Map<Integer, Integer> dic = new HashMap<>();
        // Single-layer loop, time complexity is O(n)
        for (int i = 0; i < size; i++) {
            if (dic.containsKey(target - nums[i])) {
                return new int[] { dic.get(target - nums[i]), i };
            }
            dic.put(nums[i], i);
        }
        return new int[0];
    }
    ```

=== "C#"

    ```csharp title="two_sum.cs"
    [class]{two_sum}-[func]{TwoSumHashTable}
    ```

=== "Go"

    ```go title="two_sum.go"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "Swift"

    ```swift title="two_sum.swift"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "JS"

    ```javascript title="two_sum.js"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "TS"

    ```typescript title="two_sum.ts"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "Dart"

    ```dart title="two_sum.dart"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "Rust"

    ```rust title="two_sum.rs"
    [class]{}-[func]{two_sum_hash_table}
    ```

=== "C"

    ```c title="two_sum.c"
    [class]{HashTable}-[func]{}

    [class]{}-[func]{twoSumHashTable}
    ```

=== "Kotlin"

    ```kotlin title="two_sum.kt"
    [class]{}-[func]{twoSumHashTable}
    ```

=== "Ruby"

    ```ruby title="two_sum.rb"
    [class]{}-[func]{two_sum_hash_table}
    ```

=== "Zig"

    ```zig title="two_sum.zig"
    [class]{}-[func]{twoSumHashTable}
    ```

This method reduces the time complexity from $O(n^2)$ to $O(n)$ by using hash search, significantly enhancing runtime efficiency.

As it requires maintaining an additional hash table, the space complexity is $O(n)$. **Nevertheless, this method has a more balanced time-space efficiency overall, making it the optimal solution for this problem**.
