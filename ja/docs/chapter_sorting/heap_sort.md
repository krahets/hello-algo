---
comments: true
---

# 11.7 &nbsp; ヒープソート

!!! tip

    この節を読む前に、「ヒープ」の章を必ず完了させてください。

<u>ヒープソート</u>は、ヒープデータ構造に基づく効率的なソートアルゴリズムです。すでに学習した「ヒープの構築」と「要素の抽出」操作を使用してヒープソートを実装できます。

1. 配列を入力し、最小ヒープを構築します。ここで、最小要素がヒープの頂上に位置します。
2. 継続的に抽出操作を実行し、抽出された要素を順次記録して、最小から最大までのソート済みリストを取得します。

上記の方法は実現可能ですが、ポップされた要素を格納するための追加の配列が必要で、やや空間を消費します。実際には、通常、より優雅な実装を使用します。

## 11.7.1 &nbsp; アルゴリズムの流れ

配列の長さを $n$ とすると、ヒープソートの過程は以下の通りです。

1. 配列を入力し、最大ヒープを構築します。この手順の後、最大要素がヒープの頂上に位置します。
2. ヒープの頂上要素（最初の要素）とヒープの底部要素（最後の要素）を交換します。この交換の後、ヒープの長さを $1$ 減らし、ソート済み要素の数を $1$ 増やします。
3. ヒープの頂上から開始して、上から下へのsift-down操作を実行します。sift-downの後、ヒープの性質が復元されます。
4. 手順 `2.` と `3.` を繰り返します。$n - 1$ ラウンドループして、配列のソートを完了します。

!!! tip

    実際、要素抽出操作も手順 `2.` と `3.` を含み、抽出された要素をヒープから削除する追加の手順があります。

=== "<1>"
    ![ヒープソートの過程](heap_sort.assets/heap_sort_step1.png){ class="animation-figure" }

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

<p align="center"> 図 11-12 &nbsp; ヒープソートの過程 </p>

コードの実装では、「ヒープ」の章からのsift-down関数 `sift_down()` を使用しました。最大要素が抽出されるにつれてヒープの長さが減少するため、`sift_down()` 関数に長さパラメータ $n$ を追加して、ヒープの現在の有効長を指定する必要があることに注意することが重要です。コードは以下の通りです：

=== "Python"

    ```python title="heap_sort.py"
    def sift_down(nums: list[int], n: int, i: int):
        """ヒープの長さが n、ノード i から上から下へヒープ化を開始"""
        while True:
            # i、l、r の中で最大のノードを判定し、ma とする
            l = 2 * i + 1
            r = 2 * i + 2
            ma = i
            if l < n and nums[l] > nums[ma]:
                ma = l
            if r < n and nums[r] > nums[ma]:
                ma = r
            # ノード i が最大または l、r のインデックスが範囲外の場合、さらなるヒープ化は不要、ループを抜ける
            if ma == i:
                break
            # 2つのノードを交換
            nums[i], nums[ma] = nums[ma], nums[i]
            # 下向きにヒープ化をループ
            i = ma

    def heap_sort(nums: list[int]):
        """ヒープソート"""
        # ヒープ構築操作：葉ノード以外のすべてのノードをヒープ化
        for i in range(len(nums) // 2 - 1, -1, -1):
            sift_down(nums, len(nums), i)
        # ヒープから最大要素を抽出し、n-1 回繰り返す
        for i in range(len(nums) - 1, 0, -1):
            # ルートノードと最も右の葉ノードを交換（最初の要素と最後の要素を交換）
            nums[0], nums[i] = nums[i], nums[0]
            # ルートノードから上から下へヒープ化を開始
            sift_down(nums, i, 0)
    ```

=== "C++"

    ```cpp title="heap_sort.cpp"
    /* ヒープの長さはn、ノードiから上から下へヒープ化を開始 */
    void siftDown(vector<int> &nums, int n, int i) {
        while (true) {
            // i、l、r の中で最大のノードを決定し、maとして記録
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // ノードiが最大か、インデックスl、rが境界外の場合、それ以上のヒープ化は不要で終了
            if (ma == i) {
                break;
            }
            // 二つのノードを交換
            swap(nums[i], nums[ma]);
            // 下向きにヒープ化をループ
            i = ma;
        }
    }

    /* ヒープソート */
    void heapSort(vector<int> &nums) {
        // ヒープ構築操作：葉以外のすべてのノードをヒープ化
        for (int i = nums.size() / 2 - 1; i >= 0; --i) {
            siftDown(nums, nums.size(), i);
        }
        // ヒープから最大要素を抽出し、n-1回繰り返す
        for (int i = nums.size() - 1; i > 0; --i) {
            // ルートノードを最右葉ノードと交換（最初の要素を最後の要素と交換）
            swap(nums[0], nums[i]);
            // ルートノードから上から下へヒープ化を開始
            siftDown(nums, i, 0);
        }
    }
    ```

=== "Java"

    ```java title="heap_sort.java"
    /* ヒープの長さは n、ノード i から上から下へヒープ化開始 */
    void siftDown(int[] nums, int n, int i) {
        while (true) {
            // i, l, r の中で最大のノードを判定し、ma とする
            int l = 2 * i + 1;
            int r = 2 * i + 2;
            int ma = i;
            if (l < n && nums[l] > nums[ma])
                ma = l;
            if (r < n && nums[r] > nums[ma])
                ma = r;
            // ノード i が最大、またはインデックス l, r が範囲外の場合、さらなるヒープ化は不要、ブレーク
            if (ma == i)
                break;
            // 2つのノードを交換
            int temp = nums[i];
            nums[i] = nums[ma];
            nums[ma] = temp;
            // 下向きにヒープ化をループ
            i = ma;
        }
    }

    /* ヒープソート */
    void heapSort(int[] nums) {
        // ヒープ構築操作: 葉ノード以外のすべてのノードをヒープ化
        for (int i = nums.length / 2 - 1; i >= 0; i--) {
            siftDown(nums, nums.length, i);
        }
        // ヒープから最大要素を抽出し、n-1 回繰り返し
        for (int i = nums.length - 1; i > 0; i--) {
            // ルートノードと最も右の葉ノードを交換（最初の要素と最後の要素を交換）
            int tmp = nums[0];
            nums[0] = nums[i];
            nums[i] = tmp;
            // ルートノードから上から下へヒープ化開始
            siftDown(nums, i, 0);
        }
    }
    ```

=== "C#"

    ```csharp title="heap_sort.cs"
    [class]{heap_sort}-[func]{SiftDown}

    [class]{heap_sort}-[func]{HeapSort}
    ```

=== "Go"

    ```go title="heap_sort.go"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "Swift"

    ```swift title="heap_sort.swift"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "JS"

    ```javascript title="heap_sort.js"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "TS"

    ```typescript title="heap_sort.ts"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "Dart"

    ```dart title="heap_sort.dart"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "Rust"

    ```rust title="heap_sort.rs"
    [class]{}-[func]{sift_down}

    [class]{}-[func]{heap_sort}
    ```

=== "C"

    ```c title="heap_sort.c"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "Kotlin"

    ```kotlin title="heap_sort.kt"
    [class]{}-[func]{siftDown}

    [class]{}-[func]{heapSort}
    ```

=== "Ruby"

    ```ruby title="heap_sort.rb"
    [class]{}-[func]{sift_down}

    [class]{}-[func]{heap_sort}
    ```

## 11.7.2 &nbsp; アルゴリズムの特徴

- **時間計算量は $O(n \log n)$、非適応ソート**：ヒープの構築は $O(n)$ 時間を使用します。ヒープから最大要素を抽出するには $O(\log n)$ 時間がかかり、$n - 1$ ラウンドループします。
- **空間計算量は $O(1)$、インプレースソート**：いくつかのポインタ変数が $O(1)$ 空間を使用します。要素の交換とヒープ化操作は元の配列で実行されます。
- **非安定ソート**：ヒープの頂上と底部要素の交換中に、等しい要素の相対位置が変わる可能性があります。
