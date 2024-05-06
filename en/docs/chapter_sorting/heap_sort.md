---
comments: true
---

# 11.7 &nbsp; Heap sort

!!! tip

    Before reading this section, please make sure you have completed the "Heap" chapter.

<u>Heap sort</u> is an efficient sorting algorithm based on the heap data structure. We can implement heap sort using the "heap creation" and "element extraction" operations we have already learned.

1. Input the array and establish a min-heap, where the smallest element is at the heap's top.
2. Continuously perform the extraction operation, recording the extracted elements in sequence to obtain a sorted list from smallest to largest.

Although the above method is feasible, it requires an additional array to save the popped elements, which is somewhat space-consuming. In practice, we usually use a more elegant implementation.

## 11.7.1 &nbsp; Algorithm flow

Suppose the array length is $n$, the heap sort process is as follows.

1. Input the array and establish a max-heap. After completion, the largest element is at the heap's top.
2. Swap the top element of the heap (the first element) with the heap's bottom element (the last element). After the swap, reduce the heap's length by $1$ and increase the sorted elements count by $1$.
3. Starting from the heap top, perform the sift-down operation from top to bottom. After the sift-down, the heap's property is restored.
4. Repeat steps `2.` and `3.` Loop for $n - 1$ rounds to complete the sorting of the array.

!!! tip

    In fact, the element extraction operation also includes steps `2.` and `3.`, with the addition of a popping element step.

=== "<1>"
    ![Heap sort process](heap_sort.assets/heap_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![heap_sort_step2](heap_sort.assets/heap_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![heap_sort_step3](heap_sort.assets/heap_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![heap_sort_step4](heap_sort.assets/heap_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![heap_sort_step5](heap_sort.assets/heap_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![heap_sort_step6](heap_sort.assets/heap_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![heap_sort_step7](heap_sort.assets/heap_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![heap_sort_step8](heap_sort.assets/heap_sort_step8.png){ class="animation-figure" }

=== "<9>"
    ![heap_sort_step9](heap_sort.assets/heap_sort_step9.png){ class="animation-figure" }

=== "<10>"
    ![heap_sort_step10](heap_sort.assets/heap_sort_step10.png){ class="animation-figure" }

=== "<11>"
    ![heap_sort_step11](heap_sort.assets/heap_sort_step11.png){ class="animation-figure" }

=== "<12>"
    ![heap_sort_step12](heap_sort.assets/heap_sort_step12.png){ class="animation-figure" }

<p align="center"> Figure 11-12 &nbsp; Heap sort process </p>

In the code implementation, we used the sift-down function `sift_down()` from the "Heap" chapter. It is important to note that since the heap's length decreases as the maximum element is extracted, we need to add a length parameter $n$ to the `sift_down()` function to specify the current effective length of the heap. The code is shown below:

=== "Python"

    ```python title="heap_sort.py"
    def sift_down(nums: list[int], n: int, i: int):
        """Heap length is n, start heapifying node i, from top to bottom"""
        while True:
            # Determine the largest node among i, l, r, noted as ma
            l = 2 * i + 1
            r = 2 * i + 2
            ma = i
            if l < n and nums[l] > nums[ma]:
                ma = l
            if r < n and nums[r] > nums[ma]:
                ma = r
            # If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
            if ma == i:
                break
            # Swap two nodes
            nums[i], nums[ma] = nums[ma], nums[i]
            # Loop downwards heapification
            i = ma

    def heap_sort(nums: list[int]):
        """Heap sort"""
        # Build heap operation: heapify all nodes except leaves
        for i in range(len(nums) // 2 - 1, -1, -1):
            sift_down(nums, len(nums), i)
        # Extract the largest element from the heap and repeat for n-1 rounds
        for i in range(len(nums) - 1, 0, -1):
            # Swap the root node with the rightmost leaf node (swap the first element with the last element)
            nums[0], nums[i] = nums[i], nums[0]
            # Start heapifying the root node, from top to bottom
            sift_down(nums, i, 0)
    ```

=== "C++"

    ```cpp title="heap_sort.cpp"
    /* Heap length is n, start heapifying node i, from top to bottom */
    void siftDown(vector<int> &nums, int n, int i) {
        while (true) {
            // Determine the largest node among i, l, r, noted as ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
            if (ma == i) {
                break;
            }
            // Swap two nodes
            swap(nums[i], nums[ma]);
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Heap sort */
    void heapSort(vector<int> &nums) {
        // Build heap operation: heapify all nodes except leaves
        for (int i = nums.size() / 2 - 1; i >= 0; --i) {
            siftDown(nums, nums.size(), i);
        }
        // Extract the largest element from the heap and repeat for n-1 rounds
        for (int i = nums.size() - 1; i > 0; --i) {
            // Swap the root node with the rightmost leaf node (swap the first element with the last element)
            swap(nums[0], nums[i]);
            // Start heapifying the root node, from top to bottom
            siftDown(nums, i, 0);
        }
    }
    ```

=== "Java"

    ```java title="heap_sort.java"
    /* Heap length is n, start heapifying node i, from top to bottom */
    void siftDown(int[] nums, int n, int i) {
        while (true) {
            // Determine the largest node among i, l, r, noted as ma
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // If node i is the largest or indices l, r are out of bounds, no further heapification needed, break
            if (ma == i)
                break;
            // Swap two nodes
            int temp = nums[i];
            nums[i] = nums[ma];
            nums[ma] = temp;
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Heap sort */
    void heapSort(int[] nums) {
        // Build heap operation: heapify all nodes except leaves
        for (int i = nums.length / 2 - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // Extract the largest element from the heap and repeat for n-1 rounds
        for (int i = nums.length - 1; i > 0; i--) {
            // Swap the root node with the rightmost leaf node (swap the first element with the last element)
            int tmp = nums[0];
            nums[0] = nums[i];
            nums[i] = tmp;
            // Start heapifying the root node, from top to bottom
            siftDown(nums, i, 0);
        }
    }
    ```

=== "C#"

    ```csharp title="heap_sort.cs"
    [class]{heap_sort}-[func]{SiftDown}

    [class]{heap_sort}-[func]{HeapSort}
    ```

=== "Go"

    ```go title="heap_sort.go"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "Swift"

    ```swift title="heap_sort.swift"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "JS"

    ```javascript title="heap_sort.js"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "TS"

    ```typescript title="heap_sort.ts"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "Dart"

    ```dart title="heap_sort.dart"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "Rust"

    ```rust title="heap_sort.rs"
    [class]{}-[func]{sift_down}

    [class]{}-[func]{heap_sort}
    ```

=== "C"

    ```c title="heap_sort.c"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "Kotlin"

    ```kotlin title="heap_sort.kt"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "Ruby"

    ```ruby title="heap_sort.rb"
    [class]{}-[func]{sift_down}

    [class]{}-[func]{heap_sort}
    ```

=== "Zig"

    ```zig title="heap_sort.zig"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

## 11.7.2 &nbsp; Algorithm characteristics

- **Time complexity is $O(n \log n)$, non-adaptive sort**: The heap creation uses $O(n)$ time. Extracting the largest element from the heap takes $O(\log n)$ time, looping for $n - 1$ rounds.
- **Space complexity is $O(1)$, in-place sort**: A few pointer variables use $O(1)$ space. The element swapping and heapifying operations are performed on the original array.
- **Non-stable sort**: The relative positions of equal elements may change during the swapping of the heap's top and bottom elements.
