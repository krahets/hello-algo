---
comments: true
---

# 11.6 &nbsp; Merge Sort

<u>Merge sort (merge sort)</u> is a sorting algorithm based on the divide-and-conquer strategy, which includes the "divide" and "merge" phases shown in Figure 11-10.

1. **Divide phase**: Recursively split the array from the midpoint, transforming the sorting problem of a long array into the sorting problems of shorter arrays.
2. **Merge phase**: When the sub-array length is 1, terminate the division and start merging, continuously merging two shorter sorted arrays into one longer sorted array until the process is complete.

![Divide and merge phases of merge sort](merge_sort.assets/merge_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-10 &nbsp; Divide and merge phases of merge sort </p>

## 11.6.1 &nbsp; Algorithm Flow

As shown in Figure 11-11, the "divide phase" recursively splits the array from the midpoint into two sub-arrays from top to bottom.

1. Calculate the array midpoint `mid`, recursively divide the left sub-array (interval `[left, mid]`) and right sub-array (interval `[mid + 1, right]`).
2. Recursively execute step `1.` until the sub-array interval length is 1, then terminate.

The "merge phase" merges the left sub-array and right sub-array into a sorted array from bottom to top. Note that merging starts from sub-arrays of length 1, and each sub-array in the merge phase is sorted.

=== "<1>"
    ![Merge sort steps](merge_sort.assets/merge_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![merge_sort_step2](merge_sort.assets/merge_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![merge_sort_step3](merge_sort.assets/merge_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![merge_sort_step4](merge_sort.assets/merge_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![merge_sort_step5](merge_sort.assets/merge_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![merge_sort_step6](merge_sort.assets/merge_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![merge_sort_step7](merge_sort.assets/merge_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![merge_sort_step8](merge_sort.assets/merge_sort_step8.png){ class="animation-figure" }

=== "<9>"
    ![merge_sort_step9](merge_sort.assets/merge_sort_step9.png){ class="animation-figure" }

=== "<10>"
    ![merge_sort_step10](merge_sort.assets/merge_sort_step10.png){ class="animation-figure" }

<p align="center"> Figure 11-11 &nbsp; Merge sort steps </p>

It can be observed that the recursive order of merge sort is consistent with the post-order traversal of a binary tree.

- **Post-order traversal**: First recursively traverse the left subtree, then recursively traverse the right subtree, and finally process the root node.
- **Merge sort**: First recursively process the left sub-array, then recursively process the right sub-array, and finally perform the merge.

The implementation of merge sort is shown in the code below. Note that the interval to be merged in `nums` is `[left, right]`, while the corresponding interval in `tmp` is `[0, right - left]`.

=== "Python"

    ```python title="merge_sort.py"
    def merge(nums: list[int], left: int, mid: int, right: int):
        """Merge left subarray and right subarray"""
        # Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
        # Create a temporary array tmp to store the merged results
        tmp = [0] * (right - left + 1)
        # Initialize the start indices of the left and right subarrays
        i, j, k = left, mid + 1, 0
        # While both subarrays still have elements, compare and copy the smaller element into the temporary array
        while i <= mid and j <= right:
            if nums[i] <= nums[j]:
                tmp[k] = nums[i]
                i += 1
            else:
                tmp[k] = nums[j]
                j += 1
            k += 1
        # Copy the remaining elements of the left and right subarrays into the temporary array
        while i <= mid:
            tmp[k] = nums[i]
            i += 1
            k += 1
        while j <= right:
            tmp[k] = nums[j]
            j += 1
            k += 1
        # Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
        for k in range(0, len(tmp)):
            nums[left + k] = tmp[k]

    def merge_sort(nums: list[int], left: int, right: int):
        """Merge sort"""
        # Termination condition
        if left >= right:
            return  # Terminate recursion when subarray length is 1
        # Divide and conquer stage
        mid = (left + right) // 2  # Calculate midpoint
        merge_sort(nums, left, mid)  # Recursively process the left subarray
        merge_sort(nums, mid + 1, right)  # Recursively process the right subarray
        # Merge stage
        merge(nums, left, mid, right)
    ```

=== "C++"

    ```cpp title="merge_sort.cpp"
    /* Merge left subarray and right subarray */
    void merge(vector<int> &nums, int left, int mid, int right) {
        // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
        // Create a temporary array tmp to store the merged results
        vector<int> tmp(right - left + 1);
        // Initialize the start indices of the left and right subarrays
        int i = left, j = mid + 1, k = 0;
        // While both subarrays still have elements, compare and copy the smaller element into the temporary array
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // Copy the remaining elements of the left and right subarrays into the temporary array
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
        for (k = 0; k < tmp.size(); k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* Merge sort */
    void mergeSort(vector<int> &nums, int left, int right) {
        // Termination condition
        if (left >= right)
            return; // Terminate recursion when subarray length is 1
        // Divide and conquer stage
        int mid = left + (right - left) / 2;    // Calculate midpoint
        mergeSort(nums, left, mid);      // Recursively process the left subarray
        mergeSort(nums, mid + 1, right); // Recursively process the right subarray
        // Merge stage
        merge(nums, left, mid, right);
    }
    ```

=== "Java"

    ```java title="merge_sort.java"
    /* Merge left subarray and right subarray */
    void merge(int[] nums, int left, int mid, int right) {
        // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
        // Create a temporary array tmp to store the merged results
        int[] tmp = new int[right - left + 1];
        // Initialize the start indices of the left and right subarrays
        int i = left, j = mid + 1, k = 0;
        // While both subarrays still have elements, compare and copy the smaller element into the temporary array
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // Copy the remaining elements of the left and right subarrays into the temporary array
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* Merge sort */
    void mergeSort(int[] nums, int left, int right) {
        // Termination condition
        if (left >= right)
            return; // Terminate recursion when subarray length is 1
        // Divide and conquer stage
        int mid = left + (right - left) / 2; // Calculate midpoint
        mergeSort(nums, left, mid); // Recursively process the left subarray
        mergeSort(nums, mid + 1, right); // Recursively process the right subarray
        // Merge stage
        merge(nums, left, mid, right);
    }
    ```

=== "C#"

    ```csharp title="merge_sort.cs"
    /* Merge left subarray and right subarray */
    void Merge(int[] nums, int left, int mid, int right) {
        // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
        // Create a temporary array tmp to store the merged results
        int[] tmp = new int[right - left + 1];
        // Initialize the start indices of the left and right subarrays
        int i = left, j = mid + 1, k = 0;
        // While both subarrays still have elements, compare and copy the smaller element into the temporary array
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // Copy the remaining elements of the left and right subarrays into the temporary array
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
        for (k = 0; k < tmp.Length; ++k) {
            nums[left + k] = tmp[k];
        }
    }

    /* Merge sort */
    void MergeSort(int[] nums, int left, int right) {
        // Termination condition
        if (left >= right) return;       // Terminate recursion when subarray length is 1
        // Divide and conquer stage
        int mid = left + (right - left) / 2;    // Calculate midpoint
        MergeSort(nums, left, mid);      // Recursively process the left subarray
        MergeSort(nums, mid + 1, right); // Recursively process the right subarray
        // Merge stage
        Merge(nums, left, mid, right);
    }
    ```

=== "Go"

    ```go title="merge_sort.go"
    /* Merge left subarray and right subarray */
    func merge(nums []int, left, mid, right int) {
        // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
        // Create a temporary array tmp to store the merged results
        tmp := make([]int, right-left+1)
        // Initialize the start indices of the left and right subarrays
        i, j, k := left, mid+1, 0
        // While both subarrays still have elements, compare and copy the smaller element into the temporary array
        for i <= mid && j <= right {
            if nums[i] <= nums[j] {
                tmp[k] = nums[i]
                i++
            } else {
                tmp[k] = nums[j]
                j++
            }
            k++
        }
        // Copy the remaining elements of the left and right subarrays into the temporary array
        for i <= mid {
            tmp[k] = nums[i]
            i++
            k++
        }
        for j <= right {
            tmp[k] = nums[j]
            j++
            k++
        }
        // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
        for k := 0; k < len(tmp); k++ {
            nums[left+k] = tmp[k]
        }
    }

    /* Merge sort */
    func mergeSort(nums []int, left, right int) {
        // Termination condition
        if left >= right {
            return
        }
        // Divide and conquer stage
        mid := left + (right - left) / 2
        mergeSort(nums, left, mid)
        mergeSort(nums, mid+1, right)
        // Merge stage
        merge(nums, left, mid, right)
    }
    ```

=== "Swift"

    ```swift title="merge_sort.swift"
    /* Merge left subarray and right subarray */
    func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
        // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
        // Create a temporary array tmp to store the merged results
        var tmp = Array(repeating: 0, count: right - left + 1)
        // Initialize the start indices of the left and right subarrays
        var i = left, j = mid + 1, k = 0
        // While both subarrays still have elements, compare and copy the smaller element into the temporary array
        while i <= mid, j <= right {
            if nums[i] <= nums[j] {
                tmp[k] = nums[i]
                i += 1
            } else {
                tmp[k] = nums[j]
                j += 1
            }
            k += 1
        }
        // Copy the remaining elements of the left and right subarrays into the temporary array
        while i <= mid {
            tmp[k] = nums[i]
            i += 1
            k += 1
        }
        while j <= right {
            tmp[k] = nums[j]
            j += 1
            k += 1
        }
        // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
        for k in tmp.indices {
            nums[left + k] = tmp[k]
        }
    }

    /* Merge sort */
    func mergeSort(nums: inout [Int], left: Int, right: Int) {
        // Termination condition
        if left >= right { // Terminate recursion when subarray length is 1
            return
        }
        // Divide and conquer stage
        let mid = left + (right - left) / 2 // Calculate midpoint
        mergeSort(nums: &nums, left: left, right: mid) // Recursively process the left subarray
        mergeSort(nums: &nums, left: mid + 1, right: right) // Recursively process the right subarray
        // Merge stage
        merge(nums: &nums, left: left, mid: mid, right: right)
    }
    ```

=== "JS"

    ```javascript title="merge_sort.js"
    /* Merge left subarray and right subarray */
    function merge(nums, left, mid, right) {
        // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
        // Create a temporary array tmp to store the merged results
        const tmp = new Array(right - left + 1);
        // Initialize the start indices of the left and right subarrays
        let i = left,
            j = mid + 1,
            k = 0;
        // While both subarrays still have elements, compare and copy the smaller element into the temporary array
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // Copy the remaining elements of the left and right subarrays into the temporary array
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* Merge sort */
    function mergeSort(nums, left, right) {
        // Termination condition
        if (left >= right) return; // Terminate recursion when subarray length is 1
        // Divide and conquer stage
        let mid = Math.floor(left + (right - left) / 2); // Calculate midpoint
        mergeSort(nums, left, mid); // Recursively process the left subarray
        mergeSort(nums, mid + 1, right); // Recursively process the right subarray
        // Merge stage
        merge(nums, left, mid, right);
    }
    ```

=== "TS"

    ```typescript title="merge_sort.ts"
    /* Merge left subarray and right subarray */
    function merge(nums: number[], left: number, mid: number, right: number): void {
        // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
        // Create a temporary array tmp to store the merged results
        const tmp = new Array(right - left + 1);
        // Initialize the start indices of the left and right subarrays
        let i = left,
            j = mid + 1,
            k = 0;
        // While both subarrays still have elements, compare and copy the smaller element into the temporary array
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // Copy the remaining elements of the left and right subarrays into the temporary array
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* Merge sort */
    function mergeSort(nums: number[], left: number, right: number): void {
        // Termination condition
        if (left >= right) return; // Terminate recursion when subarray length is 1
        // Divide and conquer stage
        let mid = Math.floor(left + (right - left) / 2); // Calculate midpoint
        mergeSort(nums, left, mid); // Recursively process the left subarray
        mergeSort(nums, mid + 1, right); // Recursively process the right subarray
        // Merge stage
        merge(nums, left, mid, right);
    }
    ```

=== "Dart"

    ```dart title="merge_sort.dart"
    /* Merge left subarray and right subarray */
    void merge(List<int> nums, int left, int mid, int right) {
      // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
      // Create a temporary array tmp to store the merged results
      List<int> tmp = List.filled(right - left + 1, 0);
      // Initialize the start indices of the left and right subarrays
      int i = left, j = mid + 1, k = 0;
      // While both subarrays still have elements, compare and copy the smaller element into the temporary array
      while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
          tmp[k++] = nums[i++];
        else
          tmp[k++] = nums[j++];
      }
      // Copy the remaining elements of the left and right subarrays into the temporary array
      while (i <= mid) {
        tmp[k++] = nums[i++];
      }
      while (j <= right) {
        tmp[k++] = nums[j++];
      }
      // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
      for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
      }
    }

    /* Merge sort */
    void mergeSort(List<int> nums, int left, int right) {
      // Termination condition
      if (left >= right) return; // Terminate recursion when subarray length is 1
      // Divide and conquer stage
      int mid = left + (right - left) ~/ 2; // Calculate midpoint
      mergeSort(nums, left, mid); // Recursively process the left subarray
      mergeSort(nums, mid + 1, right); // Recursively process the right subarray
      // Merge stage
      merge(nums, left, mid, right);
    }
    ```

=== "Rust"

    ```rust title="merge_sort.rs"
    /* Merge left subarray and right subarray */
    fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
        // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
        // Create a temporary array tmp to store the merged results
        let tmp_size = right - left + 1;
        let mut tmp = vec![0; tmp_size];
        // Initialize the start indices of the left and right subarrays
        let (mut i, mut j, mut k) = (left, mid + 1, 0);
        // While both subarrays still have elements, compare and copy the smaller element into the temporary array
        while i <= mid && j <= right {
            if nums[i] <= nums[j] {
                tmp[k] = nums[i];
                i += 1;
            } else {
                tmp[k] = nums[j];
                j += 1;
            }
            k += 1;
        }
        // Copy the remaining elements of the left and right subarrays into the temporary array
        while i <= mid {
            tmp[k] = nums[i];
            k += 1;
            i += 1;
        }
        while j <= right {
            tmp[k] = nums[j];
            k += 1;
            j += 1;
        }
        // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
        for k in 0..tmp_size {
            nums[left + k] = tmp[k];
        }
    }

    /* Merge sort */
    fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
        // Termination condition
        if left >= right {
            return; // Terminate recursion when subarray length is 1
        }

        // Divide and conquer stage
        let mid = left + (right - left) / 2; // Calculate midpoint
        merge_sort(nums, left, mid); // Recursively process the left subarray
        merge_sort(nums, mid + 1, right); // Recursively process the right subarray

        // Merge stage
        merge(nums, left, mid, right);
    }
    ```

=== "C"

    ```c title="merge_sort.c"
    /* Merge left subarray and right subarray */
    void merge(int *nums, int left, int mid, int right) {
        // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
        // Create a temporary array tmp to store the merged results
        int tmpSize = right - left + 1;
        int *tmp = (int *)malloc(tmpSize * sizeof(int));
        // Initialize the start indices of the left and right subarrays
        int i = left, j = mid + 1, k = 0;
        // While both subarrays still have elements, compare and copy the smaller element into the temporary array
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // Copy the remaining elements of the left and right subarrays into the temporary array
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
        for (k = 0; k < tmpSize; ++k) {
            nums[left + k] = tmp[k];
        }
        // Free memory
        free(tmp);
    }

    /* Merge sort */
    void mergeSort(int *nums, int left, int right) {
        // Termination condition
        if (left >= right)
            return; // Terminate recursion when subarray length is 1
        // Divide and conquer stage
        int mid = left + (right - left) / 2;    // Calculate midpoint
        mergeSort(nums, left, mid);      // Recursively process the left subarray
        mergeSort(nums, mid + 1, right); // Recursively process the right subarray
        // Merge stage
        merge(nums, left, mid, right);
    }
    ```

=== "Kotlin"

    ```kotlin title="merge_sort.kt"
    /* Merge left subarray and right subarray */
    fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
        // Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
        // Create a temporary array tmp to store the merged results
        val tmp = IntArray(right - left + 1)
        // Initialize the start indices of the left and right subarrays
        var i = left
        var j = mid + 1
        var k = 0
        // While both subarrays still have elements, compare and copy the smaller element into the temporary array
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++]
            else
                tmp[k++] = nums[j++]
        }
        // Copy the remaining elements of the left and right subarrays into the temporary array
        while (i <= mid) {
            tmp[k++] = nums[i++]
        }
        while (j <= right) {
            tmp[k++] = nums[j++]
        }
        // Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
        for (l in tmp.indices) {
            nums[left + l] = tmp[l]
        }
    }

    /* Merge sort */
    fun mergeSort(nums: IntArray, left: Int, right: Int) {
        // Termination condition
        if (left >= right) return  // Terminate recursion when subarray length is 1
        // Divide and conquer stage
        val mid = left + (right - left) / 2 // Calculate midpoint
        mergeSort(nums, left, mid) // Recursively process the left subarray
        mergeSort(nums, mid + 1, right) // Recursively process the right subarray
        // Merge stage
        merge(nums, left, mid, right)
    }
    ```

=== "Ruby"

    ```ruby title="merge_sort.rb"
    ### Merge left and right subarrays ###
    def merge(nums, left, mid, right)
      # Left subarray interval is [left, mid], right subarray interval is [mid+1, right]
      # Create temporary array tmp to store merged result
      tmp = Array.new(right - left + 1, 0)
      # Initialize the start indices of the left and right subarrays
      i, j, k = left, mid + 1, 0
      # While both subarrays still have elements, compare and copy the smaller element into the temporary array
      while i <= mid && j <= right
        if nums[i] <= nums[j]
          tmp[k] = nums[i]
          i += 1
        else
          tmp[k] = nums[j]
          j += 1
        end
        k += 1
      end
      # Copy the remaining elements of the left and right subarrays into the temporary array
      while i <= mid
        tmp[k] = nums[i]
        i += 1
        k += 1
      end
      while j <= right
        tmp[k] = nums[j]
        j += 1
        k += 1
      end
      # Copy the elements from the temporary array tmp back to the original array nums at the corresponding interval
      (0...tmp.length).each do |k|
        nums[left + k] = tmp[k]
      end
    end

    ### Merge sort ###
    def merge_sort(nums, left, right)
      # Termination condition
      # Terminate recursion when subarray length is 1
      return if left >= right
      # Divide and conquer stage
      mid = left + (right - left) / 2 # Calculate midpoint
      merge_sort(nums, left, mid) # Recursively process the left subarray
      merge_sort(nums, mid + 1, right) # Recursively process the right subarray
      # Merge stage
      merge(nums, left, mid, right)
    end
    ```

## 11.6.2 &nbsp; Algorithm Characteristics

- **Time complexity of $O(n \log n)$, non-adaptive sorting**: The division produces a recursion tree of height $\log n$, and the total number of merge operations at each level is $n$, so the overall time complexity is $O(n \log n)$.
- **Space complexity of $O(n)$, non-in-place sorting**: The recursion depth is $\log n$, using $O(\log n)$ size of stack frame space. The merge operation requires the aid of an auxiliary array, using $O(n)$ size of additional space.
- **Stable sorting**: In the merge process, the order of equal elements remains unchanged.

## 11.6.3 &nbsp; Linked List Sorting

For linked lists, merge sort has significant advantages over other sorting algorithms, **and can optimize the space complexity of linked list sorting tasks to $O(1)$**.

- **Divide phase**: "Iteration" can be used instead of "recursion" to implement linked list division work, thus saving the stack frame space used by recursion.
- **Merge phase**: In linked lists, node insertion and deletion operations can be achieved by just changing references (pointers), so there is no need to create additional linked lists during the merge phase (merging two short ordered linked lists into one long ordered linked list).

The specific implementation details are quite complex, and interested readers can consult related materials for learning.
