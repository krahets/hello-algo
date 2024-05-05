---
comments: true
---

# 10.3 &nbsp; Binary search boundaries

## 10.3.1 &nbsp; Find the left boundary

!!! question

    Given a sorted array `nums` of length $n$, which may contain duplicate elements, return the index of the leftmost element `target`. If the element is not present in the array, return $-1$.

Recall the method of binary search for an insertion point, after the search is completed, $i$ points to the leftmost `target`, **thus searching for the insertion point is essentially searching for the index of the leftmost `target`**.

Consider implementing the search for the left boundary using the function for finding an insertion point. Note that the array might not contain `target`, which could lead to the following two results:

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
    [class]{}-[func]{binarySearchLeftEdge}
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

So how do we find the rightmost `target`? The most straightforward way is to modify the code, replacing the pointer contraction operation in the case of `nums[m] == target`. The code is omitted here, but interested readers can implement it on their own.

Below we introduce two more cunning methods.

### 1. &nbsp; Reusing the search for the left boundary

In fact, we can use the function for finding the leftmost element to find the rightmost element, specifically by **transforming the search for the rightmost `target` into a search for the leftmost `target + 1`**.

As shown in Figure 10-7, after the search is completed, the pointer $i$ points to the leftmost `target + 1` (if it exists), while $j$ points to the rightmost `target`, **thus returning $j$ is sufficient**.

![Transforming the search for the right boundary into the search for the left boundary](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png){ class="animation-figure" }

<p align="center"> Figure 10-7 &nbsp; Transforming the search for the right boundary into the search for the left boundary </p>

Please note, the insertion point returned is $i$, therefore, it should be subtracted by $1$ to obtain $j$:

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
    [class]{}-[func]{binarySearchRightEdge}
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

### 2. &nbsp; Transforming into an element search

We know that when the array does not contain `target`, $i$ and $j$ will eventually point to the first element greater and smaller than `target` respectively.

Thus, as shown in Figure 10-8, we can construct an element that does not exist in the array, to search for the left and right boundaries.

- To find the leftmost `target`: it can be transformed into searching for `target - 0.5`, and return the pointer $i$.
- To find the rightmost `target`: it can be transformed into searching for `target + 0.5`, and return the pointer $j$.

![Transforming the search for boundaries into the search for an element](binary_search_edge.assets/binary_search_edge_by_element.png){ class="animation-figure" }

<p align="center"> Figure 10-8 &nbsp; Transforming the search for boundaries into the search for an element </p>

The code is omitted here, but two points are worth noting.

- The given array does not contain decimals, meaning we do not need to worry about how to handle equal situations.
- Since this method introduces decimals, the variable `target` in the function needs to be changed to a floating point type (no change needed in Python).
