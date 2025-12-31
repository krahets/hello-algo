---
comments: true
---

# 10.1 &nbsp; Binary Search

<u>Binary search</u> is an efficient searching algorithm based on the divide-and-conquer strategy. It leverages the orderliness of data to reduce the search range by half in each round until the target element is found or the search interval becomes empty.

!!! question

    Given an array `nums` of length $n$ with elements arranged in ascending order and no duplicates, search for and return the index of element `target` in the array. If the array does not contain the element, return $-1$. An example is shown in Figure 10-1.

![Binary search example data](binary_search.assets/binary_search_example.png){ class="animation-figure" }

<p align="center"> Figure 10-1 &nbsp; Binary search example data </p>

As shown in Figure 10-2, we first initialize pointers $i = 0$ and $j = n - 1$, pointing to the first and last elements of the array respectively, representing the search interval $[0, n - 1]$. Note that square brackets denote a closed interval, which includes the boundary values themselves.

Next, perform the following two steps in a loop:

1. Calculate the midpoint index $m = \lfloor {(i + j) / 2} \rfloor$, where $\lfloor \: \rfloor$ denotes the floor operation.
2. Compare `nums[m]` and `target`, which results in three cases:
    1. When `nums[m] < target`, it indicates that `target` is in the interval $[m + 1, j]$, so execute $i = m + 1$.
    2. When `nums[m] > target`, it indicates that `target` is in the interval $[i, m - 1]$, so execute $j = m - 1$.
    3. When `nums[m] = target`, it indicates that `target` has been found, so return index $m$.

If the array does not contain the target element, the search interval will eventually shrink to empty. In this case, return $-1$.

=== "<1>"
    ![Binary search process](binary_search.assets/binary_search_step1.png){ class="animation-figure" }

=== "<2>"
    ![binary_search_step2](binary_search.assets/binary_search_step2.png){ class="animation-figure" }

=== "<3>"
    ![binary_search_step3](binary_search.assets/binary_search_step3.png){ class="animation-figure" }

=== "<4>"
    ![binary_search_step4](binary_search.assets/binary_search_step4.png){ class="animation-figure" }

=== "<5>"
    ![binary_search_step5](binary_search.assets/binary_search_step5.png){ class="animation-figure" }

=== "<6>"
    ![binary_search_step6](binary_search.assets/binary_search_step6.png){ class="animation-figure" }

=== "<7>"
    ![binary_search_step7](binary_search.assets/binary_search_step7.png){ class="animation-figure" }

<p align="center"> Figure 10-2 &nbsp; Binary search process </p>

It's worth noting that since both $i$ and $j$ are of `int` type, **$i + j$ may exceed the range of the `int` type**. To avoid large number overflow, we typically use the formula $m = \lfloor {i + (j - i) / 2} \rfloor$ to calculate the midpoint.

The code is shown below:

=== "Python"

    ```python title="binary_search.py"
    def binary_search(nums: list[int], target: int) -> int:
        """Binary search (closed interval)"""
        # Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
        i, j = 0, len(nums) - 1
        # Loop, exit when the search interval is empty (empty when i > j)
        while i <= j:
            # In theory, Python numbers can be infinitely large (depending on memory size), no need to consider large number overflow
            m = (i + j) // 2  # Calculate midpoint index m
            if nums[m] < target:
                i = m + 1  # This means target is in the interval [m+1, j]
            elif nums[m] > target:
                j = m - 1  # This means target is in the interval [i, m-1]
            else:
                return m  # Found the target element, return its index
        return -1  # Target element not found, return -1
    ```

=== "C++"

    ```cpp title="binary_search.cpp"
    /* Binary search (closed interval on both sides) */
    int binarySearch(vector<int> &nums, int target) {
        // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
        int i = 0, j = nums.size() - 1;
        // Loop, exit when the search interval is empty (empty when i > j)
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target)    // This means target is in the interval [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // This means target is in the interval [i, m-1]
                j = m - 1;
            else // Found the target element, return its index
                return m;
        }
        // Target element not found, return -1
        return -1;
    }
    ```

=== "Java"

    ```java title="binary_search.java"
    /* Binary search (closed interval on both sides) */
    int binarySearch(int[] nums, int target) {
        // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
        int i = 0, j = nums.length - 1;
        // Loop, exit when the search interval is empty (empty when i > j)
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target) // This means target is in the interval [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // This means target is in the interval [i, m-1]
                j = m - 1;
            else // Found the target element, return its index
                return m;
        }
        // Target element not found, return -1
        return -1;
    }
    ```

=== "C#"

    ```csharp title="binary_search.cs"
    /* Binary search (closed interval on both sides) */
    int BinarySearch(int[] nums, int target) {
        // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
        int i = 0, j = nums.Length - 1;
        // Loop, exit when the search interval is empty (empty when i > j)
        while (i <= j) {
            int m = i + (j - i) / 2;   // Calculate the midpoint index m
            if (nums[m] < target)      // This means target is in the interval [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // This means target is in the interval [i, m-1]
                j = m - 1;
            else                       // Found the target element, return its index
                return m;
        }
        // Target element not found, return -1
        return -1;
    }
    ```

=== "Go"

    ```go title="binary_search.go"
    /* Binary search (closed interval on both sides) */
    func binarySearch(nums []int, target int) int {
        // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
        i, j := 0, len(nums)-1
        // Loop, exit when the search interval is empty (empty when i > j)
        for i <= j {
            m := i + (j-i)/2      // Calculate the midpoint index m
            if nums[m] < target { // This means target is in the interval [m+1, j]
                i = m + 1
            } else if nums[m] > target { // This means target is in the interval [i, m-1]
                j = m - 1
            } else { // Found the target element, return its index
                return m
            }
        }
        // Target element not found, return -1
        return -1
    }
    ```

=== "Swift"

    ```swift title="binary_search.swift"
    /* Binary search (closed interval on both sides) */
    func binarySearch(nums: [Int], target: Int) -> Int {
        // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
        var i = nums.startIndex
        var j = nums.endIndex - 1
        // Loop, exit when the search interval is empty (empty when i > j)
        while i <= j {
            let m = i + (j - i) / 2 // Calculate the midpoint index m
            if nums[m] < target { // This means target is in the interval [m+1, j]
                i = m + 1
            } else if nums[m] > target { // This means target is in the interval [i, m-1]
                j = m - 1
            } else { // Found the target element, return its index
                return m
            }
        }
        // Target element not found, return -1
        return -1
    }
    ```

=== "JS"

    ```javascript title="binary_search.js"
    /* Binary search (closed interval on both sides) */
    function binarySearch(nums, target) {
        // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
        let i = 0,
            j = nums.length - 1;
        // Loop, exit when the search interval is empty (empty when i > j)
        while (i <= j) {
            // Calculate midpoint index m, use parseInt() to round down
            const m = parseInt(i + (j - i) / 2);
            if (nums[m] < target)
                // This means target is in the interval [m+1, j]
                i = m + 1;
            else if (nums[m] > target)
                // This means target is in the interval [i, m-1]
                j = m - 1;
            else return m; // Found the target element, return its index
        }
        // Target element not found, return -1
        return -1;
    }
    ```

=== "TS"

    ```typescript title="binary_search.ts"
    /* Binary search (closed interval on both sides) */
    function binarySearch(nums: number[], target: number): number {
        // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
        let i = 0,
            j = nums.length - 1;
        // Loop, exit when the search interval is empty (empty when i > j)
        while (i <= j) {
            // Calculate the midpoint index m
            const m = Math.floor(i + (j - i) / 2);
            if (nums[m] < target) {
                // This means target is in the interval [m+1, j]
                i = m + 1;
            } else if (nums[m] > target) {
                // This means target is in the interval [i, m-1]
                j = m - 1;
            } else {
                // Found the target element, return its index
                return m;
            }
        }
        return -1; // Target element not found, return -1
    }
    ```

=== "Dart"

    ```dart title="binary_search.dart"
    /* Binary search (closed interval on both sides) */
    int binarySearch(List<int> nums, int target) {
      // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
      int i = 0, j = nums.length - 1;
      // Loop, exit when the search interval is empty (empty when i > j)
      while (i <= j) {
        int m = i + (j - i) ~/ 2; // Calculate the midpoint index m
        if (nums[m] < target) {
          // This means target is in the interval [m+1, j]
          i = m + 1;
        } else if (nums[m] > target) {
          // This means target is in the interval [i, m-1]
          j = m - 1;
        } else {
          // Found the target element, return its index
          return m;
        }
      }
      // Target element not found, return -1
      return -1;
    }
    ```

=== "Rust"

    ```rust title="binary_search.rs"
    /* Binary search (closed interval on both sides) */
    fn binary_search(nums: &[i32], target: i32) -> i32 {
        // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
        let mut i = 0;
        let mut j = nums.len() as i32 - 1;
        // Loop, exit when the search interval is empty (empty when i > j)
        while i <= j {
            let m = i + (j - i) / 2; // Calculate the midpoint index m
            if nums[m as usize] < target {
                // This means target is in the interval [m+1, j]
                i = m + 1;
            } else if nums[m as usize] > target {
                // This means target is in the interval [i, m-1]
                j = m - 1;
            } else {
                // Found the target element, return its index
                return m;
            }
        }
        // Target element not found, return -1
        return -1;
    }
    ```

=== "C"

    ```c title="binary_search.c"
    /* Binary search (closed interval on both sides) */
    int binarySearch(int *nums, int len, int target) {
        // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
        int i = 0, j = len - 1;
        // Loop, exit when the search interval is empty (empty when i > j)
        while (i <= j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target)    // This means target is in the interval [m+1, j]
                i = m + 1;
            else if (nums[m] > target) // This means target is in the interval [i, m-1]
                j = m - 1;
            else // Found the target element, return its index
                return m;
        }
        // Target element not found, return -1
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search.kt"
    /* Binary search (closed interval on both sides) */
    fun binarySearch(nums: IntArray, target: Int): Int {
        // Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
        var i = 0
        var j = nums.size - 1
        // Loop, exit when the search interval is empty (empty when i > j)
        while (i <= j) {
            val m = i + (j - i) / 2 // Calculate the midpoint index m
            if (nums[m] < target) // This means target is in the interval [m+1, j]
                i = m + 1
            else if (nums[m] > target) // This means target is in the interval [i, m-1]
                j = m - 1
            else  // Found the target element, return its index
                return m
        }
        // Target element not found, return -1
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="binary_search.rb"
    ### Binary search (closed interval) ###
    def binary_search(nums, target)
      # Initialize closed interval [0, n-1], i.e., i, j point to the first and last elements of the array
      i, j = 0, nums.length - 1

      # Loop, exit when the search interval is empty (empty when i > j)
      while i <= j
        # In theory, Ruby numbers can be infinitely large (limited by memory), no need to consider overflow
        m = (i + j) / 2   # Calculate the midpoint index m
      
        if nums[m] < target
          i = m + 1 # This means target is in the interval [m+1, j]
        elsif nums[m] > target
          j = m - 1 # This means target is in the interval [i, m-1]
        else
          return m  # Found the target element, return its index
        end
      end

      -1  # Target element not found, return -1
    end
    ```

**Time complexity is $O(\log n)$**: In the binary loop, the interval is reduced by half each round, so the number of loops is $\log_2 n$.

**Space complexity is $O(1)$**: Pointers $i$ and $j$ use constant-size space.

## 10.1.1 &nbsp; Interval Representation Methods

In addition to the closed interval mentioned above, another common interval representation is the "left-closed right-open" interval, defined as $[0, n)$, meaning the left boundary includes itself while the right boundary does not. Under this representation, the interval $[i, j)$ is empty when $i = j$.

We can implement a binary search algorithm with the same functionality based on this representation:

=== "Python"

    ```python title="binary_search.py"
    def binary_search_lcro(nums: list[int], target: int) -> int:
        """Binary search (left-closed right-open interval)"""
        # Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
        i, j = 0, len(nums)
        # Loop, exit when the search interval is empty (empty when i = j)
        while i < j:
            m = (i + j) // 2  # Calculate midpoint index m
            if nums[m] < target:
                i = m + 1  # This means target is in the interval [m+1, j)
            elif nums[m] > target:
                j = m  # This means target is in the interval [i, m)
            else:
                return m  # Found the target element, return its index
        return -1  # Target element not found, return -1
    ```

=== "C++"

    ```cpp title="binary_search.cpp"
    /* Binary search (left-closed right-open interval) */
    int binarySearchLCRO(vector<int> &nums, int target) {
        // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
        int i = 0, j = nums.size();
        // Loop, exit when the search interval is empty (empty when i = j)
        while (i < j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target)    // This means target is in the interval [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // This means target is in the interval [i, m)
                j = m;
            else // Found the target element, return its index
                return m;
        }
        // Target element not found, return -1
        return -1;
    }
    ```

=== "Java"

    ```java title="binary_search.java"
    /* Binary search (left-closed right-open interval) */
    int binarySearchLCRO(int[] nums, int target) {
        // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
        int i = 0, j = nums.length;
        // Loop, exit when the search interval is empty (empty when i = j)
        while (i < j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target) // This means target is in the interval [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // This means target is in the interval [i, m)
                j = m;
            else // Found the target element, return its index
                return m;
        }
        // Target element not found, return -1
        return -1;
    }
    ```

=== "C#"

    ```csharp title="binary_search.cs"
    /* Binary search (left-closed right-open interval) */
    int BinarySearchLCRO(int[] nums, int target) {
        // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
        int i = 0, j = nums.Length;
        // Loop, exit when the search interval is empty (empty when i = j)
        while (i < j) {
            int m = i + (j - i) / 2;   // Calculate the midpoint index m
            if (nums[m] < target)      // This means target is in the interval [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // This means target is in the interval [i, m)
                j = m;
            else                       // Found the target element, return its index
                return m;
        }
        // Target element not found, return -1
        return -1;
    }
    ```

=== "Go"

    ```go title="binary_search.go"
    /* Binary search (left-closed right-open interval) */
    func binarySearchLCRO(nums []int, target int) int {
        // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
        i, j := 0, len(nums)
        // Loop, exit when the search interval is empty (empty when i = j)
        for i < j {
            m := i + (j-i)/2      // Calculate the midpoint index m
            if nums[m] < target { // This means target is in the interval [m+1, j)
                i = m + 1
            } else if nums[m] > target { // This means target is in the interval [i, m)
                j = m
            } else { // Found the target element, return its index
                return m
            }
        }
        // Target element not found, return -1
        return -1
    }
    ```

=== "Swift"

    ```swift title="binary_search.swift"
    /* Binary search (left-closed right-open interval) */
    func binarySearchLCRO(nums: [Int], target: Int) -> Int {
        // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
        var i = nums.startIndex
        var j = nums.endIndex
        // Loop, exit when the search interval is empty (empty when i = j)
        while i < j {
            let m = i + (j - i) / 2 // Calculate the midpoint index m
            if nums[m] < target { // This means target is in the interval [m+1, j)
                i = m + 1
            } else if nums[m] > target { // This means target is in the interval [i, m)
                j = m
            } else { // Found the target element, return its index
                return m
            }
        }
        // Target element not found, return -1
        return -1
    }
    ```

=== "JS"

    ```javascript title="binary_search.js"
    /* Binary search (left-closed right-open interval) */
    function binarySearchLCRO(nums, target) {
        // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
        let i = 0,
            j = nums.length;
        // Loop, exit when the search interval is empty (empty when i = j)
        while (i < j) {
            // Calculate midpoint index m, use parseInt() to round down
            const m = parseInt(i + (j - i) / 2);
            if (nums[m] < target)
                // This means target is in the interval [m+1, j)
                i = m + 1;
            else if (nums[m] > target)
                // This means target is in the interval [i, m)
                j = m;
            // Found the target element, return its index
            else return m;
        }
        // Target element not found, return -1
        return -1;
    }
    ```

=== "TS"

    ```typescript title="binary_search.ts"
    /* Binary search (left-closed right-open interval) */
    function binarySearchLCRO(nums: number[], target: number): number {
        // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
        let i = 0,
            j = nums.length;
        // Loop, exit when the search interval is empty (empty when i = j)
        while (i < j) {
            // Calculate the midpoint index m
            const m = Math.floor(i + (j - i) / 2);
            if (nums[m] < target) {
                // This means target is in the interval [m+1, j)
                i = m + 1;
            } else if (nums[m] > target) {
                // This means target is in the interval [i, m)
                j = m;
            } else {
                // Found the target element, return its index
                return m;
            }
        }
        return -1; // Target element not found, return -1
    }
    ```

=== "Dart"

    ```dart title="binary_search.dart"
    /* Binary search (left-closed right-open interval) */
    int binarySearchLCRO(List<int> nums, int target) {
      // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
      int i = 0, j = nums.length;
      // Loop, exit when the search interval is empty (empty when i = j)
      while (i < j) {
        int m = i + (j - i) ~/ 2; // Calculate the midpoint index m
        if (nums[m] < target) {
          // This means target is in the interval [m+1, j)
          i = m + 1;
        } else if (nums[m] > target) {
          // This means target is in the interval [i, m)
          j = m;
        } else {
          // Found the target element, return its index
          return m;
        }
      }
      // Target element not found, return -1
      return -1;
    }
    ```

=== "Rust"

    ```rust title="binary_search.rs"
    /* Binary search (left-closed right-open interval) */
    fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
        // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
        let mut i = 0;
        let mut j = nums.len() as i32;
        // Loop, exit when the search interval is empty (empty when i = j)
        while i < j {
            let m = i + (j - i) / 2; // Calculate the midpoint index m
            if nums[m as usize] < target {
                // This means target is in the interval [m+1, j)
                i = m + 1;
            } else if nums[m as usize] > target {
                // This means target is in the interval [i, m)
                j = m;
            } else {
                // Found the target element, return its index
                return m;
            }
        }
        // Target element not found, return -1
        return -1;
    }
    ```

=== "C"

    ```c title="binary_search.c"
    /* Binary search (left-closed right-open interval) */
    int binarySearchLCRO(int *nums, int len, int target) {
        // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
        int i = 0, j = len;
        // Loop, exit when the search interval is empty (empty when i = j)
        while (i < j) {
            int m = i + (j - i) / 2; // Calculate the midpoint index m
            if (nums[m] < target)    // This means target is in the interval [m+1, j)
                i = m + 1;
            else if (nums[m] > target) // This means target is in the interval [i, m)
                j = m;
            else // Found the target element, return its index
                return m;
        }
        // Target element not found, return -1
        return -1;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search.kt"
    /* Binary search (left-closed right-open interval) */
    fun binarySearchLCRO(nums: IntArray, target: Int): Int {
        // Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
        var i = 0
        var j = nums.size
        // Loop, exit when the search interval is empty (empty when i = j)
        while (i < j) {
            val m = i + (j - i) / 2 // Calculate the midpoint index m
            if (nums[m] < target) // This means target is in the interval [m+1, j)
                i = m + 1
            else if (nums[m] > target) // This means target is in the interval [i, m)
                j = m
            else  // Found the target element, return its index
                return m
        }
        // Target element not found, return -1
        return -1
    }
    ```

=== "Ruby"

    ```ruby title="binary_search.rb"
    ### Binary search (left-closed right-open interval) ###
    def binary_search_lcro(nums, target)
      # Initialize left-closed right-open interval [0, n), i.e., i, j point to the first element and last element+1
      i, j = 0, nums.length

      # Loop, exit when the search interval is empty (empty when i = j)
      while i < j
        # Calculate the midpoint index m
        m = (i + j) / 2

        if nums[m] < target
          i = m + 1 # This means target is in the interval [m+1, j)
        elsif nums[m] > target
          j = m - 1 # This means target is in the interval [i, m)
        else
          return m  # Found the target element, return its index
        end
      end

      -1  # Target element not found, return -1
    end
    ```

As shown in Figure 10-3, under the two interval representations, the initialization, loop condition, and interval narrowing operations of the binary search algorithm are all different.

Since both the left and right boundaries in the "closed interval" representation are defined as closed, the operations to narrow the interval through pointers $i$ and $j$ are also symmetric. This makes it less error-prone, **so the "closed interval" approach is generally recommended**.

![Two interval definitions](binary_search.assets/binary_search_ranges.png){ class="animation-figure" }

<p align="center"> Figure 10-3 &nbsp; Two interval definitions </p>

## 10.1.2 &nbsp; Advantages and Limitations

Binary search performs well in both time and space aspects.

- Binary search has high time efficiency. With large data volumes, the logarithmic time complexity has significant advantages. For example, when the data size $n = 2^{20}$, linear search requires $2^{20} = 1048576$ loop rounds, while binary search only needs $\log_2 2^{20} = 20$ rounds.
- Binary search requires no extra space. Compared to searching algorithms that require additional space (such as hash-based search), binary search is more space-efficient.

However, binary search is not suitable for all situations, mainly for the following reasons:

- Binary search is only applicable to sorted data. If the input data is unsorted, sorting specifically to use binary search would be counterproductive, as sorting algorithms typically have a time complexity of $O(n \log n)$, which is higher than both linear search and binary search. For scenarios with frequent element insertions, maintaining array orderliness requires inserting elements at specific positions with a time complexity of $O(n)$, which is also very expensive.
- Binary search is only applicable to arrays. Binary search requires jump-style (non-contiguous) element access, and jump-style access has low efficiency in linked lists, making it unsuitable for linked lists or data structures based on linked list implementations.
- For small data volumes, linear search performs better. In linear search, each round requires only 1 comparison operation; while in binary search, it requires 1 addition, 1 division, 1-3 comparison operations, and 1 addition (subtraction), totaling 4-6 unit operations. Therefore, when the data volume $n$ is small, linear search is actually faster than binary search.
