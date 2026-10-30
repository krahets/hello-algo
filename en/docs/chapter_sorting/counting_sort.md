---
comments: true
---

# 11.9 &nbsp; Counting sort

<u>Counting sort</u> sorts by counting how often each element occurs. It is typically used for integer arrays.

## 11.9.1 &nbsp; A simple implementation

Start with a simple example: an array `nums` of length $n$ containing nonnegative integers. The overall process is shown below.

1. Traverse the array to find its maximum value, denoted by $m$, then create an auxiliary array `counter` of length $m + 1$.
2. **Use `counter` to count occurrences of each number in `nums`**. Here, `counter[num]` is the number of occurrences of `num`. Simply traverse `nums` and increment `counter[num]` by $1$ for each current value `num`.
3. **Because the indices of `counter` are inherently ordered, the numbers are effectively already sorted**. Traverse `counter` and write each number into `nums` in ascending order, repeating it according to its count.

![The counting sort process](counting_sort.assets/counting_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-16 &nbsp; The counting sort process </p>

The code is as follows:

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort_naive(nums: list[int]):
        """Counting sort"""
        # Simple implementation; cannot be used to sort objects
        # 1. Find the maximum array element m
        m = max(nums)
        # 2. Count the occurrences of each number
        # counter[num] is the number of occurrences of num
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. Traverse counter and fill the original array nums with the elements
        i = 0
        for num in range(m + 1):
            for _ in range(counter[num]):
                nums[i] = num
                i += 1
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* Counting sort */
    // Simple implementation; cannot be used to sort objects
    void countingSortNaive(vector<int> &nums) {
        // 1. Find the maximum array element m
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Traverse counter and fill the original array nums with the elements
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
    // Simple implementation; cannot be used to sort objects
    void countingSortNaive(int[] nums) {
        // 1. Find the maximum array element m
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Traverse counter and fill the original array nums with the elements
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
    // Simple implementation; cannot be used to sort objects
    void CountingSortNaive(int[] nums) {
        // 1. Find the maximum array element m
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Traverse counter and fill the original array nums with the elements
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
    // Simple implementation; cannot be used to sort objects
    func countingSortNaive(nums []int) {
        // 1. Find the maximum array element m
        m := 0
        for _, num := range nums {
            if num > m {
                m = num
            }
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        counter := make([]int, m+1)
        for _, num := range nums {
            counter[num]++
        }
        // 3. Traverse counter and fill the original array nums with the elements
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
    // Simple implementation; cannot be used to sort objects
    func countingSortNaive(nums: inout [Int]) {
        // 1. Find the maximum array element m
        let m = nums.max()!
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        var counter = Array(repeating: 0, count: m + 1)
        for num in nums {
            counter[num] += 1
        }
        // 3. Traverse counter and fill the original array nums with the elements
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
    // Simple implementation; cannot be used to sort objects
    function countingSortNaive(nums) {
        // 1. Find the maximum array element m
        let m = Math.max(...nums);
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        const counter = new Array(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. Traverse counter and fill the original array nums with the elements
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
    // Simple implementation; cannot be used to sort objects
    function countingSortNaive(nums: number[]): void {
        // 1. Find the maximum array element m
        let m: number = Math.max(...nums);
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        const counter: number[] = new Array<number>(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. Traverse counter and fill the original array nums with the elements
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
    // Simple implementation; cannot be used to sort objects
    void countingSortNaive(List<int> nums) {
      // 1. Find the maximum array element m
      int m = 0;
      for (int _num in nums) {
        m = max(m, _num);
      }
      // 2. Count the occurrences of each number
      // counter[_num] is the number of occurrences of _num
      List<int> counter = List.filled(m + 1, 0);
      for (int _num in nums) {
        counter[_num]++;
      }
      // 3. Traverse counter and fill the original array nums with the elements
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
    // Simple implementation; cannot be used to sort objects
    fn counting_sort_naive(nums: &mut [i32]) {
        // 1. Find the maximum array element m
        let m = *nums.iter().max().unwrap();
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        let mut counter = vec![0; m as usize + 1];
        for &num in nums.iter() {
            counter[num as usize] += 1;
        }
        // 3. Traverse counter and fill the original array nums with the elements
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
    // Simple implementation; cannot be used to sort objects
    void countingSortNaive(int nums[], int size) {
        // 1. Find the maximum array element m
        int m = 0;
        for (int i = 0; i < size; i++) {
            if (nums[i] > m) {
                m = nums[i];
            }
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        int *counter = calloc(m + 1, sizeof(int));
        for (int i = 0; i < size; i++) {
            counter[nums[i]]++;
        }
        // 3. Traverse counter and fill the original array nums with the elements
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
    // Simple implementation; cannot be used to sort objects
    fun countingSortNaive(nums: IntArray) {
        // 1. Find the maximum array element m
        var m = 0
        for (num in nums) {
            m = max(m, num)
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        val counter = IntArray(m + 1)
        for (num in nums) {
            counter[num]++
        }
        // 3. Traverse counter and fill the original array nums with the elements
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
      # Simple implementation; cannot be used to sort objects
      # 1. Find the maximum array element m
      m = 0
      nums.each { |num| m = [m, num].max }
      # 2. Count the occurrences of each number
      # counter[num] is the number of occurrences of num
      counter = Array.new(m + 1, 0)
      nums.each { |num| counter[num] += 1 }
      # 3. Traverse counter and fill the original array nums with the elements
      i = 0
      for num in 0...(m + 1)
        (0...counter[num]).each do
          nums[i] = num
          i += 1
        end
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort_naive%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Counting%20sort%22%22%22%0A%20%20%20%20%23%20Simple%20implementation%3B%20cannot%20be%20used%20to%20sort%20objects%0A%20%20%20%20%23%201.%20Find%20the%20maximum%20array%20element%20m%0A%20%20%20%20m%20%3D%200%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20max%28m,%20num%29%0A%20%20%20%20%23%202.%20Count%20the%20occurrences%20of%20each%20number%0A%20%20%20%20%23%20counter%5Bnum%5D%20is%20the%20number%20of%20occurrences%20of%20num%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20Traverse%20counter%20and%20fill%20the%20original%20array%20nums%20with%20the%20elements%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20num%20in%20range%28m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28counter%5Bnum%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort_naive%28nums%29%0A%20%20%20%20print%28f%22After%20counting%20sort%20%28without%20support%20for%20objects%29,%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort_naive%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Counting%20sort%22%22%22%0A%20%20%20%20%23%20Simple%20implementation%3B%20cannot%20be%20used%20to%20sort%20objects%0A%20%20%20%20%23%201.%20Find%20the%20maximum%20array%20element%20m%0A%20%20%20%20m%20%3D%200%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20max%28m,%20num%29%0A%20%20%20%20%23%202.%20Count%20the%20occurrences%20of%20each%20number%0A%20%20%20%20%23%20counter%5Bnum%5D%20is%20the%20number%20of%20occurrences%20of%20num%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20Traverse%20counter%20and%20fill%20the%20original%20array%20nums%20with%20the%20elements%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20num%20in%20range%28m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28counter%5Bnum%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort_naive%28nums%29%0A%20%20%20%20print%28f%22After%20counting%20sort%20%28without%20support%20for%20objects%29,%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

!!! note "How counting sort relates to bucket sort"

    From a bucket-sort perspective, each index of `counter` is a bucket, and counting occurrences is equivalent to distributing elements into their corresponding buckets. Counting sort is essentially a special case of bucket sort for integer data.

## 11.9.2 &nbsp; A complete implementation

You may have noticed that **step `3.` above fails when the input consists of objects**. Suppose the inputs are product objects and we want to sort them by price, a member variable of the class. The algorithm above can produce only the sorted prices.

How can we obtain the sorted original data? First, calculate the “prefix sums” of `counter`. The prefix sum `prefix[i]` is the sum of the array entries up to index `i`:

$$
\text{prefix}[i] = \sum_{j=0}^i \text{counter[j]}
$$

**The prefix sum has a precise meaning: `prefix[num] - 1` is the index of the last occurrence of `num` in the result array `res`**. This tells us where each element belongs. Next, traverse the original array `nums` in reverse and perform two steps for each element `num`.

1. Place `num` at index `prefix[num] - 1` in `res`.
2. Decrease `prefix[num]` by $1$ to obtain the index for placing the next occurrence of `num`.

After the traversal, `res` contains the sorted result. Finally, copy `res` over the original array `nums`. Figure 11-17 shows the complete process.

=== "<1>"
    ![Steps of counting sort](counting_sort.assets/counting_sort_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 11-17 &nbsp; Steps of counting sort </p>

The implementation is as follows:

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort(nums: list[int]):
        """Counting sort"""
        # Full implementation; stable and adaptable to sorting objects
        # 1. Find the maximum array element m
        m = max(nums)
        # 2. Count the occurrences of each number
        # counter[num] is the number of occurrences of num
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. Compute prefix sums of counter to convert occurrence counts into end positions
        # That is, counter[num]-1 is the index of the last occurrence of num in res
        for i in range(m):
            counter[i + 1] += counter[i]
        # 4. Traverse nums in reverse and place each element in the result array res
        # Initialize array res to store the result
        n = len(nums)
        res = [0] * n
        for i in range(n - 1, -1, -1):
            num = nums[i]
            res[counter[num] - 1] = num  # Place num at the corresponding index
            counter[num] -= 1  # Decrement the prefix sum by 1 to determine where to place the next occurrence of num
        # Overwrite the original array nums with the result array res
        for i in range(n):
            nums[i] = res[i]
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* Counting sort */
    // Stable implementation that can be adapted to sort objects
    void countingSort(vector<int> &nums) {
        // 1. Find the maximum array element m
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Compute prefix sums of counter to convert occurrence counts into end positions
        // That is, counter[num]-1 is the index of the last occurrence of num in res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse and place each element in the result array res
        // Initialize array res to store the result
        int n = nums.size();
        vector<int> res(n);
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--;              // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
        }
        // Overwrite the original array nums with the result array res
        nums = res;
    }
    ```

=== "Java"

    ```java title="counting_sort.java"
    /* Counting sort */
    // Full implementation; stable and adaptable to sorting objects
    void countingSort(int[] nums) {
        // 1. Find the maximum array element m
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. Compute prefix sums of counter to convert occurrence counts into end positions
        // That is, counter[num]-1 is the index of the last occurrence of num in res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse and place each element in the result array res
        // Initialize array res to store the result
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--; // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
        }
        // Overwrite the original array nums with the result array res
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "C#"

    ```csharp title="counting_sort.cs"
    /* Counting sort */
    // Full implementation; stable and adaptable to sorting objects
    void CountingSort(int[] nums) {
        // 1. Find the maximum array element m
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. Compute prefix sums of counter to convert occurrence counts into end positions
        // That is, counter[num]-1 is the index of the last occurrence of num in res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse and place each element in the result array res
        // Initialize array res to store the result
        int n = nums.Length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--; // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
        }
        // Overwrite the original array nums with the result array res
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "Go"

    ```go title="counting_sort.go"
    /* Counting sort */
    // Full implementation; stable and adaptable to sorting objects
    func countingSort(nums []int) {
        // 1. Find the maximum array element m
        m := 0
        for _, num := range nums {
            if num > m {
                m = num
            }
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        counter := make([]int, m+1)
        for _, num := range nums {
            counter[num]++
        }
        // 3. Compute prefix sums of counter to convert occurrence counts into end positions
        // That is, counter[num]-1 is the index of the last occurrence of num in res
        for i := 0; i < m; i++ {
            counter[i+1] += counter[i]
        }
        // 4. Traverse nums in reverse and place each element in the result array res
        // Initialize array res to store the result
        n := len(nums)
        res := make([]int, n)
        for i := n - 1; i >= 0; i-- {
            num := nums[i]
            // Place num at the corresponding index
            res[counter[num]-1] = num
            // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
            counter[num]--
        }
        // Overwrite the original array nums with the result array res
        copy(nums, res)
    }
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    /* Counting sort */
    // Full implementation; stable and adaptable to sorting objects
    func countingSort(nums: inout [Int]) {
        // 1. Find the maximum array element m
        let m = nums.max()!
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        var counter = Array(repeating: 0, count: m + 1)
        for num in nums {
            counter[num] += 1
        }
        // 3. Compute prefix sums of counter to convert occurrence counts into end positions
        // That is, counter[num]-1 is the index of the last occurrence of num in res
        for i in 0 ..< m {
            counter[i + 1] += counter[i]
        }
        // 4. Traverse nums in reverse and place each element in the result array res
        // Initialize array res to store the result
        var res = Array(repeating: 0, count: nums.count)
        for i in nums.indices.reversed() {
            let num = nums[i]
            res[counter[num] - 1] = num // Place num at the corresponding index
            counter[num] -= 1 // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
        }
        // Overwrite the original array nums with the result array res
        for i in nums.indices {
            nums[i] = res[i]
        }
    }
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    /* Counting sort */
    // Full implementation; stable and adaptable to sorting objects
    function countingSort(nums) {
        // 1. Find the maximum array element m
        let m = Math.max(...nums);
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        const counter = new Array(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. Compute prefix sums of counter to convert occurrence counts into end positions
        // That is, counter[num]-1 is the index of the last occurrence of num in res
        for (let i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse and place each element in the result array res
        // Initialize array res to store the result
        const n = nums.length;
        const res = new Array(n);
        for (let i = n - 1; i >= 0; i--) {
            const num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--; // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
        }
        // Overwrite the original array nums with the result array res
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    /* Counting sort */
    // Full stable implementation; this approach can be adapted to sort objects
    function countingSort(nums: number[]): void {
        // 1. Find the maximum array element m
        let m: number = Math.max(...nums);
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        const counter: number[] = new Array<number>(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. Compute prefix sums of counter to convert occurrence counts into end positions
        // That is, counter[num]-1 is the index of the last occurrence of num in res
        for (let i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse and place each element in the result array res
        // Initialize array res to store the result
        const n = nums.length;
        const res: number[] = new Array<number>(n);
        for (let i = n - 1; i >= 0; i--) {
            const num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--; // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
        }
        // Overwrite the original array nums with the result array res
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    /* Counting sort */
    // Full stable implementation; this approach can be adapted to sort objects
    void countingSort(List<int> nums) {
      // 1. Find the maximum array element m
      int m = 0;
      for (int _num in nums) {
        m = max(m, _num);
      }
      // 2. Count the occurrences of each number
      // counter[_num] is the number of occurrences of _num
      List<int> counter = List.filled(m + 1, 0);
      for (int _num in nums) {
        counter[_num]++;
      }
      // 3. Compute prefix sums of counter to convert occurrence counts into end positions
      // That is, counter[_num]-1 is the index of the last occurrence of _num in res
      for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
      }
      // 4. Traverse nums in reverse and place each element in the result array res
      // Initialize array res to store the result
      int n = nums.length;
      List<int> res = List.filled(n, 0);
      for (int i = n - 1; i >= 0; i--) {
        int _num = nums[i];
        res[counter[_num] - 1] = _num; // Place _num at the corresponding index
        counter[_num]--; // Decrement the prefix sum by 1 to determine where to place the next occurrence of _num
      }
      // Overwrite the original array nums with the result array res
      nums.setAll(0, res);
    }
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    /* Counting sort */
    // Stable implementation that can be adapted to sort objects
    fn counting_sort(nums: &mut [i32]) {
        // 1. Find the maximum array element m
        let m = *nums.iter().max().unwrap() as usize;
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        let mut counter = vec![0; m + 1];
        for &num in nums.iter() {
            counter[num as usize] += 1;
        }
        // 3. Compute prefix sums of counter to convert occurrence counts into end positions
        // That is, counter[num]-1 is the index of the last occurrence of num in res
        for i in 0..m {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse and place each element in the result array res
        // Initialize array res to store the result
        let n = nums.len();
        let mut res = vec![0; n];
        for i in (0..n).rev() {
            let num = nums[i];
            res[counter[num as usize] - 1] = num; // Place num at the corresponding index
            counter[num as usize] -= 1; // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
        }
        // Overwrite the original array nums with the result array res
        nums.copy_from_slice(&res)
    }
    ```

=== "C"

    ```c title="counting_sort.c"
    /* Counting sort */
    // Full, stable implementation; can be adapted to sort objects
    void countingSort(int nums[], int size) {
        // 1. Find the maximum array element m
        int m = 0;
        for (int i = 0; i < size; i++) {
            if (nums[i] > m) {
                m = nums[i];
            }
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        int *counter = calloc(m, sizeof(int));
        for (int i = 0; i < size; i++) {
            counter[nums[i]]++;
        }
        // 3. Compute prefix sums of counter to convert occurrence counts into end positions
        // That is, counter[num]-1 is the index of the last occurrence of num in res
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. Traverse nums in reverse and place each element in the result array res
        // Initialize array res to store the result
        int *res = malloc(sizeof(int) * size);
        for (int i = size - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // Place num at the corresponding index
            counter[num]--;              // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
        }
        // Overwrite the original array nums with the result array res
        memcpy(nums, res, size * sizeof(int));
        // 5. Free memory
        free(res);
        free(counter);
    }
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    /* Counting sort */
    // Full implementation; stable and adaptable to sorting objects
    fun countingSort(nums: IntArray) {
        // 1. Find the maximum array element m
        var m = 0
        for (num in nums) {
            m = max(m, num)
        }
        // 2. Count the occurrences of each number
        // counter[num] is the number of occurrences of num
        val counter = IntArray(m + 1)
        for (num in nums) {
            counter[num]++
        }
        // 3. Compute prefix sums of counter to convert occurrence counts into end positions
        // That is, counter[num]-1 is the index of the last occurrence of num in res
        for (i in 0..<m) {
            counter[i + 1] += counter[i]
        }
        // 4. Traverse nums in reverse and place each element in the result array res
        // Initialize array res to store the result
        val n = nums.size
        val res = IntArray(n)
        for (i in n - 1 downTo 0) {
            val num = nums[i]
            res[counter[num] - 1] = num // Place num at the corresponding index
            counter[num]-- // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
        }
        // Overwrite the original array nums with the result array res
        for (i in 0..<n) {
            nums[i] = res[i]
        }
    }
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    ### Counting sort ###
    def counting_sort(nums)
      # Full, stable implementation; the approach can be adapted to sort objects
      # 1. Find the maximum array element m
      m = nums.max
      # 2. Count the occurrences of each number
      # counter[num] is the number of occurrences of num
      counter = Array.new(m + 1, 0)
      nums.each { |num| counter[num] += 1 }
      # 3. Compute prefix sums of counter to convert occurrence counts into end positions
      # That is, counter[num]-1 is the index of the last occurrence of num in res
      (0...m).each { |i| counter[i + 1] += counter[i] }
      # 4. Traverse nums in reverse and place each element in the result array res
      # Initialize array res to store the result
      n = nums.length
      res = Array.new(n, 0)
      (n - 1).downto(0).each do |i|
        num = nums[i]
        res[counter[num] - 1] = num # Place num at the corresponding index
        counter[num] -= 1 # Decrement the prefix sum by 1 to determine where to place the next occurrence of num
      end
      # Overwrite the original array nums with the result array res
      (0...n).each { |i| nums[i] = res[i] }
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Counting%20sort%22%22%22%0A%20%20%20%20%23%20Full%20implementation%3B%20stable%20and%20adaptable%20to%20sorting%20objects%0A%20%20%20%20%23%201.%20Find%20the%20maximum%20array%20element%20m%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%202.%20Count%20the%20occurrences%20of%20each%20number%0A%20%20%20%20%23%20counter%5Bnum%5D%20is%20the%20number%20of%20occurrences%20of%20num%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20Compute%20prefix%20sums%20of%20counter%20to%20convert%20occurrence%20counts%20into%20end%20positions%0A%20%20%20%20%23%20That%20is,%20counter%5Bnum%5D-1%20is%20the%20index%20of%20the%20last%20occurrence%20of%20num%20in%20res%0A%20%20%20%20for%20i%20in%20range%28m%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%20%2B%201%5D%20%2B%3D%20counter%5Bi%5D%0A%20%20%20%20%23%204.%20Traverse%20nums%20in%20reverse%20and%20place%20each%20element%20in%20the%20result%20array%20res%0A%20%20%20%20%23%20Initialize%20array%20res%20to%20store%20the%20result%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20res%5Bcounter%5Bnum%5D%20-%201%5D%20%3D%20num%20%20%23%20Place%20num%20at%20the%20corresponding%20index%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20-%3D%201%20%20%23%20Decrement%20the%20prefix%20sum%20by%201%20to%20determine%20where%20to%20place%20the%20next%20occurrence%20of%20num%0A%20%20%20%20%23%20Overwrite%20the%20original%20array%20nums%20with%20the%20result%20array%20res%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort%28nums%29%0A%20%20%20%20print%28f%22After%20counting%20sort,%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Counting%20sort%22%22%22%0A%20%20%20%20%23%20Full%20implementation%3B%20stable%20and%20adaptable%20to%20sorting%20objects%0A%20%20%20%20%23%201.%20Find%20the%20maximum%20array%20element%20m%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%202.%20Count%20the%20occurrences%20of%20each%20number%0A%20%20%20%20%23%20counter%5Bnum%5D%20is%20the%20number%20of%20occurrences%20of%20num%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20Compute%20prefix%20sums%20of%20counter%20to%20convert%20occurrence%20counts%20into%20end%20positions%0A%20%20%20%20%23%20That%20is,%20counter%5Bnum%5D-1%20is%20the%20index%20of%20the%20last%20occurrence%20of%20num%20in%20res%0A%20%20%20%20for%20i%20in%20range%28m%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%20%2B%201%5D%20%2B%3D%20counter%5Bi%5D%0A%20%20%20%20%23%204.%20Traverse%20nums%20in%20reverse%20and%20place%20each%20element%20in%20the%20result%20array%20res%0A%20%20%20%20%23%20Initialize%20array%20res%20to%20store%20the%20result%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20res%5Bcounter%5Bnum%5D%20-%201%5D%20%3D%20num%20%20%23%20Place%20num%20at%20the%20corresponding%20index%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20-%3D%201%20%20%23%20Decrement%20the%20prefix%20sum%20by%201%20to%20determine%20where%20to%20place%20the%20next%20occurrence%20of%20num%0A%20%20%20%20%23%20Overwrite%20the%20original%20array%20nums%20with%20the%20result%20array%20res%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort%28nums%29%0A%20%20%20%20print%28f%22After%20counting%20sort,%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 11.9.3 &nbsp; Algorithm properties

- **Time complexity: $O(n + m)$; not adaptive**. Traversing `nums` and `counter` each takes linear time. Usually $n \gg m$, so the complexity approaches $O(n)$.
- **Space complexity: $O(n + m)$; not in-place**. The algorithm uses arrays `res` and `counter` of lengths $n$ and $m$, respectively.
- **Stable**. Since elements are placed into `res` from right to left, traversing `nums` in reverse preserves the relative order of equal elements. A forward traversal also produces a correctly sorted result, but it is not stable.

## 11.9.4 &nbsp; Limitations

Counting sort may seem ingenious: it sorts efficiently simply by counting occurrences. However, its prerequisites are relatively restrictive.

**Counting sort applies only to nonnegative integers**. For other data types, the values must be convertible to nonnegative integers without changing their relative order. For example, if an integer array contains negative numbers, add a constant to every element to make them all positive, sort, and then reverse the transformation.

**Counting sort suits large datasets with a relatively small value range**. In the example above, $m$ must not be too large, or the algorithm will consume excessive space. When $n \ll m$, counting sort takes $O(m)$ time and may be slower than an $O(n \log n)$ sorting algorithm.
