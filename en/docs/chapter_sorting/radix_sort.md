---
comments: true
---

# 11.10 &nbsp; Radix Sort

The previous section introduced counting sort, which is suitable for situations where the data volume $n$ is large but the data range $m$ is small. Suppose we need to sort $n = 10^6$ student IDs, and the student ID is an 8-digit number, which means the data range $m = 10^8$ is very large. Using counting sort would require allocating a large amount of memory space, whereas radix sort can avoid this situation.

<u>Radix sort (radix sort)</u> has a core idea consistent with counting sort, which also achieves sorting by counting quantities. Building on this, radix sort utilizes the progressive relationship between the digits of numbers, sorting each digit in turn to obtain the final sorting result.

## 11.10.1 &nbsp; Algorithm Flow

Taking student ID data as an example, assume the lowest digit is the $1$st digit and the highest digit is the $8$th digit. The flow of radix sort is shown in Figure 11-18.

1. Initialize the digit $k = 1$.
2. Perform "counting sort" on the $k$th digit of the student IDs. After completion, the data will be sorted from smallest to largest according to the $k$th digit.
3. Increase $k$ by $1$, then return to step `2.` and continue iterating until all digits are sorted, at which point the process ends.

![Radix sort algorithm flow](radix_sort.assets/radix_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-18 &nbsp; Radix sort algorithm flow </p>

Below we analyze the code implementation. For a $d$-base number $x$, to get its $k$th digit $x_k$, the following calculation formula can be used:

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

Where $\lfloor a \rfloor$ denotes rounding down the floating-point number $a$, and $\bmod \: d$ denotes taking the modulo (remainder) with respect to $d$. For student ID data, $d = 10$ and $k \in [1, 8]$.

Additionally, we need to slightly modify the counting sort code to make it sort based on the $k$th digit of the number:

=== "Python"

    ```python title="radix_sort.py"
    def digit(num: int, exp: int) -> int:
        """Get the k-th digit of element num, where exp = 10^(k-1)"""
        # Passing exp instead of k can avoid repeated expensive exponentiation here
        return (num // exp) % 10

    def counting_sort_digit(nums: list[int], exp: int):
        """Counting sort (based on nums k-th digit)"""
        # Decimal digit range is 0~9, therefore need a bucket array of length 10
        counter = [0] * 10
        n = len(nums)
        # Count the occurrence of digits 0~9
        for i in range(n):
            d = digit(nums[i], exp)  # Get the k-th digit of nums[i], noted as d
            counter[d] += 1  # Count the occurrence of digit d
        # Calculate prefix sum, converting "occurrence count" into "array index"
        for i in range(1, 10):
            counter[i] += counter[i - 1]
        # Traverse in reverse, based on bucket statistics, place each element into res
        res = [0] * n
        for i in range(n - 1, -1, -1):
            d = digit(nums[i], exp)
            j = counter[d] - 1  # Get the index j for d in the array
            res[j] = nums[i]  # Place the current element at index j
            counter[d] -= 1  # Decrease the count of d by 1
        # Use result to overwrite the original array nums
        for i in range(n):
            nums[i] = res[i]

    def radix_sort(nums: list[int]):
        """Radix sort"""
        # Get the maximum element of the array, used to determine the maximum number of digits
        m = max(nums)
        # Traverse from the lowest to the highest digit
        exp = 1
        while exp <= m:
            # Perform counting sort on the k-th digit of array elements
            # k = 1 -> exp = 1
            # k = 2 -> exp = 10
            # i.e., exp = 10^(k-1)
            counting_sort_digit(nums, exp)
            exp *= 10
    ```

=== "C++"

    ```cpp title="radix_sort.cpp"
    /* Get the k-th digit of element num, where exp = 10^(k-1) */
    int digit(int num, int exp) {
        // Passing exp instead of k can avoid repeated expensive exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort (based on nums k-th digit) */
    void countingSortDigit(vector<int> &nums, int exp) {
        // Decimal digit range is 0~9, therefore need a bucket array of length 10
        vector<int> counter(10, 0);
        int n = nums.size();
        // Count the occurrence of digits 0~9
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // Get the k-th digit of nums[i], noted as d
            counter[d]++;                // Count the occurrence of digit d
        }
        // Calculate prefix sum, converting "occurrence count" into "array index"
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse, based on bucket statistics, place each element into res
        vector<int> res(n, 0);
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Get the index j for d in the array
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrease the count of d by 1
        }
        // Use result to overwrite the original array nums
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* Radix sort */
    void radixSort(vector<int> &nums) {
        // Get the maximum element of the array, used to determine the maximum number of digits
        int m = *max_element(nums.begin(), nums.end());
        // Traverse from the lowest to the highest digit
        for (int exp = 1; exp <= m; exp *= 10)
            // Perform counting sort on the k-th digit of array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // i.e., exp = 10^(k-1)
            countingSortDigit(nums, exp);
    }
    ```

=== "Java"

    ```java title="radix_sort.java"
    /* Get the k-th digit of element num, where exp = 10^(k-1) */
    int digit(int num, int exp) {
        // Passing exp instead of k can avoid repeated expensive exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort (based on nums k-th digit) */
    void countingSortDigit(int[] nums, int exp) {
        // Decimal digit range is 0~9, therefore need a bucket array of length 10
        int[] counter = new int[10];
        int n = nums.length;
        // Count the occurrence of digits 0~9
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // Get the k-th digit of nums[i], noted as d
            counter[d]++;                // Count the occurrence of digit d
        }
        // Calculate prefix sum, converting "occurrence count" into "array index"
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse, based on bucket statistics, place each element into res
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Get the index j for d in the array
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrease the count of d by 1
        }
        // Use result to overwrite the original array nums
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* Radix sort */
    void radixSort(int[] nums) {
        // Get the maximum element of the array, used to determine the maximum number of digits
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // Traverse from the lowest to the highest digit
        for (int exp = 1; exp <= m; exp *= 10) {
            // Perform counting sort on the k-th digit of array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // i.e., exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "C#"

    ```csharp title="radix_sort.cs"
    /* Get the k-th digit of element num, where exp = 10^(k-1) */
    int Digit(int num, int exp) {
        // Passing exp instead of k can avoid repeated expensive exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort (based on nums k-th digit) */
    void CountingSortDigit(int[] nums, int exp) {
        // Decimal digit range is 0~9, therefore need a bucket array of length 10
        int[] counter = new int[10];
        int n = nums.Length;
        // Count the occurrence of digits 0~9
        for (int i = 0; i < n; i++) {
            int d = Digit(nums[i], exp); // Get the k-th digit of nums[i], noted as d
            counter[d]++;                // Count the occurrence of digit d
        }
        // Calculate prefix sum, converting "occurrence count" into "array index"
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse, based on bucket statistics, place each element into res
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = Digit(nums[i], exp);
            int j = counter[d] - 1; // Get the index j for d in the array
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrease the count of d by 1
        }
        // Use result to overwrite the original array nums
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Radix sort */
    void RadixSort(int[] nums) {
        // Get the maximum element of the array, used to determine the maximum number of digits
        int m = int.MinValue;
        foreach (int num in nums) {
            if (num > m) m = num;
        }
        // Traverse from the lowest to the highest digit
        for (int exp = 1; exp <= m; exp *= 10) {
            // Perform counting sort on the k-th digit of array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // i.e., exp = 10^(k-1)
            CountingSortDigit(nums, exp);
        }
    }
    ```

=== "Go"

    ```go title="radix_sort.go"
    /* Get the k-th digit of element num, where exp = 10^(k-1) */
    func digit(num, exp int) int {
        // Passing exp instead of k can avoid repeated expensive exponentiation here
        return (num / exp) % 10
    }

    /* Counting sort (based on nums k-th digit) */
    func countingSortDigit(nums []int, exp int) {
        // Decimal digit range is 0~9, therefore need a bucket array of length 10
        counter := make([]int, 10)
        n := len(nums)
        // Count the occurrence of digits 0~9
        for i := 0; i < n; i++ {
            d := digit(nums[i], exp) // Get the k-th digit of nums[i], noted as d
            counter[d]++             // Count the occurrence of digit d
        }
        // Calculate prefix sum, converting "occurrence count" into "array index"
        for i := 1; i < 10; i++ {
            counter[i] += counter[i-1]
        }
        // Traverse in reverse, based on bucket statistics, place each element into res
        res := make([]int, n)
        for i := n - 1; i >= 0; i-- {
            d := digit(nums[i], exp)
            j := counter[d] - 1 // Get the index j for d in the array
            res[j] = nums[i]    // Place the current element at index j
            counter[d]--        // Decrease the count of d by 1
        }
        // Use result to overwrite the original array nums
        for i := 0; i < n; i++ {
            nums[i] = res[i]
        }
    }

    /* Radix sort */
    func radixSort(nums []int) {
        // Get the maximum element of the array, used to determine the maximum number of digits
        max := math.MinInt
        for _, num := range nums {
            if num > max {
                max = num
            }
        }
        // Traverse from the lowest to the highest digit
        for exp := 1; max >= exp; exp *= 10 {
            // Perform counting sort on the k-th digit of array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // i.e., exp = 10^(k-1)
            countingSortDigit(nums, exp)
        }
    }
    ```

=== "Swift"

    ```swift title="radix_sort.swift"
    /* Get the k-th digit of element num, where exp = 10^(k-1) */
    func digit(num: Int, exp: Int) -> Int {
        // Passing exp instead of k can avoid repeated expensive exponentiation here
        (num / exp) % 10
    }

    /* Counting sort (based on nums k-th digit) */
    func countingSortDigit(nums: inout [Int], exp: Int) {
        // Decimal digit range is 0~9, therefore need a bucket array of length 10
        var counter = Array(repeating: 0, count: 10)
        // Count the occurrence of digits 0~9
        for i in nums.indices {
            let d = digit(num: nums[i], exp: exp) // Get the k-th digit of nums[i], noted as d
            counter[d] += 1 // Count the occurrence of digit d
        }
        // Calculate prefix sum, converting "occurrence count" into "array index"
        for i in 1 ..< 10 {
            counter[i] += counter[i - 1]
        }
        // Traverse in reverse, based on bucket statistics, place each element into res
        var res = Array(repeating: 0, count: nums.count)
        for i in nums.indices.reversed() {
            let d = digit(num: nums[i], exp: exp)
            let j = counter[d] - 1 // Get the index j for d in the array
            res[j] = nums[i] // Place the current element at index j
            counter[d] -= 1 // Decrease the count of d by 1
        }
        // Use result to overwrite the original array nums
        for i in nums.indices {
            nums[i] = res[i]
        }
    }

    /* Radix sort */
    func radixSort(nums: inout [Int]) {
        // Get the maximum element of the array, used to determine the maximum number of digits
        var m = Int.min
        for num in nums {
            if num > m {
                m = num
            }
        }
        // Traverse from the lowest to the highest digit
        for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
            // Perform counting sort on the k-th digit of array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // i.e., exp = 10^(k-1)
            countingSortDigit(nums: &nums, exp: exp)
        }
    }
    ```

=== "JS"

    ```javascript title="radix_sort.js"
    /* Get the k-th digit of element num, where exp = 10^(k-1) */
    function digit(num, exp) {
        // Passing exp instead of k can avoid repeated expensive exponentiation here
        return Math.floor(num / exp) % 10;
    }

    /* Counting sort (based on nums k-th digit) */
    function countingSortDigit(nums, exp) {
        // Decimal digit range is 0~9, therefore need a bucket array of length 10
        const counter = new Array(10).fill(0);
        const n = nums.length;
        // Count the occurrence of digits 0~9
        for (let i = 0; i < n; i++) {
            const d = digit(nums[i], exp); // Get the k-th digit of nums[i], noted as d
            counter[d]++; // Count the occurrence of digit d
        }
        // Calculate prefix sum, converting "occurrence count" into "array index"
        for (let i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse, based on bucket statistics, place each element into res
        const res = new Array(n).fill(0);
        for (let i = n - 1; i >= 0; i--) {
            const d = digit(nums[i], exp);
            const j = counter[d] - 1; // Get the index j for d in the array
            res[j] = nums[i]; // Place the current element at index j
            counter[d]--; // Decrease the count of d by 1
        }
        // Use result to overwrite the original array nums
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Radix sort */
    function radixSort(nums) {
        // Get the maximum element of the array, used to determine the maximum number of digits
        let m = Math.max(... nums);
        // Traverse from the lowest to the highest digit
        for (let exp = 1; exp <= m; exp *= 10) {
            // Perform counting sort on the k-th digit of array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // i.e., exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "TS"

    ```typescript title="radix_sort.ts"
    /* Get the k-th digit of element num, where exp = 10^(k-1) */
    function digit(num: number, exp: number): number {
        // Passing exp instead of k can avoid repeated expensive exponentiation here
        return Math.floor(num / exp) % 10;
    }

    /* Counting sort (based on nums k-th digit) */
    function countingSortDigit(nums: number[], exp: number): void {
        // Decimal digit range is 0~9, therefore need a bucket array of length 10
        const counter = new Array(10).fill(0);
        const n = nums.length;
        // Count the occurrence of digits 0~9
        for (let i = 0; i < n; i++) {
            const d = digit(nums[i], exp); // Get the k-th digit of nums[i], noted as d
            counter[d]++; // Count the occurrence of digit d
        }
        // Calculate prefix sum, converting "occurrence count" into "array index"
        for (let i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse, based on bucket statistics, place each element into res
        const res = new Array(n).fill(0);
        for (let i = n - 1; i >= 0; i--) {
            const d = digit(nums[i], exp);
            const j = counter[d] - 1; // Get the index j for d in the array
            res[j] = nums[i]; // Place the current element at index j
            counter[d]--; // Decrease the count of d by 1
        }
        // Use result to overwrite the original array nums
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Radix sort */
    function radixSort(nums: number[]): void {
        // Get the maximum element of the array, used to determine the maximum number of digits
        let m: number = Math.max(... nums);
        // Traverse from the lowest to the highest digit
        for (let exp = 1; exp <= m; exp *= 10) {
            // Perform counting sort on the k-th digit of array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // i.e., exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "Dart"

    ```dart title="radix_sort.dart"
    /* Get k-th digit of element _num, where exp = 10^(k-1) */
    int digit(int _num, int exp) {
      // Passing exp instead of k can avoid repeated expensive exponentiation here
      return (_num ~/ exp) % 10;
    }

    /* Counting sort (based on nums k-th digit) */
    void countingSortDigit(List<int> nums, int exp) {
      // Decimal digit range is 0~9, therefore need a bucket array of length 10
      List<int> counter = List<int>.filled(10, 0);
      int n = nums.length;
      // Count the occurrence of digits 0~9
      for (int i = 0; i < n; i++) {
        int d = digit(nums[i], exp); // Get the k-th digit of nums[i], noted as d
        counter[d]++; // Count the occurrence of digit d
      }
      // Calculate prefix sum, converting "occurrence count" into "array index"
      for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
      }
      // Traverse in reverse, based on bucket statistics, place each element into res
      List<int> res = List<int>.filled(n, 0);
      for (int i = n - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // Get the index j for d in the array
        res[j] = nums[i]; // Place the current element at index j
        counter[d]--; // Decrease the count of d by 1
      }
      // Use result to overwrite the original array nums
      for (int i = 0; i < n; i++) nums[i] = res[i];
    }

    /* Radix sort */
    void radixSort(List<int> nums) {
      // Get the maximum element of the array, used to determine the maximum number of digits
      // In Dart, int length is 64 bits
      int m = -1 << 63;
      for (int _num in nums) if (_num > m) m = _num;
      // Traverse from the lowest to the highest digit
      for (int exp = 1; exp <= m; exp *= 10)
        // Perform counting sort on the k-th digit of array elements
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // i.e., exp = 10^(k-1)
        countingSortDigit(nums, exp);
    }
    ```

=== "Rust"

    ```rust title="radix_sort.rs"
    /* Get the k-th digit of element num, where exp = 10^(k-1) */
    fn digit(num: i32, exp: i32) -> usize {
        // Passing exp instead of k can avoid repeated expensive exponentiation here
        return ((num / exp) % 10) as usize;
    }

    /* Counting sort (based on nums k-th digit) */
    fn counting_sort_digit(nums: &mut [i32], exp: i32) {
        // Decimal digit range is 0~9, therefore need a bucket array of length 10
        let mut counter = [0; 10];
        let n = nums.len();
        // Count the occurrence of digits 0~9
        for i in 0..n {
            let d = digit(nums[i], exp); // Get the k-th digit of nums[i], noted as d
            counter[d] += 1; // Count the occurrence of digit d
        }
        // Calculate prefix sum, converting "occurrence count" into "array index"
        for i in 1..10 {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse, based on bucket statistics, place each element into res
        let mut res = vec![0; n];
        for i in (0..n).rev() {
            let d = digit(nums[i], exp);
            let j = counter[d] - 1; // Get the index j for d in the array
            res[j] = nums[i]; // Place the current element at index j
            counter[d] -= 1; // Decrease the count of d by 1
        }
        // Use result to overwrite the original array nums
        nums.copy_from_slice(&res);
    }

    /* Radix sort */
    fn radix_sort(nums: &mut [i32]) {
        // Get the maximum element of the array, used to determine the maximum number of digits
        let m = *nums.into_iter().max().unwrap();
        // Traverse from the lowest to the highest digit
        let mut exp = 1;
        while exp <= m {
            counting_sort_digit(nums, exp);
            exp *= 10;
        }
    }
    ```

=== "C"

    ```c title="radix_sort.c"
    /* Get the k-th digit of element num, where exp = 10^(k-1) */
    int digit(int num, int exp) {
        // Passing exp instead of k can avoid repeated expensive exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort (based on nums k-th digit) */
    void countingSortDigit(int nums[], int size, int exp) {
        // Decimal digit range is 0~9, therefore need a bucket array of length 10
        int *counter = (int *)malloc((sizeof(int) * 10));
        memset(counter, 0, sizeof(int) * 10); // Initialize to 0 to support subsequent memory release
        // Count the occurrence of digits 0~9
        for (int i = 0; i < size; i++) {
            // Get the k-th digit of nums[i], noted as d
            int d = digit(nums[i], exp);
            // Count the occurrence of digit d
            counter[d]++;
        }
        // Calculate prefix sum, converting "occurrence count" into "array index"
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse, based on bucket statistics, place each element into res
        int *res = (int *)malloc(sizeof(int) * size);
        for (int i = size - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Get the index j for d in the array
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrease the count of d by 1
        }
        // Use result to overwrite the original array nums
        for (int i = 0; i < size; i++) {
            nums[i] = res[i];
        }
        // Free memory
        free(res);
        free(counter);
    }

    /* Radix sort */
    void radixSort(int nums[], int size) {
        // Get the maximum element of the array, used to determine the maximum number of digits
        int max = INT32_MIN;
        for (int i = 0; i < size; i++) {
            if (nums[i] > max) {
                max = nums[i];
            }
        }
        // Traverse from the lowest to the highest digit
        for (int exp = 1; max >= exp; exp *= 10)
            // Perform counting sort on the k-th digit of array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // i.e., exp = 10^(k-1)
            countingSortDigit(nums, size, exp);
    }
    ```

=== "Kotlin"

    ```kotlin title="radix_sort.kt"
    /* Get the k-th digit of element num, where exp = 10^(k-1) */
    fun digit(num: Int, exp: Int): Int {
        // Passing exp instead of k can avoid repeated expensive exponentiation here
        return (num / exp) % 10
    }

    /* Counting sort (based on nums k-th digit) */
    fun countingSortDigit(nums: IntArray, exp: Int) {
        // Decimal digit range is 0~9, therefore need a bucket array of length 10
        val counter = IntArray(10)
        val n = nums.size
        // Count the occurrence of digits 0~9
        for (i in 0..<n) {
            val d = digit(nums[i], exp) // Get the k-th digit of nums[i], noted as d
            counter[d]++                // Count the occurrence of digit d
        }
        // Calculate prefix sum, converting "occurrence count" into "array index"
        for (i in 1..9) {
            counter[i] += counter[i - 1]
        }
        // Traverse in reverse, based on bucket statistics, place each element into res
        val res = IntArray(n)
        for (i in n - 1 downTo 0) {
            val d = digit(nums[i], exp)
            val j = counter[d] - 1 // Get the index j for d in the array
            res[j] = nums[i]       // Place the current element at index j
            counter[d]--           // Decrease the count of d by 1
        }
        // Use result to overwrite the original array nums
        for (i in 0..<n)
            nums[i] = res[i]
    }

    /* Radix sort */
    fun radixSort(nums: IntArray) {
        // Get the maximum element of the array, used to determine the maximum number of digits
        var m = Int.MIN_VALUE
        for (num in nums) if (num > m) m = num
        var exp = 1
        // Traverse from the lowest to the highest digit
        while (exp <= m) {
            // Perform counting sort on the k-th digit of array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // i.e., exp = 10^(k-1)
            countingSortDigit(nums, exp)
            exp *= 10
        }
    }
    ```

=== "Ruby"

    ```ruby title="radix_sort.rb"
    ### Get k-th digit of element num, where exp = 10^(k-1) ###
    def digit(num, exp)
      # Passing exp instead of k avoids expensive exponentiation calculations
      (num / exp) % 10
    end

    ### Counting sort (sort by k-th digit of nums) ###
    def counting_sort_digit(nums, exp)
      # Decimal digit range is 0~9, therefore need a bucket array of length 10
      counter = Array.new(10, 0)
      n = nums.length
      # Count the occurrence of digits 0~9
      for i in 0...n
        d = digit(nums[i], exp) # Get the k-th digit of nums[i], noted as d
        counter[d] += 1 # Count the occurrence of digit d
      end
      # Calculate prefix sum, converting "occurrence count" into "array index"
      (1...10).each { |i| counter[i] += counter[i - 1] }
      # Traverse in reverse, based on bucket statistics, place each element into res
      res = Array.new(n, 0)
      for i in (n - 1).downto(0)
        d = digit(nums[i], exp)
        j = counter[d] - 1 # Get the index j for d in the array
        res[j] = nums[i] # Place the current element at index j
        counter[d] -= 1 # Decrease the count of d by 1
      end
      # Use result to overwrite the original array nums
      (0...n).each { |i| nums[i] = res[i] }
    end

    ### Radix sort ###
    def radix_sort(nums)
      # Get the maximum element of the array, used to determine the maximum number of digits
      m = nums.max
      # Traverse from the lowest to the highest digit
      exp = 1
      while exp <= m
        # Perform counting sort on the k-th digit of array elements
        # k = 1 -> exp = 1
        # k = 2 -> exp = 10
        # i.e., exp = 10^(k-1)
        counting_sort_digit(nums, exp)
        exp *= 10
      end
    end
    ```

!!! question "Why start sorting from the lowest digit?"

    In successive sorting rounds, the result of a later round will override the result of an earlier round. For example, if the first round result is $a < b$, while the second round result is $a > b$, then the second round's result will replace the first round's result. Since higher-order digits have higher priority than lower-order digits, we should sort the lower digits first and then sort the higher digits.

## 11.10.2 &nbsp; Algorithm Characteristics

Compared to counting sort, radix sort is suitable for larger numerical ranges, **but the prerequisite is that the data must be representable in a fixed number of digits, and the number of digits should not be too large**. For example, floating-point numbers are not suitable for radix sort because their number of digits $k$ may be too large, potentially leading to time complexity $O(nk) \gg O(n^2)$.

- **Time complexity of $O(nk)$, non-adaptive sorting**: Let the data volume be $n$, the data be in base $d$, and the maximum number of digits be $k$. Then performing counting sort on a certain digit uses $O(n + d)$ time, and sorting all $k$ digits uses $O((n + d)k)$ time. Typically, both $d$ and $k$ are relatively small, and the time complexity approaches $O(n)$.
- **Space complexity of $O(n + d)$, non-in-place sorting**: Same as counting sort, radix sort requires auxiliary arrays `res` and `counter` of lengths $n$ and $d$.
- **Stable sorting**: When counting sort is stable, radix sort is also stable; when counting sort is unstable, radix sort cannot guarantee obtaining correct sorting results.
