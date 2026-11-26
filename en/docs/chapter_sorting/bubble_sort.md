---
comments: true
---

# 11.3 &nbsp; Bubble sort

<u>Bubble sort</u> sorts elements by repeatedly comparing and swapping adjacent pairs. The way elements move resembles bubbles rising from the bottom to the surface, hence the name.

Figure 11-4 shows how swaps simulate this movement. Start at the left end of the array and work to the right, comparing each pair of neighbors. If the left element is greater than the right, swap them. By the end of the pass, the largest element has moved to the right end of the array.

=== "<1>"
    ![Simulating bubbles rising with adjacent swaps](bubble_sort.assets/bubble_operation_step1.svg){ class="animation-figure" }

=== "<2>"
    ![bubble_operation_step2](bubble_sort.assets/bubble_operation_step2.svg){ class="animation-figure" }

=== "<3>"
    ![bubble_operation_step3](bubble_sort.assets/bubble_operation_step3.svg){ class="animation-figure" }

=== "<4>"
    ![bubble_operation_step4](bubble_sort.assets/bubble_operation_step4.svg){ class="animation-figure" }

=== "<5>"
    ![bubble_operation_step5](bubble_sort.assets/bubble_operation_step5.svg){ class="animation-figure" }

=== "<6>"
    ![bubble_operation_step6](bubble_sort.assets/bubble_operation_step6.svg){ class="animation-figure" }

=== "<7>"
    ![bubble_operation_step7](bubble_sort.assets/bubble_operation_step7.svg){ class="animation-figure" }

<p align="center"> Figure 11-4 &nbsp; Simulating bubbles rising with adjacent swaps </p>

## 11.3.1 &nbsp; How the algorithm works

For an array of length $n$, bubble sort proceeds as shown below.

1. First, make a pass over all $n$ elements to **move the largest element into its final position**.
2. Next, make a pass over the remaining $n - 1$ elements to **move the second-largest element into its final position**.
3. Continue in this way. After $n - 1$ passes, **the largest $n - 1$ elements are in their final positions**.
4. The one remaining element must be the smallest. It is already in place, so the entire array is sorted.

![Bubble sort procedure](bubble_sort.assets/bubble_sort_overview.svg){ class="animation-figure" }

<p align="center"> Figure 11-5 &nbsp; Bubble sort procedure </p>

Here is an implementation:

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort(nums: list[int]):
        """Bubble sort"""
        n = len(nums)
        # Outer loop: the unsorted range is [0, i]
        for i in range(n - 1, 0, -1):
            # Inner loop: swap the largest element in [0, i] to the right end of the range
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # Swap nums[j] and nums[j + 1]
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* Bubble sort */
    void bubbleSort(vector<int> &nums) {
        // Outer loop: the unsorted range is [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            // Inner loop: swap the largest element in [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    // Use the std::swap() function
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
        // Outer loop: the unsorted range is [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in [0, i] to the right end of the range
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
        // Outer loop: the unsorted range is [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in [0, i] to the right end of the range
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
        // Outer loop: the unsorted range is [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            // Inner loop: swap the largest element in [0, i] to the right end of the range
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
        // Outer loop: the unsorted range is [0, i]
        for i in nums.indices.dropFirst().reversed() {
            // Inner loop: swap the largest element in [0, i] to the right end of the range
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
        // Outer loop: the unsorted range is [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in [0, i] to the right end of the range
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
        // Outer loop: the unsorted range is [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            // Inner loop: swap the largest element in [0, i] to the right end of the range
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
      // Outer loop: the unsorted range is [0, i]
      for (int i = nums.length - 1; i > 0; i--) {
        // Inner loop: swap the largest element in [0, i] to the right end of the range
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
        // Outer loop: the unsorted range is [0, i]
        for i in (1..nums.len()).rev() {
            // Inner loop: swap the largest element in [0, i] to the right end of the range
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
        // Outer loop: the unsorted range is [0, i]
        for (int i = size - 1; i > 0; i--) {
            // Inner loop: swap the largest element in [0, i] to the right end of the range
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
        // Outer loop: the unsorted range is [0, i]
        for (i in nums.size - 1 downTo 1) {
            // Inner loop: swap the largest element in [0, i] to the right end of the range
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
      # Outer loop: the unsorted range is [0, i]
      for i in (n - 1).downto(1)
        # Inner loop: swap the largest element in [0, i] to the right end of the range
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Swap nums[j] and nums[j + 1]
            nums[j], nums[j + 1] = nums[j + 1], nums[j]
          end
        end
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 477px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Bubble%20sort%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20unsorted%20range%20is%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20swap%20the%20largest%20element%20in%20%5B0,%20i%5D%20to%20the%20right%20end%20of%20the%20range%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Swap%20nums%5Bj%5D%20and%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D,%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D,%20nums%5Bj%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22After%20bubble%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Bubble%20sort%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20unsorted%20range%20is%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20swap%20the%20largest%20element%20in%20%5B0,%20i%5D%20to%20the%20right%20end%20of%20the%20range%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Swap%20nums%5Bj%5D%20and%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D,%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D,%20nums%5Bj%5D%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20bubble_sort%28nums%29%0A%20%20%20%20print%28%22After%20bubble%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 11.3.2 &nbsp; Improving efficiency

If a pass makes no swaps, the array is already sorted and we can return it immediately. We can use a flag, `flag`, to detect this condition and stop as soon as it occurs.

With this optimization, the worst-case and average time complexities are still $O(n^2)$. A fully sorted input achieves the best-case time complexity of $O(n)$.

=== "Python"

    ```python title="bubble_sort.py"
    def bubble_sort_with_flag(nums: list[int]):
        """Bubble sort with an early-exit flag"""
        n = len(nums)
        # Outer loop: the unsorted range is [0, i]
        for i in range(n - 1, 0, -1):
            flag = False  # Initialize the flag
            # Inner loop: swap the largest element in [0, i] to the right end of the range
            for j in range(i):
                if nums[j] > nums[j + 1]:
                    # Swap nums[j] and nums[j + 1]
                    nums[j], nums[j + 1] = nums[j + 1], nums[j]
                    flag = True  # Record that a swap occurred
            if not flag:
                break  # Stop if this pass made no swaps
    ```

=== "C++"

    ```cpp title="bubble_sort.cpp"
    /* Bubble sort with an early-exit flag*/
    void bubbleSortWithFlag(vector<int> &nums) {
        // Outer loop: the unsorted range is [0, i]
        for (int i = nums.size() - 1; i > 0; i--) {
            bool flag = false; // Initialize the flag
            // Inner loop: swap the largest element in [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    // Use the std::swap() function
                    swap(nums[j], nums[j + 1]);
                    flag = true; // Record that a swap occurred
                }
            }
            if (!flag)
                break; // Stop if this pass made no swaps
        }
    }
    ```

=== "Java"

    ```java title="bubble_sort.java"
    /* Bubble sort with an early-exit flag */
    void bubbleSortWithFlag(int[] nums) {
        // Outer loop: the unsorted range is [0, i]
        for (int i = nums.length - 1; i > 0; i--) {
            boolean flag = false; // Initialize the flag
            // Inner loop: swap the largest element in [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    int tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // Record that a swap occurred
                }
            }
            if (!flag)
                break; // Stop if this pass made no swaps
        }
    }
    ```

=== "C#"

    ```csharp title="bubble_sort.cs"
    /* Bubble sort with an early-exit flag*/
    void BubbleSortWithFlag(int[] nums) {
        // Outer loop: the unsorted range is [0, i]
        for (int i = nums.Length - 1; i > 0; i--) {
            bool flag = false; // Initialize the flag
            // Inner loop: swap the largest element in [0, i] to the right end of the range
            for (int j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    (nums[j + 1], nums[j]) = (nums[j], nums[j + 1]);
                    flag = true;  // Record that a swap occurred
                }
            }
            if (!flag) break;     // Stop if this pass made no swaps
        }
    }
    ```

=== "Go"

    ```go title="bubble_sort.go"
    /* Bubble sort with an early-exit flag*/
    func bubbleSortWithFlag(nums []int) {
        // Outer loop: the unsorted range is [0, i]
        for i := len(nums) - 1; i > 0; i-- {
            flag := false // Initialize the flag
            // Inner loop: swap the largest element in [0, i] to the right end of the range
            for j := 0; j < i; j++ {
                if nums[j] > nums[j+1] {
                    // Swap nums[j] and nums[j + 1]
                    nums[j], nums[j+1] = nums[j+1], nums[j]
                    flag = true // Record that a swap occurred
                }
            }
            if flag == false { // Stop if this pass made no swaps
                break
            }
        }
    }
    ```

=== "Swift"

    ```swift title="bubble_sort.swift"
    /* Bubble sort with an early-exit flag*/
    func bubbleSortWithFlag(nums: inout [Int]) {
        // Outer loop: the unsorted range is [0, i]
        for i in nums.indices.dropFirst().reversed() {
            var flag = false // Initialize the flag
            for j in 0 ..< i {
                if nums[j] > nums[j + 1] {
                    // Swap nums[j] and nums[j + 1]
                    nums.swapAt(j, j + 1)
                    flag = true // Record that a swap occurred
                }
            }
            if !flag { // Stop if this pass made no swaps
                break
            }
        }
    }
    ```

=== "JS"

    ```javascript title="bubble_sort.js"
    /* Bubble sort with an early-exit flag*/
    function bubbleSortWithFlag(nums) {
        // Outer loop: the unsorted range is [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            let flag = false; // Initialize the flag
            // Inner loop: swap the largest element in [0, i] to the right end of the range
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // Record that a swap occurred
                }
            }
            if (!flag) break; // Stop if this pass made no swaps
        }
    }
    ```

=== "TS"

    ```typescript title="bubble_sort.ts"
    /* Bubble sort with an early-exit flag*/
    function bubbleSortWithFlag(nums: number[]): void {
        // Outer loop: the unsorted range is [0, i]
        for (let i = nums.length - 1; i > 0; i--) {
            let flag = false; // Initialize the flag
            // Inner loop: swap the largest element in [0, i] to the right end of the range
            for (let j = 0; j < i; j++) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    let tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    flag = true; // Record that a swap occurred
                }
            }
            if (!flag) break; // Stop if this pass made no swaps
        }
    }
    ```

=== "Dart"

    ```dart title="bubble_sort.dart"
    /* Bubble sort with an early-exit flag*/
    void bubbleSortWithFlag(List<int> nums) {
      // Outer loop: the unsorted range is [0, i]
      for (int i = nums.length - 1; i > 0; i--) {
        bool flag = false; // Initialize the flag
        // Inner loop: swap the largest element in [0, i] to the right end of the range
        for (int j = 0; j < i; j++) {
          if (nums[j] > nums[j + 1]) {
            // Swap nums[j] and nums[j + 1]
            int tmp = nums[j];
            nums[j] = nums[j + 1];
            nums[j + 1] = tmp;
            flag = true; // Record that a swap occurred
          }
        }
        if (!flag) break; // Stop if this pass made no swaps
      }
    }
    ```

=== "Rust"

    ```rust title="bubble_sort.rs"
    /* Bubble sort with an early-exit flag */
    fn bubble_sort_with_flag(nums: &mut [i32]) {
        // Outer loop: the unsorted range is [0, i]
        for i in (1..nums.len()).rev() {
            let mut flag = false; // Initialize the flag
            // Inner loop: swap the largest element in [0, i] to the right end of the range
            for j in 0..i {
                if nums[j] > nums[j + 1] {
                    // Swap nums[j] and nums[j + 1]
                    nums.swap(j, j + 1);
                    flag = true; // Record that a swap occurred
                }
            }
            if !flag {
                break; // Stop if this pass made no swaps
            };
        }
    }
    ```

=== "C"

    ```c title="bubble_sort.c"
    /* Bubble sort with an early-exit flag*/
    void bubbleSortWithFlag(int nums[], int size) {
        // Outer loop: the unsorted range is [0, i]
        for (int i = size - 1; i > 0; i--) {
            bool flag = false;
            // Inner loop: swap the largest element in [0, i] to the right end of the range
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
    /* Bubble sort with an early-exit flag */
    fun bubbleSortWithFlag(nums: IntArray) {
        // Outer loop: the unsorted range is [0, i]
        for (i in nums.size - 1 downTo 1) {
            var flag = false // Initialize the flag
            // Inner loop: swap the largest element in [0, i] to the right end of the range
            for (j in 0..<i) {
                if (nums[j] > nums[j + 1]) {
                    // Swap nums[j] and nums[j + 1]
                    val temp = nums[j]
                    nums[j] = nums[j + 1]
                    nums[j + 1] = temp
                    flag = true // Record that a swap occurred
                }
            }
            if (!flag) break // Stop if this pass made no swaps
        }
    }
    ```

=== "Ruby"

    ```ruby title="bubble_sort.rb"
    ### Bubble sort with an early-exit flag###
    def bubble_sort_with_flag(nums)
      n = nums.length
      # Outer loop: the unsorted range is [0, i]
      for i in (n - 1).downto(1)
        flag = false # Initialize the flag

        # Inner loop: swap the largest element in [0, i] to the right end of the range
        for j in 0...i
          if nums[j] > nums[j + 1]
            # Swap nums[j] and nums[j + 1]
            nums[j], nums[j + 1] = nums[j + 1], nums[j]
            flag = true # Record that a swap occurred
          end
        end

        break unless flag # Stop if this pass made no swaps
      end
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort_with_flag%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Bubble%20sort%20with%20an%20early-exit%20flag%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20unsorted%20range%20is%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20flag%20%3D%20False%20%20%23%20Initialize%20the%20flag%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20swap%20the%20largest%20element%20in%20%5B0,%20i%5D%20to%20the%20right%20end%20of%20the%20range%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Swap%20nums%5Bj%5D%20and%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D,%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D,%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20flag%20%3D%20True%20%20%23%20Record%20that%20a%20swap%20occurred%0A%20%20%20%20%20%20%20%20if%20not%20flag%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%20%20%23%20Stop%20if%20this%20pass%20made%20no%20swaps%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20bubble_sort_with_flag%28nums%29%0A%20%20%20%20print%28%22After%20bubble%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20bubble_sort_with_flag%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22Bubble%20sort%20with%20an%20early-exit%20flag%22%22%22%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%20Outer%20loop%3A%20the%20unsorted%20range%20is%20%5B0,%20i%5D%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20flag%20%3D%20False%20%20%23%20Initialize%20the%20flag%0A%20%20%20%20%20%20%20%20%23%20Inner%20loop%3A%20swap%20the%20largest%20element%20in%20%5B0,%20i%5D%20to%20the%20right%20end%20of%20the%20range%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%28i%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20if%20nums%5Bj%5D%20%3E%20nums%5Bj%20%2B%201%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%23%20Swap%20nums%5Bj%5D%20and%20nums%5Bj%20%2B%201%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20nums%5Bj%5D,%20nums%5Bj%20%2B%201%5D%20%3D%20nums%5Bj%20%2B%201%5D,%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20%20flag%20%3D%20True%20%20%23%20Record%20that%20a%20swap%20occurred%0A%20%20%20%20%20%20%20%20if%20not%20flag%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20break%20%20%23%20Stop%20if%20this%20pass%20made%20no%20swaps%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B4,%201,%203,%201,%205,%202%5D%0A%20%20%20%20bubble_sort_with_flag%28nums%29%0A%20%20%20%20print%28%22After%20bubble%20sort,%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

## 11.3.3 &nbsp; Algorithm properties

- **Time complexity: $O(n^2)$, adaptive**. The successive passes scan ranges of length $n - 1$, $n - 2$, $\dots$, $2$, and $1$, for a total of $(n - 1) n / 2$. With the `flag` optimization, the best-case time complexity is $O(n)$.
- **Space complexity: $O(1)$, in-place**. The two indices $i$ and $j$ use a constant amount of extra space.
- **Stable**. A bubble sort pass never swaps two equal elements.
