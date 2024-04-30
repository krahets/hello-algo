---
comments: true
---

# 11.6 &nbsp; Merge sort

<u>Merge sort</u> is a sorting algorithm based on the divide-and-conquer strategy, involving the "divide" and "merge" phases shown in the following figure.

1. **Divide phase**: Recursively split the array from the midpoint, transforming the sorting problem of a long array into that of shorter arrays.
2. **Merge phase**: Stop dividing when the length of the sub-array is 1, start merging, and continuously combine two shorter ordered arrays into one longer ordered array until the process is complete.

![The divide and merge phases of merge sort](merge_sort.assets/merge_sort_overview.png){ class="animation-figure" }

<p align="center"> Figure 11-10 &nbsp; The divide and merge phases of merge sort </p>

## 11.6.1 &nbsp; Algorithm workflow

As shown in the Figure 11-11 , the "divide phase" recursively splits the array from the midpoint into two sub-arrays from top to bottom.

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
        """合并左子数组和右子数组"""
        # 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
        # 创建一个临时数组 tmp ，用于存放合并后的结果
        tmp = [0] * (right - left + 1)
        # 初始化左子数组和右子数组的起始索引
        i, j, k = left, mid + 1, 0
        # 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
        while i <= mid and j <= right:
            if nums[i] <= nums[j]:
                tmp[k] = nums[i]
                i += 1
            else:
                tmp[k] = nums[j]
                j += 1
            k += 1
        # 将左子数组和右子数组的剩余元素复制到临时数组中
        while i <= mid:
            tmp[k] = nums[i]
            i += 1
            k += 1
        while j <= right:
            tmp[k] = nums[j]
            j += 1
            k += 1
        # 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
        for k in range(0, len(tmp)):
            nums[left + k] = tmp[k]

    def merge_sort(nums: list[int], left: int, right: int):
        """归并排序"""
        # 终止条件
        if left >= right:
            return  # 当子数组长度为 1 时终止递归
        # 划分阶段
        mid = (left + right) // 2  # 计算中点
        merge_sort(nums, left, mid)  # 递归左子数组
        merge_sort(nums, mid + 1, right)  # 递归右子数组
        # 合并阶段
        merge(nums, left, mid, right)
    ```

=== "C++"

    ```cpp title="merge_sort.cpp"
    /* 合并左子数组和右子数组 */
    void merge(vector<int> &nums, int left, int mid, int right) {
        // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
        // 创建一个临时数组 tmp ，用于存放合并后的结果
        vector<int> tmp(right - left + 1);
        // 初始化左子数组和右子数组的起始索引
        int i = left, j = mid + 1, k = 0;
        // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 将左子数组和右子数组的剩余元素复制到临时数组中
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
        for (k = 0; k < tmp.size(); k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* 归并排序 */
    void mergeSort(vector<int> &nums, int left, int right) {
        // 终止条件
        if (left >= right)
            return; // 当子数组长度为 1 时终止递归
        // 划分阶段
        int mid = (left + right) / 2;    // 计算中点
        mergeSort(nums, left, mid);      // 递归左子数组
        mergeSort(nums, mid + 1, right); // 递归右子数组
        // 合并阶段
        merge(nums, left, mid, right);
    }
    ```

=== "Java"

    ```java title="merge_sort.java"
    /* 合并左子数组和右子数组 */
    void merge(int[] nums, int left, int mid, int right) {
        // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
        // 创建一个临时数组 tmp ，用于存放合并后的结果
        int[] tmp = new int[right - left + 1];
        // 初始化左子数组和右子数组的起始索引
        int i = left, j = mid + 1, k = 0;
        // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 将左子数组和右子数组的剩余元素复制到临时数组中
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* 归并排序 */
    void mergeSort(int[] nums, int left, int right) {
        // 终止条件
        if (left >= right)
            return; // 当子数组长度为 1 时终止递归
        // 划分阶段
        int mid = (left + right) / 2; // 计算中点
        mergeSort(nums, left, mid); // 递归左子数组
        mergeSort(nums, mid + 1, right); // 递归右子数组
        // 合并阶段
        merge(nums, left, mid, right);
    }
    ```

=== "C#"

    ```csharp title="merge_sort.cs"
    /* 合并左子数组和右子数组 */
    void Merge(int[] nums, int left, int mid, int right) {
        // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
        // 创建一个临时数组 tmp ，用于存放合并后的结果
        int[] tmp = new int[right - left + 1];
        // 初始化左子数组和右子数组的起始索引
        int i = left, j = mid + 1, k = 0;
        // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 将左子数组和右子数组的剩余元素复制到临时数组中
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
        for (k = 0; k < tmp.Length; ++k) {
            nums[left + k] = tmp[k];
        }
    }

    /* 归并排序 */
    void MergeSort(int[] nums, int left, int right) {
        // 终止条件
        if (left >= right) return;       // 当子数组长度为 1 时终止递归
        // 划分阶段
        int mid = (left + right) / 2;    // 计算中点
        MergeSort(nums, left, mid);      // 递归左子数组
        MergeSort(nums, mid + 1, right); // 递归右子数组
        // 合并阶段
        Merge(nums, left, mid, right);
    }
    ```

=== "Go"

    ```go title="merge_sort.go"
    /* 合并左子数组和右子数组 */
    func merge(nums []int, left, mid, right int) {
        // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
        // 创建一个临时数组 tmp ，用于存放合并后的结果
        tmp := make([]int, right-left+1)
        // 初始化左子数组和右子数组的起始索引
        i, j, k := left, mid+1, 0
        // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
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
        // 将左子数组和右子数组的剩余元素复制到临时数组中
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
        // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
        for k := 0; k < len(tmp); k++ {
            nums[left+k] = tmp[k]
        }
    }

    /* 归并排序 */
    func mergeSort(nums []int, left, right int) {
        // 终止条件
        if left >= right {
            return
        }
        // 划分阶段
        mid := (left + right) / 2
        mergeSort(nums, left, mid)
        mergeSort(nums, mid+1, right)
        // 合并阶段
        merge(nums, left, mid, right)
    }
    ```

=== "Swift"

    ```swift title="merge_sort.swift"
    /* 合并左子数组和右子数组 */
    func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
        // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
        // 创建一个临时数组 tmp ，用于存放合并后的结果
        var tmp = Array(repeating: 0, count: right - left + 1)
        // 初始化左子数组和右子数组的起始索引
        var i = left, j = mid + 1, k = 0
        // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
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
        // 将左子数组和右子数组的剩余元素复制到临时数组中
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
        // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
        for k in tmp.indices {
            nums[left + k] = tmp[k]
        }
    }

    /* 归并排序 */
    func mergeSort(nums: inout [Int], left: Int, right: Int) {
        // 终止条件
        if left >= right { // 当子数组长度为 1 时终止递归
            return
        }
        // 划分阶段
        let mid = (left + right) / 2 // 计算中点
        mergeSort(nums: &nums, left: left, right: mid) // 递归左子数组
        mergeSort(nums: &nums, left: mid + 1, right: right) // 递归右子数组
        // 合并阶段
        merge(nums: &nums, left: left, mid: mid, right: right)
    }
    ```

=== "JS"

    ```javascript title="merge_sort.js"
    /* 合并左子数组和右子数组 */
    function merge(nums, left, mid, right) {
        // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
        // 创建一个临时数组 tmp ，用于存放合并后的结果
        const tmp = new Array(right - left + 1);
        // 初始化左子数组和右子数组的起始索引
        let i = left,
            j = mid + 1,
            k = 0;
        // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // 将左子数组和右子数组的剩余元素复制到临时数组中
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* 归并排序 */
    function mergeSort(nums, left, right) {
        // 终止条件
        if (left >= right) return; // 当子数组长度为 1 时终止递归
        // 划分阶段
        let mid = Math.floor((left + right) / 2); // 计算中点
        mergeSort(nums, left, mid); // 递归左子数组
        mergeSort(nums, mid + 1, right); // 递归右子数组
        // 合并阶段
        merge(nums, left, mid, right);
    }
    ```

=== "TS"

    ```typescript title="merge_sort.ts"
    /* 合并左子数组和右子数组 */
    function merge(nums: number[], left: number, mid: number, right: number): void {
        // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
        // 创建一个临时数组 tmp ，用于存放合并后的结果
        const tmp = new Array(right - left + 1);
        // 初始化左子数组和右子数组的起始索引
        let i = left,
            j = mid + 1,
            k = 0;
        // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // 将左子数组和右子数组的剩余元素复制到临时数组中
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* 归并排序 */
    function mergeSort(nums: number[], left: number, right: number): void {
        // 终止条件
        if (left >= right) return; // 当子数组长度为 1 时终止递归
        // 划分阶段
        let mid = Math.floor((left + right) / 2); // 计算中点
        mergeSort(nums, left, mid); // 递归左子数组
        mergeSort(nums, mid + 1, right); // 递归右子数组
        // 合并阶段
        merge(nums, left, mid, right);
    }
    ```

=== "Dart"

    ```dart title="merge_sort.dart"
    /* 合并左子数组和右子数组 */
    void merge(List<int> nums, int left, int mid, int right) {
      // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
      // 创建一个临时数组 tmp ，用于存放合并后的结果
      List<int> tmp = List.filled(right - left + 1, 0);
      // 初始化左子数组和右子数组的起始索引
      int i = left, j = mid + 1, k = 0;
      // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
      while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
          tmp[k++] = nums[i++];
        else
          tmp[k++] = nums[j++];
      }
      // 将左子数组和右子数组的剩余元素复制到临时数组中
      while (i <= mid) {
        tmp[k++] = nums[i++];
      }
      while (j <= right) {
        tmp[k++] = nums[j++];
      }
      // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
      for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
      }
    }

    /* 归并排序 */
    void mergeSort(List<int> nums, int left, int right) {
      // 终止条件
      if (left >= right) return; // 当子数组长度为 1 时终止递归
      // 划分阶段
      int mid = (left + right) ~/ 2; // 计算中点
      mergeSort(nums, left, mid); // 递归左子数组
      mergeSort(nums, mid + 1, right); // 递归右子数组
      // 合并阶段
      merge(nums, left, mid, right);
    }
    ```

=== "Rust"

    ```rust title="merge_sort.rs"
    /* 合并左子数组和右子数组 */
    fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
        // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
        // 创建一个临时数组 tmp ，用于存放合并后的结果
        let tmp_size = right - left + 1;
        let mut tmp = vec![0; tmp_size];
        // 初始化左子数组和右子数组的起始索引
        let (mut i, mut j, mut k) = (left, mid + 1, 0);
        // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
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
        // 将左子数组和右子数组的剩余元素复制到临时数组中
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
        // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
        for k in 0..tmp_size {
            nums[left + k] = tmp[k];
        }
    }

    /* 归并排序 */
    fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
        // 终止条件
        if left >= right {
            return; // 当子数组长度为 1 时终止递归
        }

        // 划分阶段
        let mid = (left + right) / 2; // 计算中点
        merge_sort(nums, left, mid); // 递归左子数组
        merge_sort(nums, mid + 1, right); // 递归右子数组

        // 合并阶段
        merge(nums, left, mid, right);
    }
    ```

=== "C"

    ```c title="merge_sort.c"
    /* 合并左子数组和右子数组 */
    void merge(int *nums, int left, int mid, int right) {
        // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
        // 创建一个临时数组 tmp ，用于存放合并后的结果
        int tmpSize = right - left + 1;
        int *tmp = (int *)malloc(tmpSize * sizeof(int));
        // 初始化左子数组和右子数组的起始索引
        int i = left, j = mid + 1, k = 0;
        // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // 将左子数组和右子数组的剩余元素复制到临时数组中
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
        for (k = 0; k < tmpSize; ++k) {
            nums[left + k] = tmp[k];
        }
        // 释放内存
        free(tmp);
    }

    /* 归并排序 */
    void mergeSort(int *nums, int left, int right) {
        // 终止条件
        if (left >= right)
            return; // 当子数组长度为 1 时终止递归
        // 划分阶段
        int mid = (left + right) / 2;    // 计算中点
        mergeSort(nums, left, mid);      // 递归左子数组
        mergeSort(nums, mid + 1, right); // 递归右子数组
        // 合并阶段
        merge(nums, left, mid, right);
    }
    ```

=== "Kotlin"

    ```kotlin title="merge_sort.kt"
    /* 合并左子数组和右子数组 */
    fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
        // 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
        // 创建一个临时数组 tmp ，用于存放合并后的结果
        val tmp = IntArray(right - left + 1)
        // 初始化左子数组和右子数组的起始索引
        var i = left
        var j = mid + 1
        var k = 0
        // 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++]
            else 
                tmp[k++] = nums[j++]
        }
        // 将左子数组和右子数组的剩余元素复制到临时数组中
        while (i <= mid) {
            tmp[k++] = nums[i++]
        }
        while (j <= right) {
            tmp[k++] = nums[j++]
        }
        // 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
        for (l in tmp.indices) {
            nums[left + l] = tmp[l]
        }
    }

    /* 归并排序 */
    fun mergeSort(nums: IntArray, left: Int, right: Int) {
        // 终止条件
        if (left >= right) return  // 当子数组长度为 1 时终止递归
        // 划分阶段
        val mid = (left + right) / 2 // 计算中点
        mergeSort(nums, left, mid) // 递归左子数组
        mergeSort(nums, mid + 1, right) // 递归右子数组
        // 合并阶段
        merge(nums, left, mid, right)
    }
    ```

=== "Ruby"

    ```ruby title="merge_sort.rb"
    ### 合并左子数组和右子数组 ###
    def merge(nums, left, mid, right)
      # 左子数组区间为 [left, mid], 右子数组区间为 [mid+1, right]
      # 创建一个临时数组 tmp，用于存放合并后的结果
      tmp = Array.new(right - left + 1, 0)
      # 初始化左子数组和右子数组的起始索引
      i, j, k = left, mid + 1, 0
      # 当左右子数组都还有元素时，进行比较并将较小的元素复制到临时数组中
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
      # 将左子数组和右子数组的剩余元素复制到临时数组中
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
      # 将临时数组 tmp 中的元素复制回原数组 nums 的对应区间
      (0...tmp.length).each do |k|
        nums[left + k] = tmp[k]
      end
    end

    ### 归并排序 ###
    def merge_sort(nums, left, right)
      # 终止条件
      # 当子数组长度为 1 时终止递归
      return if left >= right
      # 划分阶段
      mid = (left + right) / 2 # 计算中点
      merge_sort(nums, left, mid) # 递归左子数组
      merge_sort(nums, mid + 1, right) # 递归右子数组
      # 合并阶段
      merge(nums, left, mid, right)
    end
    ```

=== "Zig"

    ```zig title="merge_sort.zig"
    // 合并左子数组和右子数组
    // 左子数组区间 [left, mid]
    // 右子数组区间 [mid + 1, right]
    fn merge(nums: []i32, left: usize, mid: usize, right: usize) !void {
        // 初始化辅助数组
        var mem_arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
        defer mem_arena.deinit();
        const mem_allocator = mem_arena.allocator();
        var tmp = try mem_allocator.alloc(i32, right + 1 - left);
        std.mem.copy(i32, tmp, nums[left..right+1]);
        // 左子数组的起始索引和结束索引  
        var leftStart = left - left;
        var leftEnd = mid - left;
        // 右子数组的起始索引和结束索引       
        var rightStart = mid + 1 - left;
        var rightEnd = right - left;
        // i, j 分别指向左子数组、右子数组的首元素
        var i = leftStart;
        var j = rightStart;
        // 通过覆盖原数组 nums 来合并左子数组和右子数组
        var k = left;
        while (k <= right) : (k += 1) {
            // 若“左子数组已全部合并完”，则选取右子数组元素，并且 j++
            if (i > leftEnd) {
                nums[k] = tmp[j];
                j += 1;
            // 否则，若“右子数组已全部合并完”或“左子数组元素 <= 右子数组元素”，则选取左子数组元素，并且 i++
            } else if  (j > rightEnd or tmp[i] <= tmp[j]) {
                nums[k] = tmp[i];
                i += 1;
            // 否则，若“左右子数组都未全部合并完”且“左子数组元素 > 右子数组元素”，则选取右子数组元素，并且 j++
            } else {
                nums[k] = tmp[j];
                j += 1;
            }
        }
    }

    // 归并排序
    fn mergeSort(nums: []i32, left: usize, right: usize) !void {
        // 终止条件
        if (left >= right) return;              // 当子数组长度为 1 时终止递归
        // 划分阶段
        var mid = (left + right) / 2;           // 计算中点
        try mergeSort(nums, left, mid);         // 递归左子数组
        try mergeSort(nums, mid + 1, right);    // 递归右子数组
        // 合并阶段
        try merge(nums, left, mid, right);
    }
    ```

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20merge%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%90%88%E5%B9%B6%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%E5%92%8C%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5Bleft,%20mid%5D,%20%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5Bmid%2B1,%20right%5D%0A%20%20%20%20%23%20%E5%88%9B%E5%BB%BA%E4%B8%80%E4%B8%AA%E4%B8%B4%E6%97%B6%E6%95%B0%E7%BB%84%20tmp%20%EF%BC%8C%E7%94%A8%E4%BA%8E%E5%AD%98%E6%94%BE%E5%90%88%E5%B9%B6%E5%90%8E%E7%9A%84%E7%BB%93%E6%9E%9C%0A%20%20%20%20tmp%20%3D%20%5B0%5D%20*%20%28right%20-%20left%20%2B%201%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%E5%92%8C%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%E7%9A%84%E8%B5%B7%E5%A7%8B%E7%B4%A2%E5%BC%95%0A%20%20%20%20i,%20j,%20k%20%3D%20left,%20mid%20%2B%201,%200%0A%20%20%20%20%23%20%E5%BD%93%E5%B7%A6%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%E9%83%BD%E8%BF%98%E6%9C%89%E5%85%83%E7%B4%A0%E6%97%B6%EF%BC%8C%E8%BF%9B%E8%A1%8C%E6%AF%94%E8%BE%83%E5%B9%B6%E5%B0%86%E8%BE%83%E5%B0%8F%E7%9A%84%E5%85%83%E7%B4%A0%E5%A4%8D%E5%88%B6%E5%88%B0%E4%B8%B4%E6%97%B6%E6%95%B0%E7%BB%84%E4%B8%AD%0A%20%20%20%20while%20i%20%3C%3D%20mid%20and%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3C%3D%20nums%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%E5%B0%86%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%E5%92%8C%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%E7%9A%84%E5%89%A9%E4%BD%99%E5%85%83%E7%B4%A0%E5%A4%8D%E5%88%B6%E5%88%B0%E4%B8%B4%E6%97%B6%E6%95%B0%E7%BB%84%E4%B8%AD%0A%20%20%20%20while%20i%20%3C%3D%20mid%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20while%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%E5%B0%86%E4%B8%B4%E6%97%B6%E6%95%B0%E7%BB%84%20tmp%20%E4%B8%AD%E7%9A%84%E5%85%83%E7%B4%A0%E5%A4%8D%E5%88%B6%E5%9B%9E%E5%8E%9F%E6%95%B0%E7%BB%84%20nums%20%E7%9A%84%E5%AF%B9%E5%BA%94%E5%8C%BA%E9%97%B4%0A%20%20%20%20for%20k%20in%20range%280,%20len%28tmp%29%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bleft%20%2B%20k%5D%20%3D%20tmp%5Bk%5D%0A%0A%0Adef%20merge_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%BD%92%E5%B9%B6%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%20%20%23%20%E5%BD%93%E5%AD%90%E6%95%B0%E7%BB%84%E9%95%BF%E5%BA%A6%E4%B8%BA%201%20%E6%97%B6%E7%BB%88%E6%AD%A2%E9%80%92%E5%BD%92%0A%20%20%20%20%23%20%E5%88%92%E5%88%86%E9%98%B6%E6%AE%B5%0A%20%20%20%20mid%20%3D%20%28left%20%2B%20right%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%0A%20%20%20%20merge_sort%28nums,%20left,%20mid%29%20%20%23%20%E9%80%92%E5%BD%92%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%0A%20%20%20%20merge_sort%28nums,%20mid%20%2B%201,%20right%29%20%20%23%20%E9%80%92%E5%BD%92%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%0A%20%20%20%20%23%20%E5%90%88%E5%B9%B6%E9%98%B6%E6%AE%B5%0A%20%20%20%20merge%28nums,%20left,%20mid,%20right%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B7,%203,%202,%206,%200,%201,%205,%204%5D%0A%20%20%20%20merge_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E5%BD%92%E5%B9%B6%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20merge%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%90%88%E5%B9%B6%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%E5%92%8C%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5Bleft,%20mid%5D,%20%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%E5%8C%BA%E9%97%B4%E4%B8%BA%20%5Bmid%2B1,%20right%5D%0A%20%20%20%20%23%20%E5%88%9B%E5%BB%BA%E4%B8%80%E4%B8%AA%E4%B8%B4%E6%97%B6%E6%95%B0%E7%BB%84%20tmp%20%EF%BC%8C%E7%94%A8%E4%BA%8E%E5%AD%98%E6%94%BE%E5%90%88%E5%B9%B6%E5%90%8E%E7%9A%84%E7%BB%93%E6%9E%9C%0A%20%20%20%20tmp%20%3D%20%5B0%5D%20*%20%28right%20-%20left%20%2B%201%29%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%E5%92%8C%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%E7%9A%84%E8%B5%B7%E5%A7%8B%E7%B4%A2%E5%BC%95%0A%20%20%20%20i,%20j,%20k%20%3D%20left,%20mid%20%2B%201,%200%0A%20%20%20%20%23%20%E5%BD%93%E5%B7%A6%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%E9%83%BD%E8%BF%98%E6%9C%89%E5%85%83%E7%B4%A0%E6%97%B6%EF%BC%8C%E8%BF%9B%E8%A1%8C%E6%AF%94%E8%BE%83%E5%B9%B6%E5%B0%86%E8%BE%83%E5%B0%8F%E7%9A%84%E5%85%83%E7%B4%A0%E5%A4%8D%E5%88%B6%E5%88%B0%E4%B8%B4%E6%97%B6%E6%95%B0%E7%BB%84%E4%B8%AD%0A%20%20%20%20while%20i%20%3C%3D%20mid%20and%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3C%3D%20nums%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%E5%B0%86%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%E5%92%8C%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%E7%9A%84%E5%89%A9%E4%BD%99%E5%85%83%E7%B4%A0%E5%A4%8D%E5%88%B6%E5%88%B0%E4%B8%B4%E6%97%B6%E6%95%B0%E7%BB%84%E4%B8%AD%0A%20%20%20%20while%20i%20%3C%3D%20mid%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20while%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%E5%B0%86%E4%B8%B4%E6%97%B6%E6%95%B0%E7%BB%84%20tmp%20%E4%B8%AD%E7%9A%84%E5%85%83%E7%B4%A0%E5%A4%8D%E5%88%B6%E5%9B%9E%E5%8E%9F%E6%95%B0%E7%BB%84%20nums%20%E7%9A%84%E5%AF%B9%E5%BA%94%E5%8C%BA%E9%97%B4%0A%20%20%20%20for%20k%20in%20range%280,%20len%28tmp%29%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bleft%20%2B%20k%5D%20%3D%20tmp%5Bk%5D%0A%0A%0Adef%20merge_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%BD%92%E5%B9%B6%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E7%BB%88%E6%AD%A2%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%20%20%23%20%E5%BD%93%E5%AD%90%E6%95%B0%E7%BB%84%E9%95%BF%E5%BA%A6%E4%B8%BA%201%20%E6%97%B6%E7%BB%88%E6%AD%A2%E9%80%92%E5%BD%92%0A%20%20%20%20%23%20%E5%88%92%E5%88%86%E9%98%B6%E6%AE%B5%0A%20%20%20%20mid%20%3D%20%28left%20%2B%20right%29%20//%202%20%20%23%20%E8%AE%A1%E7%AE%97%E4%B8%AD%E7%82%B9%0A%20%20%20%20merge_sort%28nums,%20left,%20mid%29%20%20%23%20%E9%80%92%E5%BD%92%E5%B7%A6%E5%AD%90%E6%95%B0%E7%BB%84%0A%20%20%20%20merge_sort%28nums,%20mid%20%2B%201,%20right%29%20%20%23%20%E9%80%92%E5%BD%92%E5%8F%B3%E5%AD%90%E6%95%B0%E7%BB%84%0A%20%20%20%20%23%20%E5%90%88%E5%B9%B6%E9%98%B6%E6%AE%B5%0A%20%20%20%20merge%28nums,%20left,%20mid,%20right%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B7,%203,%202,%206,%200,%201,%205,%204%5D%0A%20%20%20%20merge_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E5%BD%92%E5%B9%B6%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%90%8E%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

## 11.6.2 &nbsp; Algorithm characteristics

- **Time complexity of $O(n \log n)$, non-adaptive sort**: The division creates a recursion tree of height $\log n$, with each layer merging a total of $n$ operations, resulting in an overall time complexity of $O(n \log n)$.
- **Space complexity of $O(n)$, non-in-place sort**: The recursion depth is $\log n$, using $O(\log n)$ stack frame space. The merging operation requires auxiliary arrays, using an additional space of $O(n)$.
- **Stable sort**: During the merging process, the order of equal elements remains unchanged.

## 11.6.3 &nbsp; Linked List sorting

For linked lists, merge sort has significant advantages over other sorting algorithms, **optimizing the space complexity of the linked list sorting task to $O(1)$**.

- **Divide phase**: "Iteration" can be used instead of "recursion" to perform the linked list division work, thus saving the stack frame space used by recursion.
- **Merge phase**: In linked lists, node addition and deletion operations can be achieved by changing references (pointers), so no extra lists need to be created during the merge phase (combining two short ordered lists into one long ordered list).

Detailed implementation details are complex, and interested readers can consult related materials for learning.
