---
comments: true
---

# 10.3 &nbsp; Binary search boundaries

## 10.3.1 &nbsp; Find the left boundary

!!! question

    Given a sorted array `nums` of length $n$, which may contain duplicate elements, return the index of the leftmost element `target`. If the element is not present in the array, return $-1$.

Recalling the method of binary search for an insertion point, after the search is completed, the index $i$ will point to the leftmost occurrence of `target`. Therefore, **searching for the insertion point is essentially the same as finding the index of the leftmost `target`**.

We can use the function for finding an insertion point to find the left boundary of `target`. Note that the array might not contain `target`, which could lead to the following two results:

- The index $i$ of the insertion point is out of bounds.
- The element `nums[i]` is not equal to `target`.

In these cases, simply return $-1$. The code is as follows:

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_left_edge(nums: list[int], target: int) -> int:
        """Binary search for the leftmost target"""
        # Equivalent to finding the insertion point of target
        i = binary_search_insertion(nums, target)
        # Did not find target, thus return -1
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
        // Did not find target, thus return -1
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
        // Did not find target, thus return -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // Found target, return index i
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    [class]{binary_search_edge}-[func]{BinarySearchLeftEdge}
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    [class]{}-[func]{binary_search_left_edge}
    ```

=== "C"

    ```c title="binary_search_edge.c"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    [class]{}-[func]{binary_search_left_edge}
    ```

=== "Zig"

    ```zig title="binary_search_edge.zig"
    [class]{}-[func]{binarySearchLeftEdge}
    ```

## 10.3.2 &nbsp; Find the right boundary

How do we find the rightmost occurrence of `target`? The most straightforward way is to modify the traditional binary search logic by changing how we adjust the search boundaries in the case of `nums[m] == target`. The code is omitted here. If you are interested, try to implement the code on your own.

Below we are going to introduce two more ingenious methods.

### 1. &nbsp; Reuse the left boundary search

To find the rightmost occurrence of `target`, we can reuse the function used for locating the leftmost `target`. Specifically, we transform the search for the rightmost target into a search for the leftmost target + 1.

As shown in Figure 10-7, after the search is complete, pointer $i$ will point to the leftmost `target + 1` (if exists), while pointer $j$ will point to the rightmost occurrence of `target`. Therefore, returning $j$ will give us the right boundary.

![Transforming the search for the right boundary into the search for the left boundary](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png){ class="animation-figure" }

<p align="center"> Figure 10-7 &nbsp; Transforming the search for the right boundary into the search for the left boundary </p>

Note that the insertion point returned is $i$, therefore, it should be subtracted by $1$ to obtain $j$:

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_right_edge(nums: list[int], target: int) -> int:
        """Binary search for the rightmost target"""
        # Convert to finding the leftmost target + 1
        i = binary_search_insertion(nums, target + 1)
        # j points to the rightmost target, i points to the first element greater than target
        j = i - 1
        # Did not find target, thus return -1
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
        // Did not find target, thus return -1
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
        // Did not find target, thus return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Found target, return index j
        return j;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    [class]{binary_search_edge}-[func]{BinarySearchRightEdge}
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    [class]{}-[func]{binary_search_right_edge}
    ```

=== "C"

    ```c title="binary_search_edge.c"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    [class]{}-[func]{binarySearchRightEdge}
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    [class]{}-[func]{binary_search_right_edge}
    ```

=== "Zig"

    ```zig title="binary_search_edge.zig"
    [class]{}-[func]{binarySearchRightEdge}
    ```

### 2. &nbsp; Transform into an element search

When the array does not contain `target`, $i$ and $j$ will eventually point to the first element greater and smaller than `target` respectively.

Thus, as shown in Figure 10-8, we can construct an element that does not exist in the array, to search for the left and right boundaries.

- To find the leftmost `target`: it can be transformed into searching for `target - 0.5`, and return the pointer $i$.
- To find the rightmost `target`: it can be transformed into searching for `target + 0.5`, and return the pointer $j$.

![Transforming the search for boundaries into the search for an element](binary_search_edge.assets/binary_search_edge_by_element.png){ class="animation-figure" }

<p align="center"> Figure 10-8 &nbsp; Transforming the search for boundaries into the search for an element </p>

The code is omitted here, but here are two important points to note about this approach.

- The given array `nums` does not contain decimal, so handling equal cases is not a concern.
- However, introducing decimals in this approach requires modifying the `target` variable to a floating-point type (no change needed in Python).
