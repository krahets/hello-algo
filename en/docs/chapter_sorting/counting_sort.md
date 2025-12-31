---
comments: true
---

# 11.9 &nbsp; Counting Sort

<u>Counting sort (counting sort)</u> achieves sorting by counting the number of elements, typically applied to integer arrays.

## 11.9.1 &nbsp; Simple Implementation

Let's start with a simple example. Given an array `nums` of length $n$, where the elements are all "non-negative integers", the overall flow of counting sort is shown in Figure 11-16.

1. Traverse the array to find the largest number, denoted as $m$, and then create an auxiliary array `counter` of length $m + 1$.
2. **Use `counter` to count the number of occurrences of each number in `nums`**, where `counter[num]` corresponds to the number of occurrences of the number `num`. The counting method is simple: just traverse `nums` (let the current number be `num`), and increase `counter[num]` by $1$ in each round.
3. **Since each index of `counter` is naturally ordered, this is equivalent to all numbers being sorted**. Next, we traverse `counter` and fill in `nums` in ascending order based on the number of occurrences of each number.

![Counting sort flow](counting_sort.assets/counting_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-16 &nbsp; Counting sort flow </p>

The code is as follows:

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort_naive(nums: list[int]):
        """Counting sort"""
        # Simple implementation, cannot be used for sorting objects
        # 1. Count the maximum element m in the array
        m = 0
        for num in nums:
            m = max(m, num)
        # 2. Count the occurrence of each number
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
        // 2. Count the occurrence of each number
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
        // 2. Count the occurrence of each number
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
    /* Counting sort */
    // Simple implementation, cannot be used for sorting objects
    void CountingSortNaive(int[] nums) {
        // 1. Count the maximum element m in the array
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
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

=== "Go"

    ```go title="counting_sort.go"
    /* Counting sort */
    // Simple implementation, cannot be used for sorting objects
    func countingSortNaive(nums []int) {
        // 1. Count the maximum element m in the array
        m := 0
        for _, num := range nums {
            if num > m {
                m = num
            }
        }
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        counter := make([]int, m+1)
        for _, num := range nums {
            counter[num]++
        }
        // 3. Traverse counter, filling each element back into the original array nums
        for i, num := 0, 0; num < m+1; num++ {
            for j := 0; j < counter[num]; j++ {
                nums[i] = num
                i++
            }
        }
    }
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    /* Counting sort */
    // Simple implementation, cannot be used for sorting objects
    func countingSortNaive(nums: inout [Int]) {
        // 1. Count the maximum element m in the array
        let m = nums.max()!
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        var counter = Array(repeating: 0, count: m + 1)
        for num in nums {
            counter[num] += 1
        }
        // 3. Traverse counter, filling each element back into the original array nums
        var i = 0
        for num in 0 ..< m + 1 {
            for _ in 0 ..< counter[num] {
                nums[i] = num
                i += 1
            }
        }
    }
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    /* Counting sort */
    // Simple implementation, cannot be used for sorting objects
    function countingSortNaive(nums) {
        // 1. Count the maximum element m in the array
        let m = Math.max(...nums);
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        const counter = new Array(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. Traverse counter, filling each element back into the original array nums
        let i = 0;
        for (let num = 0; num < m + 1; num++) {
            for (let j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    /* Counting sort */
    // Simple implementation, cannot be used for sorting objects
    function countingSortNaive(nums: number[]): void {
        // 1. Count the maximum element m in the array
        let m: number = Math.max(...nums);
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        const counter: number[] = new Array<number>(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. Traverse counter, filling each element back into the original array nums
        let i = 0;
        for (let num = 0; num < m + 1; num++) {
            for (let j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    /* Counting sort */
    // Simple implementation, cannot be used for sorting objects
    void countingSortNaive(List<int> nums) {
      // 1. Count the maximum element m in the array
      int m = 0;
      for (int _num in nums) {
        m = max(m, _num);
      }
      // 2. Count the occurrence of each number
      // counter[_num] represents occurrence count of _num
      List<int> counter = List.filled(m + 1, 0);
      for (int _num in nums) {
        counter[_num]++;
      }
      // 3. Traverse counter, filling each element back into the original array nums
      int i = 0;
      for (int _num = 0; _num < m + 1; _num++) {
        for (int j = 0; j < counter[_num]; j++, i++) {
          nums[i] = _num;
        }
      }
    }
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    /* Counting sort */
    // Simple implementation, cannot be used for sorting objects
    fn counting_sort_naive(nums: &mut [i32]) {
        // 1. Count the maximum element m in the array
        let m = *nums.iter().max().unwrap();
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        let mut counter = vec![0; m as usize + 1];
        for &num in nums.iter() {
            counter[num as usize] += 1;
        }
        // 3. Traverse counter, filling each element back into the original array nums
        let mut i = 0;
        for num in 0..m + 1 {
            for _ in 0..counter[num as usize] {
                nums[i] = num;
                i += 1;
            }
        }
    }
    ```

=== "C"

    ```c title="counting_sort.c"
    /* Counting sort */
    // Simple implementation, cannot be used for sorting objects
    void countingSortNaive(int nums[], int size) {
        // 1. Count the maximum element m in the array
        int m = 0;
        for (int i = 0; i < size; i++) {
            if (nums[i] > m) {
                m = nums[i];
            }
        }
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        int *counter = calloc(m + 1, sizeof(int));
        for (int i = 0; i < size; i++) {
            counter[nums[i]]++;
        }
        // 3. Traverse counter, filling each element back into the original array nums
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
        // 4. Free memory
        free(counter);
    }
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    /* Counting sort */
    // Simple implementation, cannot be used for sorting objects
    fun countingSortNaive(nums: IntArray) {
        // 1. Count the maximum element m in the array
        var m = 0
        for (num in nums) {
            m = max(m, num)
        }
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        val counter = IntArray(m + 1)
        for (num in nums) {
            counter[num]++
        }
        // 3. Traverse counter, filling each element back into the original array nums
        var i = 0
        for (num in 0..<m + 1) {
            var j = 0
            while (j < counter[num]) {
                nums[i] = num
                j++
                i++
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    ### Counting sort ###
    def counting_sort_naive(nums)
      # Simple implementation, cannot be used for sorting objects
      # 1. Count the maximum element m in the array
      m = 0
      nums.each { |num| m = [m, num].max }
      # 2. Count the occurrence of each number
      # counter[num] represents the occurrence of num
      counter = Array.new(m + 1, 0)
      nums.each { |num| counter[num] += 1 }
      # 3. Traverse counter, filling each element back into the original array nums
      i = 0
      for num in 0...(m + 1)
        (0...counter[num]).each do
          nums[i] = num
          i += 1
        end
      end
    end
    ```

!!! note "Connection between counting sort and bucket sort"

    From the perspective of bucket sort, we can regard each index of the counting array `counter` in counting sort as a bucket, and the process of counting quantities as distributing each element to the corresponding bucket. Essentially, counting sort is a special case of bucket sort for integer data.

## 11.9.2 &nbsp; Complete Implementation

Observant readers may have noticed that **if the input data is objects, step `3.` above becomes invalid**. Suppose the input data is product objects, and we want to sort the products by price (a member variable of the class), but the above algorithm can only give the sorting result of prices.

So how can we obtain the sorting result of the original data? We first calculate the "prefix sum" of `counter`. As the name suggests, the prefix sum at index `i`, `prefix[i]`, equals the sum of the first `i` elements of the array:

$$
\text{prefix}[i] = \sum_{j=0}^i \text{counter[j]}
$$

**The prefix sum has a clear meaning: `prefix[num] - 1` represents the index of the last occurrence of element `num` in the result array `res`**. This information is very critical because it tells us where each element should appear in the result array. Next, we traverse each element `num` of the original array `nums` in reverse order, performing the following two steps in each iteration.

1. Fill `num` into the array `res` at index `prefix[num] - 1`.
2. Decrease the prefix sum `prefix[num]` by $1$ to get the index for the next placement of `num`.

After the traversal is complete, the array `res` contains the sorted result, and finally `res` is used to overwrite the original array `nums`. The complete counting sort flow is shown in Figure 11-17.

=== "<1>"
    ![Counting sort steps](counting_sort.assets/counting_sort_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 11-17 &nbsp; Counting sort steps </p>

The implementation code of counting sort is as follows:

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort(nums: list[int]):
        """Counting sort"""
        # Complete implementation, can sort objects and is a stable sort
        # 1. Count the maximum element m in the array
        m = max(nums)
        # 2. Count the occurrence of each number
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
        // 2. Count the occurrence of each number
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
        // 2. Count the occurrence of each number
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
    /* Counting sort */
    // Complete implementation, can sort objects and is a stable sort
    void CountingSort(int[] nums) {
        // 1. Count the maximum element m in the array
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
        // counter[num]-1 is the last index where num appears in res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse order, placing each element into the result array res
        // Initialize the array res to record results
        int n = nums.Length;
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

=== "Go"

    ```go title="counting_sort.go"
    /* Counting sort */
    // Complete implementation, can sort objects and is a stable sort
    func countingSort(nums []int) {
        // 1. Count the maximum element m in the array
        m := 0
        for _, num := range nums {
            if num > m {
                m = num
            }
        }
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        counter := make([]int, m+1)
        for _, num := range nums {
            counter[num]++
        }
        // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
        // counter[num]-1 is the last index where num appears in res
        for i := 0; i < m; i++ {
            counter[i+1] += counter[i]
        }
        // 4. Traverse nums in reverse order, placing each element into the result array res
        // Initialize the array res to record results
        n := len(nums)
        res := make([]int, n)
        for i := n - 1; i >= 0; i-- {
            num := nums[i]
            // Place num at the corresponding index
            res[counter[num]-1] = num
            // Decrement the prefix sum by 1, getting the next index to place num
            counter[num]--
        }
        // Use result array res to overwrite the original array nums
        copy(nums, res)
    }
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    /* Counting sort */
    // Complete implementation, can sort objects and is a stable sort
    func countingSort(nums: inout [Int]) {
        // 1. Count the maximum element m in the array
        let m = nums.max()!
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        var counter = Array(repeating: 0, count: m + 1)
        for num in nums {
            counter[num] += 1
        }
        // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
        // counter[num]-1 is the last index where num appears in res
        for i in 0 ..< m {
            counter[i + 1] += counter[i]
        }
        // 4. Traverse nums in reverse order, placing each element into the result array res
        // Initialize the array res to record results
        var res = Array(repeating: 0, count: nums.count)
        for i in nums.indices.reversed() {
            let num = nums[i]
            res[counter[num] - 1] = num // Place num at the corresponding index
            counter[num] -= 1 // Decrement the prefix sum by 1, getting the next index to place num
        }
        // Use result array res to overwrite the original array nums
        for i in nums.indices {
            nums[i] = res[i]
        }
    }
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    /* Counting sort */
    // Complete implementation, can sort objects and is a stable sort
    function countingSort(nums) {
        // 1. Count the maximum element m in the array
        let m = Math.max(...nums);
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        const counter = new Array(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
        // counter[num]-1 is the last index where num appears in res
        for (let i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse order, placing each element into the result array res
        // Initialize the array res to record results
        const n = nums.length;
        const res = new Array(n);
        for (let i = n - 1; i >= 0; i--) {
            const num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--; // Decrement the prefix sum by 1, getting the next index to place num
        }
        // Use result array res to overwrite the original array nums
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    /* Counting sort */
    // Complete implementation, can sort objects and is a stable sort
    function countingSort(nums: number[]): void {
        // 1. Count the maximum element m in the array
        let m: number = Math.max(...nums);
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        const counter: number[] = new Array<number>(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
        // counter[num]-1 is the last index where num appears in res
        for (let i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse order, placing each element into the result array res
        // Initialize the array res to record results
        const n = nums.length;
        const res: number[] = new Array<number>(n);
        for (let i = n - 1; i >= 0; i--) {
            const num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--; // Decrement the prefix sum by 1, getting the next index to place num
        }
        // Use result array res to overwrite the original array nums
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    /* Counting sort */
    // Complete implementation, can sort objects and is a stable sort
    void countingSort(List<int> nums) {
      // 1. Count the maximum element m in the array
      int m = 0;
      for (int _num in nums) {
        m = max(m, _num);
      }
      // 2. Count the occurrence of each number
      // counter[_num] represents occurrence count of _num
      List<int> counter = List.filled(m + 1, 0);
      for (int _num in nums) {
        counter[_num]++;
      }
      // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
      // That is, counter[_num]-1 is the last occurrence index of _num in res
      for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
      }
      // 4. Traverse nums in reverse order, placing each element into the result array res
      // Initialize the array res to record results
      int n = nums.length;
      List<int> res = List.filled(n, 0);
      for (int i = n - 1; i >= 0; i--) {
        int _num = nums[i];
        res[counter[_num] - 1] = _num; // Place _num at corresponding index
        counter[_num]--; // Decrement prefix sum by 1 to get next placement index for _num
      }
      // Use result array res to overwrite the original array nums
      nums.setAll(0, res);
    }
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    /* Counting sort */
    // Complete implementation, can sort objects and is a stable sort
    fn counting_sort(nums: &mut [i32]) {
        // 1. Count the maximum element m in the array
        let m = *nums.iter().max().unwrap() as usize;
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        let mut counter = vec![0; m + 1];
        for &num in nums.iter() {
            counter[num as usize] += 1;
        }
        // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
        // counter[num]-1 is the last index where num appears in res
        for i in 0..m {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse order, placing each element into the result array res
        // Initialize the array res to record results
        let n = nums.len();
        let mut res = vec![0; n];
        for i in (0..n).rev() {
            let num = nums[i];
            res[counter[num as usize] - 1] = num; // Place num at the corresponding index
            counter[num as usize] -= 1; // Decrement the prefix sum by 1, getting the next index to place num
        }
        // Use result array res to overwrite the original array nums
        nums.copy_from_slice(&res)
    }
    ```

=== "C"

    ```c title="counting_sort.c"
    /* Counting sort */
    // Complete implementation, can sort objects and is a stable sort
    void countingSort(int nums[], int size) {
        // 1. Count the maximum element m in the array
        int m = 0;
        for (int i = 0; i < size; i++) {
            if (nums[i] > m) {
                m = nums[i];
            }
        }
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        int *counter = calloc(m, sizeof(int));
        for (int i = 0; i < size; i++) {
            counter[nums[i]]++;
        }
        // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
        // counter[num]-1 is the last index where num appears in res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse order, placing each element into the result array res
        // Initialize the array res to record results
        int *res = malloc(sizeof(int) * size);
        for (int i = size - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--;              // Decrement the prefix sum by 1, getting the next index to place num
        }
        // Use result array res to overwrite the original array nums
        memcpy(nums, res, size * sizeof(int));
        // 5. Free memory
        free(res);
        free(counter);
    }
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    /* Counting sort */
    // Complete implementation, can sort objects and is a stable sort
    fun countingSort(nums: IntArray) {
        // 1. Count the maximum element m in the array
        var m = 0
        for (num in nums) {
            m = max(m, num)
        }
        // 2. Count the occurrence of each number
        // counter[num] represents the occurrence of num
        val counter = IntArray(m + 1)
        for (num in nums) {
            counter[num]++
        }
        // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
        // counter[num]-1 is the last index where num appears in res
        for (i in 0..<m) {
            counter[i + 1] += counter[i]
        }
        // 4. Traverse nums in reverse order, placing each element into the result array res
        // Initialize the array res to record results
        val n = nums.size
        val res = IntArray(n)
        for (i in n - 1 downTo 0) {
            val num = nums[i]
            res[counter[num] - 1] = num // Place num at the corresponding index
            counter[num]-- // Decrement the prefix sum by 1, getting the next index to place num
        }
        // Use result array res to overwrite the original array nums
        for (i in 0..<n) {
            nums[i] = res[i]
        }
    }
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    ### Counting sort ###
    def counting_sort(nums)
      # Complete implementation, can sort objects and is a stable sort
      # 1. Count the maximum element m in the array
      m = nums.max
      # 2. Count the occurrence of each number
      # counter[num] represents the occurrence of num
      counter = Array.new(m + 1, 0)
      nums.each { |num| counter[num] += 1 }
      # 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
      # counter[num]-1 is the last index where num appears in res
      (0...m).each { |i| counter[i + 1] += counter[i] }
      # 4. Traverse nums in reverse, fill elements into result array res
      # Initialize the array res to record results
      n = nums.length
      res = Array.new(n, 0)
      (n - 1).downto(0).each do |i|
        num = nums[i]
        res[counter[num] - 1] = num # Place num at the corresponding index
        counter[num] -= 1 # Decrement the prefix sum by 1, getting the next index to place num
      end
      # Use result array res to overwrite the original array nums
      (0...n).each { |i| nums[i] = res[i] }
    end
    ```

## 11.9.3 &nbsp; Algorithm Characteristics

- **Time complexity of $O(n + m)$, non-adaptive sorting**: Involves traversing `nums` and traversing `counter`, both using linear time. Generally, $n \gg m$, and time complexity tends toward $O(n)$.
- **Space complexity of $O(n + m)$, non-in-place sorting**: Uses arrays `res` and `counter` of lengths $n$ and $m$ respectively.
- **Stable sorting**: Since elements are filled into `res` in a "right-to-left" order, traversing `nums` in reverse can avoid changing the relative positions of equal elements, thereby achieving stable sorting. In fact, traversing `nums` in forward order can also yield correct sorting results, but the result would be unstable.

## 11.9.4 &nbsp; Limitations

By this point, you might think counting sort is very clever, as it can achieve efficient sorting just by counting quantities. However, the prerequisites for using counting sort are relatively strict.

**Counting sort is only suitable for non-negative integers**. If you want to apply it to other types of data, you need to ensure that the data can be converted to non-negative integers without changing the relative size relationships between elements. For example, for an integer array containing negative numbers, you can first add a constant to all numbers to convert them all to positive numbers, and then convert them back after sorting is complete.

**Counting sort is suitable for situations where the data volume is large but the data range is small**. For example, in the above example, $m$ cannot be too large, otherwise it will occupy too much space. And when $n \ll m$, counting sort uses $O(m)$ time, which may be slower than $O(n \log n)$ sorting algorithms.
