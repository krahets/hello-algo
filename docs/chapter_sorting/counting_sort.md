---
comments: true
---

# 11.9 &nbsp; 计数排序

「计数排序 counting sort」通过统计元素数量来实现排序，通常应用于整数数组。

## 11.9.1 &nbsp; 简单实现

先来看一个简单的例子。给定一个长度为 $n$ 的数组 `nums` ，其中的元素都是“非负整数”，计数排序的整体流程如图 11-16 所示。

1. 遍历数组，找出其中的最大数字，记为 $m$ ，然后创建一个长度为 $m + 1$ 的辅助数组 `counter` 。
2. **借助 `counter` 统计 `nums` 中各数字的出现次数**，其中 `counter[num]` 对应数字 `num` 的出现次数。统计方法很简单，只需遍历 `nums`（设当前数字为 `num`），每轮将 `counter[num]` 增加 $1$ 即可。
3. **由于 `counter` 的各个索引天然有序，因此相当于所有数字已经排序好了**。接下来，我们遍历 `counter` ，根据各数字出现次数从小到大的顺序填入 `nums` 即可。

![计数排序流程](counting_sort.assets/counting_sort_overview.png){ class="animation-figure" }

<p align="center"> 图 11-16 &nbsp; 计数排序流程 </p>

代码如下所示：

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

=== "Zig"

    ```zig title="counting_sort.zig"
    [class]{}-[func]{countingSortNaive}
    ```

??? pythontutor "可视化运行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort_naive%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%EF%BC%8C%E6%97%A0%E6%B3%95%E7%94%A8%E4%BA%8E%E6%8E%92%E5%BA%8F%E5%AF%B9%E8%B1%A1%0A%20%20%20%20%23%201.%20%E7%BB%9F%E8%AE%A1%E6%95%B0%E7%BB%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%20m%0A%20%20%20%20m%20%3D%200%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20max%28m,%20num%29%0A%20%20%20%20%23%202.%20%E7%BB%9F%E8%AE%A1%E5%90%84%E6%95%B0%E5%AD%97%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20%23%20counter%5Bnum%5D%20%E4%BB%A3%E8%A1%A8%20num%20%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20counter%20%3D%20%5B0%5D%20*%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20%E9%81%8D%E5%8E%86%20counter%20%EF%BC%8C%E5%B0%86%E5%90%84%E5%85%83%E7%B4%A0%E5%A1%AB%E5%85%A5%E5%8E%9F%E6%95%B0%E7%BB%84%20nums%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20num%20in%20range%28m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28counter%5Bnum%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort_naive%28nums%29%0A%20%20%20%20print%28f%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%EF%BC%88%E6%97%A0%E6%B3%95%E6%8E%92%E5%BA%8F%E5%AF%B9%E8%B1%A1%EF%BC%89%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort_naive%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E7%AE%80%E5%8D%95%E5%AE%9E%E7%8E%B0%EF%BC%8C%E6%97%A0%E6%B3%95%E7%94%A8%E4%BA%8E%E6%8E%92%E5%BA%8F%E5%AF%B9%E8%B1%A1%0A%20%20%20%20%23%201.%20%E7%BB%9F%E8%AE%A1%E6%95%B0%E7%BB%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%20m%0A%20%20%20%20m%20%3D%200%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20max%28m,%20num%29%0A%20%20%20%20%23%202.%20%E7%BB%9F%E8%AE%A1%E5%90%84%E6%95%B0%E5%AD%97%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20%23%20counter%5Bnum%5D%20%E4%BB%A3%E8%A1%A8%20num%20%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20counter%20%3D%20%5B0%5D%20*%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20%E9%81%8D%E5%8E%86%20counter%20%EF%BC%8C%E5%B0%86%E5%90%84%E5%85%83%E7%B4%A0%E5%A1%AB%E5%85%A5%E5%8E%9F%E6%95%B0%E7%BB%84%20nums%0A%20%20%20%20i%20%3D%200%0A%20%20%20%20for%20num%20in%20range%28m%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20for%20_%20in%20range%28counter%5Bnum%5D%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20num%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort_naive%28nums%29%0A%20%20%20%20print%28f%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%EF%BC%88%E6%97%A0%E6%B3%95%E6%8E%92%E5%BA%8F%E5%AF%B9%E8%B1%A1%EF%BC%89%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

!!! note "计数排序与桶排序的联系"

    从桶排序的角度看，我们可以将计数排序中的计数数组 `counter` 的每个索引视为一个桶，将统计数量的过程看作将各个元素分配到对应的桶中。本质上，计数排序是桶排序在整型数据下的一个特例。

## 11.9.2 &nbsp; 完整实现

细心的读者可能发现了，**如果输入数据是对象，上述步骤 `3.` 就失效了**。假设输入数据是商品对象，我们想按照商品价格（类的成员变量）对商品进行排序，而上述算法只能给出价格的排序结果。

那么如何才能得到原数据的排序结果呢？我们首先计算 `counter` 的“前缀和”。顾名思义，索引 `i` 处的前缀和 `prefix[i]` 等于数组前 `i` 个元素之和：

$$
\text{prefix}[i] = \sum_{j=0}^i \text{counter[j]}
$$

**前缀和具有明确的意义，`prefix[num] - 1` 代表元素 `num` 在结果数组 `res` 中最后一次出现的索引**。这个信息非常关键，因为它告诉我们各个元素应该出现在结果数组的哪个位置。接下来，我们倒序遍历原数组 `nums` 的每个元素 `num` ，在每轮迭代中执行以下两步。

1. 将 `num` 填入数组 `res` 的索引 `prefix[num] - 1` 处。
2. 令前缀和 `prefix[num]` 减小 $1$ ，从而得到下次放置 `num` 的索引。

遍历完成后，数组 `res` 中就是排序好的结果，最后使用 `res` 覆盖原数组 `nums` 即可。图 11-17 展示了完整的计数排序流程。

=== "<1>"
    ![计数排序步骤](counting_sort.assets/counting_sort_step1.png){ class="animation-figure" }

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

<p align="center"> 图 11-17 &nbsp; 计数排序步骤 </p>

计数排序的实现代码如下所示：

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

=== "Zig"

    ```zig title="counting_sort.zig"
    [class]{}-[func]{countingSort}
    ```

??? pythontutor "可视化运行"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%AE%8C%E6%95%B4%E5%AE%9E%E7%8E%B0%EF%BC%8C%E5%8F%AF%E6%8E%92%E5%BA%8F%E5%AF%B9%E8%B1%A1%EF%BC%8C%E5%B9%B6%E4%B8%94%E6%98%AF%E7%A8%B3%E5%AE%9A%E6%8E%92%E5%BA%8F%0A%20%20%20%20%23%201.%20%E7%BB%9F%E8%AE%A1%E6%95%B0%E7%BB%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%20m%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%202.%20%E7%BB%9F%E8%AE%A1%E5%90%84%E6%95%B0%E5%AD%97%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20%23%20counter%5Bnum%5D%20%E4%BB%A3%E8%A1%A8%20num%20%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20counter%20%3D%20%5B0%5D%20*%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20%E6%B1%82%20counter%20%E7%9A%84%E5%89%8D%E7%BC%80%E5%92%8C%EF%BC%8C%E5%B0%86%E2%80%9C%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%E2%80%9D%E8%BD%AC%E6%8D%A2%E4%B8%BA%E2%80%9C%E5%B0%BE%E7%B4%A2%E5%BC%95%E2%80%9D%0A%20%20%20%20%23%20%E5%8D%B3%20counter%5Bnum%5D-1%20%E6%98%AF%20num%20%E5%9C%A8%20res%20%E4%B8%AD%E6%9C%80%E5%90%8E%E4%B8%80%E6%AC%A1%E5%87%BA%E7%8E%B0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%20%20%20%20for%20i%20in%20range%28m%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%20%2B%201%5D%20%2B%3D%20counter%5Bi%5D%0A%20%20%20%20%23%204.%20%E5%80%92%E5%BA%8F%E9%81%8D%E5%8E%86%20nums%20%EF%BC%8C%E5%B0%86%E5%90%84%E5%85%83%E7%B4%A0%E5%A1%AB%E5%85%A5%E7%BB%93%E6%9E%9C%E6%95%B0%E7%BB%84%20res%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%20res%20%E7%94%A8%E4%BA%8E%E8%AE%B0%E5%BD%95%E7%BB%93%E6%9E%9C%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20res%20%3D%20%5B0%5D%20*%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20res%5Bcounter%5Bnum%5D%20-%201%5D%20%3D%20num%20%20%23%20%E5%B0%86%20num%20%E6%94%BE%E7%BD%AE%E5%88%B0%E5%AF%B9%E5%BA%94%E7%B4%A2%E5%BC%95%E5%A4%84%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20-%3D%201%20%20%23%20%E4%BB%A4%E5%89%8D%E7%BC%80%E5%92%8C%E8%87%AA%E5%87%8F%201%20%EF%BC%8C%E5%BE%97%E5%88%B0%E4%B8%8B%E6%AC%A1%E6%94%BE%E7%BD%AE%20num%20%E7%9A%84%E7%B4%A2%E5%BC%95%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E7%BB%93%E6%9E%9C%E6%95%B0%E7%BB%84%20res%20%E8%A6%86%E7%9B%96%E5%8E%9F%E6%95%B0%E7%BB%84%20nums%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort%28nums%29%0A%20%20%20%20print%28f%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20counting_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E5%AE%8C%E6%95%B4%E5%AE%9E%E7%8E%B0%EF%BC%8C%E5%8F%AF%E6%8E%92%E5%BA%8F%E5%AF%B9%E8%B1%A1%EF%BC%8C%E5%B9%B6%E4%B8%94%E6%98%AF%E7%A8%B3%E5%AE%9A%E6%8E%92%E5%BA%8F%0A%20%20%20%20%23%201.%20%E7%BB%9F%E8%AE%A1%E6%95%B0%E7%BB%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%20m%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%202.%20%E7%BB%9F%E8%AE%A1%E5%90%84%E6%95%B0%E5%AD%97%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20%23%20counter%5Bnum%5D%20%E4%BB%A3%E8%A1%A8%20num%20%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20counter%20%3D%20%5B0%5D%20*%20%28m%20%2B%201%29%0A%20%20%20%20for%20num%20in%20nums%3A%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20%2B%3D%201%0A%20%20%20%20%23%203.%20%E6%B1%82%20counter%20%E7%9A%84%E5%89%8D%E7%BC%80%E5%92%8C%EF%BC%8C%E5%B0%86%E2%80%9C%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%E2%80%9D%E8%BD%AC%E6%8D%A2%E4%B8%BA%E2%80%9C%E5%B0%BE%E7%B4%A2%E5%BC%95%E2%80%9D%0A%20%20%20%20%23%20%E5%8D%B3%20counter%5Bnum%5D-1%20%E6%98%AF%20num%20%E5%9C%A8%20res%20%E4%B8%AD%E6%9C%80%E5%90%8E%E4%B8%80%E6%AC%A1%E5%87%BA%E7%8E%B0%E7%9A%84%E7%B4%A2%E5%BC%95%0A%20%20%20%20for%20i%20in%20range%28m%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%20%2B%201%5D%20%2B%3D%20counter%5Bi%5D%0A%20%20%20%20%23%204.%20%E5%80%92%E5%BA%8F%E9%81%8D%E5%8E%86%20nums%20%EF%BC%8C%E5%B0%86%E5%90%84%E5%85%83%E7%B4%A0%E5%A1%AB%E5%85%A5%E7%BB%93%E6%9E%9C%E6%95%B0%E7%BB%84%20res%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E6%95%B0%E7%BB%84%20res%20%E7%94%A8%E4%BA%8E%E8%AE%B0%E5%BD%95%E7%BB%93%E6%9E%9C%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20res%20%3D%20%5B0%5D%20*%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20num%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20res%5Bcounter%5Bnum%5D%20-%201%5D%20%3D%20num%20%20%23%20%E5%B0%86%20num%20%E6%94%BE%E7%BD%AE%E5%88%B0%E5%AF%B9%E5%BA%94%E7%B4%A2%E5%BC%95%E5%A4%84%0A%20%20%20%20%20%20%20%20counter%5Bnum%5D%20-%3D%201%20%20%23%20%E4%BB%A4%E5%89%8D%E7%BC%80%E5%92%8C%E8%87%AA%E5%87%8F%201%20%EF%BC%8C%E5%BE%97%E5%88%B0%E4%B8%8B%E6%AC%A1%E6%94%BE%E7%BD%AE%20num%20%E7%9A%84%E7%B4%A2%E5%BC%95%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E7%BB%93%E6%9E%9C%E6%95%B0%E7%BB%84%20res%20%E8%A6%86%E7%9B%96%E5%8E%9F%E6%95%B0%E7%BB%84%20nums%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B1,%200,%201,%202,%200,%204,%200,%202,%202,%204%5D%0A%20%20%20%20counting_sort%28nums%29%0A%20%20%20%20print%28f%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%20%7Bnums%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全屏观看 ></a></div>

## 11.9.3 &nbsp; 算法特性

- **时间复杂度为 $O(n + m)$** ：涉及遍历 `nums` 和遍历 `counter` ，都使用线性时间。一般情况下 $n \gg m$ ，时间复杂度趋于 $O(n)$ 。
- **空间复杂度为 $O(n + m)$、非原地排序**：借助了长度分别为 $n$ 和 $m$ 的数组 `res` 和 `counter` 。
- **稳定排序**：由于向 `res` 中填充元素的顺序是“从右向左”的，因此倒序遍历 `nums` 可以避免改变相等元素之间的相对位置，从而实现稳定排序。实际上，正序遍历 `nums` 也可以得到正确的排序结果，但结果是非稳定的。

## 11.9.4 &nbsp; 局限性

看到这里，你也许会觉得计数排序非常巧妙，仅通过统计数量就可以实现高效的排序。然而，使用计数排序的前置条件相对较为严格。

**计数排序只适用于非负整数**。若想将其用于其他类型的数据，需要确保这些数据可以转换为非负整数，并且在转换过程中不能改变各个元素之间的相对大小关系。例如，对于包含负数的整数数组，可以先给所有数字加上一个常数，将全部数字转化为正数，排序完成后再转换回去。

**计数排序适用于数据量大但数据范围较小的情况**。比如，在上述示例中 $m$ 不能太大，否则会占用过多空间。而当 $n \ll m$ 时，计数排序使用 $O(m)$ 时间，可能比 $O(n \log n)$ 的排序算法还要慢。
