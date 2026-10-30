---
comments: true
---

# 10.3 &nbsp; Finding boundaries with binary search

## 10.3.1 &nbsp; Finding the left boundary

!!! question

    Given a sorted array `nums` of length $n$ that may contain duplicate elements, return the index of the leftmost occurrence of `target`. If the array does not contain this element, return $-1$.

Recall the method for finding an insertion point with binary search: when the search finishes, $i$ points to the leftmost `target`. **Finding the insertion point therefore amounts to finding the index of the leftmost `target`**.

We can use the insertion-point function to find the left boundary. However, `target` may be absent from the array, leading to either of the following outcomes.

- The insertion index $i$ is out of bounds.
- `nums[i]` is not equal to `target`.

In either case, simply return $-1$. The code is as follows:

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_left_edge(nums: list[int], target: int) -> int:
        """Find the leftmost occurrence of target using binary search"""
        # This is equivalent to finding the insertion point of target
        i = binary_search_insertion(nums, target)
        # If target was not found, return -1
        if i == len(nums) or nums[i] != target:
            return -1
        # Target was found; return index i
        return i
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* Find the leftmost occurrence of target using binary search */
    int binarySearchLeftEdge(vector<int> &nums, int target) {
        // This is equivalent to finding the insertion point of target
        int i = binarySearchInsertion(nums, target);
        // If target was not found, return -1
        if (i == nums.size() || nums[i] != target) {
            return -1;
        }
        // Target was found; return index i
        return i;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* Find the leftmost occurrence of target using binary search */
    int binarySearchLeftEdge(int[] nums, int target) {
        // This is equivalent to finding the insertion point of target
        int i = binary_search_insertion.binarySearchInsertion(nums, target);
        // If target was not found, return -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        // Target was found; return index i
        return i;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* Find the leftmost occurrence of target using binary search */
    int BinarySearchLeftEdge(int[] nums, int target) {
        // This is equivalent to finding the insertion point of target
        int i = binary_search_insertion.BinarySearchInsertion(nums, target);
        // If target was not found, return -1
        if (i == nums.Length || nums[i] != target) {
            return -1;
        }
        // Target was found; return index i
        return i;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* Find the leftmost occurrence of target using binary search */
    func binarySearchLeftEdge(nums []int, target int) int {
        // This is equivalent to finding the insertion point of target
        i := binarySearchInsertion(nums, target)
        // If target was not found, return -1
        if i == len(nums) || nums[i] != target {
            return -1
        }
        // Target was found; return index i
        return i
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* Find the leftmost occurrence of target using binary search */
    func binarySearchLeftEdge(nums: [Int], target: Int) -> Int {
        // This is equivalent to finding the insertion point of target
        let i = binarySearchInsertion(nums: nums, target: target)
        // If target was not found, return -1
        if i == nums.endIndex || nums[i] != target {
            return -1
        }
        // Target was found; return index i
        return i
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* Find the leftmost occurrence of target using binary search */
    function binarySearchLeftEdge(nums, target) {
        // This is equivalent to finding the insertion point of target
        const i = binarySearchInsertion(nums, target);
        // If target was not found, return -1
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // Target was found; return index i
        return i;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* Find the leftmost occurrence of target using binary search */
    function binarySearchLeftEdge(nums: Array<number>, target: number): number {
        // This is equivalent to finding the insertion point of target
        const i = binarySearchInsertion(nums, target);
        // If target was not found, return -1
        if (i === nums.length || nums[i] !== target) {
            return -1;
        }
        // Target was found; return index i
        return i;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* Find the leftmost occurrence of target using binary search */
    int binarySearchLeftEdge(List<int> nums, int target) {
      // This is equivalent to finding the insertion point of target
      int i = binarySearchInsertion(nums, target);
      // If target was not found, return -1
      if (i == nums.length || nums[i] != target) {
        return -1;
      }
      // Target was found; return index i
      return i;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* Find the leftmost occurrence of target using binary search */
    fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
        // This is equivalent to finding the insertion point of target
        let i = binary_search_insertion(nums, target);
        // If target was not found, return -1
        if i == nums.len() as i32 || nums[i as usize] != target {
            return -1;
        }
        // Target was found; return index i
        i
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* Find the leftmost occurrence of target using binary search */
    int binarySearchLeftEdge(int *nums, int numSize, int target) {
        // This is equivalent to finding the insertion point of target
        int i = binarySearchInsertion(nums, numSize, target);
        // If target was not found, return -1
        if (i == numSize || nums[i] != target) {
            return -1;
        }
        // Target was found; return index i
        return i;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* Find the leftmost occurrence of target using binary search */
    fun binarySearchLeftEdge(nums: IntArray, target: Int): Int {
        // This is equivalent to finding the insertion point of target
        val i = binarySearchInsertion(nums, target)
        // If target was not found, return -1
        if (i == nums.size || nums[i] != target) {
            return -1
        }
        // Target was found; return index i
        return i
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### Find the leftmost occurrence of target using binary search ###
    def binary_search_left_edge(nums, target)
      # This is equivalent to finding the insertion point of target
      i = binary_search_insertion(nums, target)

      # If target was not found, return -1
      return -1 if i == nums.length || nums[i] != target

      i # Target was found; return index i
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Find%20an%20insertion%20point%20using%20binary%20search%20%28with%20duplicates%29%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20Initialize%20the%20closed%20interval%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20Calculate%20the%20midpoint%20index%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20Target%20must%20be%20in%20%5Bm%2B1,%20j%5D%20if%20it%20exists%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20Target%20must%20be%20in%20%5Bi,%20m-1%5D%20if%20it%20exists%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20Search%20%5Bi,%20m-1%5D%20for%20the%20insertion%20point%20before%20equal%20elements%0A%20%20%20%20%23%20Return%20insertion%20point%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Find%20the%20leftmost%20occurrence%20of%20target%20using%20binary%20search%22%22%22%0A%20%20%20%20%23%20This%20is%20equivalent%20to%20finding%20the%20insertion%20point%20of%20target%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20%23%20If%20target%20was%20not%20found,%20return%20-1%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20Target%20was%20found%3B%20return%20index%20i%0A%20%20%20%20return%20i%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Array%20containing%20duplicate%20elements%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20Find%20a%20boundary%20using%20binary%20search%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22Index%20of%20the%20leftmost%20occurrence%20of%20%7Btarget%7D%3A%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Find%20an%20insertion%20point%20using%20binary%20search%20%28with%20duplicates%29%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20Initialize%20the%20closed%20interval%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20Calculate%20the%20midpoint%20index%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20Target%20must%20be%20in%20%5Bm%2B1,%20j%5D%20if%20it%20exists%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20Target%20must%20be%20in%20%5Bi,%20m-1%5D%20if%20it%20exists%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20Search%20%5Bi,%20m-1%5D%20for%20the%20insertion%20point%20before%20equal%20elements%0A%20%20%20%20%23%20Return%20insertion%20point%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_left_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Find%20the%20leftmost%20occurrence%20of%20target%20using%20binary%20search%22%22%22%0A%20%20%20%20%23%20This%20is%20equivalent%20to%20finding%20the%20insertion%20point%20of%20target%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%29%0A%20%20%20%20%23%20If%20target%20was%20not%20found,%20return%20-1%0A%20%20%20%20if%20i%20%3D%3D%20len%28nums%29%20or%20nums%5Bi%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20Target%20was%20found%3B%20return%20index%20i%0A%20%20%20%20return%20i%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Array%20containing%20duplicate%20elements%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20Find%20a%20boundary%20using%20binary%20search%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_left_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22Index%20of%20the%20leftmost%20occurrence%20of%20%7Btarget%7D%3A%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 10.3.2 &nbsp; Finding the right boundary

How can we find the rightmost `target`? The most direct approach is to modify the pointer update for `nums[m] == target`. We omit the code here; interested readers can implement it themselves.

Here are two shortcuts.

### 1. &nbsp; Reusing the left-boundary search

We can use the function for finding the leftmost element to find the rightmost one: **turn the search for the rightmost `target` into a search for the leftmost `target + 1`**.

As shown below, when the search finishes, pointer $i$ points to the leftmost `target + 1`, if it exists, while $j$ points to the rightmost `target`. **We therefore return $j$**.

![Turning a right-boundary search into a left-boundary search](binary_search_edge.assets/binary_search_right_edge_by_left_edge.png){ class="animation-figure" }

<p align="center"> Figure 10-7 &nbsp; Turning a right-boundary search into a left-boundary search </p>

The returned insertion point is $i$, so subtract $1$ to obtain $j$:

=== "Python"

    ```python title="binary_search_edge.py"
    def binary_search_right_edge(nums: list[int], target: int) -> int:
        """Find the rightmost occurrence of target using binary search"""
        # Reduce the problem to finding the leftmost insertion point of target + 1
        i = binary_search_insertion(nums, target + 1)
        # j is the candidate rightmost target index; i is the index of the first element greater than target, or len(nums)
        j = i - 1
        # If target was not found, return -1
        if j == -1 or nums[j] != target:
            return -1
        # Target was found; return index j
        return j
    ```

=== "C++"

    ```cpp title="binary_search_edge.cpp"
    /* Find the rightmost occurrence of target using binary search */
    int binarySearchRightEdge(vector<int> &nums, int target) {
        // Reduce the problem to finding the leftmost insertion point of target + 1
        int i = binarySearchInsertion(nums, target + 1);
        // j points to the rightmost target, while i points to the first element greater than target
        int j = i - 1;
        // If target was not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Target was found; return index j
        return j;
    }
    ```

=== "Java"

    ```java title="binary_search_edge.java"
    /* Find the rightmost occurrence of target using binary search */
    int binarySearchRightEdge(int[] nums, int target) {
        // Reduce the problem to finding the leftmost insertion point of target + 1
        int i = binary_search_insertion.binarySearchInsertion(nums, target + 1);
        // j points to the rightmost target, while i points to the first element greater than target
        int j = i - 1;
        // If target was not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Target was found; return index j
        return j;
    }
    ```

=== "C#"

    ```csharp title="binary_search_edge.cs"
    /* Find the rightmost occurrence of target using binary search */
    int BinarySearchRightEdge(int[] nums, int target) {
        // Reduce the problem to finding the leftmost insertion point of target + 1
        int i = binary_search_insertion.BinarySearchInsertion(nums, target + 1);
        // j is the candidate index of the rightmost target; i is the insertion point after all elements <= target
        int j = i - 1;
        // If target was not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Target was found; return index j
        return j;
    }
    ```

=== "Go"

    ```go title="binary_search_edge.go"
    /* Find the rightmost occurrence of target using binary search */
    func binarySearchRightEdge(nums []int, target int) int {
        // For integer values, find the leftmost insertion point of target + 1 (assuming no overflow)
        i := binarySearchInsertion(nums, target+1)
        // i is the index of the first element greater than target (or len(nums)); j is the candidate index of the rightmost target
        j := i - 1
        // If target was not found, return -1
        if j == -1 || nums[j] != target {
            return -1
        }
        // Target was found; return index j
        return j
    }
    ```

=== "Swift"

    ```swift title="binary_search_edge.swift"
    /* Find the rightmost occurrence of target using binary search */
    func binarySearchRightEdge(nums: [Int], target: Int) -> Int {
        // Reduce the problem to finding the leftmost insertion point of target + 1
        let i = binarySearchInsertion(nums: nums, target: target + 1)
        // i is the first index with a value greater than target (or nums.endIndex); j is the candidate index of the rightmost target
        let j = i - 1
        // If target was not found, return -1
        if j == -1 || nums[j] != target {
            return -1
        }
        // Target was found; return index j
        return j
    }
    ```

=== "JS"

    ```javascript title="binary_search_edge.js"
    /* Find the rightmost occurrence of target using binary search */
    function binarySearchRightEdge(nums, target) {
        // Reduce the problem to finding the leftmost insertion point of target + 1
        const i = binarySearchInsertion(nums, target + 1);
        // j points to the rightmost target, while i points to the first element greater than target
        const j = i - 1;
        // If target was not found, return -1
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // Target was found; return index j
        return j;
    }
    ```

=== "TS"

    ```typescript title="binary_search_edge.ts"
    /* Find the rightmost occurrence of target using binary search */
    function binarySearchRightEdge(nums: Array<number>, target: number): number {
        // Reduce the problem to finding the leftmost insertion point of target + 1
        const i = binarySearchInsertion(nums, target + 1);
        // For integer elements, i is the first index greater than target (or the array length); j is the candidate rightmost target index
        const j = i - 1;
        // If target was not found, return -1
        if (j === -1 || nums[j] !== target) {
            return -1;
        }
        // Target was found; return index j
        return j;
    }
    ```

=== "Dart"

    ```dart title="binary_search_edge.dart"
    /* Find the rightmost occurrence of target using binary search */
    int binarySearchRightEdge(List<int> nums, int target) {
      // Reduce the problem to finding the leftmost insertion point of target + 1
      int i = binarySearchInsertion(nums, target + 1);
      // i is the first index greater than target (or the array length); j is the candidate rightmost target index
      int j = i - 1;
      // If target was not found, return -1
      if (j == -1 || nums[j] != target) {
        return -1;
      }
      // Target was found; return index j
      return j;
    }
    ```

=== "Rust"

    ```rust title="binary_search_edge.rs"
    /* Find the rightmost occurrence of target using binary search */
    fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
        // Reduce the problem to finding the leftmost insertion point of target + 1
        let i = binary_search_insertion(nums, target + 1);
        // j points to the rightmost target, while i points to the first element greater than target
        let j = i - 1;
        // If target was not found, return -1
        if j == -1 || nums[j as usize] != target {
            return -1;
        }
        // Target was found; return index j
        j
    }
    ```

=== "C"

    ```c title="binary_search_edge.c"
    /* Find the rightmost occurrence of target using binary search */
    int binarySearchRightEdge(int *nums, int numSize, int target) {
        // Reduce the problem to finding the leftmost insertion point of target + 1
        int i = binarySearchInsertion(nums, numSize, target + 1);
        // j points to the rightmost target, while i points to the first element greater than target
        int j = i - 1;
        // If target was not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        // Target was found; return index j
        return j;
    }
    ```

=== "Kotlin"

    ```kotlin title="binary_search_edge.kt"
    /* Find the rightmost occurrence of target using binary search */
    fun binarySearchRightEdge(nums: IntArray, target: Int): Int {
        // For integer values, find the leftmost insertion point of target + 1 (assuming no overflow)
        val i = binarySearchInsertion(nums, target + 1)
        // i is the index of the first element greater than target (or the array length); j is the candidate rightmost target index
        val j = i - 1
        // If target was not found, return -1
        if (j == -1 || nums[j] != target) {
            return -1
        }
        // Target was found; return index j
        return j
    }
    ```

=== "Ruby"

    ```ruby title="binary_search_edge.rb"
    ### Find the rightmost occurrence of target using binary search ###
    def binary_search_right_edge(nums, target)
      # For integer elements, find the leftmost insertion point of target + 1
      i = binary_search_insertion(nums, target + 1)

      # i is the index of the first element greater than target (or the array length); j is the candidate rightmost target index
      j = i - 1

      # If target was not found, return -1
      return -1 if j == -1 || nums[j] != target

      j # Target was found; return index j
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Find%20an%20insertion%20point%20using%20binary%20search%20%28with%20duplicates%29%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20Initialize%20the%20closed%20interval%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20Calculate%20the%20midpoint%20index%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20Target%20must%20be%20in%20%5Bm%2B1,%20j%5D%20if%20it%20exists%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20Target%20must%20be%20in%20%5Bi,%20m-1%5D%20if%20it%20exists%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20Search%20%5Bi,%20m-1%5D%20for%20the%20insertion%20point%20before%20equal%20elements%0A%20%20%20%20%23%20Return%20insertion%20point%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Find%20the%20rightmost%20occurrence%20of%20target%20using%20binary%20search%22%22%22%0A%20%20%20%20%23%20Reduce%20the%20problem%20to%20finding%20the%20leftmost%20insertion%20point%20of%20target%20%2B%201%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%20%2B%201%29%0A%20%20%20%20%23%20j%20is%20the%20candidate%20index%20of%20the%20rightmost%20target%3B%20i%20is%20the%20index%20of%20the%20first%20element%20greater%20than%20target,%20or%20len%28nums%29%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20If%20target%20was%20not%20found,%20return%20-1%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20Target%20was%20found%3B%20return%20index%20j%0A%20%20%20%20return%20j%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Array%20containing%20duplicate%20elements%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20Find%20a%20boundary%20using%20binary%20search%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22Index%20of%20the%20rightmost%20occurrence%20of%20%7Btarget%7D%3A%20%7Bindex%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20binary_search_insertion%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Find%20an%20insertion%20point%20using%20binary%20search%20%28with%20duplicates%29%22%22%22%0A%20%20%20%20i,%20j%20%3D%200,%20len%28nums%29%20-%201%20%20%23%20Initialize%20the%20closed%20interval%20%5B0,%20n-1%5D%0A%20%20%20%20while%20i%20%3C%3D%20j%3A%0A%20%20%20%20%20%20%20%20m%20%3D%20%28i%20%2B%20j%29%20//%202%20%20%23%20Calculate%20the%20midpoint%20index%20m%0A%20%20%20%20%20%20%20%20if%20nums%5Bm%5D%20%3C%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%3D%20m%20%2B%201%20%20%23%20Target%20must%20be%20in%20%5Bm%2B1,%20j%5D%20if%20it%20exists%0A%20%20%20%20%20%20%20%20elif%20nums%5Bm%5D%20%3E%20target%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20Target%20must%20be%20in%20%5Bi,%20m-1%5D%20if%20it%20exists%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%3D%20m%20-%201%20%20%23%20Search%20%5Bi,%20m-1%5D%20for%20the%20insertion%20point%20before%20equal%20elements%0A%20%20%20%20%23%20Return%20insertion%20point%20i%0A%20%20%20%20return%20i%0A%0Adef%20binary_search_right_edge%28nums%3A%20list%5Bint%5D,%20target%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22Find%20the%20rightmost%20occurrence%20of%20target%20using%20binary%20search%22%22%22%0A%20%20%20%20%23%20Reduce%20the%20problem%20to%20finding%20the%20leftmost%20insertion%20point%20of%20target%20%2B%201%0A%20%20%20%20i%20%3D%20binary_search_insertion%28nums,%20target%20%2B%201%29%0A%20%20%20%20%23%20j%20is%20the%20candidate%20index%20of%20the%20rightmost%20target%3B%20i%20is%20the%20index%20of%20the%20first%20element%20greater%20than%20target,%20or%20len%28nums%29%0A%20%20%20%20j%20%3D%20i%20-%201%0A%20%20%20%20%23%20If%20target%20was%20not%20found,%20return%20-1%0A%20%20%20%20if%20j%20%3D%3D%20-1%20or%20nums%5Bj%5D%20%21%3D%20target%3A%0A%20%20%20%20%20%20%20%20return%20-1%0A%20%20%20%20%23%20Target%20was%20found%3B%20return%20index%20j%0A%20%20%20%20return%20j%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20Array%20containing%20duplicate%20elements%0A%20%20%20%20nums%20%3D%20%5B1,%203,%206,%206,%206,%206,%206,%2010,%2012,%2015%5D%0A%20%20%20%20%23%20Find%20a%20boundary%20using%20binary%20search%0A%20%20%20%20target%20%3D%206%0A%20%20%20%20index%20%3D%20binary_search_right_edge%28nums,%20target%29%0A%20%20%20%20print%28f%22Index%20of%20the%20rightmost%20occurrence%20of%20%7Btarget%7D%3A%20%7Bindex%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

### 2. &nbsp; Turning a boundary search into an element search

When the array does not contain `target`, $i$ ultimately points to the first element greater than `target`, while $j$ points to the rightmost element smaller than `target`.

As shown below, we can therefore construct a value absent from the array and use it to find the left and right boundaries.

- To find the leftmost `target`, search for `target - 0.5` and return pointer $i$.
- To find the rightmost `target`, search for `target + 0.5` and return pointer $j$.

![Turning a boundary search into an element search](binary_search_edge.assets/binary_search_edge_by_element.png){ class="animation-figure" }

<p align="center"> Figure 10-8 &nbsp; Turning a boundary search into an element search </p>

The code is omitted here, but keep two points in mind.

- The given array contains no fractional values, so we do not need to handle equality.
- Since this method introduces fractional values, change the function's `target` variable to a floating-point type. No change is needed in Python.
