---
comments: true
---

# 11.4 &nbsp; 挿入ソート

<u>挿入ソート</u>は、トランプのデッキを手動でソートするプロセスによく似た動作をするシンプルなソートアルゴリズムです。

具体的には、未ソート区間からベース要素を選択し、その左側のソート済み区間の要素と比較して、要素を正しい位置に挿入します。

下図は、要素が配列に挿入される方法を示しています。ベース要素を`base`とすると、ターゲットインデックスから`base`までのすべての要素を右に1つずつシフトし、その後`base`をターゲットインデックスに割り当てる必要があります。

![Single insertion operation](insertion_sort.assets/insertion_operation.png){ class="animation-figure" }

<p align="center"> 図 11-6 &nbsp; Single insertion operation </p>

## 11.4.1 &nbsp; アルゴリズムプロセス

挿入ソートの全体的なプロセスは下図に示されます。

1. 配列の最初の要素をソート済みとみなします。
2. 2番目の要素を`base`として選択し、正しい位置に挿入して、**最初の2つの要素をソート済みにします**。
3. 3番目の要素を`base`として選択し、正しい位置に挿入して、**最初の3つの要素をソート済みにします**。
4. この方法で続行し、最後の反復では、最後の要素を`base`として取り、正しい位置に挿入した後、**すべての要素がソートされます**。

![Insertion sort process](insertion_sort.assets/insertion_sort_overview.png){ class="animation-figure" }

<p align="center"> 図 11-7 &nbsp; Insertion sort process </p>

コード例は以下の通りです：

=== "Python"

    ```python title="insertion_sort.py"
    def insertion_sort(nums: list[int]):
        """挿入ソート"""
        # 外側のループ：ソート済み範囲は [0, i-1]
        for i in range(1, len(nums)):
            base = nums[i]
            j = i - 1
            # 内側のループ：base をソート済み範囲 [0, i-1] の正しい位置に挿入
            while j >= 0 and nums[j] > base:
                nums[j + 1] = nums[j]  # nums[j] を右に1つ移動
                j -= 1
            nums[j + 1] = base  # base を正しい位置に代入
    ```

=== "C++"

    ```cpp title="insertion_sort.cpp"
    /* 挿入ソート */
    void insertionSort(vector<int> &nums) {
        // 外側ループ：ソート済み範囲は[0, i-1]
        for (int i = 1; i < nums.size(); i++) {
            int base = nums[i], j = i - 1;
            // 内側ループ：baseをソート済み範囲[0, i-1]内の正しい位置に挿入
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // nums[j]を一つ右に移動
                j--;
            }
            nums[j + 1] = base; // baseを正しい位置に代入
        }
    }
    ```

=== "Java"

    ```java title="insertion_sort.java"
    /* 挿入ソート */
    void insertionSort(int[] nums) {
        // 外側ループ: ソート済み範囲は [0, i-1]
        for (int i = 1; i < nums.length; i++) {
            int base = nums[i], j = i - 1;
            // 内側ループ: base をソート済み範囲 [0, i-1] の正しい位置に挿入
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j]; // nums[j] を右に1つ移動
                j--;
            }
            nums[j + 1] = base;        // base を正しい位置に代入
        }
    }
    ```

=== "C#"

    ```csharp title="insertion_sort.cs"
    [class]{insertion_sort}-[func]{InsertionSort}
    ```

=== "Go"

    ```go title="insertion_sort.go"
    [class]{}-[func]{insertionSort}
    ```

=== "Swift"

    ```swift title="insertion_sort.swift"
    [class]{}-[func]{insertionSort}
    ```

=== "JS"

    ```javascript title="insertion_sort.js"
    [class]{}-[func]{insertionSort}
    ```

=== "TS"

    ```typescript title="insertion_sort.ts"
    [class]{}-[func]{insertionSort}
    ```

=== "Dart"

    ```dart title="insertion_sort.dart"
    [class]{}-[func]{insertionSort}
    ```

=== "Rust"

    ```rust title="insertion_sort.rs"
    [class]{}-[func]{insertion_sort}
    ```

=== "C"

    ```c title="insertion_sort.c"
    [class]{}-[func]{insertionSort}
    ```

=== "Kotlin"

    ```kotlin title="insertion_sort.kt"
    [class]{}-[func]{insertionSort}
    ```

=== "Ruby"

    ```ruby title="insertion_sort.rb"
    [class]{}-[func]{insertion_sort}
    ```

## 11.4.2 &nbsp; アルゴリズムの特性

- **時間計算量は$O(n^2)$、適応ソート**：最悪の場合、各挿入操作には$n - 1$、$n-2$、...、$2$、$1$のループが必要で、合計は$(n - 1) n / 2$となり、時間計算量は$O(n^2)$です。順序付きデータの場合、挿入操作は早期に終了します。入力配列が完全に順序付けられている場合、挿入ソートは最良時間計算量$O(n)$を実現します。
- **空間計算量は$O(1)$、インプレースソート**：ポインタ$i$と$j$は定数量の追加空間を使用します。
- **安定ソート**：挿入操作中、等しい要素の右側に要素を挿入し、順序を変更しません。

## 11.4.3 &nbsp; 挿入ソートの利点

挿入ソートの時間計算量は$O(n^2)$で、次に学習するクイックソートの時間計算量は$O(n \log n)$です。挿入ソートはより高い時間計算量を持ちますが、**小さな入力サイズでは通常より高速です**。

この結論は線形探索と二分探索の結論と似ています。時間計算量が$O(n \log n)$で分割統治戦略に基づくクイックソートなどのアルゴリズムは、多くの場合より多くの単位操作を含みます。小さな入力サイズでは、$n^2$と$n \log n$の数値は近く、計算量が支配的でなく、ラウンドあたりの単位操作数が決定的な役割を果たします。

実際、多くのプログラミング言語（Javaなど）は、組み込みソート関数内で挿入ソートを使用しています。一般的なアプローチは：長い配列に対しては、クイックソートなどの分割統治戦略に基づくソートアルゴリズムを使用し、短い配列に対しては挿入ソートを直接使用します。

バブルソート、選択ソート、挿入ソートはすべて時間計算量$O(n^2)$を持ちますが、実際には、**挿入ソートはバブルソートや選択ソートよりも一般的に使用されます**。主な理由は以下の通りです。

- バブルソートは要素交換に基づき、一時変数の使用が必要で、3つの単位操作を含みます；挿入ソートは要素代入に基づき、1つの単位操作のみが必要です。したがって、**バブルソートの計算オーバーヘッドは一般的に挿入ソートよりも高くなります**。
- 選択ソートの時間計算量は常に$O(n^2)$です。**部分的に順序付けられたデータのセットが与えられた場合、挿入ソートは通常選択ソートよりも効率的です**。
- 選択ソートは不安定で、マルチレベルソートに適用できません。
