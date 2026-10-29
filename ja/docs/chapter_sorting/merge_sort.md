---
comments: true
---

# 11.6 &nbsp; マージソート

<u>マージソート（merge sort）</u>は分割統治法に基づくソートアルゴリズムで、図 11-10 の「分割」と「結合」の段階からなります。

1. **分割の段階**：再帰的に配列を中点で分け続け、長い配列のソート問題を短い配列のソート問題へ変換します。
2. **結合の段階**：部分配列の長さが 1 になったら分割を終了して結合を始めます。左右の短い整列済み配列を一つの長い整列済み配列へ結合し、最後まで続けます。

![マージソートの分割と結合の段階](merge_sort.assets/merge_sort_overview.png){ class="animation-figure" }

<p align="center"> 図 11-10 &nbsp; マージソートの分割と結合の段階 </p>

## 11.6.1 &nbsp; アルゴリズムの流れ

図 11-11 のように、分割の段階では上から下へ再帰しながら、配列を中点で二つの部分配列に分けます。

1. 中点 `mid` を計算し、左の部分配列（区間 `[left, mid]`）と右の部分配列（区間 `[mid + 1, right]`）を再帰的に分割します。
2. 手順 `1.` を再帰的に繰り返し、部分配列の区間の長さが 1 になったら終了します。

結合の段階では、下から上へ左右の部分配列を一つの整列済み配列に結合します。長さ 1 の部分配列から結合を始めるので、この段階の各部分配列はすべて整列済みであることに注意してください。

=== "<1>"
    ![マージソートの手順](merge_sort.assets/merge_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![マージソートの手順 2](merge_sort.assets/merge_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![マージソートの手順 3](merge_sort.assets/merge_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![マージソートの手順 4](merge_sort.assets/merge_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![マージソートの手順 5](merge_sort.assets/merge_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![マージソートの手順 6](merge_sort.assets/merge_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![マージソートの手順 7](merge_sort.assets/merge_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![マージソートの手順 8](merge_sort.assets/merge_sort_step8.png){ class="animation-figure" }

=== "<9>"
    ![マージソートの手順 9](merge_sort.assets/merge_sort_step9.png){ class="animation-figure" }

=== "<10>"
    ![マージソートの手順 10](merge_sort.assets/merge_sort_step10.png){ class="animation-figure" }

<p align="center"> 図 11-11 &nbsp; マージソートの手順 </p>

マージソートの再帰の順序は、二分木の帰りがけ順走査と同じです。

- **帰りがけ順走査**：まず左の部分木を再帰的に処理し、次に右の部分木を処理して、最後に根ノードを処理します。
- **マージソート**：まず左の部分配列を再帰的に処理し、次に右の部分配列を処理して、最後に結合します。

実装は次のとおりです。結合する `nums` の区間は `[left, right]` ですが、`tmp` の対応する区間は `[0, right - left]` である点に注意してください。

=== "Python"

    ```python title="merge_sort.py"
    def merge(nums: list[int], left: int, mid: int, right: int):
        """左部分配列と右部分配列をマージする"""
        # 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
        # マージ後の結果を格納する一時配列 tmp を作成する
        tmp = [0] * (right - left + 1)
        # 左部分配列と右部分配列の開始インデックスを初期化する
        i, j, k = left, mid + 1, 0
        # 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
        while i <= mid and j <= right:
            if nums[i] <= nums[j]:
                tmp[k] = nums[i]
                i += 1
            else:
                tmp[k] = nums[j]
                j += 1
            k += 1
        # 左部分配列と右部分配列の残りの要素を一時配列にコピーする
        while i <= mid:
            tmp[k] = nums[i]
            i += 1
            k += 1
        while j <= right:
            tmp[k] = nums[j]
            j += 1
            k += 1
        # 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
        for k in range(0, len(tmp)):
            nums[left + k] = tmp[k]

    def merge_sort(nums: list[int], left: int, right: int):
        """マージソート"""
        # 終了条件
        if left >= right:
            return  # 部分配列の長さが 1 になったら再帰を終了する
        # 分割段階
        mid = (left + right) // 2 # 中央を計算する
        merge_sort(nums, left, mid)  # 左部分配列を再帰的に処理する
        merge_sort(nums, mid + 1, right)  # 右部分配列を再帰的に処理する
        # マージ段階
        merge(nums, left, mid, right)
    ```

=== "C++"

    ```cpp title="merge_sort.cpp"
    /* 左部分配列と右部分配列をマージする */
    void merge(vector<int> &nums, int left, int mid, int right) {
        // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
        // マージ後の結果を格納する一時配列 tmp を作成する
        vector<int> tmp(right - left + 1);
        // 左部分配列と右部分配列の開始インデックスを初期化する
        int i = left, j = mid + 1, k = 0;
        // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
        for (k = 0; k < tmp.size(); k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* マージソート */
    void mergeSort(vector<int> &nums, int left, int right) {
        // 終了条件
        if (left >= right)
            return; // 部分配列の長さが 1 になったら再帰を終了する
        // 分割段階
        int mid = left + (right - left) / 2;    // 中央を計算する
        mergeSort(nums, left, mid);      // 左部分配列を再帰的に処理する
        mergeSort(nums, mid + 1, right); // 右部分配列を再帰的に処理する
        // マージ段階
        merge(nums, left, mid, right);
    }
    ```

=== "Java"

    ```java title="merge_sort.java"
    /* 左部分配列と右部分配列をマージする */
    void merge(int[] nums, int left, int mid, int right) {
        // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
        // マージ後の結果を格納する一時配列 tmp を作成する
        int[] tmp = new int[right - left + 1];
        // 左部分配列と右部分配列の開始インデックスを初期化する
        int i = left, j = mid + 1, k = 0;
        // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* マージソート */
    void mergeSort(int[] nums, int left, int right) {
        // 終了条件
        if (left >= right)
            return; // 部分配列の長さが 1 になったら再帰を終了する
        // 分割段階
        int mid = left + (right - left) / 2; // 中央を計算する
        mergeSort(nums, left, mid); // 左部分配列を再帰的に処理する
        mergeSort(nums, mid + 1, right); // 右部分配列を再帰的に処理する
        // マージ段階
        merge(nums, left, mid, right);
    }
    ```

=== "C#"

    ```csharp title="merge_sort.cs"
    /* 左部分配列と右部分配列をマージする */
    void Merge(int[] nums, int left, int mid, int right) {
        // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
        // マージ後の結果を格納する一時配列 tmp を作成する
        int[] tmp = new int[right - left + 1];
        // 左部分配列と右部分配列の開始インデックスを初期化する
        int i = left, j = mid + 1, k = 0;
        // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
        for (k = 0; k < tmp.Length; ++k) {
            nums[left + k] = tmp[k];
        }
    }

    /* マージソート */
    void MergeSort(int[] nums, int left, int right) {
        // 終了条件
        if (left >= right) return;       // 部分配列の長さが 1 になったら再帰を終了する
        // 分割段階
        int mid = left + (right - left) / 2;    // 中央を計算する
        MergeSort(nums, left, mid);      // 左部分配列を再帰的に処理する
        MergeSort(nums, mid + 1, right); // 右部分配列を再帰的に処理する
        // マージ段階
        Merge(nums, left, mid, right);
    }
    ```

=== "Go"

    ```go title="merge_sort.go"
    /* 左部分配列と右部分配列をマージする */
    func merge(nums []int, left, mid, right int) {
        // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
        // マージ後の結果を格納する一時配列 tmp を作成する
        tmp := make([]int, right-left+1)
        // 左部分配列と右部分配列の開始インデックスを初期化する
        i, j, k := left, mid+1, 0
        // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
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
        // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
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
        // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
        for k := 0; k < len(tmp); k++ {
            nums[left+k] = tmp[k]
        }
    }

    /* マージソート */
    func mergeSort(nums []int, left, right int) {
        // 終了条件
        if left >= right {
            return
        }
        // 分割段階
        mid := left + (right - left) / 2
        mergeSort(nums, left, mid)
        mergeSort(nums, mid+1, right)
        // マージ段階
        merge(nums, left, mid, right)
    }
    ```

=== "Swift"

    ```swift title="merge_sort.swift"
    /* 左部分配列と右部分配列をマージする */
    func merge(nums: inout [Int], left: Int, mid: Int, right: Int) {
        // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
        // マージ後の結果を格納する一時配列 tmp を作成する
        var tmp = Array(repeating: 0, count: right - left + 1)
        // 左部分配列と右部分配列の開始インデックスを初期化する
        var i = left, j = mid + 1, k = 0
        // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
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
        // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
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
        // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
        for k in tmp.indices {
            nums[left + k] = tmp[k]
        }
    }

    /* マージソート */
    func mergeSort(nums: inout [Int], left: Int, right: Int) {
        // 終了条件
        if left >= right { // 部分配列の長さが 1 になったら再帰を終了する
            return
        }
        // 分割段階
        let mid = left + (right - left) / 2 // 中央を計算する
        mergeSort(nums: &nums, left: left, right: mid) // 左部分配列を再帰的に処理する
        mergeSort(nums: &nums, left: mid + 1, right: right) // 右部分配列を再帰的に処理する
        // マージ段階
        merge(nums: &nums, left: left, mid: mid, right: right)
    }
    ```

=== "JS"

    ```javascript title="merge_sort.js"
    /* 左部分配列と右部分配列をマージする */
    function merge(nums, left, mid, right) {
        // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
        // マージ後の結果を格納する一時配列 tmp を作成する
        const tmp = new Array(right - left + 1);
        // 左部分配列と右部分配列の開始インデックスを初期化する
        let i = left,
            j = mid + 1,
            k = 0;
        // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* マージソート */
    function mergeSort(nums, left, right) {
        // 終了条件
        if (left >= right) return; // 部分配列の長さが 1 になったら再帰を終了する
        // 分割段階
        let mid = Math.floor(left + (right - left) / 2); // 中央を計算する
        mergeSort(nums, left, mid); // 左部分配列を再帰的に処理する
        mergeSort(nums, mid + 1, right); // 右部分配列を再帰的に処理する
        // マージ段階
        merge(nums, left, mid, right);
    }
    ```

=== "TS"

    ```typescript title="merge_sort.ts"
    /* 左部分配列と右部分配列をマージする */
    function merge(nums: number[], left: number, mid: number, right: number): void {
        // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
        // マージ後の結果を格納する一時配列 tmp を作成する
        const tmp = new Array(right - left + 1);
        // 左部分配列と右部分配列の開始インデックスを初期化する
        let i = left,
            j = mid + 1,
            k = 0;
        // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* マージソート */
    function mergeSort(nums: number[], left: number, right: number): void {
        // 終了条件
        if (left >= right) return; // 部分配列の長さが 1 になったら再帰を終了する
        // 分割段階
        let mid = Math.floor(left + (right - left) / 2); // 中央を計算する
        mergeSort(nums, left, mid); // 左部分配列を再帰的に処理する
        mergeSort(nums, mid + 1, right); // 右部分配列を再帰的に処理する
        // マージ段階
        merge(nums, left, mid, right);
    }
    ```

=== "Dart"

    ```dart title="merge_sort.dart"
    /* 左部分配列と右部分配列をマージする */
    void merge(List<int> nums, int left, int mid, int right) {
      // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
      // マージ後の結果を格納する一時配列 tmp を作成する
      List<int> tmp = List.filled(right - left + 1, 0);
      // 左部分配列と右部分配列の開始インデックスを初期化する
      int i = left, j = mid + 1, k = 0;
      // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
      while (i <= mid && j <= right) {
        if (nums[i] <= nums[j])
          tmp[k++] = nums[i++];
        else
          tmp[k++] = nums[j++];
      }
      // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
      while (i <= mid) {
        tmp[k++] = nums[i++];
      }
      while (j <= right) {
        tmp[k++] = nums[j++];
      }
      // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
      for (k = 0; k < tmp.length; k++) {
        nums[left + k] = tmp[k];
      }
    }

    /* マージソート */
    void mergeSort(List<int> nums, int left, int right) {
      // 終了条件
      if (left >= right) return; // 部分配列の長さが 1 になったら再帰を終了する
      // 分割段階
      int mid = left + (right - left) ~/ 2; // 中央を計算する
      mergeSort(nums, left, mid); // 左部分配列を再帰的に処理する
      mergeSort(nums, mid + 1, right); // 右部分配列を再帰的に処理する
      // マージ段階
      merge(nums, left, mid, right);
    }
    ```

=== "Rust"

    ```rust title="merge_sort.rs"
    /* 左部分配列と右部分配列をマージする */
    fn merge(nums: &mut [i32], left: usize, mid: usize, right: usize) {
        // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
        // マージ後の結果を格納する一時配列 tmp を作成する
        let tmp_size = right - left + 1;
        let mut tmp = vec![0; tmp_size];
        // 左部分配列と右部分配列の開始インデックスを初期化する
        let (mut i, mut j, mut k) = (left, mid + 1, 0);
        // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
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
        // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
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
        // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
        for k in 0..tmp_size {
            nums[left + k] = tmp[k];
        }
    }

    /* マージソート */
    fn merge_sort(nums: &mut [i32], left: usize, right: usize) {
        // 終了条件
        if left >= right {
            return; // 部分配列の長さが 1 になったら再帰を終了する
        }

        // 分割段階
        let mid = left + (right - left) / 2; // 中央を計算する
        merge_sort(nums, left, mid); // 左部分配列を再帰的に処理する
        merge_sort(nums, mid + 1, right); // 右部分配列を再帰的に処理する

        // マージ段階
        merge(nums, left, mid, right);
    }
    ```

=== "C"

    ```c title="merge_sort.c"
    /* 左部分配列と右部分配列をマージする */
    void merge(int *nums, int left, int mid, int right) {
        // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
        // マージ後の結果を格納する一時配列 tmp を作成する
        int tmpSize = right - left + 1;
        int *tmp = (int *)malloc(tmpSize * sizeof(int));
        // 左部分配列と右部分配列の開始インデックスを初期化する
        int i = left, j = mid + 1, k = 0;
        // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp[k++] = nums[i++];
            } else {
                tmp[k++] = nums[j++];
            }
        }
        // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
        for (k = 0; k < tmpSize; ++k) {
            nums[left + k] = tmp[k];
        }
        // メモリを解放する
        free(tmp);
    }

    /* マージソート */
    void mergeSort(int *nums, int left, int right) {
        // 終了条件
        if (left >= right)
            return; // 部分配列の長さが 1 になったら再帰を終了する
        // 分割段階
        int mid = left + (right - left) / 2;    // 中央を計算する
        mergeSort(nums, left, mid);      // 左部分配列を再帰的に処理する
        mergeSort(nums, mid + 1, right); // 右部分配列を再帰的に処理する
        // マージ段階
        merge(nums, left, mid, right);
    }
    ```

=== "Kotlin"

    ```kotlin title="merge_sort.kt"
    /* 左部分配列と右部分配列をマージする */
    fun merge(nums: IntArray, left: Int, mid: Int, right: Int) {
        // 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
        // マージ後の結果を格納する一時配列 tmp を作成する
        val tmp = IntArray(right - left + 1)
        // 左部分配列と右部分配列の開始インデックスを初期化する
        var i = left
        var j = mid + 1
        var k = 0
        // 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++]
            else
                tmp[k++] = nums[j++]
        }
        // 左部分配列と右部分配列の残りの要素を一時配列にコピーする
        while (i <= mid) {
            tmp[k++] = nums[i++]
        }
        while (j <= right) {
            tmp[k++] = nums[j++]
        }
        // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
        for (l in tmp.indices) {
            nums[left + l] = tmp[l]
        }
    }

    /* マージソート */
    fun mergeSort(nums: IntArray, left: Int, right: Int) {
        // 終了条件
        if (left >= right) return  // 部分配列の長さが 1 になったら再帰を終了する
        // 分割段階
        val mid = left + (right - left) / 2 // 中央を計算する
        mergeSort(nums, left, mid) // 左部分配列を再帰的に処理する
        mergeSort(nums, mid + 1, right) // 右部分配列を再帰的に処理する
        // マージ段階
        merge(nums, left, mid, right)
    }
    ```

=== "Ruby"

    ```ruby title="merge_sort.rb"
    ### 左部分配列と右部分配列をマージする ###
    def merge(nums, left, mid, right)
      # 左部分配列の区間は [left, mid]、右部分配列の区間は [mid+1, right]
      # マージ後の結果を格納する一時配列 tmp を作成する
      tmp = Array.new(right - left + 1, 0)
      # 左部分配列と右部分配列の開始インデックスを初期化する
      i, j, k = left, mid + 1, 0
      # 左右両方の部分配列に要素が残っている間、比較して小さいほうの要素を一時配列にコピーする
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
      # 左部分配列と右部分配列の残りの要素を一時配列にコピーする
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
      # 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーし戻す
      (0...tmp.length).each do |k|
        nums[left + k] = tmp[k]
      end
    end

    ### マージソート ###
    def merge_sort(nums, left, right)
      # 終了条件
      # 部分配列の長さが 1 になったら再帰を終了する
      return if left >= right
      # 分割段階
      mid = left + (right - left) / 2 # 中央を計算する
      merge_sort(nums, left, mid) # 左部分配列を再帰的に処理する
      merge_sort(nums, mid + 1, right) # 右部分配列を再帰的に処理する
      # マージ段階
      merge(nums, left, mid, right)
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20merge%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%B7%A6%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%A8%E5%8F%B3%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%82%92%E3%83%9E%E3%83%BC%E3%82%B8%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%AE%E5%8C%BA%E9%96%93%E3%81%AF%20%5Bleft,%20mid%5D%E3%80%81%E5%8F%B3%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%AE%E5%8C%BA%E9%96%93%E3%81%AF%20%5Bmid%2B1,%20right%5D%0A%20%20%20%20%23%20%E3%83%9E%E3%83%BC%E3%82%B8%E5%BE%8C%E3%81%AE%E7%B5%90%E6%9E%9C%E3%82%92%E6%A0%BC%E7%B4%8D%E3%81%99%E3%82%8B%E4%B8%80%E6%99%82%E9%85%8D%E5%88%97%20tmp%20%E3%82%92%E4%BD%9C%E6%88%90%E3%81%99%E3%82%8B%0A%20%20%20%20tmp%20%3D%20%5B0%5D%20%2A%20%28right%20-%20left%20%2B%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%A8%E5%8F%B3%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%AE%E9%96%8B%E5%A7%8B%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20i,%20j,%20k%20%3D%20left,%20mid%20%2B%201,%200%0A%20%20%20%20%23%20%E5%B7%A6%E5%8F%B3%E4%B8%A1%E6%96%B9%E3%81%AE%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%AB%E8%A6%81%E7%B4%A0%E3%81%8C%E6%AE%8B%E3%81%A3%E3%81%A6%E3%81%84%E3%82%8B%E9%96%93%E3%80%81%E6%AF%94%E8%BC%83%E3%81%97%E3%81%A6%E5%B0%8F%E3%81%95%E3%81%84%E3%81%BB%E3%81%86%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E4%B8%80%E6%99%82%E9%85%8D%E5%88%97%E3%81%AB%E3%82%B3%E3%83%94%E3%83%BC%E3%81%99%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20mid%20and%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3C%3D%20nums%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%E5%B7%A6%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%A8%E5%8F%B3%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%AE%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E4%B8%80%E6%99%82%E9%85%8D%E5%88%97%E3%81%AB%E3%82%B3%E3%83%94%E3%83%BC%E3%81%99%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20mid%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20while%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%E4%B8%80%E6%99%82%E9%85%8D%E5%88%97%20tmp%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%85%83%E3%81%AE%E9%85%8D%E5%88%97%20nums%20%E3%81%AE%E5%AF%BE%E5%BF%9C%E3%81%99%E3%82%8B%E5%8C%BA%E9%96%93%E3%81%AB%E3%82%B3%E3%83%94%E3%83%BC%E3%81%97%E6%88%BB%E3%81%99%0A%20%20%20%20for%20k%20in%20range%280,%20len%28tmp%29%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bleft%20%2B%20k%5D%20%3D%20tmp%5Bk%5D%0A%0A%0Adef%20merge_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E3%83%9E%E3%83%BC%E3%82%B8%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20%23%20%E7%B5%82%E4%BA%86%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%20%20%23%20%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%AE%E9%95%B7%E3%81%95%E3%81%8C%201%20%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%9F%E3%82%89%E5%86%8D%E5%B8%B0%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E5%88%86%E5%89%B2%E6%AE%B5%E9%9A%8E%0A%20%20%20%20mid%20%3D%20%28left%20%2B%20right%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20merge_sort%28nums,%20left,%20mid%29%20%20%23%20%E5%B7%A6%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E5%87%A6%E7%90%86%E3%81%99%E3%82%8B%0A%20%20%20%20merge_sort%28nums,%20mid%20%2B%201,%20right%29%20%20%23%20%E5%8F%B3%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E5%87%A6%E7%90%86%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E3%83%9E%E3%83%BC%E3%82%B8%E6%AE%B5%E9%9A%8E%0A%20%20%20%20merge%28nums,%20left,%20mid,%20right%29%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B7,%203,%202,%206,%200,%201,%205,%204%5D%0A%20%20%20%20merge_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E3%83%9E%E3%83%BC%E3%82%B8%E3%82%BD%E3%83%BC%E3%83%88%E5%AE%8C%E4%BA%86%E5%BE%8C%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20merge%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20mid%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E5%B7%A6%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%A8%E5%8F%B3%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%82%92%E3%83%9E%E3%83%BC%E3%82%B8%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%AE%E5%8C%BA%E9%96%93%E3%81%AF%20%5Bleft,%20mid%5D%E3%80%81%E5%8F%B3%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%AE%E5%8C%BA%E9%96%93%E3%81%AF%20%5Bmid%2B1,%20right%5D%0A%20%20%20%20%23%20%E3%83%9E%E3%83%BC%E3%82%B8%E5%BE%8C%E3%81%AE%E7%B5%90%E6%9E%9C%E3%82%92%E6%A0%BC%E7%B4%8D%E3%81%99%E3%82%8B%E4%B8%80%E6%99%82%E9%85%8D%E5%88%97%20tmp%20%E3%82%92%E4%BD%9C%E6%88%90%E3%81%99%E3%82%8B%0A%20%20%20%20tmp%20%3D%20%5B0%5D%20%2A%20%28right%20-%20left%20%2B%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%A8%E5%8F%B3%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%AE%E9%96%8B%E5%A7%8B%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20i,%20j,%20k%20%3D%20left,%20mid%20%2B%201,%200%0A%20%20%20%20%23%20%E5%B7%A6%E5%8F%B3%E4%B8%A1%E6%96%B9%E3%81%AE%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%AB%E8%A6%81%E7%B4%A0%E3%81%8C%E6%AE%8B%E3%81%A3%E3%81%A6%E3%81%84%E3%82%8B%E9%96%93%E3%80%81%E6%AF%94%E8%BC%83%E3%81%97%E3%81%A6%E5%B0%8F%E3%81%95%E3%81%84%E3%81%BB%E3%81%86%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E4%B8%80%E6%99%82%E9%85%8D%E5%88%97%E3%81%AB%E3%82%B3%E3%83%94%E3%83%BC%E3%81%99%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20mid%20and%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20if%20nums%5Bi%5D%20%3C%3D%20nums%5Bj%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20else%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%E5%B7%A6%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%A8%E5%8F%B3%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%AE%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E4%B8%80%E6%99%82%E9%85%8D%E5%88%97%E3%81%AB%E3%82%B3%E3%83%94%E3%83%BC%E3%81%99%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20mid%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bi%5D%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20while%20j%20%3C%3D%20right%3A%0A%20%20%20%20%20%20%20%20tmp%5Bk%5D%20%3D%20nums%5Bj%5D%0A%20%20%20%20%20%20%20%20j%20%2B%3D%201%0A%20%20%20%20%20%20%20%20k%20%2B%3D%201%0A%20%20%20%20%23%20%E4%B8%80%E6%99%82%E9%85%8D%E5%88%97%20tmp%20%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E5%85%83%E3%81%AE%E9%85%8D%E5%88%97%20nums%20%E3%81%AE%E5%AF%BE%E5%BF%9C%E3%81%99%E3%82%8B%E5%8C%BA%E9%96%93%E3%81%AB%E3%82%B3%E3%83%94%E3%83%BC%E3%81%97%E6%88%BB%E3%81%99%0A%20%20%20%20for%20k%20in%20range%280,%20len%28tmp%29%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bleft%20%2B%20k%5D%20%3D%20tmp%5Bk%5D%0A%0A%0Adef%20merge_sort%28nums%3A%20list%5Bint%5D,%20left%3A%20int,%20right%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E3%83%9E%E3%83%BC%E3%82%B8%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20%23%20%E7%B5%82%E4%BA%86%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20left%20%3E%3D%20right%3A%0A%20%20%20%20%20%20%20%20return%20%20%23%20%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%81%AE%E9%95%B7%E3%81%95%E3%81%8C%201%20%E3%81%AB%E3%81%AA%E3%81%A3%E3%81%9F%E3%82%89%E5%86%8D%E5%B8%B0%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E5%88%86%E5%89%B2%E6%AE%B5%E9%9A%8E%0A%20%20%20%20mid%20%3D%20%28left%20%2B%20right%29%20//%202%20%20%23%20%E4%B8%AD%E5%A4%AE%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20merge_sort%28nums,%20left,%20mid%29%20%20%23%20%E5%B7%A6%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E5%87%A6%E7%90%86%E3%81%99%E3%82%8B%0A%20%20%20%20merge_sort%28nums,%20mid%20%2B%201,%20right%29%20%20%23%20%E5%8F%B3%E9%83%A8%E5%88%86%E9%85%8D%E5%88%97%E3%82%92%E5%86%8D%E5%B8%B0%E7%9A%84%E3%81%AB%E5%87%A6%E7%90%86%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E3%83%9E%E3%83%BC%E3%82%B8%E6%AE%B5%E9%9A%8E%0A%20%20%20%20merge%28nums,%20left,%20mid,%20right%29%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20nums%20%3D%20%5B7,%203,%202,%206,%200,%201,%205,%204%5D%0A%20%20%20%20merge_sort%28nums,%200,%20len%28nums%29%20-%201%29%0A%20%20%20%20print%28%22%E3%83%9E%E3%83%BC%E3%82%B8%E3%82%BD%E3%83%BC%E3%83%88%E5%AE%8C%E4%BA%86%E5%BE%8C%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 11.6.2 &nbsp; アルゴリズムの特徴

- **時間計算量は $O(n \log n)$、非適応的ソート**：分割によって高さ $\log n$ の再帰木ができ、各層の結合操作の総数は $n$ なので、全体の時間計算量は $O(n \log n)$ です。
- **空間計算量は $O(n)$、非インプレースソート**：再帰の深さは $\log n$ で、スタックフレームに $O(\log n)$ の領域を使います。結合には補助配列が必要で、$O(n)$ の追加領域を使います。
- **安定ソート**：結合の過程で等しい要素の順序は変わりません。

## 11.6.3 &nbsp; 連結リストのソート

連結リストでは、マージソートはほかのソートアルゴリズムより大きな利点があります。**連結リストをソートする空間計算量を $O(1)$ に改善できるためです**。

- **分割の段階**：再帰の代わりに反復を使って連結リストを分割すれば、再帰のスタックフレーム領域を省けます。
- **結合の段階**：連結リストのノードの追加や削除は、参照（ポインタ）の変更だけで行えます。そのため、二つの短い整列済みリストを一つの長い整列済みリストに結合する際、追加のリストを作る必要はありません。

具体的な実装はやや複雑なので、興味があれば関連資料で学んでみてください。
