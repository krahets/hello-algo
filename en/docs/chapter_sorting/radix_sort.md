---
comments: true
---

# 11.10 &nbsp; Radix sort

The previous section introduced counting sort, which is suitable for scenarios where the data volume $n$ is large but the data range $m$ is small. Suppose we need to sort $n = 10^6$ student IDs, where each ID is an $8$-digit number. This means the data range $m = 10^8$ is very large, requiring a significant amount of memory space for counting sort, while radix sort can avoid this situation.

<u>Radix sort</u> shares the core idea with counting sort, which also sorts by counting the frequency of elements. Building on this, radix sort utilizes the progressive relationship between the digits of numbers, sorting each digit in turn to achieve the final sorted order.

## 11.10.1 &nbsp; Algorithm process

Taking the student ID data as an example, assuming the least significant digit is the $1^{st}$ and the most significant is the $8^{th}$, the radix sort process is illustrated in Figure 11-18.

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
    [class]{radix_sort}-[func]{Digit}

    [class]{radix_sort}-[func]{CountingSortDigit}

    [class]{radix_sort}-[func]{RadixSort}
    ```

=== "Go"

    ```go title="radix_sort.go"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "Swift"

    ```swift title="radix_sort.swift"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "JS"

    ```javascript title="radix_sort.js"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "TS"

    ```typescript title="radix_sort.ts"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "Dart"

    ```dart title="radix_sort.dart"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "Rust"

    ```rust title="radix_sort.rs"
    [class]{}-[func]{digit}

    [class]{}-[func]{counting_sort_digit}

    [class]{}-[func]{radix_sort}
    ```

=== "C"

    ```c title="radix_sort.c"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "Kotlin"

    ```kotlin title="radix_sort.kt"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "Ruby"

    ```ruby title="radix_sort.rb"
    [class]{}-[func]{digit}

    [class]{}-[func]{counting_sort_digit}

    [class]{}-[func]{radix_sort}
    ```

=== "Zig"

    ```zig title="radix_sort.zig"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

!!! question "Why start sorting from the least significant digit?"

    In consecutive sorting rounds, the result of a later round will override the result of an earlier round. For example, if the result of the first round is $a < b$ and the result of the second round is $a > b$, the result of the second round will replace the first round's result. Since the significance of higher digits is greater than that of lower digits, it makes sense to sort lower digits before higher digits.

## 11.10.2 &nbsp; Algorithm characteristics

Compared to counting sort, radix sort is suitable for larger numerical ranges, **but it assumes that the data can be represented in a fixed number of digits, and the number of digits should not be too large**. For example, floating-point numbers are not suitable for radix sort, as their digit count $k$ may be large, potentially leading to a time complexity $O(nk) \gg O(n^2)$.

- **Time complexity is $O(nk)$, non-adaptive sorting**: Assuming the data size is $n$, the data is in base $d$, and the maximum number of digits is $k$, then sorting a single digit takes $O(n + d)$ time, and sorting all $k$ digits takes $O((n + d)k)$ time. Generally, both $d$ and $k$ are relatively small, leading to a time complexity approaching $O(n)$.
- **Space complexity is $O(n + d)$, non-in-place sorting**: Like counting sort, radix sort relies on arrays `res` and `counter` of lengths $n$ and $d$ respectively.
- **Stable sorting**: When counting sort is stable, radix sort is also stable; if counting sort is unstable, radix sort cannot guarantee a correct sorting outcome.
