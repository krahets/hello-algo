---
comments: true
---

# 11.3 &nbsp; Bubble sort

<u>Bubble sort</u> works by continuously comparing and swapping adjacent elements. This process is like bubbles rising from the bottom to the top, hence the name "bubble sort."

As shown in Figure 11-4, the bubbling process can be simulated using element swaps: start from the leftmost end of the array and move right, comparing each pair of adjacent elements. If the left element is greater than the right element, swap them. After the traversal, the largest element will have bubbled up to the rightmost end of the array.

=== "<1>"
    ![Simulating bubble process using element swap](bubble_sort.assets/bubble_operation_step1.png){ class="animation-figure" }

=== "<2>"
    ![bubble_operation_step2](bubble_sort.assets/bubble_operation_step2.png){ class="animation-figure" }

=== "<3>"
    ![bubble_operation_step3](bubble_sort.assets/bubble_operation_step3.png){ class="animation-figure" }

=== "<4>"
    ![bubble_operation_step4](bubble_sort.assets/bubble_operation_step4.png){ class="animation-figure" }

=== "<5>"
    ![bubble_operation_step5](bubble_sort.assets/bubble_operation_step5.png){ class="animation-figure" }

=== "<6>"
    ![bubble_operation_step6](bubble_sort.assets/bubble_operation_step6.png){ class="animation-figure" }

=== "<7>"
    ![bubble_operation_step7](bubble_sort.assets/bubble_operation_step7.png){ class="animation-figure" }

<p align="center"> Figure 11-4 &nbsp; Simulating bubble process using element swap </p>

## 11.3.1 &nbsp; Algorithm process

Assume the array has length $n$. The steps of bubble sort are shown in Figure 11-5:

1. First, perform one "bubble" pass on $n$ elements, **swapping the largest element to its correct position**.
2. Next, perform a "bubble" pass on the remaining $n - 1$ elements, **swapping the second largest element to its correct position**.
3. Continue in this manner; after $n - 1$ such passes, **the largest $n - 1$ elements will have been moved to their correct positions**.
4. The only remaining element **must** be the smallest, so **no** further sorting is required. At this point, the array is sorted.

![Bubble sort process](bubble_sort.assets/bubble_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-5 &nbsp; Bubble sort process </p>

Example code is as follows:

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort(nums: list[int]):
        """Bubble sort"""
        n = len(nums)
        # Outer loop: unsorted range is [0, i]
        for i in range(n - 1, 0, -1):
            # Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # Swap nums[j] and nums[j + 1]
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* Bubble sort */
    void bubbleSort(vector<int> &nums) {
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    // Here, the std
                    swap(nums[j], nums[j + 1]);
                }
            }
        }
    }
    ```

=== "Java"

    ```java title="bubble_sort.java"
    /* Bubble sort */
    void bubbleSort(int[] nums) {
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    [class]{bubble_sort}-[func]{BubbleSort}
    ```

=== "Go"

    ```go title="bubble_sort.go"
    [class]{}-[func]{bubbleSort}
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    [class]{}-[func]{bubbleSort}
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    [class]{}-[func]{bubbleSort}
    ```

=== "TS"

    ```typescript title="bubble_sort.ts"
    [class]{}-[func]{bubbleSort}
    ```

=== "Dart"

    ```dart title="bubble_sort.dart"
    [class]{}-[func]{bubbleSort}
    ```

=== "Rust"

    ```rust title="bubble_sort.rs"
    [class]{}-[func]{bubble_sort}
    ```

=== "C"

    ```c title="bubble_sort.c"
    [class]{}-[func]{bubbleSort}
    ```

=== "Kotlin"

    ```kotlin title="bubble_sort.kt"
    [class]{}-[func]{bubbleSort}
    ```

=== "Ruby"

    ```ruby title="bubble_sort.rb"
    [class]{}-[func]{bubble_sort}
    ```

=== "Zig"

    ```zig title="bubble_sort.zig"
    [class]{}-[func]{bubbleSort}
    ```

## 11.3.2 &nbsp; Efficiency optimization

If no swaps occur during a round of "bubbling," the array is already sorted, so we can return immediately. To detect this, we can add a `flag` variable; whenever no swaps are made in a pass, we set the flag and return early.

Even with this optimization, the worst time complexity and average time complexity of bubble sort remains $O(n^2)$. However, if the input array is already sorted, the best-case time complexity can be as low as $O(n)$.

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort_with_flag(nums: list[int]):
        """Bubble sort (optimized with flag)"""
        n = len(nums)
        # Outer loop: unsorted range is [0, i]
        for i in range(n - 1, 0, -1):
            flag = False  # Initialize flag
            # Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # Swap nums[j] and nums[j + 1]
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
                    flag = True  # Record swapped elements
            if not flag:
                break  # If no elements were swapped in this round of "bubbling", exit
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* Bubble sort (optimized with flag)*/
    void bubbleSortWithFlag(vector<int> &nums) {
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            bool flag = false; // Initialize flag
            // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    // Here, the std
                    swap(nums[j], nums[j + 1]);
                    flag = true; // Record swapped elements
                }
            }
            if (!flag)
                break; // If no elements were swapped in this round of "bubbling", exit
        }
    }
    ```

=== "Java"

    ```java title="bubble_sort.java"
    /* Bubble sort (optimized with flag) */
    void bubbleSortWithFlag(int[] nums) {
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // Initialize flag
            // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // Record swapped elements
                }
            }
            if (!flag)
                break; // If no elements were swapped in this round of "bubbling", exit
        }
    }
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    [class]{bubble_sort}-[func]{BubbleSortWithFlag}
    ```

=== "Go"

    ```go title="bubble_sort.go"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "TS"

    ```typescript title="bubble_sort.ts"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "Dart"

    ```dart title="bubble_sort.dart"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "Rust"

    ```rust title="bubble_sort.rs"
    [class]{}-[func]{bubble_sort_with_flag}
    ```

=== "C"

    ```c title="bubble_sort.c"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "Kotlin"

    ```kotlin title="bubble_sort.kt"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

=== "Ruby"

    ```ruby title="bubble_sort.rb"
    [class]{}-[func]{bubble_sort_with_flag}
    ```

=== "Zig"

    ```zig title="bubble_sort.zig"
    [class]{}-[func]{bubbleSortWithFlag}
    ```

## 11.3.3 &nbsp; Algorithm characteristics

- **Time complexity of $O(n^2)$, adaptive sorting.** Each round of "bubbling" traverses array segments of length $n - 1$, $n - 2$, $\dots$, $2$, $1$, which sums to $(n - 1) n / 2$. With a `flag` optimization, the best-case time complexity can reach $O(n)$ when the array is already sorted.
- **Space complexity of $O(1)$, in-place sorting.** Only a constant amount of extra space is used by pointers $i$ and $j$.
- **Stable sorting.** Because equal elements are not swapped during "bubbling," their original order is preserved, making this a stable sort.
