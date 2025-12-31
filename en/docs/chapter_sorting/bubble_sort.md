---
comments: true
---

# 11.3 &nbsp; Bubble Sort

<u>Bubble sort (bubble sort)</u> achieves sorting by continuously comparing and swapping adjacent elements. This process is like bubbles rising from the bottom to the top, hence the name bubble sort.

As shown in Figure 11-4, the bubbling process can be simulated using element swap operations: starting from the leftmost end of the array and traversing to the right, compare the size of adjacent elements, and if "left element > right element", swap them. After completing the traversal, the largest element will be moved to the rightmost end of the array.

=== "<1>"
    ![Simulating bubble using element swap operation](bubble_sort.assets/bubble_operation_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 11-4 &nbsp; Simulating bubble using element swap operation </p>

## 11.3.1 &nbsp; Algorithm Flow

Assume the array has length $n$. The steps of bubble sort are shown in Figure 11-5.

1. First, perform "bubbling" on $n$ elements, **swapping the largest element of the array to its correct position**.
2. Next, perform "bubbling" on the remaining $n - 1$ elements, **swapping the second largest element to its correct position**.
3. And so on. After $n - 1$ rounds of "bubbling", **the largest $n - 1$ elements have all been swapped to their correct positions**.
4. The only remaining element must be the smallest element, requiring no sorting, so the array sorting is complete.

![Bubble sort flow](bubble_sort.assets/bubble_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-5 &nbsp; Bubble sort flow </p>

Example code is as follows:

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort(nums: list[int]):
        """Bubble sort"""
        n = len(nums)
        # Outer loop: unsorted interval is [0, i]
        for i in range(n - 1, 0, -1):
            # Inner loop: swap the largest element in the unsorted interval [0, i] to the rightmost end of the interval
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
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    // Using std::swap() function here
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
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
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
    /* Bubble sort */
    void BubbleSort(int[] nums) {
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                }
            }
        }
    }
    ```

=== "Go"

    ```go title="bubble_sort.go"
    /* Bubble sort */
    func bubbleSort(nums []int) {
        // Outer loop: unsorted range is [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // Swap nums[j] and nums[j + 1]
                    nums[j], nums[j+1] = nums[j+1], nums[j]
                }
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    /* Bubble sort */
    func bubbleSort(nums: inout [Int]) {
        // Outer loop: unsorted range is [0, i]
        for i in nums.indices.dropFirst().reversed() {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // Swap nums[j] and nums[j + 1]
                    nums.swapAt(j, j + 1)
                }
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    /* Bubble sort */
    function bubbleSort(nums) {
        // Outer loop: unsorted range is [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "TS"

    ```typescript title="bubble_sort.ts"
    /* Bubble sort */
    function bubbleSort(nums: number[]): void {
        // Outer loop: unsorted range is [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                }
            }
        }
    }
    ```

=== "Dart"

    ```dart title="bubble_sort.dart"
    /* Bubble sort */
    void bubbleSort(List<int> nums) {
      // Outer loop: unsorted range is [0, i]
      for (int i = nums.length - 1; i > 0; i--) {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
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

=== "Rust"

    ```rust title="bubble_sort.rs"
    /* Bubble sort */
    fn bubble_sort(nums: &mut [i32]) {
        // Outer loop: unsorted range is [0, i]
        for i in (1..nums.len()).rev() {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // Swap nums[j] and nums[j + 1]
                    nums.swap(j, j + 1);
                }
            }
        }
    }
    ```

=== "C"

    ```c title="bubble_sort.c"
    /* Bubble sort */
    void bubbleSort(int nums[], int size) {
        // Outer loop: unsorted range is [0, i]
        for (int i = size - 1; i > 0; i--) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    int temp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = temp;
                }
            }
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bubble_sort.kt"
    /* Bubble sort */
    fun bubbleSort(nums: IntArray) {
        // Outer loop: unsorted range is [0, i]
        for (i in nums.size - 1 downTo 1) {
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                }
            }
        }
    }
    ```

=== "Ruby"

    ```ruby title="bubble_sort.rb"
    ### Bubble sort ###
    def bubble_sort(nums)
      n = nums.length
      # Outer loop: unsorted range is [0, i]
      for i in (n - 1).downto(1)
        # Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Swap nums[j] and nums[j + 1]
            nums[j], nums[j + 1] = nums[j + 1], nums[j]
          end
        end
      end
    end
    ```

## 11.3.2 &nbsp; Efficiency Optimization

We notice that if no swap operations are performed during a certain round of "bubbling", it means the array has already completed sorting and can directly return the result. Therefore, we can add a flag `flag` to monitor this situation and return immediately once it occurs.

After optimization, the worst-case time complexity and average time complexity of bubble sort remain $O(n^2)$; but when the input array is completely ordered, the best-case time complexity can reach $O(n)$.

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort_with_flag(nums: list[int]):
        """Bubble sort (flag optimization)"""
        n = len(nums)
        # Outer loop: unsorted interval is [0, i]
        for i in range(n - 1, 0, -1):
            flag = False  # Initialize flag
            # Inner loop: swap the largest element in the unsorted interval [0, i] to the rightmost end of the interval
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # Swap nums[j] and nums[j + 1]
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
                    flag = True  # Record element swap
            if not flag:
                break  # No elements were swapped in this round of "bubbling", exit directly
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* Bubble sort (flag optimization)*/
    void bubbleSortWithFlag(vector<int> &nums) {
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            bool flag = false; // Initialize flag
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    // Using std::swap() function here
                    swap(nums[j], nums[j + 1]);
                    flag = true; // Record element swap
                }
            }
            if (!flag)
                break; // No elements were swapped in this round of "bubbling", exit directly
        }
    }
    ```

=== "Java"

    ```java title="bubble_sort.java"
    /* Bubble sort (flag optimization) */
    void bubbleSortWithFlag(int[] nums) {
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // Initialize flag
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // Record element swap
                }
            }
            if (!flag)
                break; // No elements were swapped in this round of "bubbling", exit directly
        }
    }
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    /* Bubble sort (flag optimization) */
    void BubbleSortWithFlag(int[] nums) {
        // Outer loop: unsorted range is [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            bool flag = false; // Initialize flag
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    flag = true;  // Record element swap
                }
            }
            if (!flag) break;     // No elements were swapped in this round of "bubbling", exit directly
        }
    }
    ```

=== "Go"

    ```go title="bubble_sort.go"
    /* Bubble sort (flag optimization) */
    func bubbleSortWithFlag(nums []int) {
        // Outer loop: unsorted range is [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            flag := false // Initialize flag
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // Swap nums[j] and nums[j + 1]
                    nums[j], nums[j+1] = nums[j+1], nums[j]
                    flag = true // Record element swap
                }
            }
            if flag == false { // No elements were swapped in this round of "bubbling", exit directly
                break
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    /* Bubble sort (flag optimization) */
    func bubbleSortWithFlag(nums: inout [Int]) {
        // Outer loop: unsorted range is [0, i]
        for i in nums.indices.dropFirst().reversed() {
            var flag = false // Initialize flag
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // Swap nums[j] and nums[j + 1]
                    nums.swapAt(j, j + 1)
                    flag = true // Record element swap
                }
            }
            if !flag { // No elements were swapped in this round of "bubbling", exit directly
                break
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    /* Bubble sort (flag optimization) */
    function bubbleSortWithFlag(nums) {
        // Outer loop: unsorted range is [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            let flag = false; // Initialize flag
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // Record element swap
                }
            }
            if (!flag) break; // No elements were swapped in this round of "bubbling", exit directly
        }
    }
    ```

=== "TS"

    ```typescript title="bubble_sort.ts"
    /* Bubble sort (flag optimization) */
    function bubbleSortWithFlag(nums: number[]): void {
        // Outer loop: unsorted range is [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            let flag = false; // Initialize flag
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // Record element swap
                }
            }
            if (!flag) break; // No elements were swapped in this round of "bubbling", exit directly
        }
    }
    ```

=== "Dart"

    ```dart title="bubble_sort.dart"
    /* Bubble sort (flag optimization) */
    void bubbleSortWithFlag(List<int> nums) {
      // Outer loop: unsorted range is [0, i]
      for (int i = nums.length - 1; i > 0; i--) {
        bool flag = false; // Initialize flag
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for (int j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // Swap nums[j] and nums[j + 1]
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
            flag = true; // Record element swap
          }
        }
        if (!flag) break; // No elements were swapped in this round of "bubbling", exit directly
      }
    }
    ```

=== "Rust"

    ```rust title="bubble_sort.rs"
    /* Bubble sort (flag optimization) */
    fn bubble_sort_with_flag(nums: &mut [i32]) {
        // Outer loop: unsorted range is [0, i]
        for i in (1..nums.len()).rev() {
            let mut flag = false; // Initialize flag
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // Swap nums[j] and nums[j + 1]
                    nums.swap(j, j + 1);
                    flag = true; // Record element swap
                }
            }
            if !flag {
                break; // No elements were swapped in this round of "bubbling", exit directly
            };
        }
    }
    ```

=== "C"

    ```c title="bubble_sort.c"
    /* Bubble sort (flag optimization) */
    void bubbleSortWithFlag(int nums[], int size) {
        // Outer loop: unsorted range is [0, i]
        for (int i = size - 1; i > 0; i--) {
            bool flag = false;
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    int temp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = temp;
                    flag = true;
                }
            }
            if (!flag)
                break;
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="bubble_sort.kt"
    /* Bubble sort (flag optimization) */
    fun bubbleSortWithFlag(nums: IntArray) {
        // Outer loop: unsorted range is [0, i]
        for (i in nums.size - 1 downTo 1) {
            var flag = false // Initialize flag
            // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                    flag = true // Record element swap
                }
            }
            if (!flag) break // No elements were swapped in this round of "bubbling", exit directly
        }
    }
    ```

=== "Ruby"

    ```ruby title="bubble_sort.rb"
    ### Bubble sort (flag optimization) ###
    def bubble_sort_with_flag(nums)
      n = nums.length
      # Outer loop: unsorted range is [0, i]
      for i in (n - 1).downto(1)
        flag = false # Initialize flag

        # Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Swap nums[j] and nums[j + 1]
            nums[j], nums[j + 1] = nums[j + 1], nums[j]
            flag = true # Record element swap
          end
        end

        break unless flag # No elements were swapped in this round of "bubbling", exit directly
      end
    end
    ```

## 11.3.3 &nbsp; Algorithm Characteristics

- **Time complexity of $O(n^2)$, adaptive sorting**: The array lengths traversed in each round of "bubbling" are $n - 1$, $n - 2$, $\dots$, $2$, $1$, totaling $(n - 1) n / 2$. After introducing the `flag` optimization, the best-case time complexity can reach $O(n)$.
- **Space complexity of $O(1)$, in-place sorting**: Pointers $i$ and $j$ use a constant amount of extra space.
- **Stable sorting**: Since equal elements are not swapped during "bubbling".
