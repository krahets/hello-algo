---
comments: true
---

# 11.9 &nbsp; 計数ソート

<u>計数ソート</u>は要素の数をカウントすることでソートを実現し、通常は整数配列に適用されます。

## 11.9.1 &nbsp; 簡単な実装

簡単な例から始めましょう。長さ $n$ の配列 `nums` が与えられ、すべての要素が「非負整数」である場合、計数ソートの全体的な過程は以下の図に示されています。

1. 配列を走査して最大数を見つけ、それを $m$ とし、長さ $m + 1$ の補助配列 `counter` を作成します。
2. **`counter` を使用して `nums` 内の各数の出現回数をカウントします**。ここで `counter[num]` は数 `num` の出現回数に対応します。カウント方法は簡単で、`nums` を走査し（現在の数を `num` とする）、各ラウンドで `counter[num]` を $1$ 増やします。
3. **`counter` のインデックスは自然に順序付けられているため、すべての数は本質的にすでにソートされています**。次に、`counter` を走査し、出現順に `nums` を昇順で埋めます。

![計数ソートの過程](counting_sort.assets/counting_sort_overview.png){ class="animation-figure" }

<p align="center"> 図 11-16 &nbsp; 計数ソートの過程 </p>

コードは以下の通りです：

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort_naive(nums: list[int]):
        """計数ソート"""
        # シンプルな実装、オブジェクトのソートには使用できない
        # 1. 配列内の最大要素 m を統計
        m = 0
        for num in nums:
            m = max(m, num)
        # 2. 各数字の出現回数を統計
        # counter[num] は num の出現回数を表す
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. counter を走査し、各要素を元の配列 nums に埋め戻し
        i = 0
        for num in range(m + 1):
            for _ in range(counter[num]):
                nums[i] = num
                i += 1
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* カウントソート */
    // 簡単な実装、オブジェクトのソートには使用できない
    void countingSortNaive(vector<int> &nums) {
        // 1. 配列の最大要素mを統計
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. 各数字の出現回数を統計
        // counter[num]はnumの出現回数を表す
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counterを走査し、各要素を元の配列numsに戻す
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "Java"

    ```java title="counting_sort.java"
    /* 計数ソート */
    // 簡単な実装、オブジェクトのソートには使用できない
    void countingSortNaive(int[] nums) {
        // 1. 配列の最大要素 m を統計
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 各数字の出現回数を統計
        // counter[num] は num の出現回数を表す
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter を走査し、各要素を元の配列 nums に戻す
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }
    ```

=== "C#"

    ```csharp title="counting_sort.cs"
    [class]{counting_sort}-[func]{CountingSortNaive}
    ```

=== "Go"

    ```go title="counting_sort.go"
    [class]{}-[func]{countingSortNaive}
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    [class]{}-[func]{countingSortNaive}
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    [class]{}-[func]{countingSortNaive}
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    [class]{}-[func]{countingSortNaive}
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    [class]{}-[func]{countingSortNaive}
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    [class]{}-[func]{counting_sort_naive}
    ```

=== "C"

    ```c title="counting_sort.c"
    [class]{}-[func]{countingSortNaive}
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    [class]{}-[func]{countingSortNaive}
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    [class]{}-[func]{counting_sort_naive}
    ```

=== "Zig"

    ```zig title="counting_sort.zig"
    [class]{}-[func]{countingSortNaive}
    ```

!!! note "計数ソートとバケットソートの関係"

    バケットソートの観点から、計数ソートにおける計数配列 `counter` の各インデックスをバケットと考え、カウントの過程を要素を対応するバケットに分散させることと考えることができます。本質的に、計数ソートは整数データのためのバケットソートの特別なケースです。

## 11.9.2 &nbsp; 完全な実装

注意深い読者は気付くかもしれませんが、**入力データがオブジェクトの場合、上記の手順 `3.` は無効です**。入力データが商品オブジェクトで、価格（クラスメンバ変数）で商品をソートしたいとします。しかし、上記のアルゴリズムは結果としてソート済みの価格のみを提供できます。

では、元のデータのソート結果をどのように取得できるでしょうか？まず、`counter` の「前置和」を計算します。名前が示すように、インデックス `i` での前置和 `prefix[i]` は、配列の最初の `i` 個の要素の和に等しいです：

$$
\text{prefix}[i] = \sum_{j=0}^i \text{counter[j]}
$$

**前置和には明確な意味があります。`prefix[num] - 1` は結果配列 `res` における要素 `num` の最後の出現のインデックスを表します**。この情報は重要で、各要素が結果配列のどこに現れるべきかを教えてくれます。次に、元の配列 `nums` の各要素 `num` を逆順で走査し、各反復で以下の2つの手順を実行します。

1. インデックス `prefix[num] - 1` で配列 `res` に `num` を埋めます。
2. 前置和 `prefix[num]` を $1$ 減らして、`num` を配置する次のインデックスを取得します。

走査後、配列 `res` にはソートされた結果が含まれ、最後に `res` が元の配列 `nums` を置き換えます。完全な計数ソートの過程は以下の図に示されています。

=== "<1>"
    ![計数ソートの過程](counting_sort.assets/counting_sort_step1.png){ class="animation-figure" }

=== "<2>"
    ![counting_sort_step2](counting_sort.assets/counting_sort_step2.png){ class="animation-figure" }

=== "<3>"
    ![counting_sort_step3](counting_sort.assets/counting_sort_step3.png){ class="animation-figure" }

=== "<4>"
    ![counting_sort_step4](counting_sort.assets/counting_sort_step4.png){ class="animation-figure" }

=== "<5>"
    ![counting_sort_step5](counting_sort.assets/counting_sort_step5.png){ class="animation-figure" }

=== "<6>"
    ![counting_sort_step6](counting_sort.assets/counting_sort_step6.png){ class="animation-figure" }

=== "<7>"
    ![counting_sort_step7](counting_sort.assets/counting_sort_step7.png){ class="animation-figure" }

=== "<8>"
    ![counting_sort_step8](counting_sort.assets/counting_sort_step8.png){ class="animation-figure" }

<p align="center"> 図 11-17 &nbsp; 計数ソートの過程 </p>

計数ソートの実装コードは以下の通りです：

=== "Python"

    ```python title="counting_sort.py"
    def counting_sort(nums: list[int]):
        """計数ソート"""
        # 完全な実装、オブジェクトのソートが可能で、安定ソート
        # 1. 配列内の最大要素 m を統計
        m = max(nums)
        # 2. 各数字の出現回数を統計
        # counter[num] は num の出現回数を表す
        counter = [0] * (m + 1)
        for num in nums:
            counter[num] += 1
        # 3. counter の前置和を計算し、「出現回数」を「末尾インデックス」に変換
        # counter[num]-1 は res において num が最後に出現するインデックス
        for i in range(m):
            counter[i + 1] += counter[i]
        # 4. nums を逆順に走査し、各要素を結果配列 res に配置
        # 結果を記録するための配列 res を初期化
        n = len(nums)
        res = [0] * n
        for i in range(n - 1, -1, -1):
            num = nums[i]
            res[counter[num] - 1] = num  # num を対応するインデックスに配置
            counter[num] -= 1  # 前置和を1減らし、num を配置する次のインデックスを取得
        # 結果配列 res を使用して元の配列 nums を上書き
        for i in range(n):
            nums[i] = res[i]
    ```

=== "C++"

    ```cpp title="counting_sort.cpp"
    /* カウントソート */
    // 完全な実装、オブジェクトのソートが可能で安定ソート
    void countingSort(vector<int> &nums) {
        // 1. 配列の最大要素mを統計
        int m = 0;
        for (int num : nums) {
            m = max(m, num);
        }
        // 2. 各数字の出現回数を統計
        // counter[num]はnumの出現回数を表す
        vector<int> counter(m + 1, 0);
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counterの前缀和を計算し、「出現回数」を「末尾インデックス」に変換
        // counter[num]-1はnumがresで現れる最後のインデックス
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. numsを逆順で走査し、各要素を結果配列resに配置
        // 結果を記録する配列resを初期化
        int n = nums.size();
        vector<int> res(n);
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // numを対応するインデックスに配置
            counter[num]--;              // 前缀和を1減らし、numを配置する次のインデックスを取得
        }
        // 結果配列resで元の配列numsを上書き
        nums = res;
    }
    ```

=== "Java"

    ```java title="counting_sort.java"
    /* 計数ソート */
    // 完全な実装、オブジェクトをソートでき、安定ソート
    void countingSort(int[] nums) {
        // 1. 配列の最大要素 m を統計
        int m = 0;
        for (int num : nums) {
            m = Math.max(m, num);
        }
        // 2. 各数字の出現回数を統計
        // counter[num] は num の出現回数を表す
        int[] counter = new int[m + 1];
        for (int num : nums) {
            counter[num]++;
        }
        // 3. counter の累積和を計算し、「出現回数」を「尻尾インデックス」に変換
        // counter[num]-1 は res 内で num が出現する最後のインデックス
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に配置
        // 結果を記録する配列 res を初期化
        int n = nums.length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num を対応するインデックスに配置
            counter[num]--; // 累積和を 1 減算し、num を配置する次のインデックスを取得
        }
        // 結果配列 res を使って元の配列 nums を上書き
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }
    ```

=== "C#"

    ```csharp title="counting_sort.cs"
    [class]{counting_sort}-[func]{CountingSort}
    ```

=== "Go"

    ```go title="counting_sort.go"
    [class]{}-[func]{countingSort}
    ```

=== "Swift"

    ```swift title="counting_sort.swift"
    [class]{}-[func]{countingSort}
    ```

=== "JS"

    ```javascript title="counting_sort.js"
    [class]{}-[func]{countingSort}
    ```

=== "TS"

    ```typescript title="counting_sort.ts"
    [class]{}-[func]{countingSort}
    ```

=== "Dart"

    ```dart title="counting_sort.dart"
    [class]{}-[func]{countingSort}
    ```

=== "Rust"

    ```rust title="counting_sort.rs"
    [class]{}-[func]{counting_sort}
    ```

=== "C"

    ```c title="counting_sort.c"
    [class]{}-[func]{countingSort}
    ```

=== "Kotlin"

    ```kotlin title="counting_sort.kt"
    [class]{}-[func]{countingSort}
    ```

=== "Ruby"

    ```ruby title="counting_sort.rb"
    [class]{}-[func]{counting_sort}
    ```

=== "Zig"

    ```zig title="counting_sort.zig"
    [class]{}-[func]{countingSort}
    ```

## 11.9.3 &nbsp; アルゴリズムの特徴

- **時間計算量は $O(n + m)$、非適応ソート**：`nums` と `counter` の走査が含まれ、どちらも線形時間を使用します。一般的に、$n \gg m$ であり、時間計算量は $O(n)$ に近づきます。
- **空間計算量は $O(n + m)$、非インプレースソート**：長さ $n$ の配列 `res` と長さ $m$ の配列 `counter` をそれぞれ使用します。
- **安定ソート**：要素が「右から左」の順序で `res` に埋められるため、`nums` の走査を逆順にすることで、等しい要素間の相対位置の変化を防ぎ、安定したソートを実現できます。実際、`nums` を順番に走査しても正しいソート結果を生成できますが、結果は不安定です。

## 11.9.4 &nbsp; 制限事項

今までに、計数ソートは非常に巧妙だと感じるかもしれません。単に量をカウントするだけで効率的なソートを実現できるからです。しかし、計数ソートを使用するための前提条件は比較的厳しいです。

**計数ソートは非負整数にのみ適用できます**。他のタイプのデータに適用したい場合、これらのデータが要素の元の順序を変更することなく非負整数に変換できることを保証する必要があります。例えば、負の整数を含む配列の場合、最初にすべての数に定数を加えて、すべてを正の数に変換し、ソート完了後に元に戻すことができます。

**計数ソートは値の範囲が小さい大きなデータセットに適しています**。例えば、上記の例では、$m$ は大きすぎるべきではありません。そうでなければ、あまりにも多くのスペースを占有してしまいます。そして $n \ll m$ の場合、計数ソートは $O(m)$ 時間を使用し、$O(n \log n)$ ソートアルゴリズムより遅い可能性があります。
