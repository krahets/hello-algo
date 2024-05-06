---
comments: true
---

# 11.9 &nbsp; Counting sort

<u>Counting sort</u> achieves sorting by counting the number of elements, typically applied to arrays of integers.

## 11.9.1 &nbsp; Simple implementation

Let's start with a simple example. Given an array `nums` of length $n$, where all elements are "non-negative integers", the overall process of counting sort is illustrated in Figure 11-16.

1. Traverse the array to find the maximum number, denoted as $m$, then create an auxiliary array `counter` of length $m + 1$.
2. **Use `counter` to count the occurrence of each number in `nums`**, where `counter[num]` corresponds to the occurrence of the number `num`. The counting method is simple, just traverse `nums` (suppose the current number is `num`), and increase `counter[num]` by $1$ each round.
3. **Since the indices of `counter` are naturally ordered, all numbers are essentially sorted already**. Next, we traverse `counter`, filling `nums` in ascending order of occurrence.

![Counting sort process](counting_sort.assets/counting_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-16 &nbsp; Counting sort process </p>

The code is shown below:

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort_naive(nums: list[int]):
        """Counting sort"""
        # Simple implementation, cannot be used for sorting objects
        # 1. Count the maximum element m in the array
        m = 0
        for num in nums:
            m = max(m, num)
        # 2. Count the occurrence of each digit
        # counter[num] represents the occurrence of num
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. Traverse counter, filling each element back into the original array nums
        i = 0
        for num in range(m + 1):
            for _ in range(counter[num]):
                nums[i] = num
                i += 1
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* Counting sort */
    // Simple implementation, cannot be used for sorting objects
    void countingSortNaive(vector<int> &nums) {
        // 1. Count the maximum element m in the array
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. Count the occurrence of each digit
        // counter[num] represents the occurrence of num
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Traverse counter, filling each element back into the original array nums
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "Java"

    ```java title="counting_sort.java"
    /* Counting sort */
    // Simple implementation, cannot be used for sorting objects
    void countingSortNaive(int[] nums) {
        // 1. Count the maximum element m in the array
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. Count the occurrence of each digit
        // counter[num] represents the occurrence of num
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Traverse counter, filling each element back into the original array nums
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "C#"

    ```csharp title="counting_sort.cs"
    [class]{counting_sort}-[func]{CountingSortNaive}
    ```

=== "Go"

    ```go title="counting_sort.go"
    [class]{}-[func]{countingSortNaive}
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    [class]{}-[func]{countingSortNaive}
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    [class]{}-[func]{countingSortNaive}
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    [class]{}-[func]{countingSortNaive}
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    [class]{}-[func]{countingSortNaive}
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    [class]{}-[func]{counting_sort_naive}
    ```

=== "C"

    ```c title="counting_sort.c"
    [class]{}-[func]{countingSortNaive}
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    [class]{}-[func]{countingSortNaive}
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    [class]{}-[func]{counting_sort_naive}
    ```

=== "Zig"

    ```zig title="counting_sort.zig"
    [class]{}-[func]{countingSortNaive}
    ```

!!! note "Connection between counting sort and bucket sort"

    From the perspective of bucket sort, we can consider each index of the counting array `counter` in counting sort as a bucket, and the process of counting as distributing elements into the corresponding buckets. Essentially, counting sort is a special case of bucket sort for integer data.

## 11.9.2 &nbsp; Complete implementation

Astute readers might have noticed, **if the input data is an object, the above step `3.` becomes ineffective**. Suppose the input data is a product object, we want to sort the products by their price (a class member variable), but the above algorithm can only provide the sorting result for the price.

So how can we get the sorting result for the original data? First, we calculate the "prefix sum" of `counter`. As the name suggests, the prefix sum at index `i`, `prefix[i]`, equals the sum of the first `i` elements of the array:

$$
\text{prefix}[i] = \sum_{j=0}^i \text{counter[j]}
$$

**The prefix sum has a clear meaning, `prefix[num] - 1` represents the last occurrence index of element `num` in the result array `res`**. This information is crucial, as it tells us where each element should appear in the result array. Next, we traverse the original array `nums` for each element `num` in reverse order, performing the following two steps in each iteration.

1. Fill `num` into the array `res` at the index `prefix[num] - 1`.
2. Reduce the prefix sum `prefix[num]` by $1$, thus obtaining the next index to place `num`.

After the traversal, the array `res` contains the sorted result, and finally, `res` replaces the original array `nums`. The complete counting sort process is shown in Figure 11-17.

=== "<1>"
    ![Counting sort process](counting_sort.assets/counting_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![counting_sort_step2](counting_sort.assets/counting_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![counting_sort_step3](counting_sort.assets/counting_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![counting_sort_step4](counting_sort.assets/counting_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![counting_sort_step5](counting_sort.assets/counting_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![counting_sort_step6](counting_sort.assets/counting_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![counting_sort_step7](counting_sort.assets/counting_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![counting_sort_step8](counting_sort.assets/counting_sort_step8.png){ class="animation-figure" }

<p align="center"> Figure 11-17 &nbsp; Counting sort process </p>

The implementation code of counting sort is shown below:

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort(nums: list[int]):
        """Counting sort"""
        # Complete implementation, can sort objects and is a stable sort
        # 1. Count the maximum element m in the array
        m = max(nums)
        # 2. Count the occurrence of each digit
        # counter[num] represents the occurrence of num
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
        # counter[num]-1 is the last index where num appears in res
        for i in range(m):
            counter[i + 1] += counter[i]
        # 4. Traverse nums in reverse order, placing each element into the result array res
        # Initialize the array res to record results
        n = len(nums)
        res = [0] * n
        for i in range(n - 1, -1, -1):
            num = nums[i]
            res[counter[num] - 1] = num  # Place num at the corresponding index
            counter[num] -= 1  # Decrement the prefix sum by 1, getting the next index to place num
        # Use result array res to overwrite the original array nums
        for i in range(n):
            nums[i] = res[i]
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* Counting sort */
    // Complete implementation, can sort objects and is a stable sort
    void countingSort(vector<int> &nums) {
        // 1. Count the maximum element m in the array
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. Count the occurrence of each digit
        // counter[num] represents the occurrence of num
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
        // counter[num]-1 is the last index where num appears in res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse order, placing each element into the result array res
        // Initialize the array res to record results
        int n = nums.size();
        vector<int> res(n);
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--;              // Decrement the prefix sum by 1, getting the next index to place num
        }
        // Use result array res to overwrite the original array nums
        nums = res;
    }
    ```

=== "Java"

    ```java title="counting_sort.java"
    /* Counting sort */
    // Complete implementation, can sort objects and is a stable sort
    void countingSort(int[] nums) {
        // 1. Count the maximum element m in the array
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. Count the occurrence of each digit
        // counter[num] represents the occurrence of num
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
        // counter[num]-1 is the last index where num appears in res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse order, placing each element into the result array res
        // Initialize the array res to record results
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--; // Decrement the prefix sum by 1, getting the next index to place num
        }
        // Use result array res to overwrite the original array nums
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "C#"

    ```csharp title="counting_sort.cs"
    [class]{counting_sort}-[func]{CountingSort}
    ```

=== "Go"

    ```go title="counting_sort.go"
    [class]{}-[func]{countingSort}
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    [class]{}-[func]{countingSort}
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    [class]{}-[func]{countingSort}
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    [class]{}-[func]{countingSort}
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    [class]{}-[func]{countingSort}
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    [class]{}-[func]{counting_sort}
    ```

=== "C"

    ```c title="counting_sort.c"
    [class]{}-[func]{countingSort}
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    [class]{}-[func]{countingSort}
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    [class]{}-[func]{counting_sort}
    ```

=== "Zig"

    ```zig title="counting_sort.zig"
    [class]{}-[func]{countingSort}
    ```

## 11.9.3 &nbsp; Algorithm characteristics

- **Time complexity is $O(n + m)$, non-adaptive sort**: Involves traversing `nums` and `counter`, both using linear time. Generally, $n \gg m$, and the time complexity tends towards $O(n)$.
- **Space complexity is $O(n + m)$, non-in-place sort**: Utilizes arrays `res` and `counter` of lengths $n$ and $m$ respectively.
- **Stable sort**: Since elements are filled into `res` in a "right-to-left" order, reversing the traversal of `nums` can prevent changing the relative position between equal elements, thereby achieving a stable sort. Actually, traversing `nums` in order can also produce the correct sorting result, but the outcome is unstable.

## 11.9.4 &nbsp; Limitations

By now, you might find counting sort very clever, as it can achieve efficient sorting merely by counting quantities. However, the prerequisites for using counting sort are relatively strict.

**Counting sort is only suitable for non-negative integers**. If you want to apply it to other types of data, you need to ensure that these data can be converted to non-negative integers without changing the relative sizes of the elements. For example, for an array containing negative integers, you can first add a constant to all numbers, converting them all to positive numbers, and then convert them back after sorting is complete.

**Counting sort is suitable for large data volumes but small data ranges**. For example, in the above example, $m$ should not be too large, otherwise, it will occupy too much space. And when $n \ll m$, counting sort uses $O(m)$ time, which may be slower than $O(n \log n)$ sorting algorithms.
