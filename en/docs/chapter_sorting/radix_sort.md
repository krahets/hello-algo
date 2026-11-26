---
comments: true
---

# 11.10 &nbsp; Radix sort

The previous section introduced counting sort, which works well when the number of elements $n$ is large but the range of values $m$ is small. Suppose we need to sort $n = 10^6$ student IDs, each $8$ digits long. The range of values, $m = 10^8$, is so large that counting sort would require a great deal of memory. Radix sort avoids this problem.

<u>Radix sort</u> shares counting sort's basic idea of using counts to order elements. It also takes advantage of place value: sorting by one digit at a time, in succession, produces the final sorted order.

## 11.10.1 &nbsp; How the algorithm works

For the student IDs, number the digits from $1$ at the least significant end to $8$ at the most significant end. Figure 11-18 shows how radix sort proceeds.

1. Initialize the digit position $k = 1$.
2. Apply counting sort to digit $k$ of the student IDs. The IDs are now in ascending order by digit $k$.
3. Increase $k$ by $1$ and return to step `2.`. Stop after sorting by every digit.

![Radix sort procedure](radix_sort.assets/radix_sort_overview.svg){ class="animation-figure" }

<p align="center"> Figure 11-18 &nbsp; Radix sort procedure </p>

Let's look at the implementation. For a base-$d$ number $x$, we can obtain digit $k$, denoted by $x_k$, with the following formula:

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

Here $\lfloor a \rfloor$ rounds the floating-point number $a$ down to an integer, and $\bmod \: d$ takes the remainder after division by $d$. For the student IDs, $d = 10$ and $k \in [1, 8]$.

We also need to adapt counting sort slightly so that it sorts numbers by digit $k$:

=== "Python"

    ```python title="radix_sort.py"
    def digit(num: int, exp: int) -> int:
        """Get digit k of num, where exp = 10^(k-1)"""
        # Passing exp instead of k avoids repeating the costly exponentiation here
        return (num // exp) % 10

    def counting_sort_digit(nums: list[int], exp: int):
        """Counting sort by digit k of each element in nums"""
        # Decimal digits range from 0 to 9, so the bucket array needs 10 entries
        counter = [0] * 10
        n = len(nums)
        # Count the occurrences of digits 0 through 9
        for i in range(n):
            d = digit(nums[i], exp)  # Let d be digit k of nums[i]
            counter[d] += 1  # Count this occurrence of digit d
        # Compute prefix sums to convert counts into array positions
        for i in range(1, 10):
            counter[i] += counter[i - 1]
        # Traverse backward and use the bucket counts to place each element in res
        res = [0] * n
        for i in range(n - 1, -1, -1):
            d = digit(nums[i], exp)
            j = counter[d] - 1  # Get the array index j for d
            res[j] = nums[i]  # Place the current element at index j
            counter[d] -= 1  # Decrement the count for d by 1
        # Copy the result back into nums
        for i in range(n):
            nums[i] = res[i]

    def radix_sort(nums: list[int]):
        """Radix sort"""
        # Find the largest element to determine the maximum number of digits
        m = max(nums)
        # Work from the least significant digit to the most significant
        exp = 1
        while exp <= m:
            # Apply counting sort to the array elements by digit k
            # k = 1 -> exp = 1
            # k = 2 -> exp = 10
            # Here exp = 10^(k-1)
            counting_sort_digit(nums, exp)
            exp *= 10
    ```

=== "C++"

    ```cpp title="radix_sort.cpp"
    /* Get digit k of num, where exp = 10^(k-1) */
    int digit(int num, int exp) {
        // Passing exp instead of k avoids repeating the costly exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort by digit k of each element in nums */
    void countingSortDigit(vector<int> &nums, int exp) {
        // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
        vector<int> counter(10, 0);
        int n = nums.size();
        // Count the occurrences of digits 0 through 9
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // Let d be digit k of nums[i]
            counter[d]++;                // Count this occurrence of digit d
        }
        // Compute prefix sums to convert counts into array positions
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse backward and use the bucket counts to place each element in res
        vector<int> res(n, 0);
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Get the array index j for d
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrement the count for d by 1
        }
        // Copy the result back into nums
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* Radix sort */
    void radixSort(vector<int> &nums) {
        // Find the largest element to determine the maximum number of digits
        int m = *max_element(nums.begin(), nums.end());
        // Work from the least significant digit to the most significant
        for (int exp = 1; exp <= m; exp *= 10)
            // Apply counting sort to the array elements by digit k
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // Here exp = 10^(k-1)
            countingSortDigit(nums, exp);
    }
    ```

=== "Java"

    ```java title="radix_sort.java"
    /* Get digit k of num, where exp = 10^(k-1) */
    int digit(int num, int exp) {
        // Passing exp instead of k avoids repeating the costly exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort by digit k of each element in nums */
    void countingSortDigit(int[] nums, int exp) {
        // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
        int[] counter = new int[10];
        int n = nums.length;
        // Count the occurrences of digits 0 through 9
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // Let d be digit k of nums[i]
            counter[d]++;                // Count this occurrence of digit d
        }
        // Compute prefix sums to convert counts into array positions
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse backward and use the bucket counts to place each element in res
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Get the array index j for d
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrement the count for d by 1
        }
        // Copy the result back into nums
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* Radix sort */
    void radixSort(int[] nums) {
        // Find the largest element to determine the maximum number of digits
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // Work from the least significant digit to the most significant
        for (int exp = 1; exp <= m; exp *= 10) {
            // Apply counting sort to the array elements by digit k
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // Here exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "C#"

    ```csharp title="radix_sort.cs"
    /* Get digit k of num, where exp = 10^(k-1) */
    int Digit(int num, int exp) {
        // Passing exp instead of k avoids repeating the costly exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort by digit k of each element in nums */
    void CountingSortDigit(int[] nums, int exp) {
        // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
        int[] counter = new int[10];
        int n = nums.Length;
        // Count the occurrences of digits 0 through 9
        for (int i = 0; i < n; i++) {
            int d = Digit(nums[i], exp); // Let d be digit k of nums[i]
            counter[d]++;                // Count this occurrence of digit d
        }
        // Compute prefix sums to convert counts into array positions
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse backward and use the bucket counts to place each element in res
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = Digit(nums[i], exp);
            int j = counter[d] - 1; // Get the array index j for d
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrement the count for d by 1
        }
        // Copy the result back into nums
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Radix sort */
    void RadixSort(int[] nums) {
        // Find the largest element to determine the maximum number of digits
        int m = int.MinValue;
        foreach (int num in nums) {
            if (num > m) m = num;
        }
        // Work from the least significant digit to the most significant
        for (int exp = 1; exp <= m; exp *= 10) {
            // Apply counting sort to the array elements by digit k
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // Here exp = 10^(k-1)
            CountingSortDigit(nums, exp);
        }
    }
    ```

=== "Go"

    ```go title="radix_sort.go"
    /* Get digit k of num, where exp = 10^(k-1) */
    func digit(num, exp int) int {
        // Passing exp instead of k avoids repeating the costly exponentiation here
        return (num / exp) % 10
    }

    /* Counting sort by digit k of each element in nums */
    func countingSortDigit(nums []int, exp int) {
        // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
        counter := make([]int, 10)
        n := len(nums)
        // Count the occurrences of digits 0 through 9
        for i := 0; i < n; i++ {
            d := digit(nums[i], exp) // Let d be digit k of nums[i]
            counter[d]++             // Count this occurrence of digit d
        }
        // Compute prefix sums to convert counts into array positions
        for i := 1; i < 10; i++ {
            counter[i] += counter[i-1]
        }
        // Traverse backward and use the bucket counts to place each element in res
        res := make([]int, n)
        for i := n - 1; i >= 0; i-- {
            d := digit(nums[i], exp)
            j := counter[d] - 1 // Get the array index j for d
            res[j] = nums[i]    // Place the current element at index j
            counter[d]--        // Decrement the count for d by 1
        }
        // Copy the result back into nums
        for i := 0; i < n; i++ {
            nums[i] = res[i]
        }
    }

    /* Radix sort */
    func radixSort(nums []int) {
        // Find the largest element to determine the maximum number of digits
        max := math.MinInt
        for _, num := range nums {
            if num > max {
                max = num
            }
        }
        // Work from the least significant digit to the most significant
        for exp := 1; max >= exp; exp *= 10 {
            // Apply counting sort to the array elements by digit k
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // Here exp = 10^(k-1)
            countingSortDigit(nums, exp)
        }
    }
    ```

=== "Swift"

    ```swift title="radix_sort.swift"
    /* Get digit k of num, where exp = 10^(k-1) */
    func digit(num: Int, exp: Int) -> Int {
        // Passing exp instead of k avoids repeating the costly exponentiation here
        (num / exp) % 10
    }

    /* Counting sort by digit k of each element in nums */
    func countingSortDigit(nums: inout [Int], exp: Int) {
        // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
        var counter = Array(repeating: 0, count: 10)
        // Count the occurrences of digits 0 through 9
        for i in nums.indices {
            let d = digit(num: nums[i], exp: exp) // Let d be digit k of nums[i]
            counter[d] += 1 // Count this occurrence of digit d
        }
        // Compute prefix sums to convert counts into array positions
        for i in 1 ..< 10 {
            counter[i] += counter[i - 1]
        }
        // Traverse backward and use the bucket counts to place each element in res
        var res = Array(repeating: 0, count: nums.count)
        for i in nums.indices.reversed() {
            let d = digit(num: nums[i], exp: exp)
            let j = counter[d] - 1 // Get the array index j for d
            res[j] = nums[i] // Place the current element at index j
            counter[d] -= 1 // Decrement the count for d by 1
        }
        // Copy the result back into nums
        for i in nums.indices {
            nums[i] = res[i]
        }
    }

    /* Radix sort */
    func radixSort(nums: inout [Int]) {
        // Find the largest element to determine the maximum number of digits
        var m = Int.min
        for num in nums {
            if num > m {
                m = num
            }
        }
        // Work from the least significant digit to the most significant
        for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
            // Apply counting sort to the array elements by digit k
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // Here exp = 10^(k-1)
            countingSortDigit(nums: &nums, exp: exp)
        }
    }
    ```

=== "JS"

    ```javascript title="radix_sort.js"
    /* Get digit k of num, where exp = 10^(k-1) */
    function digit(num, exp) {
        // Passing exp instead of k avoids repeating the costly exponentiation here
        return Math.floor(num / exp) % 10;
    }

    /* Counting sort by digit k of each element in nums */
    function countingSortDigit(nums, exp) {
        // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
        const counter = new Array(10).fill(0);
        const n = nums.length;
        // Count the occurrences of digits 0 through 9
        for (let i = 0; i < n; i++) {
            const d = digit(nums[i], exp); // Let d be digit k of nums[i]
            counter[d]++; // Count this occurrence of digit d
        }
        // Compute prefix sums to convert counts into array positions
        for (let i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse backward and use the bucket counts to place each element in res
        const res = new Array(n).fill(0);
        for (let i = n - 1; i >= 0; i--) {
            const d = digit(nums[i], exp);
            const j = counter[d] - 1; // Get the array index j for d
            res[j] = nums[i]; // Place the current element at index j
            counter[d]--; // Decrement the count for d by 1
        }
        // Copy the result back into nums
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Radix sort */
    function radixSort(nums) {
        // Find the largest element to determine the maximum number of digits
        let m = Math.max(... nums);
        // Work from the least significant digit to the most significant
        for (let exp = 1; exp <= m; exp *= 10) {
            // Apply counting sort to the array elements by digit k
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // Here exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "TS"

    ```typescript title="radix_sort.ts"
    /* Get digit k of num, where exp = 10^(k-1) */
    function digit(num: number, exp: number): number {
        // Passing exp instead of k avoids repeating the costly exponentiation here
        return Math.floor(num / exp) % 10;
    }

    /* Counting sort by digit k of each element in nums */
    function countingSortDigit(nums: number[], exp: number): void {
        // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
        const counter = new Array(10).fill(0);
        const n = nums.length;
        // Count the occurrences of digits 0 through 9
        for (let i = 0; i < n; i++) {
            const d = digit(nums[i], exp); // Let d be digit k of nums[i]
            counter[d]++; // Count this occurrence of digit d
        }
        // Compute prefix sums to convert counts into array positions
        for (let i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse backward and use the bucket counts to place each element in res
        const res = new Array(n).fill(0);
        for (let i = n - 1; i >= 0; i--) {
            const d = digit(nums[i], exp);
            const j = counter[d] - 1; // Get the array index j for d
            res[j] = nums[i]; // Place the current element at index j
            counter[d]--; // Decrement the count for d by 1
        }
        // Copy the result back into nums
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* Radix sort */
    function radixSort(nums: number[]): void {
        // Find the largest element to determine the maximum number of digits
        let m: number = Math.max(... nums);
        // Work from the least significant digit to the most significant
        for (let exp = 1; exp <= m; exp *= 10) {
            // Apply counting sort to the array elements by digit k
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // Here exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "Dart"

    ```dart title="radix_sort.dart"
    /* Get digit k of _num, where exp = 10^(k-1) */
    int digit(int _num, int exp) {
      // Passing exp instead of k avoids repeating the costly exponentiation here
      return (_num ~/ exp) % 10;
    }

    /* Counting sort by digit k of each element in nums */
    void countingSortDigit(List<int> nums, int exp) {
      // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
      List<int> counter = List<int>.filled(10, 0);
      int n = nums.length;
      // Count the occurrences of digits 0 through 9
      for (int i = 0; i < n; i++) {
        int d = digit(nums[i], exp); // Let d be digit k of nums[i]
        counter[d]++; // Count this occurrence of digit d
      }
      // Compute prefix sums to convert counts into array positions
      for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
      }
      // Traverse backward and use the bucket counts to place each element in res
      List<int> res = List<int>.filled(n, 0);
      for (int i = n - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // Get the array index j for d
        res[j] = nums[i]; // Place the current element at index j
        counter[d]--; // Decrement the count for d by 1
      }
      // Copy the result back into nums
      for (int i = 0; i < n; i++) nums[i] = res[i];
    }

    /* Radix sort */
    void radixSort(List<int> nums) {
      // Find the largest element to determine the maximum number of digits
      // In Dart, int is 64 bits wide
      int m = -1 << 63;
      for (int _num in nums) if (_num > m) m = _num;
      // Work from the least significant digit to the most significant
      for (int exp = 1; exp <= m; exp *= 10)
        // Apply counting sort to the array elements by digit k
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // Here exp = 10^(k-1)
        countingSortDigit(nums, exp);
    }
    ```

=== "Rust"

    ```rust title="radix_sort.rs"
    /* Get digit k of num, where exp = 10^(k-1) */
    fn digit(num: i32, exp: i32) -> usize {
        // Passing exp instead of k avoids repeating the costly exponentiation here
        return ((num / exp) % 10) as usize;
    }

    /* Counting sort by digit k of each element in nums */
    fn counting_sort_digit(nums: &mut [i32], exp: i32) {
        // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
        let mut counter = [0; 10];
        let n = nums.len();
        // Count the occurrences of digits 0 through 9
        for i in 0..n {
            let d = digit(nums[i], exp); // Let d be digit k of nums[i]
            counter[d] += 1; // Count this occurrence of digit d
        }
        // Compute prefix sums to convert counts into array positions
        for i in 1..10 {
            counter[i] += counter[i - 1];
        }
        // Traverse backward and use the bucket counts to place each element in res
        let mut res = vec![0; n];
        for i in (0..n).rev() {
            let d = digit(nums[i], exp);
            let j = counter[d] - 1; // Get the array index j for d
            res[j] = nums[i]; // Place the current element at index j
            counter[d] -= 1; // Decrement the count for d by 1
        }
        // Copy the result back into nums
        nums.copy_from_slice(&res);
    }

    /* Radix sort */
    fn radix_sort(nums: &mut [i32]) {
        // Find the largest element to determine the maximum number of digits
        let m = *nums.into_iter().max().unwrap();
        // Work from the least significant digit to the most significant
        let mut exp = 1;
        while exp <= m {
            counting_sort_digit(nums, exp);
            exp *= 10;
        }
    }
    ```

=== "C"

    ```c title="radix_sort.c"
    /* Get digit k of num, where exp = 10^(k-1) */
    int digit(int num, int exp) {
        // Passing exp instead of k avoids repeating the costly exponentiation here
        return (num / exp) % 10;
    }

    /* Counting sort by digit k of each element in nums */
    void countingSortDigit(int nums[], int size, int exp) {
        // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
        int *counter = (int *)malloc((sizeof(int) * 10));
        memset(counter, 0, sizeof(int) * 10); // Initialize to 0 so the memory can be freed later
        // Count the occurrences of digits 0 through 9
        for (int i = 0; i < size; i++) {
            // Let d be digit k of nums[i]
            int d = digit(nums[i], exp);
            // Count this occurrence of digit d
            counter[d]++;
        }
        // Compute prefix sums to convert counts into array positions
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // Traverse backward and use the bucket counts to place each element in res
        int *res = (int *)malloc(sizeof(int) * size);
        for (int i = size - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // Get the array index j for d
            res[j] = nums[i];       // Place the current element at index j
            counter[d]--;           // Decrement the count for d by 1
        }
        // Copy the result back into nums
        for (int i = 0; i < size; i++) {
            nums[i] = res[i];
        }
        // Free memory
        free(res);
        free(counter);
    }

    /* Radix sort */
    void radixSort(int nums[], int size) {
        // Find the largest element to determine the maximum number of digits
        int max = INT32_MIN;
        for (int i = 0; i < size; i++) {
            if (nums[i] > max) {
                max = nums[i];
            }
        }
        // Work from the least significant digit to the most significant
        for (int exp = 1; max >= exp; exp *= 10)
            // Apply counting sort to the array elements by digit k
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // Here exp = 10^(k-1)
            countingSortDigit(nums, size, exp);
    }
    ```

=== "Kotlin"

    ```kotlin title="radix_sort.kt"
    /* Get digit k of num, where exp = 10^(k-1) */
    fun digit(num: Int, exp: Int): Int {
        // Passing exp instead of k avoids repeating the costly exponentiation here
        return (num / exp) % 10
    }

    /* Counting sort by digit k of each element in nums */
    fun countingSortDigit(nums: IntArray, exp: Int) {
        // Decimal digits range from 0 to 9, so the bucket array needs 10 entries
        val counter = IntArray(10)
        val n = nums.size
        // Count the occurrences of digits 0 through 9
        for (i in 0..<n) {
            val d = digit(nums[i], exp) // Let d be digit k of nums[i]
            counter[d]++                // Count this occurrence of digit d
        }
        // Compute prefix sums to convert counts into array positions
        for (i in 1..9) {
            counter[i] += counter[i - 1]
        }
        // Traverse backward and use the bucket counts to place each element in res
        val res = IntArray(n)
        for (i in n - 1 downTo 0) {
            val d = digit(nums[i], exp)
            val j = counter[d] - 1 // Get the array index j for d
            res[j] = nums[i]       // Place the current element at index j
            counter[d]--           // Decrement the count for d by 1
        }
        // Copy the result back into nums
        for (i in 0..<n)
            nums[i] = res[i]
    }

    /* Radix sort */
    fun radixSort(nums: IntArray) {
        // Find the largest element to determine the maximum number of digits
        var m = Int.MIN_VALUE
        for (num in nums) if (num > m) m = num
        var exp = 1
        // Work from the least significant digit to the most significant
        while (exp <= m) {
            // Apply counting sort to the array elements by digit k
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // Here exp = 10^(k-1)
            countingSortDigit(nums, exp)
            exp *= 10
        }
    }
    ```

=== "Ruby"

    ```ruby title="radix_sort.rb"
    ### Get digit k of num, where exp = 10^(k-1) ###
    def digit(num, exp)
      # Passing exp instead of k avoids repeating the costly exponentiation here
      (num / exp) % 10
    end

    ### Counting sort by digit k of each element in nums###
    def counting_sort_digit(nums, exp)
      # Decimal digits range from 0 to 9, so the bucket array needs 10 entries
      counter = Array.new(10, 0)
      n = nums.length
      # Count the occurrences of digits 0 through 9
      for i in 0...n
        d = digit(nums[i], exp) # Let d be digit k of nums[i]
        counter[d] += 1 # Count this occurrence of digit d
      end
      # Compute prefix sums to convert counts into array positions
      (1...10).each { |i| counter[i] += counter[i - 1] }
      # Traverse backward and use the bucket counts to place each element in res
      res = Array.new(n, 0)
      for i in (n - 1).downto(0)
        d = digit(nums[i], exp)
        j = counter[d] - 1 # Get the array index j for d
        res[j] = nums[i] # Place the current element at index j
        counter[d] -= 1 # Decrement the count for d by 1
      end
      # Copy the result back into nums
      (0...n).each { |i| nums[i] = res[i] }
    end

    ### Radix sort ###
    def radix_sort(nums)
      # Find the largest element to determine the maximum number of digits
      m = nums.max
      # Work from the least significant digit to the most significant
      exp = 1
      while exp <= m
        # Apply counting sort to the array elements by digit k
        # k = 1 -> exp = 1
        # k = 2 -> exp = 10
        # Here exp = 10^(k-1)
        counting_sort_digit(nums, exp)
        exp *= 10
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20digit%28num%3A%20int,%20exp%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Get%20digit%20k%20of%20num,%20where%20exp%20%3D%2010%5E%28k-1%29%22%22%22%0A%20%20%20%20%23%20Passing%20exp%20instead%20of%20k%20avoids%20repeating%20the%20costly%20exponentiation%20here%0A%20%20%20%20return%20%28num%20//%20exp%29%20%25%2010%0A%0Adef%20counting_sort_digit%28nums%3A%20list%5Bint%5D,%20exp%3A%20int%29%3A%0A%20%20%20%20%22%22%22Counting%20sort%20by%20digit%20k%20of%20each%20element%20in%20nums%22%22%22%0A%20%20%20%20%23%20Decimal%20digits%20range%20from%200%20to%209,%20so%20the%20bucket%20array%20needs%2010%20entries%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20Count%20the%20occurrences%20of%20digits%200%20through%209%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%20%20%23%20Let%20d%20be%20digit%20k%20of%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20%2B%3D%201%20%20%23%20Count%20this%20occurrence%20of%20digit%20d%0A%20%20%20%20%23%20Compute%20prefix%20sums%20to%20convert%20counts%20into%20array%20positions%0A%20%20%20%20for%20i%20in%20range%281,%2010%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%5D%20%2B%3D%20counter%5Bi%20-%201%5D%0A%20%20%20%20%23%20Traverse%20backward%20and%20use%20the%20bucket%20counts%20to%20place%20each%20element%20in%20res%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%0A%20%20%20%20%20%20%20%20j%20%3D%20counter%5Bd%5D%20-%201%20%20%23%20Get%20the%20array%20index%20j%20for%20d%0A%20%20%20%20%20%20%20%20res%5Bj%5D%20%3D%20nums%5Bi%5D%20%20%23%20Place%20the%20current%20element%20at%20index%20j%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20-%3D%201%20%20%23%20Decrement%20the%20count%20for%20d%20by%201%0A%20%20%20%20%23%20Copy%20the%20result%20back%20into%20nums%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0Adef%20radix_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Radix%20sort%22%22%22%0A%20%20%20%20%23%20Find%20the%20largest%20element%20to%20determine%20the%20maximum%20number%20of%20digits%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%20Work%20from%20the%20least%20significant%20digit%20to%20the%20most%20significant%0A%20%20%20%20exp%20%3D%201%0A%20%20%20%20while%20exp%20%3C%3D%20m%3A%0A%20%20%20%20%20%20%20%20%23%20Apply%20counting%20sort%20to%20the%20array%20elements%20by%20digit%20k%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%201%20-%3E%20exp%20%3D%201%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%202%20-%3E%20exp%20%3D%2010%0A%20%20%20%20%20%20%20%20%23%20Here%20exp%20%3D%2010%5E%28k-1%29%0A%20%20%20%20%20%20%20%20counting_sort_digit%28nums,%20exp%29%0A%20%20%20%20%20%20%20%20exp%20%2A%3D%2010%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Radix%20sort%0A%20%20%20%20nums%20%3D%20%5B%0A%20%20%20%20%20%20%20%20105,%0A%20%20%20%20%20%20%20%20356,%0A%20%20%20%20%20%20%20%20428,%0A%20%20%20%20%20%20%20%20348,%0A%20%20%20%20%20%20%20%20818,%0A%20%20%20%20%5D%0A%20%20%20%20radix_sort%28nums%29%0A%20%20%20%20print%28%22After%20radix%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20digit%28num%3A%20int,%20exp%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Get%20digit%20k%20of%20num,%20where%20exp%20%3D%2010%5E%28k-1%29%22%22%22%0A%20%20%20%20%23%20Passing%20exp%20instead%20of%20k%20avoids%20repeating%20the%20costly%20exponentiation%20here%0A%20%20%20%20return%20%28num%20//%20exp%29%20%25%2010%0A%0Adef%20counting_sort_digit%28nums%3A%20list%5Bint%5D,%20exp%3A%20int%29%3A%0A%20%20%20%20%22%22%22Counting%20sort%20by%20digit%20k%20of%20each%20element%20in%20nums%22%22%22%0A%20%20%20%20%23%20Decimal%20digits%20range%20from%200%20to%209,%20so%20the%20bucket%20array%20needs%2010%20entries%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20Count%20the%20occurrences%20of%20digits%200%20through%209%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%20%20%23%20Let%20d%20be%20digit%20k%20of%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20%2B%3D%201%20%20%23%20Count%20this%20occurrence%20of%20digit%20d%0A%20%20%20%20%23%20Compute%20prefix%20sums%20to%20convert%20counts%20into%20array%20positions%0A%20%20%20%20for%20i%20in%20range%281,%2010%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%5D%20%2B%3D%20counter%5Bi%20-%201%5D%0A%20%20%20%20%23%20Traverse%20backward%20and%20use%20the%20bucket%20counts%20to%20place%20each%20element%20in%20res%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%0A%20%20%20%20%20%20%20%20j%20%3D%20counter%5Bd%5D%20-%201%20%20%23%20Get%20the%20array%20index%20j%20for%20d%0A%20%20%20%20%20%20%20%20res%5Bj%5D%20%3D%20nums%5Bi%5D%20%20%23%20Place%20the%20current%20element%20at%20index%20j%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20-%3D%201%20%20%23%20Decrement%20the%20count%20for%20d%20by%201%0A%20%20%20%20%23%20Copy%20the%20result%20back%20into%20nums%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0Adef%20radix_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Radix%20sort%22%22%22%0A%20%20%20%20%23%20Find%20the%20largest%20element%20to%20determine%20the%20maximum%20number%20of%20digits%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%20Work%20from%20the%20least%20significant%20digit%20to%20the%20most%20significant%0A%20%20%20%20exp%20%3D%201%0A%20%20%20%20while%20exp%20%3C%3D%20m%3A%0A%20%20%20%20%20%20%20%20%23%20Apply%20counting%20sort%20to%20the%20array%20elements%20by%20digit%20k%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%201%20-%3E%20exp%20%3D%201%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%202%20-%3E%20exp%20%3D%2010%0A%20%20%20%20%20%20%20%20%23%20Here%20exp%20%3D%2010%5E%28k-1%29%0A%20%20%20%20%20%20%20%20counting_sort_digit%28nums,%20exp%29%0A%20%20%20%20%20%20%20%20exp%20%2A%3D%2010%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Radix%20sort%0A%20%20%20%20nums%20%3D%20%5B%0A%20%20%20%20%20%20%20%20105,%0A%20%20%20%20%20%20%20%20356,%0A%20%20%20%20%20%20%20%20428,%0A%20%20%20%20%20%20%20%20348,%0A%20%20%20%20%20%20%20%20818,%0A%20%20%20%20%5D%0A%20%20%20%20radix_sort%28nums%29%0A%20%20%20%20print%28%22After%20radix%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

!!! question "Why start with the least significant digit?"

    Each pass takes precedence over the one before it. For example, if the first pass orders two elements as $a < b$ but the second orders them as $a > b$, the second order prevails. Since more significant digits have higher priority, sort by the less significant digits first.

## 11.10.2 &nbsp; Algorithm properties

Compared with counting sort, radix sort handles a larger range of values, **provided that the data can be represented with a fixed number of digits and that this number is not too large**. For example, floating-point numbers are a poor fit here because their digit count $k$ can be so large that the time complexity satisfies $O(nk) \gg O(n^2)$.

- **Time complexity: $O(nk)$, nonadaptive**. Suppose there are $n$ elements in base $d$, each with at most $k$ digits. Counting sort takes $O(n + d)$ time for one digit, so sorting by all $k$ digits takes $O((n + d)k)$ time. Typically, $d$ and $k$ are both small and the time complexity approaches $O(n)$.
- **Space complexity: $O(n + d)$, out-of-place**. As in counting sort, radix sort uses an array `res` of length $n$ and an array `counter` of length $d$.
- **Stable**. If the counting sort used for each digit is stable, radix sort is stable too. If counting sort is unstable, radix sort may produce an incorrect result.
