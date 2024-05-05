---
comments: true
---

# 11.2 &nbsp; Selection sort

<u>Selection sort</u> works on a very simple principle: it starts a loop where each iteration selects the smallest element from the unsorted interval and moves it to the end of the sorted interval.

Suppose the length of the array is $n$, the algorithm flow of selection sort is as shown in Figure 11-2.

1. Initially, all elements are unsorted, i.e., the unsorted (index) interval is $[0, n-1]$.
2. Select the smallest element in the interval $[0, n-1]$ and swap it with the element at index $0$. After this, the first element of the array is sorted.
3. Select the smallest element in the interval $[1, n-1]$ and swap it with the element at index $1$. After this, the first two elements of the array are sorted.
4. Continue in this manner. After $n - 1$ rounds of selection and swapping, the first $n - 1$ elements are sorted.
5. The only remaining element is necessarily the largest element and does not need sorting, thus the array is sorted.

=== "<1>"
    ![Selection sort process](selection_sort.assets/selection_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![selection_sort_step2](selection_sort.assets/selection_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![selection_sort_step3](selection_sort.assets/selection_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![selection_sort_step4](selection_sort.assets/selection_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![selection_sort_step5](selection_sort.assets/selection_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![selection_sort_step6](selection_sort.assets/selection_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![selection_sort_step7](selection_sort.assets/selection_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![selection_sort_step8](selection_sort.assets/selection_sort_step8.png){ class="animation-figure" }

=== "<9>"
    ![selection_sort_step9](selection_sort.assets/selection_sort_step9.png){ class="animation-figure" }

=== "<10>"
    ![selection_sort_step10](selection_sort.assets/selection_sort_step10.png){ class="animation-figure" }

=== "<11>"
    ![selection_sort_step11](selection_sort.assets/selection_sort_step11.png){ class="animation-figure" }

<p align="center"> Figure 11-2 &nbsp; Selection sort process </p>

In the code, we use $k$ to record the smallest element within the unsorted interval:

=== "Python"

    ```python title="selection_sort.py"
    def selection_sort(nums: list[int]):
        """Selection sort"""
        n = len(nums)
        # Outer loop: unsorted range is [i, n-1]
        for i in range(n - 1):
            # Inner loop: find the smallest element within the unsorted range
            k = i
            for j in range(i + 1, n):
                if nums[j] < nums[k]:
                    k = j  # Record the index of the smallest element
            # Swap the smallest element with the first element of the unsorted range
            nums[i], nums[k] = nums[k], nums[i]
    ```

=== "C++"

    ```cpp title="selection_sort.cpp"
    [class]{}-[func]{selectionSort}
    ```

=== "Java"

    ```java title="selection_sort.java"
    /* Selection sort */
    void selectionSort(int[] nums) {
        int n = nums.length;
        // Outer loop: unsorted range is [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element within the unsorted range
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // Record the index of the smallest element
            }
            // Swap the smallest element with the first element of the unsorted range
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }
    ```

=== "C#"

    ```csharp title="selection_sort.cs"
    [class]{selection_sort}-[func]{SelectionSort}
    ```

=== "Go"

    ```go title="selection_sort.go"
    [class]{}-[func]{selectionSort}
    ```

=== "Swift"

    ```swift title="selection_sort.swift"
    [class]{}-[func]{selectionSort}
    ```

=== "JS"

    ```javascript title="selection_sort.js"
    [class]{}-[func]{selectionSort}
    ```

=== "TS"

    ```typescript title="selection_sort.ts"
    [class]{}-[func]{selectionSort}
    ```

=== "Dart"

    ```dart title="selection_sort.dart"
    [class]{}-[func]{selectionSort}
    ```

=== "Rust"

    ```rust title="selection_sort.rs"
    [class]{}-[func]{selection_sort}
    ```

=== "C"

    ```c title="selection_sort.c"
    [class]{}-[func]{selectionSort}
    ```

=== "Kotlin"

    ```kotlin title="selection_sort.kt"
    [class]{}-[func]{selectionSort}
    ```

=== "Ruby"

    ```ruby title="selection_sort.rb"
    [class]{}-[func]{selection_sort}
    ```

=== "Zig"

    ```zig title="selection_sort.zig"
    [class]{}-[func]{selectionSort}
    ```

## 11.2.1 &nbsp; Algorithm characteristics

- **Time complexity of $O(n^2)$, non-adaptive sort**: There are $n - 1$ rounds in the outer loop, with the unsorted interval length starting at $n$ in the first round and decreasing to $2$ in the last round, i.e., the outer loops contain $n$, $n - 1$, $\dots$, $3$, $2$ inner loops respectively, summing up to $\frac{(n - 1)(n + 2)}{2}$.
- **Space complexity of $O(1)$, in-place sort**: Uses constant extra space with pointers $i$ and $j$.
- **Non-stable sort**: As shown in Figure 11-3, an element `nums[i]` may be swapped to the right of an equal element, causing their relative order to change.

![Selection sort instability example](selection_sort.assets/selection_sort_instability.png){ class="animation-figure" }

<p align="center"> Figure 11-3 &nbsp; Selection sort instability example </p>
