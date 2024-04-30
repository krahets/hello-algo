---
comments: true
---

# 11.10 &nbsp; Radix sort

The previous section introduced counting sort, which is suitable for scenarios where the data volume $n$ is large but the data range $m$ is small. Suppose we need to sort $n = 10^6$ student IDs, where each ID is an $8$-digit number. This means the data range $m = 10^8$ is very large, requiring a significant amount of memory space for counting sort, while radix sort can avoid this situation.

<u>Radix sort</u> shares the core idea with counting sort, which also sorts by counting the frequency of elements. Building on this, radix sort utilizes the progressive relationship between the digits of numbers, sorting each digit in turn to achieve the final sorted order.

## 11.10.1 &nbsp; Algorithm process

Taking the student ID data as an example, assuming the least significant digit is the $1^{st}$ and the most significant is the $8^{th}$, the radix sort process is illustrated in the following diagram.

1. Initialize digit $k = 1$.
2. Perform "counting sort" on the $k^{th}$ digit of the student IDs. After completion, the data will be sorted from smallest to largest based on the $k^{th}$ digit.
3. Increment $k$ by $1$, then return to step `2.` and continue iterating until all digits have been sorted, then the process ends.

![Radix sort algorithm process](radix_sort.assets/radix_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-18 &nbsp; Radix sort algorithm process </p>

Below we dissect the code implementation. For a number $x$ in base $d$, to obtain its $k^{th}$ digit $x_k$, the following calculation formula can be used:

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

Where $\lfloor a \rfloor$ denotes rounding down the floating point number $a$, and $\bmod \: d$ denotes taking the modulus of $d$. For student ID data, $d = 10$ and $k \in [1, 8]$.

Additionally, we need to slightly modify the counting sort code to allow sorting based on the $k^{th}$ digit:

=== "Python"

    ```python title="radix_sort.py"
    def digit(num: int, exp: int) -> int:
        """获取元素 num 的第 k 位，其中 exp = 10^(k-1)"""
        # 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        return (num // exp) % 10

    def counting_sort_digit(nums: list[int], exp: int):
        """计数排序（根据 nums 第 k 位排序）"""
        # 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        counter = [0] * 10
        n = len(nums)
        # 统计 0~9 各数字的出现次数
        for i in range(n):
            d = digit(nums[i], exp)  # 获取 nums[i] 第 k 位，记为 d
            counter[d] += 1  # 统计数字 d 的出现次数
        # 求前缀和，将“出现个数”转换为“数组索引”
        for i in range(1, 10):
            counter[i] += counter[i - 1]
        # 倒序遍历，根据桶内统计结果，将各元素填入 res
        res = [0] * n
        for i in range(n - 1, -1, -1):
            d = digit(nums[i], exp)
            j = counter[d] - 1  # 获取 d 在数组中的索引 j
            res[j] = nums[i]  # 将当前元素填入索引 j
            counter[d] -= 1  # 将 d 的数量减 1
        # 使用结果覆盖原数组 nums
        for i in range(n):
            nums[i] = res[i]

    def radix_sort(nums: list[int]):
        """基数排序"""
        # 获取数组的最大元素，用于判断最大位数
        m = max(nums)
        # 按照从低位到高位的顺序遍历
        exp = 1
        while exp <= m:
            # 对数组元素的第 k 位执行计数排序
            # k = 1 -> exp = 1
            # k = 2 -> exp = 10
            # 即 exp = 10^(k-1)
            counting_sort_digit(nums, exp)
            exp *= 10
    ```

=== "C++"

    ```cpp title="radix_sort.cpp"
    /* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
    int digit(int num, int exp) {
        // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        return (num / exp) % 10;
    }

    /* 计数排序（根据 nums 第 k 位排序） */
    void countingSortDigit(vector<int> &nums, int exp) {
        // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        vector<int> counter(10, 0);
        int n = nums.size();
        // 统计 0~9 各数字的出现次数
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // 获取 nums[i] 第 k 位，记为 d
            counter[d]++;                // 统计数字 d 的出现次数
        }
        // 求前缀和，将“出现个数”转换为“数组索引”
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 倒序遍历，根据桶内统计结果，将各元素填入 res
        vector<int> res(n, 0);
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // 获取 d 在数组中的索引 j
            res[j] = nums[i];       // 将当前元素填入索引 j
            counter[d]--;           // 将 d 的数量减 1
        }
        // 使用结果覆盖原数组 nums
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* 基数排序 */
    void radixSort(vector<int> &nums) {
        // 获取数组的最大元素，用于判断最大位数
        int m = *max_element(nums.begin(), nums.end());
        // 按照从低位到高位的顺序遍历
        for (int exp = 1; exp <= m; exp *= 10)
            // 对数组元素的第 k 位执行计数排序
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // 即 exp = 10^(k-1)
            countingSortDigit(nums, exp);
    }
    ```

=== "Java"

    ```java title="radix_sort.java"
    /* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
    int digit(int num, int exp) {
        // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        return (num / exp) % 10;
    }

    /* 计数排序（根据 nums 第 k 位排序） */
    void countingSortDigit(int[] nums, int exp) {
        // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        int[] counter = new int[10];
        int n = nums.length;
        // 统计 0~9 各数字的出现次数
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // 获取 nums[i] 第 k 位，记为 d
            counter[d]++;                // 统计数字 d 的出现次数
        }
        // 求前缀和，将“出现个数”转换为“数组索引”
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 倒序遍历，根据桶内统计结果，将各元素填入 res
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // 获取 d 在数组中的索引 j
            res[j] = nums[i];       // 将当前元素填入索引 j
            counter[d]--;           // 将 d 的数量减 1
        }
        // 使用结果覆盖原数组 nums
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* 基数排序 */
    void radixSort(int[] nums) {
        // 获取数组的最大元素，用于判断最大位数
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // 按照从低位到高位的顺序遍历
        for (int exp = 1; exp <= m; exp *= 10) {
            // 对数组元素的第 k 位执行计数排序
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // 即 exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "C#"

    ```csharp title="radix_sort.cs"
    /* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
    int Digit(int num, int exp) {
        // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        return (num / exp) % 10;
    }

    /* 计数排序（根据 nums 第 k 位排序） */
    void CountingSortDigit(int[] nums, int exp) {
        // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        int[] counter = new int[10];
        int n = nums.Length;
        // 统计 0~9 各数字的出现次数
        for (int i = 0; i < n; i++) {
            int d = Digit(nums[i], exp); // 获取 nums[i] 第 k 位，记为 d
            counter[d]++;                // 统计数字 d 的出现次数
        }
        // 求前缀和，将“出现个数”转换为“数组索引”
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 倒序遍历，根据桶内统计结果，将各元素填入 res
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = Digit(nums[i], exp);
            int j = counter[d] - 1; // 获取 d 在数组中的索引 j
            res[j] = nums[i];       // 将当前元素填入索引 j
            counter[d]--;           // 将 d 的数量减 1
        }
        // 使用结果覆盖原数组 nums
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* 基数排序 */
    void RadixSort(int[] nums) {
        // 获取数组的最大元素，用于判断最大位数
        int m = int.MinValue;
        foreach (int num in nums) {
            if (num > m) m = num;
        }
        // 按照从低位到高位的顺序遍历
        for (int exp = 1; exp <= m; exp *= 10) {
            // 对数组元素的第 k 位执行计数排序
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // 即 exp = 10^(k-1)
            CountingSortDigit(nums, exp);
        }
    }
    ```

=== "Go"

    ```go title="radix_sort.go"
    /* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
    func digit(num, exp int) int {
        // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        return (num / exp) % 10
    }

    /* 计数排序（根据 nums 第 k 位排序） */
    func countingSortDigit(nums []int, exp int) {
        // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        counter := make([]int, 10)
        n := len(nums)
        // 统计 0~9 各数字的出现次数
        for i := 0; i < n; i++ {
            d := digit(nums[i], exp) // 获取 nums[i] 第 k 位，记为 d
            counter[d]++             // 统计数字 d 的出现次数
        }
        // 求前缀和，将“出现个数”转换为“数组索引”
        for i := 1; i < 10; i++ {
            counter[i] += counter[i-1]
        }
        // 倒序遍历，根据桶内统计结果，将各元素填入 res
        res := make([]int, n)
        for i := n - 1; i >= 0; i-- {
            d := digit(nums[i], exp)
            j := counter[d] - 1 // 获取 d 在数组中的索引 j
            res[j] = nums[i]    // 将当前元素填入索引 j
            counter[d]--        // 将 d 的数量减 1
        }
        // 使用结果覆盖原数组 nums
        for i := 0; i < n; i++ {
            nums[i] = res[i]
        }
    }

    /* 基数排序 */
    func radixSort(nums []int) {
        // 获取数组的最大元素，用于判断最大位数
        max := math.MinInt
        for _, num := range nums {
            if num > max {
                max = num
            }
        }
        // 按照从低位到高位的顺序遍历
        for exp := 1; max >= exp; exp *= 10 {
            // 对数组元素的第 k 位执行计数排序
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // 即 exp = 10^(k-1)
            countingSortDigit(nums, exp)
        }
    }
    ```

=== "Swift"

    ```swift title="radix_sort.swift"
    /* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
    func digit(num: Int, exp: Int) -> Int {
        // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        (num / exp) % 10
    }

    /* 计数排序（根据 nums 第 k 位排序） */
    func countingSortDigit(nums: inout [Int], exp: Int) {
        // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        var counter = Array(repeating: 0, count: 10)
        // 统计 0~9 各数字的出现次数
        for i in nums.indices {
            let d = digit(num: nums[i], exp: exp) // 获取 nums[i] 第 k 位，记为 d
            counter[d] += 1 // 统计数字 d 的出现次数
        }
        // 求前缀和，将“出现个数”转换为“数组索引”
        for i in 1 ..< 10 {
            counter[i] += counter[i - 1]
        }
        // 倒序遍历，根据桶内统计结果，将各元素填入 res
        var res = Array(repeating: 0, count: nums.count)
        for i in nums.indices.reversed() {
            let d = digit(num: nums[i], exp: exp)
            let j = counter[d] - 1 // 获取 d 在数组中的索引 j
            res[j] = nums[i] // 将当前元素填入索引 j
            counter[d] -= 1 // 将 d 的数量减 1
        }
        // 使用结果覆盖原数组 nums
        for i in nums.indices {
            nums[i] = res[i]
        }
    }

    /* 基数排序 */
    func radixSort(nums: inout [Int]) {
        // 获取数组的最大元素，用于判断最大位数
        var m = Int.min
        for num in nums {
            if num > m {
                m = num
            }
        }
        // 按照从低位到高位的顺序遍历
        for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
            // 对数组元素的第 k 位执行计数排序
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // 即 exp = 10^(k-1)
            countingSortDigit(nums: &nums, exp: exp)
        }
    }
    ```

=== "JS"

    ```javascript title="radix_sort.js"
    /* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
    function digit(num, exp) {
        // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        return Math.floor(num / exp) % 10;
    }

    /* 计数排序（根据 nums 第 k 位排序） */
    function countingSortDigit(nums, exp) {
        // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        const counter = new Array(10).fill(0);
        const n = nums.length;
        // 统计 0~9 各数字的出现次数
        for (let i = 0; i < n; i++) {
            const d = digit(nums[i], exp); // 获取 nums[i] 第 k 位，记为 d
            counter[d]++; // 统计数字 d 的出现次数
        }
        // 求前缀和，将“出现个数”转换为“数组索引”
        for (let i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 倒序遍历，根据桶内统计结果，将各元素填入 res
        const res = new Array(n).fill(0);
        for (let i = n - 1; i >= 0; i--) {
            const d = digit(nums[i], exp);
            const j = counter[d] - 1; // 获取 d 在数组中的索引 j
            res[j] = nums[i]; // 将当前元素填入索引 j
            counter[d]--; // 将 d 的数量减 1
        }
        // 使用结果覆盖原数组 nums
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* 基数排序 */
    function radixSort(nums) {
        // 获取数组的最大元素，用于判断最大位数
        let m = Number.MIN_VALUE;
        for (const num of nums) {
            if (num > m) {
                m = num;
            }
        }
        // 按照从低位到高位的顺序遍历
        for (let exp = 1; exp <= m; exp *= 10) {
            // 对数组元素的第 k 位执行计数排序
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // 即 exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "TS"

    ```typescript title="radix_sort.ts"
    /* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
    function digit(num: number, exp: number): number {
        // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        return Math.floor(num / exp) % 10;
    }

    /* 计数排序（根据 nums 第 k 位排序） */
    function countingSortDigit(nums: number[], exp: number): void {
        // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        const counter = new Array(10).fill(0);
        const n = nums.length;
        // 统计 0~9 各数字的出现次数
        for (let i = 0; i < n; i++) {
            const d = digit(nums[i], exp); // 获取 nums[i] 第 k 位，记为 d
            counter[d]++; // 统计数字 d 的出现次数
        }
        // 求前缀和，将“出现个数”转换为“数组索引”
        for (let i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 倒序遍历，根据桶内统计结果，将各元素填入 res
        const res = new Array(n).fill(0);
        for (let i = n - 1; i >= 0; i--) {
            const d = digit(nums[i], exp);
            const j = counter[d] - 1; // 获取 d 在数组中的索引 j
            res[j] = nums[i]; // 将当前元素填入索引 j
            counter[d]--; // 将 d 的数量减 1
        }
        // 使用结果覆盖原数组 nums
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* 基数排序 */
    function radixSort(nums: number[]): void {
        // 获取数组的最大元素，用于判断最大位数
        let m = Number.MIN_VALUE;
        for (const num of nums) {
            if (num > m) {
                m = num;
            }
        }
        // 按照从低位到高位的顺序遍历
        for (let exp = 1; exp <= m; exp *= 10) {
            // 对数组元素的第 k 位执行计数排序
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // 即 exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "Dart"

    ```dart title="radix_sort.dart"
    /* 获取元素 _num 的第 k 位，其中 exp = 10^(k-1) */
    int digit(int _num, int exp) {
      // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
      return (_num ~/ exp) % 10;
    }

    /* 计数排序（根据 nums 第 k 位排序） */
    void countingSortDigit(List<int> nums, int exp) {
      // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
      List<int> counter = List<int>.filled(10, 0);
      int n = nums.length;
      // 统计 0~9 各数字的出现次数
      for (int i = 0; i < n; i++) {
        int d = digit(nums[i], exp); // 获取 nums[i] 第 k 位，记为 d
        counter[d]++; // 统计数字 d 的出现次数
      }
      // 求前缀和，将“出现个数”转换为“数组索引”
      for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
      }
      // 倒序遍历，根据桶内统计结果，将各元素填入 res
      List<int> res = List<int>.filled(n, 0);
      for (int i = n - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // 获取 d 在数组中的索引 j
        res[j] = nums[i]; // 将当前元素填入索引 j
        counter[d]--; // 将 d 的数量减 1
      }
      // 使用结果覆盖原数组 nums
      for (int i = 0; i < n; i++) nums[i] = res[i];
    }

    /* 基数排序 */
    void radixSort(List<int> nums) {
      // 获取数组的最大元素，用于判断最大位数
      // dart 中 int 的长度是 64 位的
      int m = -1 << 63;
      for (int _num in nums) if (_num > m) m = _num;
      // 按照从低位到高位的顺序遍历
      for (int exp = 1; exp <= m; exp *= 10)
        // 对数组元素的第 k 位执行计数排序
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // 即 exp = 10^(k-1)
        countingSortDigit(nums, exp);
    }
    ```

=== "Rust"

    ```rust title="radix_sort.rs"
    /* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
    fn digit(num: i32, exp: i32) -> usize {
        // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        return ((num / exp) % 10) as usize;
    }

    /* 计数排序（根据 nums 第 k 位排序） */
    fn counting_sort_digit(nums: &mut [i32], exp: i32) {
        // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        let mut counter = [0; 10];
        let n = nums.len();
        // 统计 0~9 各数字的出现次数
        for i in 0..n {
            let d = digit(nums[i], exp); // 获取 nums[i] 第 k 位，记为 d
            counter[d] += 1; // 统计数字 d 的出现次数
        }
        // 求前缀和，将“出现个数”转换为“数组索引”
        for i in 1..10 {
            counter[i] += counter[i - 1];
        }
        // 倒序遍历，根据桶内统计结果，将各元素填入 res
        let mut res = vec![0; n];
        for i in (0..n).rev() {
            let d = digit(nums[i], exp);
            let j = counter[d] - 1; // 获取 d 在数组中的索引 j
            res[j] = nums[i]; // 将当前元素填入索引 j
            counter[d] -= 1; // 将 d 的数量减 1
        }
        // 使用结果覆盖原数组 nums
        for i in 0..n {
            nums[i] = res[i];
        }
    }

    /* 基数排序 */
    fn radix_sort(nums: &mut [i32]) {
        // 获取数组的最大元素，用于判断最大位数
        let m = *nums.into_iter().max().unwrap();
        // 按照从低位到高位的顺序遍历
        let mut exp = 1;
        while exp <= m {
            counting_sort_digit(nums, exp);
            exp *= 10;
        }
    }
    ```

=== "C"

    ```c title="radix_sort.c"
    /* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
    int digit(int num, int exp) {
        // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        return (num / exp) % 10;
    }

    /* 计数排序（根据 nums 第 k 位排序） */
    void countingSortDigit(int nums[], int size, int exp) {
        // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        int *counter = (int *)malloc((sizeof(int) * 10));
        // 统计 0~9 各数字的出现次数
        for (int i = 0; i < size; i++) {
            // 获取 nums[i] 第 k 位，记为 d
            int d = digit(nums[i], exp);
            // 统计数字 d 的出现次数
            counter[d]++;
        }
        // 求前缀和，将“出现个数”转换为“数组索引”
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 倒序遍历，根据桶内统计结果，将各元素填入 res
        int *res = (int *)malloc(sizeof(int) * size);
        for (int i = size - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // 获取 d 在数组中的索引 j
            res[j] = nums[i];       // 将当前元素填入索引 j
            counter[d]--;           // 将 d 的数量减 1
        }
        // 使用结果覆盖原数组 nums
        for (int i = 0; i < size; i++) {
            nums[i] = res[i];
        }
    }

    /* 基数排序 */
    void radixSort(int nums[], int size) {
        // 获取数组的最大元素，用于判断最大位数
        int max = INT32_MIN;
        for (size_t i = 0; i < size - 1; i++) {
            if (nums[i] > max) {
                max = nums[i];
            }
        }
        // 按照从低位到高位的顺序遍历
        for (int exp = 1; max >= exp; exp *= 10)
            // 对数组元素的第 k 位执行计数排序
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // 即 exp = 10^(k-1)
            countingSortDigit(nums, size, exp);
    }
    ```

=== "Kotlin"

    ```kotlin title="radix_sort.kt"
    /* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
    fun digit(num: Int, exp: Int): Int {
        // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        return (num / exp) % 10
    }

    /* 计数排序（根据 nums 第 k 位排序） */
    fun countingSortDigit(nums: IntArray, exp: Int) {
        // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        val counter = IntArray(10)
        val n = nums.size
        // 统计 0~9 各数字的出现次数
        for (i in 0..<n) {
            val d = digit(nums[i], exp) // 获取 nums[i] 第 k 位，记为 d
            counter[d]++                // 统计数字 d 的出现次数
        }
        // 求前缀和，将“出现个数”转换为“数组索引”
        for (i in 1..9) {
            counter[i] += counter[i - 1]
        }
        // 倒序遍历，根据桶内统计结果，将各元素填入 res
        val res = IntArray(n)
        for (i in n - 1 downTo 0) {
            val d = digit(nums[i], exp)
            val j = counter[d] - 1 // 获取 d 在数组中的索引 j
            res[j] = nums[i]       // 将当前元素填入索引 j
            counter[d]--           // 将 d 的数量减 1
        }
        // 使用结果覆盖原数组 nums
        for (i in 0..<n)
            nums[i] = res[i]
    }

    /* 基数排序 */
    fun radixSort(nums: IntArray) {
        // 获取数组的最大元素，用于判断最大位数
        var m = Int.MIN_VALUE
        for (num in nums) if (num > m) m = num
        var exp = 1
        // 按照从低位到高位的顺序遍历
        while (exp <= m) {
            // 对数组元素的第 k 位执行计数排序
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // 即 exp = 10^(k-1)
            countingSortDigit(nums, exp)
            exp *= 10
        }
    }
    ```

=== "Ruby"

    ```ruby title="radix_sort.rb"
    [class]{}-[func]{digit}

    [class]{}-[func]{counting_sort_digit}

    [class]{}-[func]{radix_sort}
    ```

=== "Zig"

    ```zig title="radix_sort.zig"
    // 获取元素 num 的第 k 位，其中 exp = 10^(k-1)
    fn digit(num: i32, exp: i32) i32 {
        // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
        return @mod(@divFloor(num, exp), 10);
    }

    // 计数排序（根据 nums 第 k 位排序）
    fn countingSortDigit(nums: []i32, exp: i32) !void {
        // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
        var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
        // defer mem_arena.deinit();
        const mem_allocator = mem_arena.allocator();
        var counter = try mem_allocator.alloc(usize, 10);
        @memset(counter, 0);
        var n = nums.len;
        // 统计 0~9 各数字的出现次数
        for (nums) |num| {
            var d: u32 = @bitCast(digit(num, exp)); // 获取 nums[i] 第 k 位，记为 d
            counter[d] += 1; // 统计数字 d 的出现次数
        }
        // 求前缀和，将“出现个数”转换为“数组索引”
        var i: usize = 1;
        while (i < 10) : (i += 1) {
            counter[i] += counter[i - 1];
        }
        // 倒序遍历，根据桶内统计结果，将各元素填入 res
        var res = try mem_allocator.alloc(i32, n);
        i = n - 1;
        while (i >= 0) : (i -= 1) {
            var d: u32 = @bitCast(digit(nums[i], exp));
            var j = counter[d] - 1; // 获取 d 在数组中的索引 j
            res[j] = nums[i];       // 将当前元素填入索引 j
            counter[d] -= 1;        // 将 d 的数量减 1
            if (i == 0) break;
        }
        // 使用结果覆盖原数组 nums
        i = 0;
        while (i < n) : (i += 1) {
            nums[i] = res[i];
        }
    }

    // 基数排序
    fn radixSort(nums: []i32) !void {
        // 获取数组的最大元素，用于判断最大位数
        var m: i32 = std.math.minInt(i32);
        for (nums) |num| {
            if (num > m) m = num;
        }
        // 按照从低位到高位的顺序遍历
        var exp: i32 = 1;
        while (exp <= m) : (exp *= 10) {
            // 对数组元素的第 k 位执行计数排序
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // 即 exp = 10^(k-1)
            try countingSortDigit(nums, exp);    
        }
    } 
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20digit%28num%3A%20int,%20exp%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%85%83%E7%B4%A0%20num%20%E7%9A%84%E7%AC%AC%20k%20%E4%BD%8D%EF%BC%8C%E5%85%B6%E4%B8%AD%20exp%20%3D%2010%5E%28k-1%29%22%22%22%0A%20%20%20%20%23%20%E4%BC%A0%E5%85%A5%20exp%20%E8%80%8C%E9%9D%9E%20k%20%E5%8F%AF%E4%BB%A5%E9%81%BF%E5%85%8D%E5%9C%A8%E6%AD%A4%E9%87%8D%E5%A4%8D%E6%89%A7%E8%A1%8C%E6%98%82%E8%B4%B5%E7%9A%84%E6%AC%A1%E6%96%B9%E8%AE%A1%E7%AE%97%0A%20%20%20%20return%20%28num%20//%20exp%29%20%25%2010%0A%0Adef%20counting_sort_digit%28nums%3A%20list%5Bint%5D,%20exp%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%EF%BC%88%E6%A0%B9%E6%8D%AE%20nums%20%E7%AC%AC%20k%20%E4%BD%8D%E6%8E%92%E5%BA%8F%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E5%8D%81%E8%BF%9B%E5%88%B6%E7%9A%84%E4%BD%8D%E8%8C%83%E5%9B%B4%E4%B8%BA%200~9%20%EF%BC%8C%E5%9B%A0%E6%AD%A4%E9%9C%80%E8%A6%81%E9%95%BF%E5%BA%A6%E4%B8%BA%2010%20%E7%9A%84%E6%A1%B6%E6%95%B0%E7%BB%84%0A%20%20%20%20counter%20%3D%20%5B0%5D%20*%2010%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E7%BB%9F%E8%AE%A1%200~9%20%E5%90%84%E6%95%B0%E5%AD%97%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%20%20%23%20%E8%8E%B7%E5%8F%96%20nums%5Bi%5D%20%E7%AC%AC%20k%20%E4%BD%8D%EF%BC%8C%E8%AE%B0%E4%B8%BA%20d%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20%2B%3D%201%20%20%23%20%E7%BB%9F%E8%AE%A1%E6%95%B0%E5%AD%97%20d%20%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20%23%20%E6%B1%82%E5%89%8D%E7%BC%80%E5%92%8C%EF%BC%8C%E5%B0%86%E2%80%9C%E5%87%BA%E7%8E%B0%E4%B8%AA%E6%95%B0%E2%80%9D%E8%BD%AC%E6%8D%A2%E4%B8%BA%E2%80%9C%E6%95%B0%E7%BB%84%E7%B4%A2%E5%BC%95%E2%80%9D%0A%20%20%20%20for%20i%20in%20range%281,%2010%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%5D%20%2B%3D%20counter%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E5%80%92%E5%BA%8F%E9%81%8D%E5%8E%86%EF%BC%8C%E6%A0%B9%E6%8D%AE%E6%A1%B6%E5%86%85%E7%BB%9F%E8%AE%A1%E7%BB%93%E6%9E%9C%EF%BC%8C%E5%B0%86%E5%90%84%E5%85%83%E7%B4%A0%E5%A1%AB%E5%85%A5%20res%0A%20%20%20%20res%20%3D%20%5B0%5D%20*%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%0A%20%20%20%20%20%20%20%20j%20%3D%20counter%5Bd%5D%20-%201%20%20%23%20%E8%8E%B7%E5%8F%96%20d%20%E5%9C%A8%E6%95%B0%E7%BB%84%E4%B8%AD%E7%9A%84%E7%B4%A2%E5%BC%95%20j%0A%20%20%20%20%20%20%20%20res%5Bj%5D%20%3D%20nums%5Bi%5D%20%20%23%20%E5%B0%86%E5%BD%93%E5%89%8D%E5%85%83%E7%B4%A0%E5%A1%AB%E5%85%A5%E7%B4%A2%E5%BC%95%20j%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20-%3D%201%20%20%23%20%E5%B0%86%20d%20%E7%9A%84%E6%95%B0%E9%87%8F%E5%87%8F%201%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E7%BB%93%E6%9E%9C%E8%A6%86%E7%9B%96%E5%8E%9F%E6%95%B0%E7%BB%84%20nums%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0Adef%20radix_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E6%95%B0%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E6%95%B0%E7%BB%84%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%EF%BC%8C%E7%94%A8%E4%BA%8E%E5%88%A4%E6%96%AD%E6%9C%80%E5%A4%A7%E4%BD%8D%E6%95%B0%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%20%E6%8C%89%E7%85%A7%E4%BB%8E%E4%BD%8E%E4%BD%8D%E5%88%B0%E9%AB%98%E4%BD%8D%E7%9A%84%E9%A1%BA%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20exp%20%3D%201%0A%20%20%20%20while%20exp%20%3C%3D%20m%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%AF%B9%E6%95%B0%E7%BB%84%E5%85%83%E7%B4%A0%E7%9A%84%E7%AC%AC%20k%20%E4%BD%8D%E6%89%A7%E8%A1%8C%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%201%20-%3E%20exp%20%3D%201%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%202%20-%3E%20exp%20%3D%2010%0A%20%20%20%20%20%20%20%20%23%20%E5%8D%B3%20exp%20%3D%2010%5E%28k-1%29%0A%20%20%20%20%20%20%20%20counting_sort_digit%28nums,%20exp%29%0A%20%20%20%20%20%20%20%20exp%20*%3D%2010%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%9F%BA%E6%95%B0%E6%8E%92%E5%BA%8F%0A%20%20%20%20nums%20%3D%20%5B%0A%20%20%20%20%20%20%20%20105,%0A%20%20%20%20%20%20%20%20356,%0A%20%20%20%20%20%20%20%20428,%0A%20%20%20%20%20%20%20%20348,%0A%20%20%20%20%20%20%20%20818,%0A%20%20%20%20%5D%0A%20%20%20%20radix_sort%28nums%29%0A%20%20%20%20print%28%22%E5%9F%BA%E6%95%B0%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20digit%28num%3A%20int,%20exp%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E8%8E%B7%E5%8F%96%E5%85%83%E7%B4%A0%20num%20%E7%9A%84%E7%AC%AC%20k%20%E4%BD%8D%EF%BC%8C%E5%85%B6%E4%B8%AD%20exp%20%3D%2010%5E%28k-1%29%22%22%22%0A%20%20%20%20%23%20%E4%BC%A0%E5%85%A5%20exp%20%E8%80%8C%E9%9D%9E%20k%20%E5%8F%AF%E4%BB%A5%E9%81%BF%E5%85%8D%E5%9C%A8%E6%AD%A4%E9%87%8D%E5%A4%8D%E6%89%A7%E8%A1%8C%E6%98%82%E8%B4%B5%E7%9A%84%E6%AC%A1%E6%96%B9%E8%AE%A1%E7%AE%97%0A%20%20%20%20return%20%28num%20//%20exp%29%20%25%2010%0A%0Adef%20counting_sort_digit%28nums%3A%20list%5Bint%5D,%20exp%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%EF%BC%88%E6%A0%B9%E6%8D%AE%20nums%20%E7%AC%AC%20k%20%E4%BD%8D%E6%8E%92%E5%BA%8F%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E5%8D%81%E8%BF%9B%E5%88%B6%E7%9A%84%E4%BD%8D%E8%8C%83%E5%9B%B4%E4%B8%BA%200~9%20%EF%BC%8C%E5%9B%A0%E6%AD%A4%E9%9C%80%E8%A6%81%E9%95%BF%E5%BA%A6%E4%B8%BA%2010%20%E7%9A%84%E6%A1%B6%E6%95%B0%E7%BB%84%0A%20%20%20%20counter%20%3D%20%5B0%5D%20*%2010%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20%E7%BB%9F%E8%AE%A1%200~9%20%E5%90%84%E6%95%B0%E5%AD%97%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%20%20%23%20%E8%8E%B7%E5%8F%96%20nums%5Bi%5D%20%E7%AC%AC%20k%20%E4%BD%8D%EF%BC%8C%E8%AE%B0%E4%B8%BA%20d%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20%2B%3D%201%20%20%23%20%E7%BB%9F%E8%AE%A1%E6%95%B0%E5%AD%97%20d%20%E7%9A%84%E5%87%BA%E7%8E%B0%E6%AC%A1%E6%95%B0%0A%20%20%20%20%23%20%E6%B1%82%E5%89%8D%E7%BC%80%E5%92%8C%EF%BC%8C%E5%B0%86%E2%80%9C%E5%87%BA%E7%8E%B0%E4%B8%AA%E6%95%B0%E2%80%9D%E8%BD%AC%E6%8D%A2%E4%B8%BA%E2%80%9C%E6%95%B0%E7%BB%84%E7%B4%A2%E5%BC%95%E2%80%9D%0A%20%20%20%20for%20i%20in%20range%281,%2010%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%5D%20%2B%3D%20counter%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E5%80%92%E5%BA%8F%E9%81%8D%E5%8E%86%EF%BC%8C%E6%A0%B9%E6%8D%AE%E6%A1%B6%E5%86%85%E7%BB%9F%E8%AE%A1%E7%BB%93%E6%9E%9C%EF%BC%8C%E5%B0%86%E5%90%84%E5%85%83%E7%B4%A0%E5%A1%AB%E5%85%A5%20res%0A%20%20%20%20res%20%3D%20%5B0%5D%20*%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%0A%20%20%20%20%20%20%20%20j%20%3D%20counter%5Bd%5D%20-%201%20%20%23%20%E8%8E%B7%E5%8F%96%20d%20%E5%9C%A8%E6%95%B0%E7%BB%84%E4%B8%AD%E7%9A%84%E7%B4%A2%E5%BC%95%20j%0A%20%20%20%20%20%20%20%20res%5Bj%5D%20%3D%20nums%5Bi%5D%20%20%23%20%E5%B0%86%E5%BD%93%E5%89%8D%E5%85%83%E7%B4%A0%E5%A1%AB%E5%85%A5%E7%B4%A2%E5%BC%95%20j%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20-%3D%201%20%20%23%20%E5%B0%86%20d%20%E7%9A%84%E6%95%B0%E9%87%8F%E5%87%8F%201%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E7%BB%93%E6%9E%9C%E8%A6%86%E7%9B%96%E5%8E%9F%E6%95%B0%E7%BB%84%20nums%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0Adef%20radix_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E6%95%B0%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E8%8E%B7%E5%8F%96%E6%95%B0%E7%BB%84%E7%9A%84%E6%9C%80%E5%A4%A7%E5%85%83%E7%B4%A0%EF%BC%8C%E7%94%A8%E4%BA%8E%E5%88%A4%E6%96%AD%E6%9C%80%E5%A4%A7%E4%BD%8D%E6%95%B0%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%20%E6%8C%89%E7%85%A7%E4%BB%8E%E4%BD%8E%E4%BD%8D%E5%88%B0%E9%AB%98%E4%BD%8D%E7%9A%84%E9%A1%BA%E5%BA%8F%E9%81%8D%E5%8E%86%0A%20%20%20%20exp%20%3D%201%0A%20%20%20%20while%20exp%20%3C%3D%20m%3A%0A%20%20%20%20%20%20%20%20%23%20%E5%AF%B9%E6%95%B0%E7%BB%84%E5%85%83%E7%B4%A0%E7%9A%84%E7%AC%AC%20k%20%E4%BD%8D%E6%89%A7%E8%A1%8C%E8%AE%A1%E6%95%B0%E6%8E%92%E5%BA%8F%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%201%20-%3E%20exp%20%3D%201%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%202%20-%3E%20exp%20%3D%2010%0A%20%20%20%20%20%20%20%20%23%20%E5%8D%B3%20exp%20%3D%2010%5E%28k-1%29%0A%20%20%20%20%20%20%20%20counting_sort_digit%28nums,%20exp%29%0A%20%20%20%20%20%20%20%20exp%20*%3D%2010%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%9F%BA%E6%95%B0%E6%8E%92%E5%BA%8F%0A%20%20%20%20nums%20%3D%20%5B%0A%20%20%20%20%20%20%20%20105,%0A%20%20%20%20%20%20%20%20356,%0A%20%20%20%20%20%20%20%20428,%0A%20%20%20%20%20%20%20%20348,%0A%20%20%20%20%20%20%20%20818,%0A%20%20%20%20%5D%0A%20%20%20%20radix_sort%28nums%29%0A%20%20%20%20print%28%22%E5%9F%BA%E6%95%B0%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

!!! question "Why start sorting from the least significant digit?"

    In consecutive sorting rounds, the result of a later round will override the result of an earlier round. For example, if the result of the first round is $a < b$ and the result of the second round is $a > b$, the result of the second round will replace the first round's result. Since the significance of higher digits is greater than that of lower digits, it makes sense to sort lower digits before higher digits.

## 11.10.2 &nbsp; Algorithm characteristics

Compared to counting sort, radix sort is suitable for larger numerical ranges, **but it assumes that the data can be represented in a fixed number of digits, and the number of digits should not be too large**. For example, floating-point numbers are not suitable for radix sort, as their digit count $k$ may be large, potentially leading to a time complexity $O(nk) \gg O(n^2)$.

- **Time complexity is $O(nk)$, non-adaptive sorting**: Assuming the data size is $n$, the data is in base $d$, and the maximum number of digits is $k$, then sorting a single digit takes $O(n + d)$ time, and sorting all $k$ digits takes $O((n + d)k)$ time. Generally, both $d$ and $k$ are relatively small, leading to a time complexity approaching $O(n)$.
- **Space complexity is $O(n + d)$, non-in-place sorting**: Like counting sort, radix sort relies on arrays `res` and `counter` of lengths $n$ and $d$ respectively.
- **Stable sorting**: When counting sort is stable, radix sort is also stable; if counting sort is unstable, radix sort cannot guarantee a correct sorting outcome.
