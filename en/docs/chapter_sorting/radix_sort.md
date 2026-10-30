---
comments: true
---

# 11.10 &nbsp; Radix sort

The previous section introduced counting sort, which suits a large number of elements $n$ with a small value range $m$. Suppose we need to sort $n = 10^6$ student IDs, each an $8$-digit number. The value range $m = 10^8$ is very large, so counting sort would require substantial memory. Radix sort avoids this problem.

<u>Radix sort</u> shares counting sort's core idea of sorting by counting occurrences. It also uses the relative significance of digit positions, sorting one digit at a time to obtain the final order.

## 11.10.1 &nbsp; Algorithm steps

For the student IDs, number the least significant digit as $1$ and the most significant as $8$. Radix sort proceeds as shown below.

1. Initialize the digit position $k = 1$.
2. Apply counting sort to the $k$th digit of each student ID. The data is now sorted in ascending order by its $k$th digit.
3. Increase the digit position $k$ by $1$ and return to step `2.`. Continue until all digit positions have been processed.

![The radix sort process](radix_sort.assets/radix_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-18 &nbsp; The radix sort process </p>

Now consider the implementation. For a number $x$ in base $d$, its $k$th digit $x_k$ can be obtained with the following formula:

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

Here, $\lfloor a \rfloor$ rounds the floating-point value $a$ down, and $\bmod \: d$ takes the remainder modulo $d$. For the student IDs, $d = 10$ and $k \in [1, 8]$.

We also need to modify counting sort slightly so that it sorts by the $k$th digit:

=== "Python"

    ```python title="radix_sort.py"
    def digit(num: int, exp: int) -> int:
        """Get the k-th digit of num, where exp = 10^(k-1)"""
        # Passing exp instead of k avoids repeatedly performing expensive exponentiation here
        return (num // exp) % 10

    def counting_sort_digit(nums: list[int], exp: int):
        """Counting sort (sort nums by the k-th digit)"""
        # Decimal digits range from 0 to 9, so the bucket array needs length 10
        counter = [0] * 10
        n = len(nums)
        # Count the occurrences of each digit from 0 to 9
        for i in range(n):
            d = digit(nums[i], exp)  # Get the k-th digit of nums[i] and store it in d
            counter[d] += 1  # Count the occurrences of digit d
        # Compute prefix sums to convert occurrence counts into array positions
        for i in range(1, 10):
            counter[i] += counter[i - 1]
        # Traverse in reverse and place each element into res according to the bucket counts
        res = [0] * n
        for i in range(n - 1, -1, -1):
            d = digit(nums[i], exp)
            j = counter[d] - 1  # Get the destination index j for digit d in the array
            res[j] = nums[i]  # Place the current element at index j
            counter[d] -= 1  # Decrease the count for d by 1
        # Overwrite the original array nums with the result
        for i in range(n):
            nums[i] = res[i]

    def radix_sort(nums: list[int]):
        """Radix sort"""
        # Get the largest array element to determine the maximum number of digits
        m = max(nums)
        # Process digits from least significant to most significant
        exp = 1
        while exp <= m:
            # Apply counting sort to the k-th digit of the array elements
            # k = 1 -> exp = 1
            # k = 2 -> exp = 10
            # That is, exp = 10^(k-1)
            counting_sort_digit(nums, exp)
            exp *= 10
    ```

=== "C++"

    ```cpp title="radix_sort.cpp"
    /* Get the k-th digit of num, where exp = 10^(k-1) */
    int digit(int num, int exp) {
        // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort (sort nums by the k-th digit) */
    void countingSortDigit(vector<int> &nums, int exp) {
        // Decimal digits range from 0 to 9, so the bucket array needs length 10
        vector<int> counter(10, 0);
        int n = nums.size();
        // Count the occurrences of each digit from 0 to 9
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // Get the k-th digit of nums[i] and store it in d
            counter[d]++;                // Count the occurrences of digit d
        }
        // Compute prefix sums to convert occurrence counts into array positions
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse and place each element into res according to the bucket counts
        vector<int> res(n, 0);
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Get the destination index j for digit d in the array
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrease the count for d by 1
        }
        // Overwrite the original array nums with the result
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* Radix sort */
    void radixSort(vector<int> &nums) {
        // Get the largest array element to determine the maximum number of digits
        int m = *max_element(nums.begin(), nums.end());
        // Process digits from least significant to most significant
        for (int exp = 1; exp <= m; exp *= 10)
            // Apply counting sort to the k-th digit of the array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // That is, exp = 10^(k-1)
            countingSortDigit(nums, exp);
    }
    ```

=== "Java"

    ```java title="radix_sort.java"
    /* Get the k-th digit of num, where exp = 10^(k-1) */
    int digit(int num, int exp) {
        // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort (sort nums by the k-th digit) */
    void countingSortDigit(int[] nums, int exp) {
        // Decimal digits range from 0 to 9, so the bucket array needs length 10
        int[] counter = new int[10];
        int n = nums.length;
        // Count the occurrences of each digit from 0 to 9
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // Get the k-th digit of nums[i] and store it in d
            counter[d]++;                // Count the occurrences of digit d
        }
        // Compute prefix sums to convert occurrence counts into array positions
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse and place each element into res according to the bucket counts
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Get the destination index j for digit d in the array
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrease the count for d by 1
        }
        // Overwrite the original array nums with the result
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* Radix sort */
    void radixSort(int[] nums) {
        // Get the largest array element to determine the maximum number of digits
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // Process digits from least significant to most significant
        for (int exp = 1; exp <= m; exp *= 10) {
            // Apply counting sort to the k-th digit of the array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // That is, exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "C#"

    ```csharp title="radix_sort.cs"
    /* Get the k-th digit of num, where exp = 10^(k-1) */
    int Digit(int num, int exp) {
        // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort (sort nums by the k-th digit) */
    void CountingSortDigit(int[] nums, int exp) {
        // Decimal digits range from 0 to 9, so the bucket array needs length 10
        int[] counter = new int[10];
        int n = nums.Length;
        // Count the occurrences of each digit from 0 to 9
        for (int i = 0; i < n; i++) {
            int d = Digit(nums[i], exp); // Get the k-th digit of nums[i] and store it in d
            counter[d]++;                // Count the occurrences of digit d
        }
        // Compute prefix sums to convert occurrence counts into array positions
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse and place each element into res according to the bucket counts
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = Digit(nums[i], exp);
            int j = counter[d] - 1; // Get the destination index j for digit d in the array
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrease the count for d by 1
        }
        // Overwrite the original array nums with the result
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Radix sort */
    void RadixSort(int[] nums) {
        // Get the largest array element to determine the maximum number of digits
        int m = int.MinValue;
        foreach (int num in nums) {
            if (num > m) m = num;
        }
        // Process digits from least significant to most significant
        for (int exp = 1; exp <= m; exp *= 10) {
            // Apply counting sort to the k-th digit of the array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // That is, exp = 10^(k-1)
            CountingSortDigit(nums, exp);
        }
    }
    ```

=== "Go"

    ```go title="radix_sort.go"
    /* Get the k-th digit of num, where exp = 10^(k-1) */
    func digit(num, exp int) int {
        // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
        return (num / exp) % 10
    }

    /* Counting sort (sort nums by the k-th digit) */
    func countingSortDigit(nums []int, exp int) {
        // Decimal digits range from 0 to 9, so the bucket array needs length 10
        counter := make([]int, 10)
        n := len(nums)
        // Count the occurrences of each digit from 0 to 9
        for i := 0; i < n; i++ {
            d := digit(nums[i], exp) // Get the k-th digit of nums[i] and store it in d
            counter[d]++             // Count the occurrences of digit d
        }
        // Compute prefix sums to convert occurrence counts into array positions
        for i := 1; i < 10; i++ {
            counter[i] += counter[i-1]
        }
        // Traverse in reverse and place each element into res according to the bucket counts
        res := make([]int, n)
        for i := n - 1; i >= 0; i-- {
            d := digit(nums[i], exp)
            j := counter[d] - 1 // Get the destination index j for digit d in the array
            res[j] = nums[i]    // Place the current element at index j
            counter[d]--        // Decrease the count for d by 1
        }
        // Overwrite the original array nums with the result
        for i := 0; i < n; i++ {
            nums[i] = res[i]
        }
    }

    /* Radix sort */
    func radixSort(nums []int) {
        // Get the largest array element to determine the maximum number of digits
        max := math.MinInt
        for _, num := range nums {
            if num > max {
                max = num
            }
        }
        // Process digits from least significant to most significant
        for exp := 1; max >= exp; exp *= 10 {
            // Apply counting sort to the k-th digit of the array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // That is, exp = 10^(k-1)
            countingSortDigit(nums, exp)
        }
    }
    ```

=== "Swift"

    ```swift title="radix_sort.swift"
    /* Get the k-th digit of num, where exp = 10^(k-1) */
    func digit(num: Int, exp: Int) -> Int {
        // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
        (num / exp) % 10
    }

    /* Counting sort (sort nums by the k-th digit) */
    func countingSortDigit(nums: inout [Int], exp: Int) {
        // Decimal digits range from 0 to 9, so the bucket array needs length 10
        var counter = Array(repeating: 0, count: 10)
        // Count the occurrences of each digit from 0 to 9
        for i in nums.indices {
            let d = digit(num: nums[i], exp: exp) // Get the k-th digit of nums[i] and store it in d
            counter[d] += 1 // Count the occurrences of digit d
        }
        // Compute prefix sums to convert occurrence counts into array positions
        for i in 1 ..< 10 {
            counter[i] += counter[i - 1]
        }
        // Traverse in reverse and place each element into res according to the bucket counts
        var res = Array(repeating: 0, count: nums.count)
        for i in nums.indices.reversed() {
            let d = digit(num: nums[i], exp: exp)
            let j = counter[d] - 1 // Get the destination index j for digit d in the array
            res[j] = nums[i] // Place the current element at index j
            counter[d] -= 1 // Decrease the count for d by 1
        }
        // Overwrite the original array nums with the result
        for i in nums.indices {
            nums[i] = res[i]
        }
    }

    /* Radix sort */
    func radixSort(nums: inout [Int]) {
        // Get the largest array element to determine the maximum number of digits
        var m = Int.min
        for num in nums {
            if num > m {
                m = num
            }
        }
        // Process digits from least significant to most significant
        for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
            // Apply counting sort to the k-th digit of the array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // That is, exp = 10^(k-1)
            countingSortDigit(nums: &nums, exp: exp)
        }
    }
    ```

=== "JS"

    ```javascript title="radix_sort.js"
    /* Get the k-th digit of num, where exp = 10^(k-1) */
    function digit(num, exp) {
        // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
        return Math.floor(num / exp) % 10;
    }

    /* Counting sort (sort nums by the k-th digit) */
    function countingSortDigit(nums, exp) {
        // Decimal digits range from 0 to 9, so the bucket array needs length 10
        const counter = new Array(10).fill(0);
        const n = nums.length;
        // Count the occurrences of each digit from 0 to 9
        for (let i = 0; i < n; i++) {
            const d = digit(nums[i], exp); // Get the k-th digit of nums[i] and store it in d
            counter[d]++; // Count the occurrences of digit d
        }
        // Compute prefix sums to convert occurrence counts into array positions
        for (let i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse and place each element into res according to the bucket counts
        const res = new Array(n).fill(0);
        for (let i = n - 1; i >= 0; i--) {
            const d = digit(nums[i], exp);
            const j = counter[d] - 1; // Get the destination index j for digit d in the array
            res[j] = nums[i]; // Place the current element at index j
            counter[d]--; // Decrease the count for d by 1
        }
        // Overwrite the original array nums with the result
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Radix sort */
    function radixSort(nums) {
        // Get the largest array element to determine the maximum number of digits
        let m = Math.max(... nums);
        // Process digits from least significant to most significant
        for (let exp = 1; exp <= m; exp *= 10) {
            // Apply counting sort to the k-th digit of the array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // That is, exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "TS"

    ```typescript title="radix_sort.ts"
    /* Get the k-th digit of num, where exp = 10^(k-1) */
    function digit(num: number, exp: number): number {
        // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
        return Math.floor(num / exp) % 10;
    }

    /* Counting sort (sort nums by the k-th digit) */
    function countingSortDigit(nums: number[], exp: number): void {
        // Decimal digits range from 0 to 9, so the bucket array needs length 10
        const counter = new Array(10).fill(0);
        const n = nums.length;
        // Count the occurrences of each digit from 0 to 9
        for (let i = 0; i < n; i++) {
            const d = digit(nums[i], exp); // Get the k-th digit of nums[i] and store it in d
            counter[d]++; // Count the occurrences of digit d
        }
        // Compute prefix sums to convert occurrence counts into array positions
        for (let i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse and place each element into res according to the bucket counts
        const res = new Array(n).fill(0);
        for (let i = n - 1; i >= 0; i--) {
            const d = digit(nums[i], exp);
            const j = counter[d] - 1; // Get the destination index j for digit d in the array
            res[j] = nums[i]; // Place the current element at index j
            counter[d]--; // Decrease the count for d by 1
        }
        // Overwrite the original array nums with the result
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Radix sort */
    function radixSort(nums: number[]): void {
        // Get the largest array element to determine the maximum number of digits
        let m: number = Math.max(... nums);
        // Process digits from least significant to most significant
        for (let exp = 1; exp <= m; exp *= 10) {
            // Apply counting sort to the k-th digit of the array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // That is, exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "Dart"

    ```dart title="radix_sort.dart"
    /* Get the k-th digit of _num, where exp = 10^(k-1) */
    int digit(int _num, int exp) {
      // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
      return (_num ~/ exp) % 10;
    }

    /* Counting sort (sort nums by the k-th digit) */
    void countingSortDigit(List<int> nums, int exp) {
      // Decimal digits range from 0 to 9, so the bucket array needs length 10
      List<int> counter = List<int>.filled(10, 0);
      int n = nums.length;
      // Count the occurrences of each digit from 0 to 9
      for (int i = 0; i < n; i++) {
        int d = digit(nums[i], exp); // Get the k-th digit of nums[i] and store it in d
        counter[d]++; // Count the occurrences of digit d
      }
      // Compute prefix sums to convert occurrence counts into array positions
      for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
      }
      // Traverse in reverse and place each element into res according to the bucket counts
      List<int> res = List<int>.filled(n, 0);
      for (int i = n - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // Get the destination index j for digit d in the array
        res[j] = nums[i]; // Place the current element at index j
        counter[d]--; // Decrease the count for d by 1
      }
      // Overwrite the original array nums with the result
      for (int i = 0; i < n; i++) nums[i] = res[i];
    }

    /* Radix sort */
    void radixSort(List<int> nums) {
      // Get the largest array element to determine the maximum number of digits
      // On native platforms, Dart int values are 64-bit integers
      int m = -1 << 63;
      for (int _num in nums) if (_num > m) m = _num;
      // Process digits from least significant to most significant
      for (int exp = 1; exp <= m; exp *= 10)
        // Apply counting sort to the k-th digit of the array elements
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // That is, exp = 10^(k-1)
        countingSortDigit(nums, exp);
    }
    ```

=== "Rust"

    ```rust title="radix_sort.rs"
    /* Get the k-th digit of num, where exp = 10^(k-1) */
    fn digit(num: i32, exp: i32) -> usize {
        // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
        return ((num / exp) % 10) as usize;
    }

    /* Counting sort (sort nums by the k-th digit) */
    fn counting_sort_digit(nums: &mut [i32], exp: i32) {
        // Decimal digits range from 0 to 9, so the bucket array needs length 10
        let mut counter = [0; 10];
        let n = nums.len();
        // Count the occurrences of each digit from 0 to 9
        for i in 0..n {
            let d = digit(nums[i], exp); // Get the k-th digit of nums[i] and store it in d
            counter[d] += 1; // Count the occurrences of digit d
        }
        // Compute prefix sums to convert occurrence counts into array positions
        for i in 1..10 {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse and place each element into res according to the bucket counts
        let mut res = vec![0; n];
        for i in (0..n).rev() {
            let d = digit(nums[i], exp);
            let j = counter[d] - 1; // Get the destination index j for digit d in the array
            res[j] = nums[i]; // Place the current element at index j
            counter[d] -= 1; // Decrease the count for d by 1
        }
        // Overwrite the original array nums with the result
        nums.copy_from_slice(&res);
    }

    /* Radix sort */
    fn radix_sort(nums: &mut [i32]) {
        // Get the largest array element to determine the maximum number of digits
        let m = *nums.into_iter().max().unwrap();
        // Process digits from least significant to most significant
        let mut exp = 1;
        while exp <= m {
            counting_sort_digit(nums, exp);
            exp *= 10;
        }
    }
    ```

=== "C"

    ```c title="radix_sort.c"
    /* Get the k-th digit of num, where exp = 10^(k-1) */
    int digit(int num, int exp) {
        // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort (sort nums by the k-th digit) */
    void countingSortDigit(int nums[], int size, int exp) {
        // Decimal digits range from 0 to 9, so the bucket array needs length 10
        int *counter = (int *)malloc((sizeof(int) * 10));
        memset(counter, 0, sizeof(int) * 10); // Initialize the counts to 0
        // Count the occurrences of each digit from 0 to 9
        for (int i = 0; i < size; i++) {
            // Get the k-th digit of nums[i] and store it in d
            int d = digit(nums[i], exp);
            // Count the occurrences of digit d
            counter[d]++;
        }
        // Compute prefix sums to convert occurrence counts into array positions
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse in reverse and place each element into res according to the bucket counts
        int *res = (int *)malloc(sizeof(int) * size);
        for (int i = size - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Get the destination index j for digit d in the array
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrease the count for d by 1
        }
        // Overwrite the original array nums with the result
        for (int i = 0; i < size; i++) {
            nums[i] = res[i];
        }
        // Free memory
        free(res);
        free(counter);
    }

    /* Radix sort */
    void radixSort(int nums[], int size) {
        // Get the largest array element to determine the maximum number of digits
        int max = INT32_MIN;
        for (int i = 0; i < size; i++) {
            if (nums[i] > max) {
                max = nums[i];
            }
        }
        // Process digits from least significant to most significant
        for (int exp = 1; max >= exp; exp *= 10)
            // Apply counting sort to the k-th digit of the array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // That is, exp = 10^(k-1)
            countingSortDigit(nums, size, exp);
    }
    ```

=== "Kotlin"

    ```kotlin title="radix_sort.kt"
    /* Get the k-th digit of num, where exp = 10^(k-1) */
    fun digit(num: Int, exp: Int): Int {
        // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
        return (num / exp) % 10
    }

    /* Counting sort (sort nums by the k-th digit) */
    fun countingSortDigit(nums: IntArray, exp: Int) {
        // Decimal digits range from 0 to 9, so the bucket array needs length 10
        val counter = IntArray(10)
        val n = nums.size
        // Count the occurrences of each digit from 0 to 9
        for (i in 0..<n) {
            val d = digit(nums[i], exp) // Get the k-th digit of nums[i] and store it in d
            counter[d]++                // Count the occurrences of digit d
        }
        // Compute prefix sums to convert occurrence counts into array positions
        for (i in 1..9) {
            counter[i] += counter[i - 1]
        }
        // Traverse in reverse and place each element into res according to the bucket counts
        val res = IntArray(n)
        for (i in n - 1 downTo 0) {
            val d = digit(nums[i], exp)
            val j = counter[d] - 1 // Get the destination index j for digit d in the array
            res[j] = nums[i]       // Place the current element at index j
            counter[d]--           // Decrease the count for d by 1
        }
        // Overwrite the original array nums with the result
        for (i in 0..<n)
            nums[i] = res[i]
    }

    /* Radix sort */
    fun radixSort(nums: IntArray) {
        // Get the largest array element to determine the maximum number of digits
        var m = Int.MIN_VALUE
        for (num in nums) if (num > m) m = num
        var exp = 1
        // Process digits from least significant to most significant
        while (exp <= m) {
            // Apply counting sort to the k-th digit of the array elements
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // That is, exp = 10^(k-1)
            countingSortDigit(nums, exp)
            exp *= 10
        }
    }
    ```

=== "Ruby"

    ```ruby title="radix_sort.rb"
    ### Get the k-th digit of num, where exp = 10^(k-1) ###
    def digit(num, exp)
      # Passing exp instead of k avoids repeatedly performing expensive exponentiation here
      (num / exp) % 10
    end

    ### Counting sort (sort nums by the k-th digit)###
    def counting_sort_digit(nums, exp)
      # Decimal digits range from 0 to 9, so the bucket array needs length 10
      counter = Array.new(10, 0)
      n = nums.length
      # Count the occurrences of each digit from 0 to 9
      for i in 0...n
        d = digit(nums[i], exp) # Get the k-th digit of nums[i] and store it in d
        counter[d] += 1 # Count the occurrences of digit d
      end
      # Compute prefix sums to convert occurrence counts into array positions
      (1...10).each { |i| counter[i] += counter[i - 1] }
      # Traverse in reverse and place each element into res according to the bucket counts
      res = Array.new(n, 0)
      for i in (n - 1).downto(0)
        d = digit(nums[i], exp)
        j = counter[d] - 1 # Get the destination index j for digit d in the array
        res[j] = nums[i] # Place the current element at index j
        counter[d] -= 1 # Decrease the count for d by 1
      end
      # Overwrite the original array nums with the result
      (0...n).each { |i| nums[i] = res[i] }
    end

    ### Radix sort ###
    def radix_sort(nums)
      # Get the largest array element to determine the maximum number of digits
      m = nums.max
      # Process digits from least significant to most significant
      exp = 1
      while exp <= m
        # Apply counting sort to the k-th digit of the array elements
        # k = 1 -> exp = 1
        # k = 2 -> exp = 10
        # That is, exp = 10^(k-1)
        counting_sort_digit(nums, exp)
        exp *= 10
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20digit%28num%3A%20int,%20exp%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Get%20the%20k-th%20digit%20of%20num,%20where%20exp%20%3D%2010%5E%28k-1%29%22%22%22%0A%20%20%20%20%23%20Passing%20exp%20instead%20of%20k%20avoids%20repeatedly%20performing%20expensive%20exponentiation%20here%0A%20%20%20%20return%20%28num%20//%20exp%29%20%25%2010%0A%0Adef%20counting_sort_digit%28nums%3A%20list%5Bint%5D,%20exp%3A%20int%29%3A%0A%20%20%20%20%22%22%22Counting%20sort%20%28sort%20nums%20by%20the%20k-th%20digit%29%22%22%22%0A%20%20%20%20%23%20Decimal%20digits%20range%20from%200%20to%209,%20so%20the%20bucket%20array%20needs%20length%2010%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20Count%20the%20occurrences%20of%20each%20digit%20from%200%20to%209%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%20%20%23%20Get%20the%20k-th%20digit%20of%20nums%5Bi%5D%20and%20store%20it%20in%20d%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20%2B%3D%201%20%20%23%20Count%20the%20occurrences%20of%20digit%20d%0A%20%20%20%20%23%20Compute%20prefix%20sums%20to%20convert%20occurrence%20counts%20into%20array%20positions%0A%20%20%20%20for%20i%20in%20range%281,%2010%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%5D%20%2B%3D%20counter%5Bi%20-%201%5D%0A%20%20%20%20%23%20Traverse%20in%20reverse%20and%20place%20each%20element%20into%20res%20according%20to%20the%20bucket%20counts%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%0A%20%20%20%20%20%20%20%20j%20%3D%20counter%5Bd%5D%20-%201%20%20%23%20Get%20the%20destination%20index%20j%20for%20digit%20d%20in%20the%20array%0A%20%20%20%20%20%20%20%20res%5Bj%5D%20%3D%20nums%5Bi%5D%20%20%23%20Place%20the%20current%20element%20at%20index%20j%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20-%3D%201%20%20%23%20Decrease%20the%20count%20for%20d%20by%201%0A%20%20%20%20%23%20Overwrite%20the%20original%20array%20nums%20with%20the%20result%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0Adef%20radix_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Radix%20sort%22%22%22%0A%20%20%20%20%23%20Get%20the%20largest%20array%20element%20to%20determine%20the%20maximum%20number%20of%20digits%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%20Process%20digits%20from%20least%20significant%20to%20most%20significant%0A%20%20%20%20exp%20%3D%201%0A%20%20%20%20while%20exp%20%3C%3D%20m%3A%0A%20%20%20%20%20%20%20%20%23%20Apply%20counting%20sort%20to%20the%20k-th%20digit%20of%20the%20array%20elements%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%201%20-%3E%20exp%20%3D%201%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%202%20-%3E%20exp%20%3D%2010%0A%20%20%20%20%20%20%20%20%23%20That%20is,%20exp%20%3D%2010%5E%28k-1%29%0A%20%20%20%20%20%20%20%20counting_sort_digit%28nums,%20exp%29%0A%20%20%20%20%20%20%20%20exp%20%2A%3D%2010%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Radix%20sort%0A%20%20%20%20nums%20%3D%20%5B%0A%20%20%20%20%20%20%20%20105,%0A%20%20%20%20%20%20%20%20356,%0A%20%20%20%20%20%20%20%20428,%0A%20%20%20%20%20%20%20%20348,%0A%20%20%20%20%20%20%20%20818,%0A%20%20%20%20%5D%0A%20%20%20%20radix_sort%28nums%29%0A%20%20%20%20print%28%22After%20radix%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20digit%28num%3A%20int,%20exp%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Get%20the%20k-th%20digit%20of%20num,%20where%20exp%20%3D%2010%5E%28k-1%29%22%22%22%0A%20%20%20%20%23%20Passing%20exp%20instead%20of%20k%20avoids%20repeatedly%20performing%20expensive%20exponentiation%20here%0A%20%20%20%20return%20%28num%20//%20exp%29%20%25%2010%0A%0Adef%20counting_sort_digit%28nums%3A%20list%5Bint%5D,%20exp%3A%20int%29%3A%0A%20%20%20%20%22%22%22Counting%20sort%20%28sort%20nums%20by%20the%20k-th%20digit%29%22%22%22%0A%20%20%20%20%23%20Decimal%20digits%20range%20from%200%20to%209,%20so%20the%20bucket%20array%20needs%20length%2010%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20Count%20the%20occurrences%20of%20each%20digit%20from%200%20to%209%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%20%20%23%20Get%20the%20k-th%20digit%20of%20nums%5Bi%5D%20and%20store%20it%20in%20d%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20%2B%3D%201%20%20%23%20Count%20the%20occurrences%20of%20digit%20d%0A%20%20%20%20%23%20Compute%20prefix%20sums%20to%20convert%20occurrence%20counts%20into%20array%20positions%0A%20%20%20%20for%20i%20in%20range%281,%2010%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%5D%20%2B%3D%20counter%5Bi%20-%201%5D%0A%20%20%20%20%23%20Traverse%20in%20reverse%20and%20place%20each%20element%20into%20res%20according%20to%20the%20bucket%20counts%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%0A%20%20%20%20%20%20%20%20j%20%3D%20counter%5Bd%5D%20-%201%20%20%23%20Get%20the%20destination%20index%20j%20for%20digit%20d%20in%20the%20array%0A%20%20%20%20%20%20%20%20res%5Bj%5D%20%3D%20nums%5Bi%5D%20%20%23%20Place%20the%20current%20element%20at%20index%20j%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20-%3D%201%20%20%23%20Decrease%20the%20count%20for%20d%20by%201%0A%20%20%20%20%23%20Overwrite%20the%20original%20array%20nums%20with%20the%20result%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0Adef%20radix_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Radix%20sort%22%22%22%0A%20%20%20%20%23%20Get%20the%20largest%20array%20element%20to%20determine%20the%20maximum%20number%20of%20digits%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%20Process%20digits%20from%20least%20significant%20to%20most%20significant%0A%20%20%20%20exp%20%3D%201%0A%20%20%20%20while%20exp%20%3C%3D%20m%3A%0A%20%20%20%20%20%20%20%20%23%20Apply%20counting%20sort%20to%20the%20k-th%20digit%20of%20the%20array%20elements%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%201%20-%3E%20exp%20%3D%201%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%202%20-%3E%20exp%20%3D%2010%0A%20%20%20%20%20%20%20%20%23%20That%20is,%20exp%20%3D%2010%5E%28k-1%29%0A%20%20%20%20%20%20%20%20counting_sort_digit%28nums,%20exp%29%0A%20%20%20%20%20%20%20%20exp%20%2A%3D%2010%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Radix%20sort%0A%20%20%20%20nums%20%3D%20%5B%0A%20%20%20%20%20%20%20%20105,%0A%20%20%20%20%20%20%20%20356,%0A%20%20%20%20%20%20%20%20428,%0A%20%20%20%20%20%20%20%20348,%0A%20%20%20%20%20%20%20%20818,%0A%20%20%20%20%5D%0A%20%20%20%20radix_sort%28nums%29%0A%20%20%20%20print%28%22After%20radix%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

!!! question "Why start with the least significant digit?"

    In successive rounds, a later sort takes precedence over an earlier one. For example, if the first round orders two elements as $a < b$ but the second orders them as $a > b$, the second result replaces the first. Higher digits have greater priority, so lower digits must be sorted first.

## 11.10.2 &nbsp; Algorithm properties

Compared with counting sort, radix sort handles a larger range of values, **provided the data can be represented with a fixed number of digits and that number is not too large**. For example, floating-point numbers are unsuitable because their digit count $k$ may be so large that $O(nk) \gg O(n^2)$.

- **Time complexity: $O(nk)$; not adaptive**. For $n$ elements represented in base $d$ with at most $k$ digits, counting sort on one digit takes $O(n + d)$ time. Sorting all $k$ digits takes $O((n + d)k)$. Usually $d$ and $k$ are relatively small, so the complexity approaches $O(n)$.
- **Space complexity: $O(n + d)$; not in-place**. Like counting sort, radix sort requires arrays `res` and `counter` of lengths $n$ and $d$.
- **Stable**. Radix sort is stable when the counting sort used within it is stable. If counting sort is not stable, radix sort cannot guarantee a correctly sorted result.
