---
comments: true
---

# 11.9 &nbsp; Counting sort

<u>Counting sort</u> achieves sorting by counting the number of elements, typically applied to arrays of integers.

## 11.9.1 &nbsp; Simple implementation

Let's start with a simple example. Given an array `nums` of length $n$, where all elements are "non-negative integers", the overall process of counting sort is illustrated in the following diagram.

1. Traverse the array to find the maximum number, denoted as $m$, then create an auxiliary array `counter` of length $m + 1$.
2. **Use `counter` to count the occurrence of each number in `nums`**, where `counter[num]` corresponds to the occurrence of the number `num`. The counting method is simple, just traverse `nums` (suppose the current number is `num`), and increase `counter[num]` by $1$ each round.
3. **Since the indices of `counter` are naturally ordered, all numbers are essentially sorted already**. Next, we traverse `counter`, filling `nums` in ascending order of occurrence.

![Counting sort process](counting_sort.assets/counting_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-16 &nbsp; Counting sort process </p>

The code is shown below:

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort_naive(nums: list[int]):
        """计数排序"""
        # 简单实现，无法用于排序对象
        # 1. 统计数组最大元素 m
        m = 0
        for num in nums:
            m = max(m, num)
        # 2. 统计各数字的出现次数
        # counter[num] 代表 num 的出现次数
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. 遍历 counter ，将各元素填入原数组 nums
        i = 0
        for num in range(m + 1):
            for _ in range(counter[num]):
                nums[i] = num
                i += 1
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* 计数排序 */
    // 简单实现，无法用于排序对象
    void countingSortNaive(vector<int> &nums) {
        // 1. 统计数组最大元素 m
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. 遍历 counter ，将各元素填入原数组 nums
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
    /* 计数排序 */
    // 简单实现，无法用于排序对象
    void countingSortNaive(int[] nums) {
        // 1. 统计数组最大元素 m
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. 遍历 counter ，将各元素填入原数组 nums
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
    /* 计数排序 */
    // 简单实现，无法用于排序对象
    void CountingSortNaive(int[] nums) {
        // 1. 统计数组最大元素 m
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. 遍历 counter ，将各元素填入原数组 nums
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
    /* 计数排序 */
    // 简单实现，无法用于排序对象
    func countingSortNaive(nums []int) {
        // 1. 统计数组最大元素 m
        m := 0
        for _, num := range nums {
            if num > m {
                m = num
            }
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        counter := make([]int, m+1)
        for _, num := range nums {
            counter[num]++
        }
        // 3. 遍历 counter ，将各元素填入原数组 nums
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
    /* 计数排序 */
    // 简单实现，无法用于排序对象
    func countingSortNaive(nums: inout [Int]) {
        // 1. 统计数组最大元素 m
        let m = nums.max()!
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        var counter = Array(repeating: 0, count: m + 1)
        for num in nums {
            counter[num] += 1
        }
        // 3. 遍历 counter ，将各元素填入原数组 nums
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
    /* 计数排序 */
    // 简单实现，无法用于排序对象
    function countingSortNaive(nums) {
        // 1. 统计数组最大元素 m
        let m = 0;
        for (const num of nums) {
            m = Math.max(m, num);
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        const counter = new Array(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. 遍历 counter ，将各元素填入原数组 nums
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
    /* 计数排序 */
    // 简单实现，无法用于排序对象
    function countingSortNaive(nums: number[]): void {
        // 1. 统计数组最大元素 m
        let m = 0;
        for (const num of nums) {
            m = Math.max(m, num);
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        const counter: number[] = new Array<number>(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. 遍历 counter ，将各元素填入原数组 nums
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
    /* 计数排序 */
    // 简单实现，无法用于排序对象
    void countingSortNaive(List<int> nums) {
      // 1. 统计数组最大元素 m
      int m = 0;
      for (int _num in nums) {
        m = max(m, _num);
      }
      // 2. 统计各数字的出现次数
      // counter[_num] 代表 _num 的出现次数
      List<int> counter = List.filled(m + 1, 0);
      for (int _num in nums) {
        counter[_num]++;
      }
      // 3. 遍历 counter ，将各元素填入原数组 nums
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
    /* 计数排序 */
    // 简单实现，无法用于排序对象
    fn counting_sort_naive(nums: &mut [i32]) {
        // 1. 统计数组最大元素 m
        let m = *nums.into_iter().max().unwrap();
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        let mut counter = vec![0; m as usize + 1];
        for &num in &*nums {
            counter[num as usize] += 1;
        }
        // 3. 遍历 counter ，将各元素填入原数组 nums
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
    /* 计数排序 */
    // 简单实现，无法用于排序对象
    void countingSortNaive(int nums[], int size) {
        // 1. 统计数组最大元素 m
        int m = 0;
        for (int i = 0; i < size; i++) {
            if (nums[i] > m) {
                m = nums[i];
            }
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        int *counter = calloc(m + 1, sizeof(int));
        for (int i = 0; i < size; i++) {
            counter[nums[i]]++;
        }
        // 3. 遍历 counter ，将各元素填入原数组 nums
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
        // 4. 释放内存
        free(counter);
    }
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    /* 计数排序 */
    // 简单实现，无法用于排序对象
    fun countingSortNaive(nums: IntArray) {
        // 1. 统计数组最大元素 m
        var m = 0
        for (num in nums) {
            m = max(m, num)
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        val counter = IntArray(m + 1)
        for (num in nums) {
            counter[num]++
        }
        // 3. 遍历 counter ，将各元素填入原数组 nums
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
    [class]{}-[func]{counting_sort_naive}
    ```

=== "Zig"

    ```zig title="counting_sort.zig"
    [class]{}-[func]{countingSortNaive}
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort_naive%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%EF%BC%8C%E6%97%A0%E6%B3%95%E7%94%A8%E4%BA%8E%E6%8E%92%E5%BA%8F%E5%AF%B9%E8%B1%A1%0A%20%20%20%20%23%201.%20%E7%BB%9F%E8%AE%A1%E6%95%B0%E7%BB%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%20m%0A%20%20%20%20m%20%3D%200%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20max%28m,%20num%29%0A%20%20%20%20%23%202.%20%E7%BB%9F%E8%AE%A1%E5%90%84%E6%95%B0%E5%AD%97%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20%23%20counter%5Bnum%5D%20%E4%BB%A3%E8%A1%A8%20num%20%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20counter%20%3D%20%5B0%5D%20*%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20%E9%81%8D%E5%8E%86%20counter%20%EF%BC%8C%E5%B0%86%E5%90%84%E5%85%83%E7%B4%A0%E5%A1%AB%E5%85%A5%E5%8E%9F%E6%95%B0%E7%BB%84%20nums%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20num%20in%20range%28m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28counter%5Bnum%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort_naive%28nums%29%0A%20%20%20%20print%28f%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%EF%BC%88%E6%97%A0%E6%B3%95%E6%8E%92%E5%BA%8F%E5%AF%B9%E8%B1%A1%EF%BC%89%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort_naive%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%EF%BC%8C%E6%97%A0%E6%B3%95%E7%94%A8%E4%BA%8E%E6%8E%92%E5%BA%8F%E5%AF%B9%E8%B1%A1%0A%20%20%20%20%23%201.%20%E7%BB%9F%E8%AE%A1%E6%95%B0%E7%BB%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%20m%0A%20%20%20%20m%20%3D%200%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20max%28m,%20num%29%0A%20%20%20%20%23%202.%20%E7%BB%9F%E8%AE%A1%E5%90%84%E6%95%B0%E5%AD%97%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20%23%20counter%5Bnum%5D%20%E4%BB%A3%E8%A1%A8%20num%20%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20counter%20%3D%20%5B0%5D%20*%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20%E9%81%8D%E5%8E%86%20counter%20%EF%BC%8C%E5%B0%86%E5%90%84%E5%85%83%E7%B4%A0%E5%A1%AB%E5%85%A5%E5%8E%9F%E6%95%B0%E7%BB%84%20nums%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20num%20in%20range%28m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28counter%5Bnum%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort_naive%28nums%29%0A%20%20%20%20print%28f%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%EF%BC%88%E6%97%A0%E6%B3%95%E6%8E%92%E5%BA%8F%E5%AF%B9%E8%B1%A1%EF%BC%89%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

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

After the traversal, the array `res` contains the sorted result, and finally, `res` replaces the original array `nums`. The complete counting sort process is shown in the figures below.

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
        """计数排序"""
        # 完整实现，可排序对象，并且是稳定排序
        # 1. 统计数组最大元素 m
        m = max(nums)
        # 2. 统计各数字的出现次数
        # counter[num] 代表 num 的出现次数
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
        # 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
        for i in range(m):
            counter[i + 1] += counter[i]
        # 4. 倒序遍历 nums ，将各元素填入结果数组 res
        # 初始化数组 res 用于记录结果
        n = len(nums)
        res = [0] * n
        for i in range(n - 1, -1, -1):
            num = nums[i]
            res[counter[num] - 1] = num  # 将 num 放置到对应索引处
            counter[num] -= 1  # 令前缀和自减 1 ，得到下次放置 num 的索引
        # 使用结果数组 res 覆盖原数组 nums
        for i in range(n):
            nums[i] = res[i]
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* 计数排序 */
    // 完整实现，可排序对象，并且是稳定排序
    void countingSort(vector<int> &nums) {
        // 1. 统计数组最大元素 m
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
        // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. 倒序遍历 nums ，将各元素填入结果数组 res
        // 初始化数组 res 用于记录结果
        int n = nums.size();
        vector<int> res(n);
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // 将 num 放置到对应索引处
            counter[num]--;              // 令前缀和自减 1 ，得到下次放置 num 的索引
        }
        // 使用结果数组 res 覆盖原数组 nums
        nums = res;
    }
    ```

=== "Java"

    ```java title="counting_sort.java"
    /* 计数排序 */
    // 完整实现，可排序对象，并且是稳定排序
    void countingSort(int[] nums) {
        // 1. 统计数组最大元素 m
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
        // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. 倒序遍历 nums ，将各元素填入结果数组 res
        // 初始化数组 res 用于记录结果
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // 将 num 放置到对应索引处
            counter[num]--; // 令前缀和自减 1 ，得到下次放置 num 的索引
        }
        // 使用结果数组 res 覆盖原数组 nums
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "C#"

    ```csharp title="counting_sort.cs"
    /* 计数排序 */
    // 完整实现，可排序对象，并且是稳定排序
    void CountingSort(int[] nums) {
        // 1. 统计数组最大元素 m
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
        // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. 倒序遍历 nums ，将各元素填入结果数组 res
        // 初始化数组 res 用于记录结果
        int n = nums.Length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // 将 num 放置到对应索引处
            counter[num]--; // 令前缀和自减 1 ，得到下次放置 num 的索引
        }
        // 使用结果数组 res 覆盖原数组 nums
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "Go"

    ```go title="counting_sort.go"
    /* 计数排序 */
    // 完整实现，可排序对象，并且是稳定排序
    func countingSort(nums []int) {
        // 1. 统计数组最大元素 m
        m := 0
        for _, num := range nums {
            if num > m {
                m = num
            }
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        counter := make([]int, m+1)
        for _, num := range nums {
            counter[num]++
        }
        // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
        // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
        for i := 0; i < m; i++ {
            counter[i+1] += counter[i]
        }
        // 4. 倒序遍历 nums ，将各元素填入结果数组 res
        // 初始化数组 res 用于记录结果
        n := len(nums)
        res := make([]int, n)
        for i := n - 1; i >= 0; i-- {
            num := nums[i]
            // 将 num 放置到对应索引处
            res[counter[num]-1] = num
            // 令前缀和自减 1 ，得到下次放置 num 的索引
            counter[num]--
        }
        // 使用结果数组 res 覆盖原数组 nums
        copy(nums, res)
    }
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    /* 计数排序 */
    // 完整实现，可排序对象，并且是稳定排序
    func countingSort(nums: inout [Int]) {
        // 1. 统计数组最大元素 m
        let m = nums.max()!
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        var counter = Array(repeating: 0, count: m + 1)
        for num in nums {
            counter[num] += 1
        }
        // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
        // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
        for i in 0 ..< m {
            counter[i + 1] += counter[i]
        }
        // 4. 倒序遍历 nums ，将各元素填入结果数组 res
        // 初始化数组 res 用于记录结果
        var res = Array(repeating: 0, count: nums.count)
        for i in nums.indices.reversed() {
            let num = nums[i]
            res[counter[num] - 1] = num // 将 num 放置到对应索引处
            counter[num] -= 1 // 令前缀和自减 1 ，得到下次放置 num 的索引
        }
        // 使用结果数组 res 覆盖原数组 nums
        for i in nums.indices {
            nums[i] = res[i]
        }
    }
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    /* 计数排序 */
    // 完整实现，可排序对象，并且是稳定排序
    function countingSort(nums) {
        // 1. 统计数组最大元素 m
        let m = 0;
        for (const num of nums) {
            m = Math.max(m, num);
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        const counter = new Array(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
        // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
        for (let i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. 倒序遍历 nums ，将各元素填入结果数组 res
        // 初始化数组 res 用于记录结果
        const n = nums.length;
        const res = new Array(n);
        for (let i = n - 1; i >= 0; i--) {
            const num = nums[i];
            res[counter[num] - 1] = num; // 将 num 放置到对应索引处
            counter[num]--; // 令前缀和自减 1 ，得到下次放置 num 的索引
        }
        // 使用结果数组 res 覆盖原数组 nums
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    /* 计数排序 */
    // 完整实现，可排序对象，并且是稳定排序
    function countingSort(nums: number[]): void {
        // 1. 统计数组最大元素 m
        let m = 0;
        for (const num of nums) {
            m = Math.max(m, num);
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        const counter: number[] = new Array<number>(m + 1).fill(0);
        for (const num of nums) {
            counter[num]++;
        }
        // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
        // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
        for (let i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. 倒序遍历 nums ，将各元素填入结果数组 res
        // 初始化数组 res 用于记录结果
        const n = nums.length;
        const res: number[] = new Array<number>(n);
        for (let i = n - 1; i >= 0; i--) {
            const num = nums[i];
            res[counter[num] - 1] = num; // 将 num 放置到对应索引处
            counter[num]--; // 令前缀和自减 1 ，得到下次放置 num 的索引
        }
        // 使用结果数组 res 覆盖原数组 nums
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    /* 计数排序 */
    // 完整实现，可排序对象，并且是稳定排序
    void countingSort(List<int> nums) {
      // 1. 统计数组最大元素 m
      int m = 0;
      for (int _num in nums) {
        m = max(m, _num);
      }
      // 2. 统计各数字的出现次数
      // counter[_num] 代表 _num 的出现次数
      List<int> counter = List.filled(m + 1, 0);
      for (int _num in nums) {
        counter[_num]++;
      }
      // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
      // 即 counter[_num]-1 是 _num 在 res 中最后一次出现的索引
      for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
      }
      // 4. 倒序遍历 nums ，将各元素填入结果数组 res
      // 初始化数组 res 用于记录结果
      int n = nums.length;
      List<int> res = List.filled(n, 0);
      for (int i = n - 1; i >= 0; i--) {
        int _num = nums[i];
        res[counter[_num] - 1] = _num; // 将 _num 放置到对应索引处
        counter[_num]--; // 令前缀和自减 1 ，得到下次放置 _num 的索引
      }
      // 使用结果数组 res 覆盖原数组 nums
      nums.setAll(0, res);
    }
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    /* 计数排序 */
    // 完整实现，可排序对象，并且是稳定排序
    fn counting_sort(nums: &mut [i32]) {
        // 1. 统计数组最大元素 m
        let m = *nums.into_iter().max().unwrap();
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        let mut counter = vec![0; m as usize + 1];
        for &num in &*nums {
            counter[num as usize] += 1;
        }
        // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
        // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
        for i in 0..m as usize {
            counter[i + 1] += counter[i];
        }
        // 4. 倒序遍历 nums ，将各元素填入结果数组 res
        // 初始化数组 res 用于记录结果
        let n = nums.len();
        let mut res = vec![0; n];
        for i in (0..n).rev() {
            let num = nums[i];
            res[counter[num as usize] - 1] = num; // 将 num 放置到对应索引处
            counter[num as usize] -= 1; // 令前缀和自减 1 ，得到下次放置 num 的索引
        }
        // 使用结果数组 res 覆盖原数组 nums
        for i in 0..n {
            nums[i] = res[i];
        }
    }
    ```

=== "C"

    ```c title="counting_sort.c"
    /* 计数排序 */
    // 完整实现，可排序对象，并且是稳定排序
    void countingSort(int nums[], int size) {
        // 1. 统计数组最大元素 m
        int m = 0;
        for (int i = 0; i < size; i++) {
            if (nums[i] > m) {
                m = nums[i];
            }
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        int *counter = calloc(m, sizeof(int));
        for (int i = 0; i < size; i++) {
            counter[nums[i]]++;
        }
        // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
        // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. 倒序遍历 nums ，将各元素填入结果数组 res
        // 初始化数组 res 用于记录结果
        int *res = malloc(sizeof(int) * size);
        for (int i = size - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // 将 num 放置到对应索引处
            counter[num]--;              // 令前缀和自减 1 ，得到下次放置 num 的索引
        }
        // 使用结果数组 res 覆盖原数组 nums
        memcpy(nums, res, size * sizeof(int));
        // 5. 释放内存
        free(counter);
    }
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    /* 计数排序 */
    // 完整实现，可排序对象，并且是稳定排序
    fun countingSort(nums: IntArray) {
        // 1. 统计数组最大元素 m
        var m = 0
        for (num in nums) {
            m = max(m, num)
        }
        // 2. 统计各数字的出现次数
        // counter[num] 代表 num 的出现次数
        val counter = IntArray(m + 1)
        for (num in nums) {
            counter[num]++
        }
        // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
        // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
        for (i in 0..<m) {
            counter[i + 1] += counter[i]
        }
        // 4. 倒序遍历 nums ，将各元素填入结果数组 res
        // 初始化数组 res 用于记录结果
        val n = nums.size
        val res = IntArray(n)
        for (i in n - 1 downTo 0) {
            val num = nums[i]
            res[counter[num] - 1] = num // 将 num 放置到对应索引处
            counter[num]-- // 令前缀和自减 1 ，得到下次放置 num 的索引
        }
        // 使用结果数组 res 覆盖原数组 nums
        for (i in 0..<n) {
            nums[i] = res[i]
        }
    }
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    [class]{}-[func]{counting_sort}
    ```

=== "Zig"

    ```zig title="counting_sort.zig"
    [class]{}-[func]{countingSort}
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%AE%8C%E6%95%B4%E5%AE%9E%E7%8E%B0%EF%BC%8C%E5%8F%AF%E6%8E%92%E5%BA%8F%E5%AF%B9%E8%B1%A1%EF%BC%8C%E5%B9%B6%E4%B8%94%E6%98%AF%E7%A8%B3%E5%AE%9A%E6%8E%92%E5%BA%8F%0A%20%20%20%20%23%201.%20%E7%BB%9F%E8%AE%A1%E6%95%B0%E7%BB%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%20m%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%202.%20%E7%BB%9F%E8%AE%A1%E5%90%84%E6%95%B0%E5%AD%97%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20%23%20counter%5Bnum%5D%20%E4%BB%A3%E8%A1%A8%20num%20%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20counter%20%3D%20%5B0%5D%20*%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20%E6%B1%82%20counter%20%E7%9A%84%E5%89%8D%E7%BC%80%E5%92%8C%EF%BC%8C%E5%B0%86%E2%80%9C%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%E2%80%9D%E8%BD%AC%E6%8D%A2%E4%B8%BA%E2%80%9C%E5%B0%BE%E7%B4%A2%E5%BC%95%E2%80%9D%0A%20%20%20%20%23%20%E5%8D%B3%20counter%5Bnum%5D-1%20%E6%98%AF%20num%20%E5%9C%A8%20res%20%E4%B8%AD%E6%9C%80%E5%90%8E%E4%B8%80%E6%AC%A1%E5%87%BA%E7%8E%B0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%20%20%20%20for%20i%20in%20range%28m%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%20%2B%201%5D%20%2B%3D%20counter%5Bi%5D%0A%20%20%20%20%23%204.%20%E5%80%92%E5%BA%8F%E9%81%8D%E5%8E%86%20nums%20%EF%BC%8C%E5%B0%86%E5%90%84%E5%85%83%E7%B4%A0%E5%A1%AB%E5%85%A5%E7%BB%93%E6%9E%9C%E6%95%B0%E7%BB%84%20res%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%20res%20%E7%94%A8%E4%BA%8E%E8%AE%B0%E5%BD%95%E7%BB%93%E6%9E%9C%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20res%20%3D%20%5B0%5D%20*%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20res%5Bcounter%5Bnum%5D%20-%201%5D%20%3D%20num%20%20%23%20%E5%B0%86%20num%20%E6%94%BE%E7%BD%AE%E5%88%B0%E5%AF%B9%E5%BA%94%E7%B4%A2%E5%BC%95%E5%A4%84%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20-%3D%201%20%20%23%20%E4%BB%A4%E5%89%8D%E7%BC%80%E5%92%8C%E8%87%AA%E5%87%8F%201%20%EF%BC%8C%E5%BE%97%E5%88%B0%E4%B8%8B%E6%AC%A1%E6%94%BE%E7%BD%AE%20num%20%E7%9A%84%E7%B4%A2%E5%BC%95%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E7%BB%93%E6%9E%9C%E6%95%B0%E7%BB%84%20res%20%E8%A6%86%E7%9B%96%E5%8E%9F%E6%95%B0%E7%BB%84%20nums%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort%28nums%29%0A%20%20%20%20print%28f%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%AE%8C%E6%95%B4%E5%AE%9E%E7%8E%B0%EF%BC%8C%E5%8F%AF%E6%8E%92%E5%BA%8F%E5%AF%B9%E8%B1%A1%EF%BC%8C%E5%B9%B6%E4%B8%94%E6%98%AF%E7%A8%B3%E5%AE%9A%E6%8E%92%E5%BA%8F%0A%20%20%20%20%23%201.%20%E7%BB%9F%E8%AE%A1%E6%95%B0%E7%BB%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%20m%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%202.%20%E7%BB%9F%E8%AE%A1%E5%90%84%E6%95%B0%E5%AD%97%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20%23%20counter%5Bnum%5D%20%E4%BB%A3%E8%A1%A8%20num%20%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20counter%20%3D%20%5B0%5D%20*%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20%E6%B1%82%20counter%20%E7%9A%84%E5%89%8D%E7%BC%80%E5%92%8C%EF%BC%8C%E5%B0%86%E2%80%9C%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%E2%80%9D%E8%BD%AC%E6%8D%A2%E4%B8%BA%E2%80%9C%E5%B0%BE%E7%B4%A2%E5%BC%95%E2%80%9D%0A%20%20%20%20%23%20%E5%8D%B3%20counter%5Bnum%5D-1%20%E6%98%AF%20num%20%E5%9C%A8%20res%20%E4%B8%AD%E6%9C%80%E5%90%8E%E4%B8%80%E6%AC%A1%E5%87%BA%E7%8E%B0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%20%20%20%20for%20i%20in%20range%28m%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%20%2B%201%5D%20%2B%3D%20counter%5Bi%5D%0A%20%20%20%20%23%204.%20%E5%80%92%E5%BA%8F%E9%81%8D%E5%8E%86%20nums%20%EF%BC%8C%E5%B0%86%E5%90%84%E5%85%83%E7%B4%A0%E5%A1%AB%E5%85%A5%E7%BB%93%E6%9E%9C%E6%95%B0%E7%BB%84%20res%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%20res%20%E7%94%A8%E4%BA%8E%E8%AE%B0%E5%BD%95%E7%BB%93%E6%9E%9C%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20res%20%3D%20%5B0%5D%20*%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20res%5Bcounter%5Bnum%5D%20-%201%5D%20%3D%20num%20%20%23%20%E5%B0%86%20num%20%E6%94%BE%E7%BD%AE%E5%88%B0%E5%AF%B9%E5%BA%94%E7%B4%A2%E5%BC%95%E5%A4%84%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20-%3D%201%20%20%23%20%E4%BB%A4%E5%89%8D%E7%BC%80%E5%92%8C%E8%87%AA%E5%87%8F%201%20%EF%BC%8C%E5%BE%97%E5%88%B0%E4%B8%8B%E6%AC%A1%E6%94%BE%E7%BD%AE%20num%20%E7%9A%84%E7%B4%A2%E5%BC%95%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E7%BB%93%E6%9E%9C%E6%95%B0%E7%BB%84%20res%20%E8%A6%86%E7%9B%96%E5%8E%9F%E6%95%B0%E7%BB%84%20nums%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort%28nums%29%0A%20%20%20%20print%28f%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 11.9.3 &nbsp; Algorithm characteristics

- **Time complexity is $O(n + m)$, non-adaptive sort**: Involves traversing `nums` and `counter`, both using linear time. Generally, $n \gg m$, and the time complexity tends towards $O(n)$.
- **Space complexity is $O(n + m)$, non-in-place sort**: Utilizes arrays `res` and `counter` of lengths $n$ and $m$ respectively.
- **Stable sort**: Since elements are filled into `res` in a "right-to-left" order, reversing the traversal of `nums` can prevent changing the relative position between equal elements, thereby achieving a stable sort. Actually, traversing `nums` in order can also produce the correct sorting result, but the outcome is unstable.

## 11.9.4 &nbsp; Limitations

By now, you might find counting sort very clever, as it can achieve efficient sorting merely by counting quantities. However, the prerequisites for using counting sort are relatively strict.

**Counting sort is only suitable for non-negative integers**. If you want to apply it to other types of data, you need to ensure that these data can be converted to non-negative integers without changing the relative sizes of the elements. For example, for an array containing negative integers, you can first add a constant to all numbers, converting them all to positive numbers, and then convert them back after sorting is complete.

**Counting sort is suitable for large data volumes but small data ranges**. For example, in the above example, $m$ should not be too large, otherwise, it will occupy too much space. And when $n \ll m$, counting sort uses $O(m)$ time, which may be slower than $O(n \log n)$ sorting algorithms.
