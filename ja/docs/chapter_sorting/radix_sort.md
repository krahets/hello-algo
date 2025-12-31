---
comments: true
---

# 11.10 &nbsp; 基数ソート

前の節では計数ソートを紹介しました。これは、データサイズ $n$ が大きいがデータ範囲 $m$ が小さいシナリオに適しています。$n = 10^6$ の学生IDをソートする必要があり、各IDが $8$ 桁の数字であるとします。これは、データ範囲 $m = 10^8$ が非常に大きいことを意味します。この場合、計数ソートを使用すると、大量のメモリスペースが必要になります。基数ソートはこの状況を回避できます。

<u>基数ソート</u>は計数ソートと同じ核心概念を共有し、要素の頻度をカウントすることでソートします。同時に、基数ソートは数字の桁間の漸進的関係を利用してこれを基盤としています。桁を一度に一つずつ処理してソートし、最終的なソート順序を達成します。

## 11.10.1 &nbsp; アルゴリズムの過程

学生IDデータを例として、最下位桁を $1$ 番目、最上位桁を $8$ 番目とすると、基数ソートの過程は以下の図に示されています。

1. 桁 $k = 1$ を初期化します。
2. 学生IDの $k$ 番目の桁に対して「計数ソート」を実行します。完了後、データは $k$ 番目の桁に基づいて最小から最大までソートされます。
3. $k$ を $1$ 増やし、手順 `2.` に戻って反復を続け、すべての桁がソートされるまで続けます。この時点で過程が終了します。

![基数ソートアルゴリズムの過程](radix_sort.assets/radix_sort_overview.png){ class="animation-figure" }

<p align="center"> 図 11-18 &nbsp; 基数ソートアルゴリズムの過程 </p>

以下、コード実装を詳しく見てみます。基数 $d$ での数 $x$ に対して、その $k$ 番目の桁 $x_k$ を取得するには、以下の計算式を使用できます：

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

ここで $\lfloor a \rfloor$ は浮動小数点数 $a$ の切り捨てを表し、$\bmod \: d$ は $d$ による剰余を表します。学生IDデータの場合、$d = 10$ で $k \in [1, 8]$ です。

さらに、$k$ 番目の桁に基づいてソートできるように、計数ソートのコードを少し修正する必要があります：

=== "Python"

    ```python title="radix_sort.py"
    def digit(num: int, exp: int) -> int:
        """要素 num の k 番目の桁を取得、exp = 10^(k-1)"""
        # k の代わりに exp を渡すことで、ここでコストの高い累乗計算を避けることができる
        return (num // exp) % 10

    def counting_sort_digit(nums: list[int], exp: int):
        """計数ソート（nums の k 番目の桁に基づく）"""
        # 10進数の桁の範囲は 0~9、したがって長さ10のバケット配列が必要
        counter = [0] * 10
        n = len(nums)
        # 数字 0~9 の出現回数を統計
        for i in range(n):
            d = digit(nums[i], exp)  # nums[i] の k 番目の桁を取得、d とする
            counter[d] += 1  # 数字 d の出現回数を統計
        # 前置和を計算し、「出現回数」を「配列インデックス」に変換
        for i in range(1, 10):
            counter[i] += counter[i - 1]
        # 逆順に走査し、バケット統計に基づいて各要素を res に配置
        res = [0] * n
        for i in range(n - 1, -1, -1):
            d = digit(nums[i], exp)
            j = counter[d] - 1  # 配列内の d のインデックス j を取得
            res[j] = nums[i]  # 現在の要素をインデックス j に配置
            counter[d] -= 1  # d の数を1減らす
        # 結果を使用して元の配列 nums を上書き
        for i in range(n):
            nums[i] = res[i]

    def radix_sort(nums: list[int]):
        """基数ソート"""
        # 配列の最大要素を取得し、最大桁数を判定するために使用
        m = max(nums)
        # 最下位桁から最上位桁まで走査
        exp = 1
        while exp <= m:
            # 配列要素の k 番目の桁に対して計数ソートを実行
            # k = 1 -> exp = 1
            # k = 2 -> exp = 10
            # つまり、exp = 10^(k-1)
            counting_sort_digit(nums, exp)
            exp *= 10
    ```

=== "C++"

    ```cpp title="radix_sort.cpp"
    /* 要素numのk番目の桁を取得、exp = 10^(k-1) */
    int digit(int num, int exp) {
        // kの代わりにexpを渡すことで、ここで繰り返される高価な冪乗計算を避けることができる
        return (num / exp) % 10;
    }

    /* カウントソート（numsのk番目の桁に基づく） */
    void countingSortDigit(vector<int> &nums, int exp) {
        // 10進数の桁範囲は0~9なので、長さ10のバケット配列が必要
        vector<int> counter(10, 0);
        int n = nums.size();
        // 数字0~9の出現回数を統計
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // nums[i]のk番目の桁を取得、dとして記録
            counter[d]++;                // 数字dの出現回数を統計
        }
        // 前缀和を計算し、「出現回数」を「配列インデックス」に変換
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 逆順で走査し、バケット統計に基づいて各要素をresに配置
        vector<int> res(n, 0);
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // dが配列内にあるインデックスjを取得
            res[j] = nums[i];       // 現在の要素をインデックスjに配置
            counter[d]--;           // dのカウントを1減らす
        }
        // 結果で元の配列numsを上書き
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* 基数ソート */
    void radixSort(vector<int> &nums) {
        // 配列の最大要素を取得、最大桁数を判定するために使用
        int m = *max_element(nums.begin(), nums.end());
        // 最下位桁から最上位桁まで走査
        for (int exp = 1; exp <= m; exp *= 10)
            // 配列要素のk番目の桁でカウントソートを実行
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // つまり、exp = 10^(k-1)
            countingSortDigit(nums, exp);
    }
    ```

=== "Java"

    ```java title="radix_sort.java"
    /* 要素 num の k 番目の桁を取得、exp = 10^(k-1) */
    int digit(int num, int exp) {
        // k の代わりに exp を渡すことで、ここでコストの高い累乗計算の繰り返しを避けることができる
        return (num / exp) % 10;
    }

    /* 計数ソート（nums の k 番目の桁に基づく） */
    void countingSortDigit(int[] nums, int exp) {
        // 10進数の桁の範囲は 0~9、したがって長さ 10 のバケット配列が必要
        int[] counter = new int[10];
        int n = nums.length;
        // 桁 0~9 の出現回数を統計
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // nums[i] の k 番目の桁を取得、d とする
            counter[d]++;                // 桁 d の出現回数を統計
        }
        // 累積和を計算し、「出現回数」を「配列インデックス」に変換
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 逆順に走査し、バケット統計に基づいて各要素を res に配置
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // 配列内での d のインデックス j を取得
            res[j] = nums[i];       // 現在の要素をインデックス j に配置
            counter[d]--;           // d のカウントを 1 減らす
        }
        // 結果で元の配列 nums を上書き
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* 基数ソート */
    void radixSort(int[] nums) {
        // 配列の最大要素を取得し、最大桁数を判定するために使用
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // 最下位桁から最上位桁まで走査
        for (int exp = 1; exp <= m; exp *= 10) {
            // 配列要素の k 番目の桁に対して計数ソートを実行
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // すなわち exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "C#"

    ```csharp title="radix_sort.cs"
    [class]{radix_sort}-[func]{Digit}

    [class]{radix_sort}-[func]{CountingSortDigit}

    [class]{radix_sort}-[func]{RadixSort}
    ```

=== "Go"

    ```go title="radix_sort.go"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "Swift"

    ```swift title="radix_sort.swift"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "JS"

    ```javascript title="radix_sort.js"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "TS"

    ```typescript title="radix_sort.ts"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "Dart"

    ```dart title="radix_sort.dart"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "Rust"

    ```rust title="radix_sort.rs"
    [class]{}-[func]{digit}

    [class]{}-[func]{counting_sort_digit}

    [class]{}-[func]{radix_sort}
    ```

=== "C"

    ```c title="radix_sort.c"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "Kotlin"

    ```kotlin title="radix_sort.kt"
    [class]{}-[func]{digit}

    [class]{}-[func]{countingSortDigit}

    [class]{}-[func]{radixSort}
    ```

=== "Ruby"

    ```ruby title="radix_sort.rb"
    [class]{}-[func]{digit}

    [class]{}-[func]{counting_sort_digit}

    [class]{}-[func]{radix_sort}
    ```

!!! question "なぜ最下位桁から開始するのか？"

    連続するソートラウンドでは、後のラウンドの結果が前のラウンドの結果を上書きします。例えば、最初のラウンドの結果が $a < b$ で、2番目のラウンドが $a > b$ の場合、2番目のラウンドの結果が最初のラウンドの結果を置き換えます。上位桁は下位桁より優先されるため、上位桁の前に下位桁をソートすることが理にかなっています。

## 11.10.2 &nbsp; アルゴリズムの特徴

計数ソートと比較して、基数ソートはより大きな数値範囲に適していますが、**データが固定桁数で表現でき、桁数があまり大きくないことを前提としています**。例えば、浮動小数点数は桁数 $k$ が大きい可能性があり、時間計算量 $O(nk) \gg O(n^2)$ につながる可能性があるため、基数ソートには適していません。

- **時間計算量は $O(nk)$、非適応ソート**：データサイズを $n$、データが基数 $d$、最大桁数を $k$ とすると、単一桁のソートには $O(n + d)$ 時間がかかり、すべての $k$ 桁のソートには $O((n + d)k)$ 時間がかかります。一般的に、$d$ と $k$ はどちらも比較的小さく、時間計算量は $O(n)$ に近づきます。
- **空間計算量は $O(n + d)$、非インプレースソート**：計数ソートと同様に、基数ソートは長さ $n$ と $d$ の配列 `res` と `counter` にそれぞれ依存します。
- **安定ソート**：計数ソートが安定な場合、基数ソートも安定です。計数ソートが不安定な場合、基数ソートは正しいソート順序を保証できません。
