---
comments: true
---

# 11.6 &nbsp; 合併排序

<u>合併排序（merge sort）</u>採用分治策略，分為圖 11-10 所示的「分割」與「合併」兩個階段。

1. **分割階段**：以遞迴方式反覆從中點分割陣列，將長陣列的排序問題轉為短陣列的排序問題。
2. **合併階段**：子陣列長度為 1 時停止分割，開始合併。將左、右兩個較短的已排序陣列合併成一個較長的已排序陣列，重複直到完成排序。

![合併排序的分割與合併階段](merge_sort.assets/merge_sort_overview.svg){ class="animation-figure" }

<p align="center"> 圖 11-10 &nbsp; 合併排序的分割與合併階段 </p>

## 11.6.1 &nbsp; 演算法流程

如圖 11-11 所示，「分割階段」由上而下遞迴地將每個陣列從中點切成兩個子陣列。

1. 計算陣列的中點 `mid`，再遞迴分割左子陣列（區間 `[left, mid]`）與右子陣列（區間 `[mid + 1, right]`）。
2. 遞迴執行步驟 `1.`，直到子陣列區間的長度為 1 時停止。

「合併階段」由下而上，將左、右子陣列合併成一個已排序陣列。請留意，合併是從長度為 1 的子陣列開始，因此每次參與合併的子陣列都已排好。

=== "<1>"
    ![合併排序的步驟](merge_sort.assets/merge_sort_step1.svg){ class="animation-figure" }

=== "<2>"
    ![merge_sort_step2](merge_sort.assets/merge_sort_step2.svg){ class="animation-figure" }

=== "<3>"
    ![merge_sort_step3](merge_sort.assets/merge_sort_step3.svg){ class="animation-figure" }

=== "<4>"
    ![merge_sort_step4](merge_sort.assets/merge_sort_step4.svg){ class="animation-figure" }

=== "<5>"
    ![merge_sort_step5](merge_sort.assets/merge_sort_step5.svg){ class="animation-figure" }

=== "<6>"
    ![merge_sort_step6](merge_sort.assets/merge_sort_step6.svg){ class="animation-figure" }

=== "<7>"
    ![merge_sort_step7](merge_sort.assets/merge_sort_step7.svg){ class="animation-figure" }

=== "<8>"
    ![merge_sort_step8](merge_sort.assets/merge_sort_step8.svg){ class="animation-figure" }

=== "<9>"
    ![merge_sort_step9](merge_sort.assets/merge_sort_step9.svg){ class="animation-figure" }

=== "<10>"
    ![merge_sort_step10](merge_sort.assets/merge_sort_step10.svg){ class="animation-figure" }

<p align="center"> 圖 11-11 &nbsp; 合併排序的步驟 </p>

仔細觀察會發現，合併排序的遞迴順序與二元樹的後序走訪相同。

- **後序走訪**：先遞迴走訪左子樹，再遞迴走訪右子樹，最後處理根節點。
- **合併排序**：先遞迴處理左子陣列，再遞迴處理右子陣列，最後合併兩者。

合併排序的實作如下。請留意，`nums` 中待合併的區間為 `[left, right]`，`tmp` 中對應的區間則為 `[0, right - left]`。

=== "Python"

    ```python title="merge_sort.py"
    def merge(nums: list[int], left: int, mid: int, right: int):
        """合併左、右子陣列"""
        # 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
        # 建立暫存陣列 tmp，用來存放合併結果
        tmp = [0] * (right - left + 1)
        # 設定左、右子陣列的起始索引
        i, j, k = left, mid + 1, 0
        # 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
        while i <= mid and j <= right:
            if nums[i] <= nums[j]:
                tmp[k] = nums[i]
                i += 1
            else:
                tmp[k] = nums[j]
                j += 1
            k += 1
        # 將左、右子陣列中剩餘的元素複製到暫存陣列
        while i <= mid:
            tmp[k] = nums[i]
            i += 1
            k += 1
        while j <= right:
            tmp[k] = nums[j]
            j += 1
            k += 1
        # 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
        for k in range(0, len(tmp)):
            nums[left + k] = tmp[k]

    def merge_sort(nums: list[int], left: int, right: int):
        """合併排序"""
        # 終止條件
        if left >= right:
            return  # 當子陣列的長度為 1 時，終止遞迴
        # 分割階段
        mid = (left + right) // 2 # 計算中點
        merge_sort(nums, left, mid)  # 遞迴處理左子陣列
        merge_sort(nums, mid + 1, right)  # 遞迴處理右子陣列
        # 合併階段
        merge(nums, left, mid, right)
    ```

=== "C++"

    ```cpp title="merge_sort.cpp"
    /* 合併左、右子陣列 */
    void merge(vector<int> &nums, int left, int mid, int right) {
        // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
        // 建立暫存陣列 tmp，用來存放合併結果
        vector<int> tmp(right - left + 1);
        // 設定左、右子陣列的起始索引
        int i = left, j = mid + 1, k = 0;
        // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 將左、右子陣列中剩餘的元素複製到暫存陣列
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
        for (k = 0; k < tmp.size(); k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* 合併排序 */
    void mergeSort(vector<int> &nums, int left, int right) {
        // 終止條件
        if (left >= right)
            return; // 當子陣列的長度為 1 時，終止遞迴
        // 分割階段
        int mid = left + (right - left) / 2;    // 計算中點
        mergeSort(nums, left, mid);      // 遞迴處理左子陣列
        mergeSort(nums, mid + 1, right); // 遞迴處理右子陣列
        // 合併階段
        merge(nums, left, mid, right);
    }
    ```

=== "Java"

    ```java title="merge_sort.java"
    /* 合併左、右子陣列 */
    void merge(int[] nums, int left, int mid, int right) {
        // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
        // 建立暫存陣列 tmp，用來存放合併結果
        int[] tmp = new int[right - left + 1];
        // 設定左、右子陣列的起始索引
        int i = left, j = mid + 1, k = 0;
        // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 將左、右子陣列中剩餘的元素複製到暫存陣列
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* 合併排序 */
    void mergeSort(int[] nums, int left, int right) {
        // 終止條件
        if (left >= right)
            return; // 當子陣列的長度為 1 時，終止遞迴
        // 分割階段
        int mid = left + (right - left) / 2; // 計算中點
        mergeSort(nums, left, mid); // 遞迴處理左子陣列
        mergeSort(nums, mid + 1, right); // 遞迴處理右子陣列
        // 合併階段
        merge(nums, left, mid, right);
    }
    ```

=== "C#"

    ```csharp title="merge_sort.cs"
    /* 合併左、右子陣列 */
    void Merge(int[] nums, int left, int mid, int right) {
        // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
        // 建立暫存陣列 tmp，用來存放合併結果
        int[] tmp = new int[right - left + 1];
        // 設定左、右子陣列的起始索引
        int i = left, j = mid + 1, k = 0;
        // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 將左、右子陣列中剩餘的元素複製到暫存陣列
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
        for (k = 0; k < tmp.Length; ++k) {
            nums[left + k] = tmp[k];
        }
    }

    /* 合併排序 */
    void MergeSort(int[] nums, int left, int right) {
        // 終止條件
        if (left >= right) return;       // 當子陣列的長度為 1 時，終止遞迴
        // 分割階段
        int mid = left + (right - left) / 2;    // 計算中點
        MergeSort(nums, left, mid);      // 遞迴處理左子陣列
        MergeSort(nums, mid + 1, right); // 遞迴處理右子陣列
        // 合併階段
        Merge(nums, left, mid, right);
    }
    ```

=== "Go"

    ```go title="merge_sort.go"
    /* 合併左、右子陣列 */
    func merge(nums []int, left, mid, right int) {
        // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
        // 建立暫存陣列 tmp，用來存放合併結果
        tmp := make([]int, right-left+1)
        // 設定左、右子陣列的起始索引
        i, j, k := left, mid+1, 0
        // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
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
        // 將左、右子陣列中剩餘的元素複製到暫存陣列
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
        // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
        for k := 0; k < len(tmp); k++ {
            nums[left+k] = tmp[k]
        }
    }

    /* 合併排序 */
    func mergeSort(nums []int, left, right int) {
        // 終止條件
        if left >= right {
            return
        }
        // 分割階段
        mid := left + (right - left) / 2
        mergeSort(nums, left, mid)
        mergeSort(nums, mid+1, right)
        // 合併階段
        merge(nums, left, mid, right)
    }
    ```

=== "Swift"

    ```swift title="merge_sort.swift"
    /* 合併左、右子陣列 */
    func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
        // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
        // 建立暫存陣列 tmp，用來存放合併結果
        var tmp = Array(repeating: 0, count: right - left + 1)
        // 設定左、右子陣列的起始索引
        var i = left, j = mid + 1, k = 0
        // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
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
        // 將左、右子陣列中剩餘的元素複製到暫存陣列
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
        // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
        for k in tmp.indices {
            nums[left + k] = tmp[k]
        }
    }

    /* 合併排序 */
    func mergeSort(nums: inout [Int], left: Int, right: Int) {
        // 終止條件
        if left >= right { // 當子陣列的長度為 1 時，終止遞迴
            return
        }
        // 分割階段
        let mid = left + (right - left) / 2 // 計算中點
        mergeSort(nums: &nums, left: left, right: mid) // 遞迴處理左子陣列
        mergeSort(nums: &nums, left: mid + 1, right: right) // 遞迴處理右子陣列
        // 合併階段
        merge(nums: &nums, left: left, mid: mid, right: right)
    }
    ```

=== "JS"

    ```javascript title="merge_sort.js"
    /* 合併左、右子陣列 */
    function merge(nums, left, mid, right) {
        // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
        // 建立暫存陣列 tmp，用來存放合併結果
        const tmp = new Array(right - left + 1);
        // 設定左、右子陣列的起始索引
        let i = left,
            j = mid + 1,
            k = 0;
        // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // 將左、右子陣列中剩餘的元素複製到暫存陣列
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* 合併排序 */
    function mergeSort(nums, left, right) {
        // 終止條件
        if (left >= right) return; // 當子陣列的長度為 1 時，終止遞迴
        // 分割階段
        let mid = Math.floor(left + (right - left) / 2); // 計算中點
        mergeSort(nums, left, mid); // 遞迴處理左子陣列
        mergeSort(nums, mid + 1, right); // 遞迴處理右子陣列
        // 合併階段
        merge(nums, left, mid, right);
    }
    ```

=== "TS"

    ```typescript title="merge_sort.ts"
    /* 合併左、右子陣列 */
    function merge(nums: number[], left: number, mid: number, right: number): void {
        // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
        // 建立暫存陣列 tmp，用來存放合併結果
        const tmp = new Array(right - left + 1);
        // 設定左、右子陣列的起始索引
        let i = left,
            j = mid + 1,
            k = 0;
        // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // 將左、右子陣列中剩餘的元素複製到暫存陣列
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* 合併排序 */
    function mergeSort(nums: number[], left: number, right: number): void {
        // 終止條件
        if (left >= right) return; // 當子陣列的長度為 1 時，終止遞迴
        // 分割階段
        let mid = Math.floor(left + (right - left) / 2); // 計算中點
        mergeSort(nums, left, mid); // 遞迴處理左子陣列
        mergeSort(nums, mid + 1, right); // 遞迴處理右子陣列
        // 合併階段
        merge(nums, left, mid, right);
    }
    ```

=== "Dart"

    ```dart title="merge_sort.dart"
    /* 合併左、右子陣列 */
    void merge(List<int> nums, int left, int mid, int right) {
      // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
      // 建立暫存陣列 tmp，用來存放合併結果
      List<int> tmp = List.filled(right - left + 1, 0);
      // 設定左、右子陣列的起始索引
      int i = left, j = mid + 1, k = 0;
      // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
      while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
          tmp[k++] = nums[i++];
        else
          tmp[k++] = nums[j++];
      }
      // 將左、右子陣列中剩餘的元素複製到暫存陣列
      while (i <= mid) {
        tmp[k++] = nums[i++];
      }
      while (j <= right) {
        tmp[k++] = nums[j++];
      }
      // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
      for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
      }
    }

    /* 合併排序 */
    void mergeSort(List<int> nums, int left, int right) {
      // 終止條件
      if (left >= right) return; // 當子陣列的長度為 1 時，終止遞迴
      // 分割階段
      int mid = left + (right - left) ~/ 2; // 計算中點
      mergeSort(nums, left, mid); // 遞迴處理左子陣列
      mergeSort(nums, mid + 1, right); // 遞迴處理右子陣列
      // 合併階段
      merge(nums, left, mid, right);
    }
    ```

=== "Rust"

    ```rust title="merge_sort.rs"
    /* 合併左、右子陣列 */
    fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
        // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
        // 建立暫存陣列 tmp，用來存放合併結果
        let tmp_size = right - left + 1;
        let mut tmp = vec![0; tmp_size];
        // 設定左、右子陣列的起始索引
        let (mut i, mut j, mut k) = (left, mid + 1, 0);
        // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
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
        // 將左、右子陣列中剩餘的元素複製到暫存陣列
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
        // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
        for k in 0..tmp_size {
            nums[left + k] = tmp[k];
        }
    }

    /* 合併排序 */
    fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
        // 終止條件
        if left >= right {
            return; // 當子陣列的長度為 1 時，終止遞迴
        }

        // 分割階段
        let mid = left + (right - left) / 2; // 計算中點
        merge_sort(nums, left, mid); // 遞迴處理左子陣列
        merge_sort(nums, mid + 1, right); // 遞迴處理右子陣列

        // 合併階段
        merge(nums, left, mid, right);
    }
    ```

=== "C"

    ```c title="merge_sort.c"
    /* 合併左、右子陣列 */
    void merge(int *nums, int left, int mid, int right) {
        // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
        // 建立暫存陣列 tmp，用來存放合併結果
        int tmpSize = right - left + 1;
        int *tmp = (int *)malloc(tmpSize * sizeof(int));
        // 設定左、右子陣列的起始索引
        int i = left, j = mid + 1, k = 0;
        // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // 將左、右子陣列中剩餘的元素複製到暫存陣列
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
        for (k = 0; k < tmpSize; ++k) {
            nums[left + k] = tmp[k];
        }
        // 釋放記憶體
        free(tmp);
    }

    /* 合併排序 */
    void mergeSort(int *nums, int left, int right) {
        // 終止條件
        if (left >= right)
            return; // 當子陣列的長度為 1 時，終止遞迴
        // 分割階段
        int mid = left + (right - left) / 2;    // 計算中點
        mergeSort(nums, left, mid);      // 遞迴處理左子陣列
        mergeSort(nums, mid + 1, right); // 遞迴處理右子陣列
        // 合併階段
        merge(nums, left, mid, right);
    }
    ```

=== "Kotlin"

    ```kotlin title="merge_sort.kt"
    /* 合併左、右子陣列 */
    fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
        // 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
        // 建立暫存陣列 tmp，用來存放合併結果
        val tmp = IntArray(right - left + 1)
        // 設定左、右子陣列的起始索引
        var i = left
        var j = mid + 1
        var k = 0
        // 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++]
            else
                tmp[k++] = nums[j++]
        }
        // 將左、右子陣列中剩餘的元素複製到暫存陣列
        while (i <= mid) {
            tmp[k++] = nums[i++]
        }
        while (j <= right) {
            tmp[k++] = nums[j++]
        }
        // 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
        for (l in tmp.indices) {
            nums[left + l] = tmp[l]
        }
    }

    /* 合併排序 */
    fun mergeSort(nums: IntArray, left: Int, right: Int) {
        // 終止條件
        if (left >= right) return  // 當子陣列的長度為 1 時，終止遞迴
        // 分割階段
        val mid = left + (right - left) / 2 // 計算中點
        mergeSort(nums, left, mid) // 遞迴處理左子陣列
        mergeSort(nums, mid + 1, right) // 遞迴處理右子陣列
        // 合併階段
        merge(nums, left, mid, right)
    }
    ```

=== "Ruby"

    ```ruby title="merge_sort.rb"
    ### 合併左、右子陣列 ###
    def merge(nums, left, mid, right)
      # 左子陣列的區間為 [left, mid]，右子陣列的區間為 [mid+1, right]
      # 建立暫存陣列 tmp，用來存放合併結果
      tmp = Array.new(right - left + 1, 0)
      # 設定左、右子陣列的起始索引
      i, j, k = left, mid + 1, 0
      # 當左、右子陣列都還有元素時，比較兩邊的元素，將較小的元素複製到暫存陣列
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
      # 將左、右子陣列中剩餘的元素複製到暫存陣列
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
      # 將暫存陣列 tmp 的元素複製回原陣列 nums 的對應區間
      (0...tmp.length).each do |k|
        nums[left + k] = tmp[k]
      end
    end

    ### 合併排序 ###
    def merge_sort(nums, left, right)
      # 終止條件
      # 當子陣列的長度為 1 時，終止遞迴
      return if left >= right
      # 分割階段
      mid = left + (right - left) / 2 # 計算中點
      merge_sort(nums, left, mid) # 遞迴處理左子陣列
      merge_sort(nums, mid + 1, right) # 遞迴處理右子陣列
      # 合併階段
      merge(nums, left, mid, right)
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20merge%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%90%88%E4%BD%B5%E5%B7%A6%E3%80%81%E5%8F%B3%E5%AD%90%E9%99%A3%E5%88%97%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E5%AD%90%E9%99%A3%E5%88%97%E7%9A%84%E5%8D%80%E9%96%93%E7%82%BA%20%5Bleft,%20mid%5D%EF%BC%8C%E5%8F%B3%E5%AD%90%E9%99%A3%E5%88%97%E7%9A%84%E5%8D%80%E9%96%93%E7%82%BA%20%5Bmid%2B1,%20right%5D%0A%20%20%20%20%23%20%E5%BB%BA%E7%AB%8B%E6%9A%AB%E5%AD%98%E9%99%A3%E5%88%97%20tmp%EF%BC%8C%E7%94%A8%E4%BE%86%E5%AD%98%E6%94%BE%E5%90%88%E4%BD%B5%E7%B5%90%E6%9E%9C%0A%20%20%20%20tmp%20%3D%20%5B0%5D%20%2A%20%28right%20-%20left%20%2B%201%29%0A%20%20%20%20%23%20%E8%A8%AD%E5%AE%9A%E5%B7%A6%E3%80%81%E5%8F%B3%E5%AD%90%E9%99%A3%E5%88%97%E7%9A%84%E8%B5%B7%E5%A7%8B%E7%B4%A2%E5%BC%95%0A%20%20%20%20i,%20j,%20k%20%3D%20left,%20mid%20%2B%201,%200%0A%20%20%20%20%23%20%E7%95%B6%E5%B7%A6%E3%80%81%E5%8F%B3%E5%AD%90%E9%99%A3%E5%88%97%E9%83%BD%E9%82%84%E6%9C%89%E5%85%83%E7%B4%A0%E6%99%82%EF%BC%8C%E6%AF%94%E8%BC%83%E5%85%A9%E9%82%8A%E7%9A%84%E5%85%83%E7%B4%A0%EF%BC%8C%E5%B0%87%E8%BC%83%E5%B0%8F%E7%9A%84%E5%85%83%E7%B4%A0%E8%A4%87%E8%A3%BD%E5%88%B0%E6%9A%AB%E5%AD%98%E9%99%A3%E5%88%97%0A%20%20%20%20while%20i%20%3C%3D%20mid%20and%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3C%3D%20nums%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%E5%B0%87%E5%B7%A6%E3%80%81%E5%8F%B3%E5%AD%90%E9%99%A3%E5%88%97%E4%B8%AD%E5%89%A9%E9%A4%98%E7%9A%84%E5%85%83%E7%B4%A0%E8%A4%87%E8%A3%BD%E5%88%B0%E6%9A%AB%E5%AD%98%E9%99%A3%E5%88%97%0A%20%20%20%20while%20i%20%3C%3D%20mid%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20while%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%E5%B0%87%E6%9A%AB%E5%AD%98%E9%99%A3%E5%88%97%20tmp%20%E7%9A%84%E5%85%83%E7%B4%A0%E8%A4%87%E8%A3%BD%E5%9B%9E%E5%8E%9F%E9%99%A3%E5%88%97%20nums%20%E7%9A%84%E5%B0%8D%E6%87%89%E5%8D%80%E9%96%93%0A%20%20%20%20for%20k%20in%20range%280,%20len%28tmp%29%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bleft%20%2B%20k%5D%20%3D%20tmp%5Bk%5D%0A%0A%0Adef%20merge_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%90%88%E4%BD%B5%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E7%B5%82%E6%AD%A2%E6%A2%9D%E4%BB%B6%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%20%20%23%20%E7%95%B6%E5%AD%90%E9%99%A3%E5%88%97%E7%9A%84%E9%95%B7%E5%BA%A6%E7%82%BA%201%20%E6%99%82%EF%BC%8C%E7%B5%82%E6%AD%A2%E9%81%9E%E8%BF%B4%0A%20%20%20%20%23%20%E5%88%86%E5%89%B2%E9%9A%8E%E6%AE%B5%0A%20%20%20%20mid%20%3D%20%28left%20%2B%20right%29%20//%202%20%20%23%20%E8%A8%88%E7%AE%97%E4%B8%AD%E9%BB%9E%0A%20%20%20%20merge_sort%28nums,%20left,%20mid%29%20%20%23%20%E9%81%9E%E8%BF%B4%E8%99%95%E7%90%86%E5%B7%A6%E5%AD%90%E9%99%A3%E5%88%97%0A%20%20%20%20merge_sort%28nums,%20mid%20%2B%201,%20right%29%20%20%23%20%E9%81%9E%E8%BF%B4%E8%99%95%E7%90%86%E5%8F%B3%E5%AD%90%E9%99%A3%E5%88%97%0A%20%20%20%20%23%20%E5%90%88%E4%BD%B5%E9%9A%8E%E6%AE%B5%0A%20%20%20%20merge%28nums,%20left,%20mid,%20right%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B7,%203,%202,%206,%200,%201,%205,%204%5D%0A%20%20%20%20merge_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E5%90%88%E4%BD%B5%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%BE%8C%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20merge%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%90%88%E4%BD%B5%E5%B7%A6%E3%80%81%E5%8F%B3%E5%AD%90%E9%99%A3%E5%88%97%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E5%AD%90%E9%99%A3%E5%88%97%E7%9A%84%E5%8D%80%E9%96%93%E7%82%BA%20%5Bleft,%20mid%5D%EF%BC%8C%E5%8F%B3%E5%AD%90%E9%99%A3%E5%88%97%E7%9A%84%E5%8D%80%E9%96%93%E7%82%BA%20%5Bmid%2B1,%20right%5D%0A%20%20%20%20%23%20%E5%BB%BA%E7%AB%8B%E6%9A%AB%E5%AD%98%E9%99%A3%E5%88%97%20tmp%EF%BC%8C%E7%94%A8%E4%BE%86%E5%AD%98%E6%94%BE%E5%90%88%E4%BD%B5%E7%B5%90%E6%9E%9C%0A%20%20%20%20tmp%20%3D%20%5B0%5D%20%2A%20%28right%20-%20left%20%2B%201%29%0A%20%20%20%20%23%20%E8%A8%AD%E5%AE%9A%E5%B7%A6%E3%80%81%E5%8F%B3%E5%AD%90%E9%99%A3%E5%88%97%E7%9A%84%E8%B5%B7%E5%A7%8B%E7%B4%A2%E5%BC%95%0A%20%20%20%20i,%20j,%20k%20%3D%20left,%20mid%20%2B%201,%200%0A%20%20%20%20%23%20%E7%95%B6%E5%B7%A6%E3%80%81%E5%8F%B3%E5%AD%90%E9%99%A3%E5%88%97%E9%83%BD%E9%82%84%E6%9C%89%E5%85%83%E7%B4%A0%E6%99%82%EF%BC%8C%E6%AF%94%E8%BC%83%E5%85%A9%E9%82%8A%E7%9A%84%E5%85%83%E7%B4%A0%EF%BC%8C%E5%B0%87%E8%BC%83%E5%B0%8F%E7%9A%84%E5%85%83%E7%B4%A0%E8%A4%87%E8%A3%BD%E5%88%B0%E6%9A%AB%E5%AD%98%E9%99%A3%E5%88%97%0A%20%20%20%20while%20i%20%3C%3D%20mid%20and%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3C%3D%20nums%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%E5%B0%87%E5%B7%A6%E3%80%81%E5%8F%B3%E5%AD%90%E9%99%A3%E5%88%97%E4%B8%AD%E5%89%A9%E9%A4%98%E7%9A%84%E5%85%83%E7%B4%A0%E8%A4%87%E8%A3%BD%E5%88%B0%E6%9A%AB%E5%AD%98%E9%99%A3%E5%88%97%0A%20%20%20%20while%20i%20%3C%3D%20mid%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20while%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%E5%B0%87%E6%9A%AB%E5%AD%98%E9%99%A3%E5%88%97%20tmp%20%E7%9A%84%E5%85%83%E7%B4%A0%E8%A4%87%E8%A3%BD%E5%9B%9E%E5%8E%9F%E9%99%A3%E5%88%97%20nums%20%E7%9A%84%E5%B0%8D%E6%87%89%E5%8D%80%E9%96%93%0A%20%20%20%20for%20k%20in%20range%280,%20len%28tmp%29%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bleft%20%2B%20k%5D%20%3D%20tmp%5Bk%5D%0A%0A%0Adef%20merge_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%90%88%E4%BD%B5%E6%8E%92%E5%BA%8F%22%22%22%0A%20%20%20%20%23%20%E7%B5%82%E6%AD%A2%E6%A2%9D%E4%BB%B6%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%20%20%23%20%E7%95%B6%E5%AD%90%E9%99%A3%E5%88%97%E7%9A%84%E9%95%B7%E5%BA%A6%E7%82%BA%201%20%E6%99%82%EF%BC%8C%E7%B5%82%E6%AD%A2%E9%81%9E%E8%BF%B4%0A%20%20%20%20%23%20%E5%88%86%E5%89%B2%E9%9A%8E%E6%AE%B5%0A%20%20%20%20mid%20%3D%20%28left%20%2B%20right%29%20//%202%20%20%23%20%E8%A8%88%E7%AE%97%E4%B8%AD%E9%BB%9E%0A%20%20%20%20merge_sort%28nums,%20left,%20mid%29%20%20%23%20%E9%81%9E%E8%BF%B4%E8%99%95%E7%90%86%E5%B7%A6%E5%AD%90%E9%99%A3%E5%88%97%0A%20%20%20%20merge_sort%28nums,%20mid%20%2B%201,%20right%29%20%20%23%20%E9%81%9E%E8%BF%B4%E8%99%95%E7%90%86%E5%8F%B3%E5%AD%90%E9%99%A3%E5%88%97%0A%20%20%20%20%23%20%E5%90%88%E4%BD%B5%E9%9A%8E%E6%AE%B5%0A%20%20%20%20merge%28nums,%20left,%20mid,%20right%29%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B7,%203,%202,%206,%200,%201,%205,%204%5D%0A%20%20%20%20merge_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E5%90%88%E4%BD%B5%E6%8E%92%E5%BA%8F%E5%AE%8C%E6%88%90%E5%BE%8C%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

## 11.6.2 &nbsp; 演算法特性

- **時間複雜度為 $O(n \log n)$、不具調適性的排序**：分割後會形成高度為 $\log n$ 的遞迴樹，每一層合併所需的操作總數為 $n$，因此整體時間複雜度為 $O(n \log n)$。
- **空間複雜度為 $O(n)$、非原地排序**：遞迴深度為 $\log n$，需要 $O(\log n)$ 的呼叫堆疊空間。合併時需要輔助陣列，另占用 $O(n)$ 空間。
- **穩定排序**：合併時，相等元素的先後順序維持不變。

## 11.6.3 &nbsp; 鏈結串列排序

要將鏈結串列排序時，合併排序比其他排序演算法更有優勢，**它能將鏈結串列排序的空間複雜度降到 $O(1)$**。

- **分割階段**：可改用「迭代」來分割鏈結串列，省去「遞迴」所需的呼叫堆疊空間。
- **合併階段**：在鏈結串列中，新增與刪除節點只需改變參照（指標）。因此，將兩個較短的已排序鏈結串列合併成一個較長的已排序鏈結串列時，無須額外建立串列。

實作細節較為複雜，有興趣的讀者可以參閱相關資料。
