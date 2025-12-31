---
comments: true
---

# 11.2 &nbsp; Selection Sort

<u>Selection sort (selection sort)</u> works very simply: it opens a loop, and in each round, selects the smallest element from the unsorted interval and places it at the end of the sorted interval.

Assume the array has length $n$. The algorithm flow of selection sort is shown in Figure 11-2.

1. Initially, all elements are unsorted, i.e., the unsorted (index) interval is $[0, n-1]$.
2. Select the smallest element in the interval $[0, n-1]$ and swap it with the element at index $0$. After completion, the first element of the array is sorted.
3. Select the smallest element in the interval $[1, n-1]$ and swap it with the element at index $1$. After completion, the first 2 elements of the array are sorted.
4. And so on. After $n - 1$ rounds of selection and swapping, the first $n - 1$ elements of the array are sorted.
5. The only remaining element must be the largest element, requiring no sorting, so the array sorting is complete.

=== "<1>"
    ![Selection sort steps](selection_sort.assets/selection_sort_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 11-2 &nbsp; Selection sort steps </p>

In the code, we use $k$ to record the smallest element within the unsorted interval:

=== "Python"

    ```python title="selection_sort.py"
    def selection_sort(nums: list[int]):
        """Selection sort"""
        n = len(nums)
        # Outer loop: unsorted interval is [i, n-1]
        for i in range(n - 1):
            # Inner loop: find the smallest element within the unsorted interval
            k = i
            for j in range(i + 1, n):
                if nums[j] < nums[k]:
                    k = j  # Record the index of the smallest element
            # Swap the smallest element with the first element of the unsorted interval
            nums[i], nums[k] = nums[k], nums[i]
    ```

=== "C++"

    ```cpp title="selection_sort.cpp"
    /* Selection sort */
    void selectionSort(vector<int> &nums) {
        int n = nums.size();
        // Outer loop: unsorted interval is [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element within the unsorted interval
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // Record the index of the smallest element
            }
            // Swap the smallest element with the first element of the unsorted interval
            swap(nums[i], nums[k]);
        }
    }
    ```

=== "Java"

    ```java title="selection_sort.java"
    /* Selection sort */
    void selectionSort(int[] nums) {
        int n = nums.length;
        // Outer loop: unsorted interval is [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element within the unsorted interval
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // Record the index of the smallest element
            }
            // Swap the smallest element with the first element of the unsorted interval
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }
    ```

=== "C#"

    ```csharp title="selection_sort.cs"
    /* Selection sort */
    void SelectionSort(int[] nums) {
        int n = nums.Length;
        // Outer loop: unsorted interval is [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element within the unsorted interval
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // Record the index of the smallest element
            }
            // Swap the smallest element with the first element of the unsorted interval
            (nums[k], nums[i]) = (nums[i], nums[k]);
        }
    }
    ```

=== "Go"

    ```go title="selection_sort.go"
    /* Selection sort */
    func selectionSort(nums []int) {
        n := len(nums)
        // Outer loop: unsorted interval is [i, n-1]
        for i := 0; i < n-1; i++ {
            // Inner loop: find the smallest element within the unsorted interval
            k := i
            for j := i + 1; j < n; j++ {
                if nums[j] < nums[k] {
                    // Record the index of the smallest element
                    k = j
                }
            }
            // Swap the smallest element with the first element of the unsorted interval
            nums[i], nums[k] = nums[k], nums[i]

        }
    }
    ```

=== "Swift"

    ```swift title="selection_sort.swift"
    /* Selection sort */
    func selectionSort(nums: inout [Int]) {
        // Outer loop: unsorted interval is [i, n-1]
        for i in nums.indices.dropLast() {
            // Inner loop: find the smallest element within the unsorted interval
            var k = i
            for j in nums.indices.dropFirst(i + 1) {
                if nums[j] < nums[k] {
                    k = j // Record the index of the smallest element
                }
            }
            // Swap the smallest element with the first element of the unsorted interval
            nums.swapAt(i, k)
        }
    }
    ```

=== "JS"

    ```javascript title="selection_sort.js"
    /* Selection sort */
    function selectionSort(nums) {
        let n = nums.length;
        // Outer loop: unsorted interval is [i, n-1]
        for (let i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element within the unsorted interval
            let k = i;
            for (let j = i + 1; j < n; j++) {
                if (nums[j] < nums[k]) {
                    k = j; // Record the index of the smallest element
                }
            }
            // Swap the smallest element with the first element of the unsorted interval
            [nums[i], nums[k]] = [nums[k], nums[i]];
        }
    }
    ```

=== "TS"

    ```typescript title="selection_sort.ts"
    /* Selection sort */
    function selectionSort(nums: number[]): void {
        let n = nums.length;
        // Outer loop: unsorted interval is [i, n-1]
        for (let i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element within the unsorted interval
            let k = i;
            for (let j = i + 1; j < n; j++) {
                if (nums[j] < nums[k]) {
                    k = j; // Record the index of the smallest element
                }
            }
            // Swap the smallest element with the first element of the unsorted interval
            [nums[i], nums[k]] = [nums[k], nums[i]];
        }
    }
    ```

=== "Dart"

    ```dart title="selection_sort.dart"
    /* Selection sort */
    void selectionSort(List<int> nums) {
      int n = nums.length;
      // Outer loop: unsorted interval is [i, n-1]
      for (int i = 0; i < n - 1; i++) {
        // Inner loop: find the smallest element within the unsorted interval
        int k = i;
        for (int j = i + 1; j < n; j++) {
          if (nums[j] < nums[k]) k = j; // Record the index of the smallest element
        }
        // Swap the smallest element with the first element of the unsorted interval
        int temp = nums[i];
        nums[i] = nums[k];
        nums[k] = temp;
      }
    }
    ```

=== "Rust"

    ```rust title="selection_sort.rs"
    /* Selection sort */
    fn selection_sort(nums: &mut [i32]) {
        if nums.is_empty() {
            return;
        }
        let n = nums.len();
        // Outer loop: unsorted interval is [i, n-1]
        for i in 0..n - 1 {
            // Inner loop: find the smallest element within the unsorted interval
            let mut k = i;
            for j in i + 1..n {
                if nums[j] < nums[k] {
                    k = j; // Record the index of the smallest element
                }
            }
            // Swap the smallest element with the first element of the unsorted interval
            nums.swap(i, k);
        }
    }
    ```

=== "C"

    ```c title="selection_sort.c"
    /* Selection sort */
    void selectionSort(int nums[], int n) {
        // Outer loop: unsorted interval is [i, n-1]
        for (int i = 0; i < n - 1; i++) {
            // Inner loop: find the smallest element within the unsorted interval
            int k = i;
            for (int j = i + 1; j < n; j++) {
                if (nums[j] < nums[k])
                    k = j; // Record the index of the smallest element
            }
            // Swap the smallest element with the first element of the unsorted interval
            int temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="selection_sort.kt"
    /* Selection sort */
    fun selectionSort(nums: IntArray) {
        val n = nums.size
        // Outer loop: unsorted interval is [i, n-1]
        for (i in 0..<n - 1) {
            var k = i
            // Inner loop: find the smallest element within the unsorted interval
            for (j in i + 1..<n) {
                if (nums[j] < nums[k])
                    k = j // Record the index of the smallest element
            }
            // Swap the smallest element with the first element of the unsorted interval
            val temp = nums[i]
            nums[i] = nums[k]
            nums[k] = temp
        }
    }
    ```

=== "Ruby"

    ```ruby title="selection_sort.rb"
    ### Selection sort ###
    def selection_sort(nums)
      n = nums.length
      # Outer loop: unsorted interval is [i, n-1]
      for i in 0...(n - 1)
        # Inner loop: find the smallest element within the unsorted interval
        k = i
        for j in (i + 1)...n
          if nums[j] < nums[k]
            k = j # Record the index of the smallest element
          end
        end
        # Swap the smallest element with the first element of the unsorted interval
        nums[i], nums[k] = nums[k], nums[i]
      end
    end
    ```

## 11.2.1 &nbsp; Algorithm Characteristics

- **Time complexity of $O(n^2)$, non-adaptive sorting**: The outer loop has $n - 1$ rounds in total. The length of the unsorted interval in the first round is $n$, and the length of the unsorted interval in the last round is $2$. That is, each round of the outer loop contains $n$, $n - 1$, $\dots$, $3$, $2$ inner loop iterations, summing to $\frac{(n - 1)(n + 2)}{2}$.
- **Space complexity of $O(1)$, in-place sorting**: Pointers $i$ and $j$ use a constant amount of extra space.
- **Non-stable sorting**: As shown in Figure 11-3, element `nums[i]` may be swapped to the right of an element equal to it, causing a change in their relative order.

![Selection sort non-stability example](selection_sort.assets/selection_sort_instability.png){ class="animation-figure" }

<p align="center"> Figure 11-3 &nbsp; Selection sort non-stability example </p>
