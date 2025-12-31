---
comments: true
---

# 11.7 &nbsp; Heap Sort

!!! tip

    Before reading this section, please ensure you have completed the "Heap" chapter.

<u>Heap sort (heap sort)</u> is an efficient sorting algorithm based on the heap data structure. We can use the "build heap operation" and "element out-heap operation" that we have already learned to implement heap sort.

1. Input the array and build a min-heap, at which point the smallest element is at the heap top.
2. Continuously perform the out-heap operation, record the out-heap elements in sequence, and an ascending sorted sequence can be obtained.

Although the above method is feasible, it requires an additional array to save the popped elements, which is quite wasteful of space. In practice, we usually use a more elegant implementation method.

## 11.7.1 &nbsp; Algorithm Flow

Assume the array length is $n$. The flow of heap sort is shown in Figure 11-12.

1. Input the array and build a max-heap. After completion, the largest element is at the heap top.
2. Swap the heap top element (first element) with the heap bottom element (last element). After the swap is complete, reduce the heap length by $1$ and increase the count of sorted elements by $1$.
3. Starting from the heap top element, perform top-to-bottom heapify operation (sift down). After heapify is complete, the heap property is restored.
4. Loop through steps `2.` and `3.` After looping $n - 1$ rounds, the array sorting can be completed.

!!! tip

    In fact, the element out-heap operation also includes steps `2.` and `3.`, with just an additional step to pop the element.

=== "<1>"
    ![Heap sort steps](heap_sort.assets/heap_sort_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 11-12 &nbsp; Heap sort steps </p>

In the code implementation, we use the same top-to-bottom heapify function `sift_down()` from the "Heap" chapter. It is worth noting that since the heap length will decrease as the largest element is extracted, we need to add a length parameter $n$ to the `sift_down()` function to specify the current effective length of the heap. The code is as follows:

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
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // Swap two nodes
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
            // Delete node
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
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // Swap two nodes
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
            // Delete node
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
    /* Heap length is n, start heapifying node i, from top to bottom */
    void SiftDown(int[] nums, int n, int i) {
        while (true) {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // Swap two nodes
            if (ma == i)
                break;
            // Swap two nodes
            (nums[ma], nums[i]) = (nums[i], nums[ma]);
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Heap sort */
    void HeapSort(int[] nums) {
        // Build heap operation: heapify all nodes except leaves
        for (int i = nums.Length / 2 - 1; i >= 0; i--) {
            SiftDown(nums, nums.Length, i);
        }
        // Extract the largest element from the heap and repeat for n-1 rounds
        for (int i = nums.Length - 1; i > 0; i--) {
            // Delete node
            (nums[i], nums[0]) = (nums[0], nums[i]);
            // Start heapifying the root node, from top to bottom
            SiftDown(nums, i, 0);
        }
    }
    ```

=== "Go"

    ```go title="heap_sort.go"
    /* Heap length is n, start heapifying node i, from top to bottom */
    func siftDown(nums *[]int, n, i int) {
        for true {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            l := 2*i + 1
            r := 2*i + 2
            ma := i
            if l < n && (*nums)[l] > (*nums)[ma] {
                ma = l
            }
            if r < n && (*nums)[r] > (*nums)[ma] {
                ma = r
            }
            // Swap two nodes
            if ma == i {
                break
            }
            // Swap two nodes
            (*nums)[i], (*nums)[ma] = (*nums)[ma], (*nums)[i]
            // Loop downwards heapification
            i = ma
        }
    }

    /* Heap sort */
    func heapSort(nums *[]int) {
        // Build heap operation: heapify all nodes except leaves
        for i := len(*nums)/2 - 1; i >= 0; i-- {
            siftDown(nums, len(*nums), i)
        }
        // Extract the largest element from the heap and repeat for n-1 rounds
        for i := len(*nums) - 1; i > 0; i-- {
            // Delete node
            (*nums)[0], (*nums)[i] = (*nums)[i], (*nums)[0]
            // Start heapifying the root node, from top to bottom
            siftDown(nums, i, 0)
        }
    }
    ```

=== "Swift"

    ```swift title="heap_sort.swift"
    /* Heap length is n, start heapifying node i, from top to bottom */
    func siftDown(nums: inout [Int], n: Int, i: Int) {
        var i = i
        while true {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            let l = 2 * i + 1
            let r = 2 * i + 2
            var ma = i
            if l < n, nums[l] > nums[ma] {
                ma = l
            }
            if r < n, nums[r] > nums[ma] {
                ma = r
            }
            // Swap two nodes
            if ma == i {
                break
            }
            // Swap two nodes
            nums.swapAt(i, ma)
            // Loop downwards heapification
            i = ma
        }
    }

    /* Heap sort */
    func heapSort(nums: inout [Int]) {
        // Build heap operation: heapify all nodes except leaves
        for i in stride(from: nums.count / 2 - 1, through: 0, by: -1) {
            siftDown(nums: &nums, n: nums.count, i: i)
        }
        // Extract the largest element from the heap and repeat for n-1 rounds
        for i in nums.indices.dropFirst().reversed() {
            // Delete node
            nums.swapAt(0, i)
            // Start heapifying the root node, from top to bottom
            siftDown(nums: &nums, n: i, i: 0)
        }
    }
    ```

=== "JS"

    ```javascript title="heap_sort.js"
    /* Heap length is n, start heapifying node i, from top to bottom */
    function siftDown(nums, n, i) {
        while (true) {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            let l = 2 * i + 1;
            let r = 2 * i + 2;
            let ma = i;
            if (l < n && nums[l] > nums[ma]) {
                ma = l;
            }
            if (r < n && nums[r] > nums[ma]) {
                ma = r;
            }
            // Swap two nodes
            if (ma === i) {
                break;
            }
            // Swap two nodes
            [nums[i], nums[ma]] = [nums[ma], nums[i]];
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Heap sort */
    function heapSort(nums) {
        // Build heap operation: heapify all nodes except leaves
        for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // Extract the largest element from the heap and repeat for n-1 rounds
        for (let i = nums.length - 1; i > 0; i--) {
            // Delete node
            [nums[0], nums[i]] = [nums[i], nums[0]];
            // Start heapifying the root node, from top to bottom
            siftDown(nums, i, 0);
        }
    }
    ```

=== "TS"

    ```typescript title="heap_sort.ts"
    /* Heap length is n, start heapifying node i, from top to bottom */
    function siftDown(nums: number[], n: number, i: number): void {
        while (true) {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            let l = 2 * i + 1;
            let r = 2 * i + 2;
            let ma = i;
            if (l < n && nums[l] > nums[ma]) {
                ma = l;
            }
            if (r < n && nums[r] > nums[ma]) {
                ma = r;
            }
            // Swap two nodes
            if (ma === i) {
                break;
            }
            // Swap two nodes
            [nums[i], nums[ma]] = [nums[ma], nums[i]];
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Heap sort */
    function heapSort(nums: number[]): void {
        // Build heap operation: heapify all nodes except leaves
        for (let i = Math.floor(nums.length / 2) - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // Extract the largest element from the heap and repeat for n-1 rounds
        for (let i = nums.length - 1; i > 0; i--) {
            // Delete node
            [nums[0], nums[i]] = [nums[i], nums[0]];
            // Start heapifying the root node, from top to bottom
            siftDown(nums, i, 0);
        }
    }
    ```

=== "Dart"

    ```dart title="heap_sort.dart"
    /* Heap length is n, start heapifying node i, from top to bottom */
    void siftDown(List<int> nums, int n, int i) {
      while (true) {
        // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
        int l = 2 * i + 1;
        int r = 2 * i + 2;
        int ma = i;
        if (l < n && nums[l] > nums[ma]) ma = l;
        if (r < n && nums[r] > nums[ma]) ma = r;
        // Swap two nodes
        if (ma == i) break;
        // Swap two nodes
        int temp = nums[i];
        nums[i] = nums[ma];
        nums[ma] = temp;
        // Loop downwards heapification
        i = ma;
      }
    }

    /* Heap sort */
    void heapSort(List<int> nums) {
      // Build heap operation: heapify all nodes except leaves
      for (int i = nums.length ~/ 2 - 1; i >= 0; i--) {
        siftDown(nums, nums.length, i);
      }
      // Extract the largest element from the heap and repeat for n-1 rounds
      for (int i = nums.length - 1; i > 0; i--) {
        // Delete node
        int tmp = nums[0];
        nums[0] = nums[i];
        nums[i] = tmp;
        // Start heapifying the root node, from top to bottom
        siftDown(nums, i, 0);
      }
    }
    ```

=== "Rust"

    ```rust title="heap_sort.rs"
    /* Heap length is n, start heapifying node i, from top to bottom */
    fn sift_down(nums: &mut [i32], n: usize, mut i: usize) {
        loop {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            let l = 2 * i + 1;
            let r = 2 * i + 2;
            let mut ma = i;
            if l < n && nums[l] > nums[ma] {
                ma = l;
            }
            if r < n && nums[r] > nums[ma] {
                ma = r;
            }
            // Swap two nodes
            if ma == i {
                break;
            }
            // Swap two nodes
            nums.swap(i, ma);
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Heap sort */
    fn heap_sort(nums: &mut [i32]) {
        // Build heap operation: heapify all nodes except leaves
        for i in (0..nums.len() / 2).rev() {
            sift_down(nums, nums.len(), i);
        }
        // Extract the largest element from the heap and repeat for n-1 rounds
        for i in (1..nums.len()).rev() {
            // Delete node
            nums.swap(0, i);
            // Start heapifying the root node, from top to bottom
            sift_down(nums, i, 0);
        }
    }
    ```

=== "C"

    ```c title="heap_sort.c"
    /* Heap length is n, start heapifying node i, from top to bottom */
    void siftDown(int nums[], int n, int i) {
        while (1) {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // Swap two nodes
            if (ma == i) {
                break;
            }
            // Swap two nodes
            int temp = nums[i];
            nums[i] = nums[ma];
            nums[ma] = temp;
            // Loop downwards heapification
            i = ma;
        }
    }

    /* Heap sort */
    void heapSort(int nums[], int n) {
        // Build heap operation: heapify all nodes except leaves
        for (int i = n / 2 - 1; i >= 0; --i) {
            siftDown(nums, n, i);
        }
        // Extract the largest element from the heap and repeat for n-1 rounds
        for (int i = n - 1; i > 0; --i) {
            // Delete node
            int tmp = nums[0];
            nums[0] = nums[i];
            nums[i] = tmp;
            // Start heapifying the root node, from top to bottom
            siftDown(nums, i, 0);
        }
    }
    ```

=== "Kotlin"

    ```kotlin title="heap_sort.kt"
    /* Heap length is n, start heapifying node i, from top to bottom */
    fun siftDown(nums: IntArray, n: Int, li: Int) {
        var i = li
        while (true) {
            // If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
            val l = 2 * i + 1
            val r = 2 * i + 2
            var ma = i
            if (l < n && nums[l] > nums[ma]) 
                ma = l
            if (r < n && nums[r] > nums[ma]) 
                ma = r
            // Swap two nodes
            if (ma == i) 
                break
            // Swap two nodes
            val temp = nums[i]
            nums[i] = nums[ma]
            nums[ma] = temp
            // Loop downwards heapification
            i = ma
        }
    }

    /* Heap sort */
    fun heapSort(nums: IntArray) {
        // Build heap operation: heapify all nodes except leaves
        for (i in nums.size / 2 - 1 downTo 0) {
            siftDown(nums, nums.size, i)
        }
        // Extract the largest element from the heap and repeat for n-1 rounds
        for (i in nums.size - 1 downTo 1) {
            // Delete node
            val temp = nums[0]
            nums[0] = nums[i]
            nums[i] = temp
            // Start heapifying the root node, from top to bottom
            siftDown(nums, i, 0)
        }
    }
    ```

=== "Ruby"

    ```ruby title="heap_sort.rb"
    ### Heap length is n, heapify from node i, top to bottom ###
    def sift_down(nums, n, i)
      while true
        # If node i is largest or indices l, r are out of bounds, no need to continue heapify, break
        l = 2 * i + 1
        r = 2 * i + 2
        ma = i
        ma = l if l < n && nums[l] > nums[ma]
        ma = r if r < n && nums[r] > nums[ma]
        # Swap two nodes
        break if ma == i
        # Swap two nodes
        nums[i], nums[ma] = nums[ma], nums[i]
        # Loop downwards heapification
        i = ma
      end
    end

    ### Heap sort ###
    def heap_sort(nums)
      # Build heap operation: heapify all nodes except leaves
      (nums.length / 2 - 1).downto(0) do |i|
        sift_down(nums, nums.length, i)
      end
      # Extract the largest element from the heap and repeat for n-1 rounds
      (nums.length - 1).downto(1) do |i|
        # Delete node
        nums[0], nums[i] = nums[i], nums[0]
        # Start heapifying the root node, from top to bottom
        sift_down(nums, i, 0)
      end
    end
    ```

## 11.7.2 &nbsp; Algorithm Characteristics

- **Time complexity of $O(n \log n)$, non-adaptive sorting**: The build heap operation uses $O(n)$ time. Extracting the largest element from the heap has a time complexity of $O(\log n)$, looping a total of $n - 1$ rounds.
- **Space complexity of $O(1)$, in-place sorting**: A few pointer variables use $O(1)$ space. Element swapping and heapify operations are both performed on the original array.
- **Non-stable sorting**: When swapping the heap top element and heap bottom element, the relative positions of equal elements may change.
