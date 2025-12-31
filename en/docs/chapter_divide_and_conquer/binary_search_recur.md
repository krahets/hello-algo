---
comments: true
---

# 12.2 &nbsp; Divide and Conquer Search Strategy

We have already learned that search algorithms are divided into two major categories.

- **Brute-force search**: Implemented by traversing the data structure, with a time complexity of $O(n)$.
- **Adaptive search**: Utilizes unique data organization forms or prior information, with time complexity reaching $O(\log n)$ or even $O(1)$.

In fact, **search algorithms with time complexity of $O(\log n)$ are typically implemented based on the divide and conquer strategy**, such as binary search and trees.

- Each step of binary search divides the problem (searching for a target element in an array) into a smaller problem (searching for the target element in half of the array), continuing until the array is empty or the target element is found.
- Trees are representative of the divide and conquer idea. In data structures such as binary search trees, AVL trees, and heaps, the time complexity of various operations is $O(\log n)$.

The divide and conquer strategy of binary search is as follows.

- **The problem can be decomposed**: Binary search recursively decomposes the original problem (searching in an array) into subproblems (searching in half of the array), achieved by comparing the middle element with the target element.
- **Subproblems are independent**: In binary search, each round only processes one subproblem, which is not affected by other subproblems.
- **Solutions of subproblems do not need to be merged**: Binary search aims to find a specific element, so there is no need to merge the solutions of subproblems. When a subproblem is solved, the original problem is also solved.

Divide and conquer can improve search efficiency because brute-force search can only eliminate one option per round, **while divide and conquer search can eliminate half of the options per round**.

### 1. &nbsp; Implementing Binary Search Based on Divide and Conquer

In previous sections, binary search was implemented based on iteration. Now we implement it based on divide and conquer (recursion).

!!! question

    Given a sorted array `nums` of length $n$, where all elements are unique, find the element `target`.

From a divide and conquer perspective, we denote the subproblem corresponding to the search interval $[i, j]$ as $f(i, j)$.

Starting from the original problem $f(0, n-1)$, perform binary search through the following steps.

1. Calculate the midpoint $m$ of the search interval $[i, j]$, and use it to eliminate half of the search interval.
2. Recursively solve the subproblem reduced by half in size, which could be $f(i, m-1)$ or $f(m+1, j)$.
3. Repeat steps `1.` and `2.` until `target` is found or the interval is empty and return.

Figure 12-4 shows the divide and conquer process of binary search for element $6$ in an array.

![Divide and conquer process of binary search](binary_search_recur.assets/binary_search_recur.png){ class="animation-figure" }

<p align="center"> Figure 12-4 &nbsp; Divide and conquer process of binary search </p>

In the implementation code, we declare a recursive function `dfs()` to solve the problem $f(i, j)$:

=== "Python"

    ```python title="binary_search_recur.py"
    def dfs(nums: list[int], target: int, i: int, j: int) -> int:
        """Binary search: problem f(i, j)"""
        # If the interval is empty, it means there is no target element, return -1
        if i > j:
            return -1
        # Calculate the midpoint index m
        m = (i + j) // 2
        if nums[m] < target:
            # Recursion subproblem f(m+1, j)
            return dfs(nums, target, m + 1, j)
        elif nums[m] > target:
            # Recursion subproblem f(i, m-1)
            return dfs(nums, target, i, m - 1)
        else:
            # Found the target element, return its index
            return m

    def binary_search(nums: list[int], target: int) -> int:
        """Binary search"""
        n = len(nums)
        # Solve the problem f(0, n-1)
        return dfs(nums, target, 0, n - 1)
    ```

=== "C++"

    ```cpp title="binary_search_recur.cpp"
    /* Binary search: problem f(i, j) */
    int dfs(vector<int> &nums, int target, int i, int j) {
        // If the interval is empty, it means there is no target element, return -1
        if (i > j) {
            return -1;
        }
        // Calculate the midpoint index m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Recursion subproblem f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Recursion subproblem f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Found the target element, return its index
            return m;
        }
    }

    /* Binary search */
    int binarySearch(vector<int> &nums, int target) {
        int n = nums.size();
        // Solve the problem f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Java"

    ```java title="binary_search_recur.java"
    /* Binary search: problem f(i, j) */
    int dfs(int[] nums, int target, int i, int j) {
        // If the interval is empty, it means there is no target element, return -1
        if (i > j) {
            return -1;
        }
        // Calculate the midpoint index m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Recursion subproblem f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Recursion subproblem f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Found the target element, return its index
            return m;
        }
    }

    /* Binary search */
    int binarySearch(int[] nums, int target) {
        int n = nums.length;
        // Solve the problem f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "C#"

    ```csharp title="binary_search_recur.cs"
    /* Binary search: problem f(i, j) */
    int DFS(int[] nums, int target, int i, int j) {
        // If the interval is empty, it means there is no target element, return -1
        if (i > j) {
            return -1;
        }
        // Calculate the midpoint index m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Recursion subproblem f(m+1, j)
            return DFS(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Recursion subproblem f(i, m-1)
            return DFS(nums, target, i, m - 1);
        } else {
            // Found the target element, return its index
            return m;
        }
    }

    /* Binary search */
    int BinarySearch(int[] nums, int target) {
        int n = nums.Length;
        // Solve the problem f(0, n-1)
        return DFS(nums, target, 0, n - 1);
    }
    ```

=== "Go"

    ```go title="binary_search_recur.go"
    /* Binary search: problem f(i, j) */
    func dfs(nums []int, target, i, j int) int {
        // If interval is empty, indicating no target element, return -1
        if i > j {
            return -1
        }
        // Calculate midpoint index
        m := i + ((j - i) >> 1)
        // Compare midpoint with target element
        if nums[m] < target {
            // If smaller, recurse on right half of array
            // Recursion subproblem f(m+1, j)
            return dfs(nums, target, m+1, j)
        } else if nums[m] > target {
            // If larger, recurse on left half of array
            // Recursion subproblem f(i, m-1)
            return dfs(nums, target, i, m-1)
        } else {
            // Found the target element, return its index
            return m
        }
    }

    /* Binary search */
    func binarySearch(nums []int, target int) int {
        n := len(nums)
        return dfs(nums, target, 0, n-1)
    }
    ```

=== "Swift"

    ```swift title="binary_search_recur.swift"
    /* Binary search: problem f(i, j) */
    func dfs(nums: [Int], target: Int, i: Int, j: Int) -> Int {
        // If the interval is empty, it means there is no target element, return -1
        if i > j {
            return -1
        }
        // Calculate the midpoint index m
        let m = (i + j) / 2
        if nums[m] < target {
            // Recursion subproblem f(m+1, j)
            return dfs(nums: nums, target: target, i: m + 1, j: j)
        } else if nums[m] > target {
            // Recursion subproblem f(i, m-1)
            return dfs(nums: nums, target: target, i: i, j: m - 1)
        } else {
            // Found the target element, return its index
            return m
        }
    }

    /* Binary search */
    func binarySearch(nums: [Int], target: Int) -> Int {
        // Solve the problem f(0, n-1)
        dfs(nums: nums, target: target, i: nums.startIndex, j: nums.endIndex - 1)
    }
    ```

=== "JS"

    ```javascript title="binary_search_recur.js"
    /* Binary search: problem f(i, j) */
    function dfs(nums, target, i, j) {
        // If the interval is empty, it means there is no target element, return -1
        if (i > j) {
            return -1;
        }
        // Calculate the midpoint index m
        const m = i + ((j - i) >> 1);
        if (nums[m] < target) {
            // Recursion subproblem f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Recursion subproblem f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Found the target element, return its index
            return m;
        }
    }

    /* Binary search */
    function binarySearch(nums, target) {
        const n = nums.length;
        // Solve the problem f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "TS"

    ```typescript title="binary_search_recur.ts"
    /* Binary search: problem f(i, j) */
    function dfs(nums: number[], target: number, i: number, j: number): number {
        // If the interval is empty, it means there is no target element, return -1
        if (i > j) {
            return -1;
        }
        // Calculate the midpoint index m
        const m = i + ((j - i) >> 1);
        if (nums[m] < target) {
            // Recursion subproblem f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Recursion subproblem f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Found the target element, return its index
            return m;
        }
    }

    /* Binary search */
    function binarySearch(nums: number[], target: number): number {
        const n = nums.length;
        // Solve the problem f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Dart"

    ```dart title="binary_search_recur.dart"
    /* Binary search: problem f(i, j) */
    int dfs(List<int> nums, int target, int i, int j) {
      // If the interval is empty, it means there is no target element, return -1
      if (i > j) {
        return -1;
      }
      // Calculate the midpoint index m
      int m = (i + j) ~/ 2;
      if (nums[m] < target) {
        // Recursion subproblem f(m+1, j)
        return dfs(nums, target, m + 1, j);
      } else if (nums[m] > target) {
        // Recursion subproblem f(i, m-1)
        return dfs(nums, target, i, m - 1);
      } else {
        // Found the target element, return its index
        return m;
      }
    }

    /* Binary search */
    int binarySearch(List<int> nums, int target) {
      int n = nums.length;
      // Solve the problem f(0, n-1)
      return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Rust"

    ```rust title="binary_search_recur.rs"
    /* Binary search: problem f(i, j) */
    fn dfs(nums: &[i32], target: i32, i: i32, j: i32) -> i32 {
        // If the interval is empty, it means there is no target element, return -1
        if i > j {
            return -1;
        }
        let m: i32 = i + (j - i) / 2;
        if nums[m as usize] < target {
            // Recursion subproblem f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if nums[m as usize] > target {
            // Recursion subproblem f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Found the target element, return its index
            return m;
        }
    }

    /* Binary search */
    fn binary_search(nums: &[i32], target: i32) -> i32 {
        let n = nums.len() as i32;
        // Solve the problem f(0, n-1)
        dfs(nums, target, 0, n - 1)
    }
    ```

=== "C"

    ```c title="binary_search_recur.c"
    /* Binary search: problem f(i, j) */
    int dfs(int nums[], int target, int i, int j) {
        // If the interval is empty, it means there is no target element, return -1
        if (i > j) {
            return -1;
        }
        // Calculate the midpoint index m
        int m = (i + j) / 2;
        if (nums[m] < target) {
            // Recursion subproblem f(m+1, j)
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Recursion subproblem f(i, m-1)
            return dfs(nums, target, i, m - 1);
        } else {
            // Found the target element, return its index
            return m;
        }
    }

    /* Binary search */
    int binarySearch(int nums[], int target, int numsSize) {
        int n = numsSize;
        // Solve the problem f(0, n-1)
        return dfs(nums, target, 0, n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_recur.kt"
    /* Binary search: problem f(i, j) */
    fun dfs(
        nums: IntArray,
        target: Int,
        i: Int,
        j: Int
    ): Int {
        // If the interval is empty, it means there is no target element, return -1
        if (i > j) {
            return -1
        }
        // Calculate the midpoint index m
        val m = (i + j) / 2
        return if (nums[m] < target) {
            // Recursion subproblem f(m+1, j)
            dfs(nums, target, m + 1, j)
        } else if (nums[m] > target) {
            // Recursion subproblem f(i, m-1)
            dfs(nums, target, i, m - 1)
        } else {
            // Found the target element, return its index
            m
        }
    }

    /* Binary search */
    fun binarySearch(nums: IntArray, target: Int): Int {
        val n = nums.size
        // Solve the problem f(0, n-1)
        return dfs(nums, target, 0, n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_recur.rb"
    ### Binary search: problem f(i, j) ###
    def dfs(nums, target, i, j)
      # If the interval is empty, it means there is no target element, return -1
      return -1 if i > j
      
      # Calculate the midpoint index m
      m = (i + j) / 2

      if nums[m] < target
        # Recursion subproblem f(m+1, j)
        return dfs(nums, target, m + 1, j)
      elsif nums[m] > target
        # Recursion subproblem f(i, m-1)
        return dfs(nums, target, i, m - 1)
      else
        # Found the target element, return its index
        return m
      end
    end

    ### Binary search ###
    def binary_search(nums, target)
      n = nums.length
      # Solve the problem f(0, n-1)
      dfs(nums, target, 0, n - 1)
    end
    ```
