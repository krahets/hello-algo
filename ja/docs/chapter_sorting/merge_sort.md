---
comments: true
---

# 11.6 &nbsp; マージソート

<u>マージソート</u>は分割統治戦略に基づくソートアルゴリズムで、下図に示す「分割」と「マージ」フェーズを含みます。

1. **分割フェーズ**：中点から配列を再帰的に分割し、長い配列のソート問題をより短い配列に変換します。
2. **マージフェーズ**：サブ配列の長さが1になったときに分割を停止し、その後マージを開始します。2つの短いソート済み配列を連続的により長いソート済み配列にマージし、プロセスが完了するまで続行します。

![The divide and merge phases of merge sort](merge_sort.assets/merge_sort_overview.png){ class="animation-figure" }

<p align="center"> 図 11-10 &nbsp; The divide and merge phases of merge sort </p>

## 11.6.1 &nbsp; アルゴリズムワークフロー

下図に示すように、「分割フェーズ」は中点から配列を上から下に2つのサブ配列に再帰的に分割します。

1. 中点`mid`を計算し、左サブ配列（区間`[left, mid]`）と右サブ配列（区間`[mid + 1, right]`）を再帰的に分割します。
2. サブ配列の長さが1になるまでステップ`1.`を再帰的に続行し、その後停止します。

「マージフェーズ」は左と右のサブ配列を下から上にソート済み配列に結合します。重要なのは、マージが長さ1のサブ配列から開始され、マージフェーズ中に各サブ配列がソートされることです。

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

<p align="center"> 図 11-11 &nbsp; Merge sort process </p>

マージソートの再帰順序は二分木の後順横断と一致することが観察できます。

- **後順横断**：まず左のサブツリーを再帰的に横断し、次に右のサブツリーを横断し、最後にルートノードを処理します。
- **マージソート**：まず左のサブ配列を再帰的に処理し、次に右のサブ配列を処理し、最後にマージを実行します。

マージソートの実装は以下のコードに示されます。`nums`でマージされる区間は`[left, right]`で、`tmp`の対応する区間は`[0, right - left]`であることに注意してください。

=== "Python"

    ```python title="merge_sort.py"
    def merge(nums: list[int], left: int, mid: int, right: int):
        """左サブ配列と右サブ配列をマージ"""
        # 左サブ配列区間は [left, mid]、右サブ配列区間は [mid+1, right]
        # 一時配列 tmp を作成してマージ結果を格納
        tmp = [0] * (right - left + 1)
        # 左右サブ配列の開始インデックスを初期化
        i, j, k = left, mid + 1, 0
        # 両方のサブ配列に要素が残っている間、より小さい要素を一時配列にコピー
        while i <= mid and j <= right:
            if nums[i] <= nums[j]:
                tmp[k] = nums[i]
                i += 1
            else:
                tmp[k] = nums[j]
                j += 1
            k += 1
        # 残った左右サブ配列の要素を一時配列にコピー
        while i <= mid:
            tmp[k] = nums[i]
            i += 1
            k += 1
        while j <= right:
            tmp[k] = nums[j]
            j += 1
            k += 1
        # 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーバック
        for k in range(0, len(tmp)):
            nums[left + k] = tmp[k]

    def merge_sort(nums: list[int], left: int, right: int):
        """マージソート"""
        # 終了条件
        if left >= right:
            return  # サブ配列の長さが1のときに再帰を終了
        # 分割段階
        mid = left + (right - left) // 2  # 中点を計算
        merge_sort(nums, left, mid)  # 左サブ配列を再帰的に処理
        merge_sort(nums, mid + 1, right)  # 右サブ配列を再帰的に処理
        # マージ段階
        merge(nums, left, mid, right)
    ```

=== "C++"

    ```cpp title="merge_sort.cpp"
    /* 左サブ配列と右サブ配列をマージ */
    void merge(vector<int> &nums, int left, int mid, int right) {
        // 左サブ配列の区間は[left, mid]、右サブ配列の区間は[mid+1, right]
        // マージ結果を保存する一時配列tmpを作成
        vector<int> tmp(right - left + 1);
        // 左右サブ配列の開始インデックスを初期化
        int i = left, j = mid + 1, k = 0;
        // 両サブ配列に要素がある間、小さい方の要素を一時配列にコピー
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 左右サブ配列の残りの要素を一時配列にコピー
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 一時配列tmpの要素を元の配列numsの対応する区間にコピー
        for (k = 0; k < tmp.size(); k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* マージソート */
    void mergeSort(vector<int> &nums, int left, int right) {
        // 終了条件
        if (left >= right)
            return; // サブ配列の長さが1の時、再帰を終了
        // 分割段階
        int mid = left + (right - left) / 2;    // 中点を計算
        mergeSort(nums, left, mid);      // 左サブ配列を再帰的に処理
        mergeSort(nums, mid + 1, right); // 右サブ配列を再帰的に処理
        // マージ段階
        merge(nums, left, mid, right);
    }
    ```

=== "Java"

    ```java title="merge_sort.java"
    /* 左部分配列と右部分配列をマージ */
    void merge(int[] nums, int left, int mid, int right) {
        // 左部分配列区間は [left, mid]、右部分配列区間は [mid+1, right]
        // 一時配列 tmp を作成してマージ結果を格納
        int[] tmp = new int[right - left + 1];
        // 左右部分配列の開始インデックスを初期化
        int i = left, j = mid + 1, k = 0;
        // 両部分配列にまだ要素がある間、比較してより小さい要素を一時配列にコピー
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j])
                tmp[k++] = nums[i++];
            else
                tmp[k++] = nums[j++];
        }
        // 左右部分配列の残りの要素を一時配列にコピー
        while (i <= mid) {
            tmp[k++] = nums[i++];
        }
        while (j <= right) {
            tmp[k++] = nums[j++];
        }
        // 一時配列 tmp の要素を元の配列 nums の対応する区間にコピーバック
        for (k = 0; k < tmp.length; k++) {
            nums[left + k] = tmp[k];
        }
    }

    /* マージソート */
    void mergeSort(int[] nums, int left, int right) {
        // 終了条件
        if (left >= right)
            return; // 部分配列の長さが 1 のとき再帰を終了
        // 分割段階
        int mid = left + (right - left) / 2; // 中点を計算
        mergeSort(nums, left, mid); // 左部分配列を再帰的に処理
        mergeSort(nums, mid + 1, right); // 右部分配列を再帰的に処理
        // マージ段階
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

## 11.6.2 &nbsp; アルゴリズムの特性

- **$O(n \log n)$の時間計算量、非適応ソート**：分割により高さ$\log n$の再帰ツリーが作成され、各層で合計$n$回の操作をマージし、全体的な時間計算量は$O(n \log n)$となります。
- **$O(n)$の空間計算量、非インプレースソート**：再帰深度は$\log n$で、$O(\log n)$のスタックフレーム空間を使用します。マージ操作には補助配列が必要で、追加の$O(n)$空間を使用します。
- **安定ソート**：マージプロセス中、等しい要素の順序は変更されません。

## 11.6.3 &nbsp; 連結リストのソート

連結リストの場合、マージソートは他のソートアルゴリズムよりも大きな利点があります。**連結リストソートタスクの空間計算量を$O(1)$に最適化できます**。

- **分割フェーズ**：「再帰」の代わりに「反復」を使用して連結リスト分割作業を実行できるため、再帰で使用されるスタックフレーム空間を節約できます。
- **マージフェーズ**：連結リストでは、ノードの挿入と削除操作は参照（ポインタ）を変更することで実現できるため、マージフェーズ（2つの短い順序付きリストを1つの長い順序付きリストに結合）中に追加のリストを作成する必要がありません。

実装の詳細は比較的複雑で、興味のある読者は関連資料を参照して学習してください。
