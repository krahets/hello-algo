---
comments: true
---

# 11.6 &nbsp; Merge sort

<u>Merge sort</u> is a sorting algorithm based on the divide-and-conquer strategy, involving the "divide" and "merge" phases shown in Figure 11-10.

1. **Divide phase**: Recursively split the array from the midpoint, transforming the sorting problem of a long array into that of shorter arrays.
2. **Merge phase**: Stop dividing when the length of the sub-array is 1, start merging, and continuously combine two shorter ordered arrays into one longer ordered array until the process is complete.

![The divide and merge phases of merge sort](merge_sort.assets/merge_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-10 &nbsp; The divide and merge phases of merge sort </p>

## 11.6.1 &nbsp; Algorithm workflow

As shown in Figure 11-11, the "divide phase" recursively splits the array from the midpoint into two sub-arrays from top to bottom.

1. Calculate the midpoint `mid`, recursively divide the left sub-array (interval `[left, mid]`) and the right sub-array (interval `[mid + 1, right]`).
2. Continue with step `1.` recursively until the sub-array interval length is 1 to stop.

The "merge phase" combines the left and right sub-arrays into a single ordered array from bottom to top. Note that merging starts with sub-arrays of length 1, and each sub-array is ordered during the merge phase.

=== "<1>"
    ![Merge sort process](merge_sort.assets/merge_sort_step1.png){ class="animation-figure" }

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

<p align="center"> Figure 11-11 &nbsp; Merge sort process </p>

It is observed that the order of recursion in merge sort is consistent with the post-order traversal of a binary tree.

- **Post-order traversal**: First recursively traverse the left subtree, then the right subtree, and finally handle the root node.
- **Merge sort**: First recursively handle the left sub-array, then the right sub-array, and finally perform the merge.

The implementation of merge sort is shown in the following code. Note that the interval to be merged in `nums` is `[left, right]`, while the corresponding interval in `tmp` is `[0, right - left]`.

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
        # Partition stage
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
        // Partition stage
        int mid = (left + right) / 2;    // Calculate midpoint
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
        // Partition stage
        int mid = (left + right) / 2; // Calculate midpoint
        mergeSort(nums, left, mid); // Recursively process the left subarray
        mergeSort(nums, mid + 1, right); // Recursively process the right subarray
        // Merge stage
        merge(nums, left, mid, right);
    }
    ```

=== "C#"

    ```csharp title="merge_sort.cs"
    [class]{merge_sort}-[func]{Merge}

    [class]{merge_sort}-[func]{MergeSort}
    ```

=== "Go"

    ```go title="merge_sort.go"
    [class]{}-[func]{merge}

    [class]{}-[func]{mergeSort}
    ```

=== "Swift"

    ```swift title="merge_sort.swift"
    [class]{}-[func]{merge}

    [class]{}-[func]{mergeSort}
    ```

=== "JS"

    ```javascript title="merge_sort.js"
    [class]{}-[func]{merge}

    [class]{}-[func]{mergeSort}
    ```

=== "TS"

    ```typescript title="merge_sort.ts"
    [class]{}-[func]{merge}

    [class]{}-[func]{mergeSort}
    ```

=== "Dart"

    ```dart title="merge_sort.dart"
    [class]{}-[func]{merge}

    [class]{}-[func]{mergeSort}
    ```

=== "Rust"

    ```rust title="merge_sort.rs"
    [class]{}-[func]{merge}

    [class]{}-[func]{merge_sort}
    ```

=== "C"

    ```c title="merge_sort.c"
    [class]{}-[func]{merge}

    [class]{}-[func]{mergeSort}
    ```

=== "Kotlin"

    ```kotlin title="merge_sort.kt"
    [class]{}-[func]{merge}

    [class]{}-[func]{mergeSort}
    ```

=== "Ruby"

    ```ruby title="merge_sort.rb"
    [class]{}-[func]{merge}

    [class]{}-[func]{merge_sort}
    ```

=== "Zig"

    ```zig title="merge_sort.zig"
    [class]{}-[func]{merge}

    [class]{}-[func]{mergeSort}
    ```

## 11.6.2 &nbsp; Algorithm characteristics

- **Time complexity of $O(n \log n)$, non-adaptive sort**: The division creates a recursion tree of height $\log n$, with each layer merging a total of $n$ operations, resulting in an overall time complexity of $O(n \log n)$.
- **Space complexity of $O(n)$, non-in-place sort**: The recursion depth is $\log n$, using $O(\log n)$ stack frame space. The merging operation requires auxiliary arrays, using an additional space of $O(n)$.
- **Stable sort**: During the merging process, the order of equal elements remains unchanged.

## 11.6.3 &nbsp; Linked List sorting

For linked lists, merge sort has significant advantages over other sorting algorithms, **optimizing the space complexity of the linked list sorting task to $O(1)$**.

- **Divide phase**: "Iteration" can be used instead of "recursion" to perform the linked list division work, thus saving the stack frame space used by recursion.
- **Merge phase**: In linked lists, node addition and deletion operations can be achieved by changing references (pointers), so no extra lists need to be created during the merge phase (combining two short ordered lists into one long ordered list).

Detailed implementation details are complex, and interested readers can consult related materials for learning.
