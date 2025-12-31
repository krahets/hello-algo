---
comments: true
---

# 10.3 &nbsp; Binary Search Edge Cases

## 10.3.1 &nbsp; Finding the Left Boundary

!!! question

    Given a sorted array `nums` of length $n$ that may contain duplicate elements, return the index of the leftmost element `target` in the array. If the array does not contain the element, return $-1$.

Recall the method for finding the insertion point with binary search. After the search completes, $i$ points to the leftmost `target`, **so finding the insertion point is essentially finding the index of the leftmost `target`**.

Consider implementing the left boundary search using the insertion point finding function. Note that the array may not contain `target`, which could result in the following two cases:

- The insertion point index $i$ is out of bounds.
- The element `nums[i]` is not equal to `target`.

When either of these situations occurs, simply return $-1$. The code is shown below:

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_left_edge(nums: list[int], target: int) -> int:
        """Binary search for the leftmost target"""
        # Equivalent to finding the insertion point of target
        i = binary_search_insertion(nums, target)
        # Target not found, return -1
        if i == len(nums) or nums[i] != target:
            return -1
        # Found target, return index i
        return i
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* Binary search for the leftmost target */
    int binarySearchLeftEdge(vector<int> &nums, int target) {
        // Equivalent to finding the insertion point of target
        int i = binarySearchInsertion(nums, target);
        // Target not found, return -1
        if (i == nums.size() || nums[i] != target) {
            return -1;
        }
        // Found target, return index i
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* Binary search for the leftmost target */
    int binarySearchLeftEdge(int[] nums, int target) {
        // Equivalent to finding the insertion point of target
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // Target not found, return -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // Found target, return index i
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* Binary search for the leftmost target */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // Equivalent to finding the insertion point of target
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // Target not found, return -1
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // Found target, return index i
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* Binary search for the leftmost target */
    func binarySearchLeftEdge(nums []int, target int) int {
        // Equivalent to finding the insertion point of target
        i := binarySearchInsertion(nums, target)
        // Target not found, return -1
        if i == len(nums) || nums[i] != target {
            return -1
        }
        // Found target, return index i
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* Binary search for the leftmost target */
    func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
        // Equivalent to finding the insertion point of target
        let i = binarySearchInsertion(nums: nums, target: target)
        // Target not found, return -1
        if i == nums.endIndex || nums[i] != target {
            return -1
        }
        // Found target, return index i
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* Binary search for the leftmost target */
    function binarySearchLeftEdge(nums, target) {
        // Equivalent to finding the insertion point of target
        const i = binarySearchInsertion(nums, target);
        // Target not found, return -1
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // Found target, return index i
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* Binary search for the leftmost target */
    function binarySearchLeftEdge(nums: Array<number>, target: number): number {
        // Equivalent to finding the insertion point of target
        const i = binarySearchInsertion(nums, target);
        // Target not found, return -1
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // Found target, return index i
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* Binary search for the leftmost target */
    int binarySearchLeftEdge(List<int> nums, int target) {
      // Equivalent to finding the insertion point of target
      int i = binarySearchInsertion(nums, target);
      // Target not found, return -1
      if (i == nums.length || nums[i] != target) {
        return -1;
      }
      // Found target, return index i
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* Binary search for the leftmost target */
    fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
        // Equivalent to finding the insertion point of target
        let i = binary_search_insertion(nums, target);
        // Target not found, return -1
        if i == nums.len() as i32 || nums[i as usize] != target {
            return -1;
        }
        // Found target, return index i
        i
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* Binary search for the leftmost target */
    int binarySearchLeftEdge(int *nums, int numSize, int target) {
        // Equivalent to finding the insertion point of target
        int i = binarySearchInsertion(nums, numSize, target);
        // Target not found, return -1
        if (i == numSize || nums[i] != target) {
            return -1;
        }
        // Found target, return index i
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* Binary search for the leftmost target */
    fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
        // Equivalent to finding the insertion point of target
        val i = binarySearchInsertion(nums, target)
        // Target not found, return -1
        if (i == nums.size || nums[i] != target) {
            return -1
        }
        // Found target, return index i
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### Binary search leftmost target ###
    def binary_search_left_edge(nums, target)
      # Equivalent to finding the insertion point of target
      i = binary_search_insertion(nums, target)

      # Target not found, return -1
      return -1 if i == nums.length || nums[i] != target

      i # Found target, return index i
    end
    ```

## 10.3.2 &nbsp; Finding the Right Boundary

So how do we find the rightmost `target`? The most direct approach is to modify the code and replace the pointer shrinking operation in the `nums[m] == target` case. The code is omitted here; interested readers can implement it themselves.

Below we introduce two more clever methods.

### 1. &nbsp; Reusing Left Boundary Search

In fact, we can use the function for finding the leftmost element to find the rightmost element. The specific method is: **Convert finding the rightmost `target` into finding the leftmost `target + 1`**.

As shown in Figure 10-7, after the search completes, pointer $i$ points to the leftmost `target + 1` (if it exists), while $j$ points to the rightmost `target`, **so we can simply return $j$**.

![Converting right boundary search to left boundary search](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png){ class="animation-figure" }

<p align="center"> Figure 10-7 &nbsp; Converting right boundary search to left boundary search </p>

Note that the returned insertion point is $i$, so we need to subtract $1$ from it to obtain $j$:

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_right_edge(nums: list[int], target: int) -> int:
        """Binary search for the rightmost target"""
        # Convert to finding the leftmost target + 1
        i = binary_search_insertion(nums, target + 1)
        # j points to the rightmost target, i points to the first element greater than target
        j = i - 1
        # Target not found, return -1
        if j == -1 or nums[j] != target:
            return -1
        # Found target, return index j
        return j
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* Binary search for the rightmost target */
    int binarySearchRightEdge(vector<int> &nums, int target) {
        // Convert to finding the leftmost target + 1
        int i = binarySearchInsertion(nums, target + 1);
        // j points to the rightmost target, i points to the first element greater than target
        int j = i - 1;
        // Target not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Found target, return index j
        return j;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* Binary search for the rightmost target */
    int binarySearchRightEdge(int[] nums, int target) {
        // Convert to finding the leftmost target + 1
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j points to the rightmost target, i points to the first element greater than target
        int j = i - 1;
        // Target not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Found target, return index j
        return j;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* Binary search for the rightmost target */
    int BinarySearchRightEdge(int[] nums, int target) {
        // Convert to finding the leftmost target + 1
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j points to the rightmost target, i points to the first element greater than target
        int j = i - 1;
        // Target not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Found target, return index j
        return j;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* Binary search for the rightmost target */
    func binarySearchRightEdge(nums []int, target int) int {
        // Convert to finding the leftmost target + 1
        i := binarySearchInsertion(nums, target+1)
        // j points to the rightmost target, i points to the first element greater than target
        j := i - 1
        // Target not found, return -1
        if j == -1 || nums[j] != target {
            return -1
        }
        // Found target, return index j
        return j
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* Binary search for the rightmost target */
    func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
        // Convert to finding the leftmost target + 1
        let i = binarySearchInsertion(nums: nums, target: target + 1)
        // j points to the rightmost target, i points to the first element greater than target
        let j = i - 1
        // Target not found, return -1
        if j == -1 || nums[j] != target {
            return -1
        }
        // Found target, return index j
        return j
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* Binary search for the rightmost target */
    function binarySearchRightEdge(nums, target) {
        // Convert to finding the leftmost target + 1
        const i = binarySearchInsertion(nums, target + 1);
        // j points to the rightmost target, i points to the first element greater than target
        const j = i - 1;
        // Target not found, return -1
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // Found target, return index j
        return j;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* Binary search for the rightmost target */
    function binarySearchRightEdge(nums: Array<number>, target: number): number {
        // Convert to finding the leftmost target + 1
        const i = binarySearchInsertion(nums, target + 1);
        // j points to the rightmost target, i points to the first element greater than target
        const j = i - 1;
        // Target not found, return -1
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // Found target, return index j
        return j;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* Binary search for the rightmost target */
    int binarySearchRightEdge(List<int> nums, int target) {
      // Convert to finding the leftmost target + 1
      int i = binarySearchInsertion(nums, target + 1);
      // j points to the rightmost target, i points to the first element greater than target
      int j = i - 1;
      // Target not found, return -1
      if (j == -1 || nums[j] != target) {
        return -1;
      }
      // Found target, return index j
      return j;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* Binary search for the rightmost target */
    fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
        // Convert to finding the leftmost target + 1
        let i = binary_search_insertion(nums, target + 1);
        // j points to the rightmost target, i points to the first element greater than target
        let j = i - 1;
        // Target not found, return -1
        if j == -1 || nums[j as usize] != target {
            return -1;
        }
        // Found target, return index j
        j
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* Binary search for the rightmost target */
    int binarySearchRightEdge(int *nums, int numSize, int target) {
        // Convert to finding the leftmost target + 1
        int i = binarySearchInsertion(nums, numSize, target + 1);
        // j points to the rightmost target, i points to the first element greater than target
        int j = i - 1;
        // Target not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Found target, return index j
        return j;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* Binary search for the rightmost target */
    fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
        // Convert to finding the leftmost target + 1
        val i = binarySearchInsertion(nums, target + 1)
        // j points to the rightmost target, i points to the first element greater than target
        val j = i - 1
        // Target not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1
        }
        // Found target, return index j
        return j
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### Binary search rightmost target ###
    def binary_search_right_edge(nums, target)
      # Convert to finding the leftmost target + 1
      i = binary_search_insertion(nums, target + 1)

      # j points to the rightmost target, i points to the first element greater than target
      j = i - 1

      # Target not found, return -1
      return -1 if j == -1 || nums[j] != target

      j # Found target, return index j
    end
    ```

### 2. &nbsp; Converting to Element Search

We know that when the array does not contain `target`, $i$ and $j$ will eventually point to the first elements greater than and less than `target`, respectively.

Therefore, as shown in Figure 10-8, we can construct an element that does not exist in the array to find the left and right boundaries.

- Finding the leftmost `target`: Can be converted to finding `target - 0.5` and returning pointer $i$.
- Finding the rightmost `target`: Can be converted to finding `target + 0.5` and returning pointer $j$.

![Converting boundary search to element search](binary_search_edge.assets/binary_search_edge_by_element.png){ class="animation-figure" }

<p align="center"> Figure 10-8 &nbsp; Converting boundary search to element search </p>

The code is omitted here, but the following two points are worth noting:

- Since the given array does not contain decimals, we don't need to worry about how to handle equal cases.
- Because this method introduces decimals, the variable `target` in the function needs to be changed to a floating-point type (Python does not require this change).
