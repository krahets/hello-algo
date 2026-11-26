---
comments: true
---

# 11.10 &nbsp; 基数ソート

前節のカウントソートは、データ数 $n$ が多く、値の範囲 $m$ が狭い場合に適しています。$n = 10^6$ 個の学籍番号をソートしたいとします。学籍番号が $8$ 桁の数なら、値の範囲 $m = 10^8$ は非常に広く、カウントソートには大量のメモリが必要です。基数ソートならこれを避けられます。

<u>基数ソート（radix sort）</u>の基本的な考え方はカウントソートと同じで、個数を数えて並べ替えます。さらに、桁の位取りを利用し、桁ごとに順にソートして最終結果を得ます。

## 11.10.1 &nbsp; アルゴリズムの手順

学籍番号の例で、最下位を $1$ 桁目、最上位を $8$ 桁目とします。図 11-18 に基数ソートの手順を示します。

1. 桁番号 $k = 1$ を初期化します。
2. 学籍番号の $k$ 桁目をカウントソートします。これで $k$ 桁目の数字が小さい順に並びます。
3. $k$ を $1$ 増やしてステップ `2.` に戻り、すべての桁のソートが終わるまで繰り返します。

![基数ソートの手順](radix_sort.assets/radix_sort_overview.svg){ class="animation-figure" }

<p align="center"> 図 11-18 &nbsp; 基数ソートの手順 </p>

実装を見てみましょう。$d$ 進数 $x$ の下から $k$ 桁目の数字 $x_k$ は、次の式で取り出せます。

$$
x_k = \lfloor\frac{x}{d^{k-1}}\rfloor \bmod d
$$

ここで $\lfloor a \rfloor$ は浮動小数点数 $a$ を負の無限大の方向に丸めること、$\bmod \: d$ は $d$ を法とする剰余を表します。学籍番号の例では $d = 10$ かつ $k \in [1, 8]$ です。

さらに、各数値の $k$ 桁目でソートできるように、カウントソートのコードを少し変更します。

=== "Python"

    ```python title="radix_sort.py"
    def digit(num: int, exp: int) -> int:
        """要素 num の下から k 桁目を取得。ここで exp = 10^(k-1)"""
        # k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
        return (num // exp) % 10

    def counting_sort_digit(nums: list[int], exp: int):
        """カウントソート（nums の下から k 桁目でソート）"""
        # 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
        counter = [0] * 10
        n = len(nums)
        # 0～9 の各数字の出現回数を数える
        for i in range(n):
            d = digit(nums[i], exp)  # nums[i] の下から k 桁目を d とする
            counter[d] += 1  # 数字 d の出現回数を数える
        # 累積和を求め、出現回数を配列のインデックスに対応する値に変換
        for i in range(1, 10):
            counter[i] += counter[i - 1]
        # 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
        res = [0] * n
        for i in range(n - 1, -1, -1):
            d = digit(nums[i], exp)
            j = counter[d] - 1  # 配列内での d のインデックス j を求める
            res[j] = nums[i]  # 現在の要素をインデックス j に書き込む
            counter[d] -= 1  # d の個数を 1 減らす
        # 結果で元の配列 nums を上書き
        for i in range(n):
            nums[i] = res[i]

    def radix_sort(nums: list[int]):
        """基数ソート"""
        # 配列の最大値から最大桁数を求める
        m = max(nums)
        # 下位桁から上位桁へ順に走査
        exp = 1
        while exp <= m:
            # 配列要素の下から k 桁目にカウントソートを適用
            # k = 1 -> exp = 1
            # k = 2 -> exp = 10
            # すなわち exp = 10^(k-1)
            counting_sort_digit(nums, exp)
            exp *= 10
    ```

=== "C++"

    ```cpp title="radix_sort.cpp"
    /* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
    int digit(int num, int exp) {
        // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
        return (num / exp) % 10;
    }

    /* カウントソート（nums の下から k 桁目でソート） */
    void countingSortDigit(vector<int> &nums, int exp) {
        // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
        vector<int> counter(10, 0);
        int n = nums.size();
        // 0～9 の各数字の出現回数を数える
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // nums[i] の下から k 桁目を d とする
            counter[d]++;                // 数字 d の出現回数を数える
        }
        // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
        vector<int> res(n, 0);
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // 配列内での d のインデックス j を求める
            res[j] = nums[i];       // 現在の要素をインデックス j に書き込む
            counter[d]--;           // d の個数を 1 減らす
        }
        // 結果で元の配列 nums を上書き
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* 基数ソート */
    void radixSort(vector<int> &nums) {
        // 配列の最大値から最大桁数を求める
        int m = *max_element(nums.begin(), nums.end());
        // 下位桁から上位桁へ順に走査
        for (int exp = 1; exp <= m; exp *= 10)
            // 配列要素の下から k 桁目にカウントソートを適用
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // すなわち exp = 10^(k-1)
            countingSortDigit(nums, exp);
    }
    ```

=== "Java"

    ```java title="radix_sort.java"
    /* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
    int digit(int num, int exp) {
        // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
        return (num / exp) % 10;
    }

    /* カウントソート（nums の下から k 桁目でソート） */
    void countingSortDigit(int[] nums, int exp) {
        // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
        int[] counter = new int[10];
        int n = nums.length;
        // 0～9 の各数字の出現回数を数える
        for (int i = 0; i < n; i++) {
            int d = digit(nums[i], exp); // nums[i] の下から k 桁目を d とする
            counter[d]++;                // 数字 d の出現回数を数える
        }
        // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // 配列内での d のインデックス j を求める
            res[j] = nums[i];       // 現在の要素をインデックス j に書き込む
            counter[d]--;           // d の個数を 1 減らす
        }
        // 結果で元の配列 nums を上書き
        for (int i = 0; i < n; i++)
            nums[i] = res[i];
    }

    /* 基数ソート */
    void radixSort(int[] nums) {
        // 配列の最大値から最大桁数を求める
        int m = Integer.MIN_VALUE;
        for (int num : nums)
            if (num > m)
                m = num;
        // 下位桁から上位桁へ順に走査
        for (int exp = 1; exp <= m; exp *= 10) {
            // 配列要素の下から k 桁目にカウントソートを適用
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // すなわち exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "C#"

    ```csharp title="radix_sort.cs"
    /* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
    int Digit(int num, int exp) {
        // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
        return (num / exp) % 10;
    }

    /* カウントソート（nums の下から k 桁目でソート） */
    void CountingSortDigit(int[] nums, int exp) {
        // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
        int[] counter = new int[10];
        int n = nums.Length;
        // 0～9 の各数字の出現回数を数える
        for (int i = 0; i < n; i++) {
            int d = Digit(nums[i], exp); // nums[i] の下から k 桁目を d とする
            counter[d]++;                // 数字 d の出現回数を数える
        }
        // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = Digit(nums[i], exp);
            int j = counter[d] - 1; // 配列内での d のインデックス j を求める
            res[j] = nums[i];       // 現在の要素をインデックス j に書き込む
            counter[d]--;           // d の個数を 1 減らす
        }
        // 結果で元の配列 nums を上書き
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* 基数ソート */
    void RadixSort(int[] nums) {
        // 配列の最大値から最大桁数を求める
        int m = int.MinValue;
        foreach (int num in nums) {
            if (num > m) m = num;
        }
        // 下位桁から上位桁へ順に走査
        for (int exp = 1; exp <= m; exp *= 10) {
            // 配列要素の下から k 桁目にカウントソートを適用
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // すなわち exp = 10^(k-1)
            CountingSortDigit(nums, exp);
        }
    }
    ```

=== "Go"

    ```go title="radix_sort.go"
    /* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
    func digit(num, exp int) int {
        // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
        return (num / exp) % 10
    }

    /* カウントソート（nums の下から k 桁目でソート） */
    func countingSortDigit(nums []int, exp int) {
        // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
        counter := make([]int, 10)
        n := len(nums)
        // 0～9 の各数字の出現回数を数える
        for i := 0; i < n; i++ {
            d := digit(nums[i], exp) // nums[i] の下から k 桁目を d とする
            counter[d]++             // 数字 d の出現回数を数える
        }
        // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
        for i := 1; i < 10; i++ {
            counter[i] += counter[i-1]
        }
        // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
        res := make([]int, n)
        for i := n - 1; i >= 0; i-- {
            d := digit(nums[i], exp)
            j := counter[d] - 1 // 配列内での d のインデックス j を求める
            res[j] = nums[i]    // 現在の要素をインデックス j に書き込む
            counter[d]--        // d の個数を 1 減らす
        }
        // 結果で元の配列 nums を上書き
        for i := 0; i < n; i++ {
            nums[i] = res[i]
        }
    }

    /* 基数ソート */
    func radixSort(nums []int) {
        // 配列の最大値から最大桁数を求める
        max := math.MinInt
        for _, num := range nums {
            if num > max {
                max = num
            }
        }
        // 下位桁から上位桁へ順に走査
        for exp := 1; max >= exp; exp *= 10 {
            // 配列要素の下から k 桁目にカウントソートを適用
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // すなわち exp = 10^(k-1)
            countingSortDigit(nums, exp)
        }
    }
    ```

=== "Swift"

    ```swift title="radix_sort.swift"
    /* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
    func digit(num: Int, exp: Int) -> Int {
        // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
        (num / exp) % 10
    }

    /* カウントソート（nums の下から k 桁目でソート） */
    func countingSortDigit(nums: inout [Int], exp: Int) {
        // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
        var counter = Array(repeating: 0, count: 10)
        // 0～9 の各数字の出現回数を数える
        for i in nums.indices {
            let d = digit(num: nums[i], exp: exp) // nums[i] の下から k 桁目を d とする
            counter[d] += 1 // 数字 d の出現回数を数える
        }
        // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
        for i in 1 ..< 10 {
            counter[i] += counter[i - 1]
        }
        // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
        var res = Array(repeating: 0, count: nums.count)
        for i in nums.indices.reversed() {
            let d = digit(num: nums[i], exp: exp)
            let j = counter[d] - 1 // 配列内での d のインデックス j を求める
            res[j] = nums[i] // 現在の要素をインデックス j に書き込む
            counter[d] -= 1 // d の個数を 1 減らす
        }
        // 結果で元の配列 nums を上書き
        for i in nums.indices {
            nums[i] = res[i]
        }
    }

    /* 基数ソート */
    func radixSort(nums: inout [Int]) {
        // 配列の最大値から最大桁数を求める
        var m = Int.min
        for num in nums {
            if num > m {
                m = num
            }
        }
        // 下位桁から上位桁へ順に走査
        for exp in sequence(first: 1, next: { m >= ($0 * 10) ? $0 * 10 : nil }) {
            // 配列要素の下から k 桁目にカウントソートを適用
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // すなわち exp = 10^(k-1)
            countingSortDigit(nums: &nums, exp: exp)
        }
    }
    ```

=== "JS"

    ```javascript title="radix_sort.js"
    /* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
    function digit(num, exp) {
        // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
        return Math.floor(num / exp) % 10;
    }

    /* カウントソート（nums の下から k 桁目でソート） */
    function countingSortDigit(nums, exp) {
        // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
        const counter = new Array(10).fill(0);
        const n = nums.length;
        // 0～9 の各数字の出現回数を数える
        for (let i = 0; i < n; i++) {
            const d = digit(nums[i], exp); // nums[i] の下から k 桁目を d とする
            counter[d]++; // 数字 d の出現回数を数える
        }
        // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
        for (let i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
        const res = new Array(n).fill(0);
        for (let i = n - 1; i >= 0; i--) {
            const d = digit(nums[i], exp);
            const j = counter[d] - 1; // 配列内での d のインデックス j を求める
            res[j] = nums[i]; // 現在の要素をインデックス j に書き込む
            counter[d]--; // d の個数を 1 減らす
        }
        // 結果で元の配列 nums を上書き
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* 基数ソート */
    function radixSort(nums) {
        // 配列の最大値から最大桁数を求める
        let m = Math.max(... nums);
        // 下位桁から上位桁へ順に走査
        for (let exp = 1; exp <= m; exp *= 10) {
            // 配列要素の下から k 桁目にカウントソートを適用
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // すなわち exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "TS"

    ```typescript title="radix_sort.ts"
    /* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
    function digit(num: number, exp: number): number {
        // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
        return Math.floor(num / exp) % 10;
    }

    /* カウントソート（nums の下から k 桁目でソート） */
    function countingSortDigit(nums: number[], exp: number): void {
        // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
        const counter = new Array(10).fill(0);
        const n = nums.length;
        // 0～9 の各数字の出現回数を数える
        for (let i = 0; i < n; i++) {
            const d = digit(nums[i], exp); // nums[i] の下から k 桁目を d とする
            counter[d]++; // 数字 d の出現回数を数える
        }
        // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
        for (let i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
        const res = new Array(n).fill(0);
        for (let i = n - 1; i >= 0; i--) {
            const d = digit(nums[i], exp);
            const j = counter[d] - 1; // 配列内での d のインデックス j を求める
            res[j] = nums[i]; // 現在の要素をインデックス j に書き込む
            counter[d]--; // d の個数を 1 減らす
        }
        // 結果で元の配列 nums を上書き
        for (let i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* 基数ソート */
    function radixSort(nums: number[]): void {
        // 配列の最大値から最大桁数を求める
        let m: number = Math.max(... nums);
        // 下位桁から上位桁へ順に走査
        for (let exp = 1; exp <= m; exp *= 10) {
            // 配列要素の下から k 桁目にカウントソートを適用
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // すなわち exp = 10^(k-1)
            countingSortDigit(nums, exp);
        }
    }
    ```

=== "Dart"

    ```dart title="radix_sort.dart"
    /* 要素 _num の下から k 桁目を取得。ここで exp = 10^(k-1) */
    int digit(int _num, int exp) {
      // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
      return (_num ~/ exp) % 10;
    }

    /* カウントソート（nums の下から k 桁目でソート） */
    void countingSortDigit(List<int> nums, int exp) {
      // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
      List<int> counter = List<int>.filled(10, 0);
      int n = nums.length;
      // 0～9 の各数字の出現回数を数える
      for (int i = 0; i < n; i++) {
        int d = digit(nums[i], exp); // nums[i] の下から k 桁目を d とする
        counter[d]++; // 数字 d の出現回数を数える
      }
      // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
      for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
      }
      // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
      List<int> res = List<int>.filled(n, 0);
      for (int i = n - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // 配列内での d のインデックス j を求める
        res[j] = nums[i]; // 現在の要素をインデックス j に書き込む
        counter[d]--; // d の個数を 1 減らす
      }
      // 結果で元の配列 nums を上書き
      for (int i = 0; i < n; i++) nums[i] = res[i];
    }

    /* 基数ソート */
    void radixSort(List<int> nums) {
      // 配列の最大値から最大桁数を求める
      // Dart の int は 64 ビット
      int m = -1 << 63;
      for (int _num in nums) if (_num > m) m = _num;
      // 下位桁から上位桁へ順に走査
      for (int exp = 1; exp <= m; exp *= 10)
        // 配列要素の下から k 桁目にカウントソートを適用
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // すなわち exp = 10^(k-1)
        countingSortDigit(nums, exp);
    }
    ```

=== "Rust"

    ```rust title="radix_sort.rs"
    /* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
    fn digit(num: i32, exp: i32) -> usize {
        // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
        return ((num / exp) % 10) as usize;
    }

    /* カウントソート（nums の下から k 桁目でソート） */
    fn counting_sort_digit(nums: &mut [i32], exp: i32) {
        // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
        let mut counter = [0; 10];
        let n = nums.len();
        // 0～9 の各数字の出現回数を数える
        for i in 0..n {
            let d = digit(nums[i], exp); // nums[i] の下から k 桁目を d とする
            counter[d] += 1; // 数字 d の出現回数を数える
        }
        // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
        for i in 1..10 {
            counter[i] += counter[i - 1];
        }
        // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
        let mut res = vec![0; n];
        for i in (0..n).rev() {
            let d = digit(nums[i], exp);
            let j = counter[d] - 1; // 配列内での d のインデックス j を求める
            res[j] = nums[i]; // 現在の要素をインデックス j に書き込む
            counter[d] -= 1; // d の個数を 1 減らす
        }
        // 結果で元の配列 nums を上書き
        nums.copy_from_slice(&res);
    }

    /* 基数ソート */
    fn radix_sort(nums: &mut [i32]) {
        // 配列の最大値から最大桁数を求める
        let m = *nums.into_iter().max().unwrap();
        // 下位桁から上位桁へ順に走査
        let mut exp = 1;
        while exp <= m {
            counting_sort_digit(nums, exp);
            exp *= 10;
        }
    }
    ```

=== "C"

    ```c title="radix_sort.c"
    /* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
    int digit(int num, int exp) {
        // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
        return (num / exp) % 10;
    }

    /* カウントソート（nums の下から k 桁目でソート） */
    void countingSortDigit(int nums[], int size, int exp) {
        // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
        int *counter = (int *)malloc((sizeof(int) * 10));
        memset(counter, 0, sizeof(int) * 10); // 後でメモリを解放できるよう 0 で初期化
        // 0～9 の各数字の出現回数を数える
        for (int i = 0; i < size; i++) {
            // nums[i] の下から k 桁目を d とする
            int d = digit(nums[i], exp);
            // 数字 d の出現回数を数える
            counter[d]++;
        }
        // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
        int *res = (int *)malloc(sizeof(int) * size);
        for (int i = size - 1; i >= 0; i--) {
            int d = digit(nums[i], exp);
            int j = counter[d] - 1; // 配列内での d のインデックス j を求める
            res[j] = nums[i];       // 現在の要素をインデックス j に書き込む
            counter[d]--;           // d の個数を 1 減らす
        }
        // 結果で元の配列 nums を上書き
        for (int i = 0; i < size; i++) {
            nums[i] = res[i];
        }
        // メモリを解放
        free(res);
        free(counter);
    }

    /* 基数ソート */
    void radixSort(int nums[], int size) {
        // 配列の最大値から最大桁数を求める
        int max = INT32_MIN;
        for (int i = 0; i < size; i++) {
            if (nums[i] > max) {
                max = nums[i];
            }
        }
        // 下位桁から上位桁へ順に走査
        for (int exp = 1; max >= exp; exp *= 10)
            // 配列要素の下から k 桁目にカウントソートを適用
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // すなわち exp = 10^(k-1)
            countingSortDigit(nums, size, exp);
    }
    ```

=== "Kotlin"

    ```kotlin title="radix_sort.kt"
    /* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
    fun digit(num: Int, exp: Int): Int {
        // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
        return (num / exp) % 10
    }

    /* カウントソート（nums の下から k 桁目でソート） */
    fun countingSortDigit(nums: IntArray, exp: Int) {
        // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
        val counter = IntArray(10)
        val n = nums.size
        // 0～9 の各数字の出現回数を数える
        for (i in 0..<n) {
            val d = digit(nums[i], exp) // nums[i] の下から k 桁目を d とする
            counter[d]++                // 数字 d の出現回数を数える
        }
        // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
        for (i in 1..9) {
            counter[i] += counter[i - 1]
        }
        // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
        val res = IntArray(n)
        for (i in n - 1 downTo 0) {
            val d = digit(nums[i], exp)
            val j = counter[d] - 1 // 配列内での d のインデックス j を求める
            res[j] = nums[i]       // 現在の要素をインデックス j に書き込む
            counter[d]--           // d の個数を 1 減らす
        }
        // 結果で元の配列 nums を上書き
        for (i in 0..<n)
            nums[i] = res[i]
    }

    /* 基数ソート */
    fun radixSort(nums: IntArray) {
        // 配列の最大値から最大桁数を求める
        var m = Int.MIN_VALUE
        for (num in nums) if (num > m) m = num
        var exp = 1
        // 下位桁から上位桁へ順に走査
        while (exp <= m) {
            // 配列要素の下から k 桁目にカウントソートを適用
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // すなわち exp = 10^(k-1)
            countingSortDigit(nums, exp)
            exp *= 10
        }
    }
    ```

=== "Ruby"

    ```ruby title="radix_sort.rb"
    ### 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) ###
    def digit(num, exp)
      # k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
      (num / exp) % 10
    end

    ### カウントソート（nums の下から k 桁目でソート）###
    def counting_sort_digit(nums, exp)
      # 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
      counter = Array.new(10, 0)
      n = nums.length
      # 0～9 の各数字の出現回数を数える
      for i in 0...n
        d = digit(nums[i], exp) # nums[i] の下から k 桁目を d とする
        counter[d] += 1 # 数字 d の出現回数を数える
      end
      # 累積和を求め、出現回数を配列のインデックスに対応する値に変換
      (1...10).each { |i| counter[i] += counter[i - 1] }
      # 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
      res = Array.new(n, 0)
      for i in (n - 1).downto(0)
        d = digit(nums[i], exp)
        j = counter[d] - 1 # 配列内での d のインデックス j を求める
        res[j] = nums[i] # 現在の要素をインデックス j に書き込む
        counter[d] -= 1 # d の個数を 1 減らす
      end
      # 結果で元の配列 nums を上書き
      (0...n).each { |i| nums[i] = res[i] }
    end

    ### 基数ソート ###
    def radix_sort(nums)
      # 配列の最大値から最大桁数を求める
      m = nums.max
      # 下位桁から上位桁へ順に走査
      exp = 1
      while exp <= m
        # 配列要素の下から k 桁目にカウントソートを適用
        # k = 1 -> exp = 1
        # k = 2 -> exp = 10
        # すなわち exp = 10^(k-1)
        counting_sort_digit(nums, exp)
        exp *= 10
      end
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=def%20digit%28num%3A%20int,%20exp%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%20num%20%E3%81%AE%E4%B8%8B%E3%81%8B%E3%82%89%20k%20%E6%A1%81%E7%9B%AE%E3%82%92%E5%8F%96%E5%BE%97%E3%80%82%E3%81%93%E3%81%93%E3%81%A7%20exp%20%3D%2010%5E%28k-1%29%22%22%22%0A%20%20%20%20%23%20k%20%E3%81%A7%E3%81%AF%E3%81%AA%E3%81%8F%20exp%20%E3%82%92%E6%B8%A1%E3%81%97%E3%80%81%E8%B2%A0%E8%8D%B7%E3%81%AE%E9%AB%98%E3%81%84%E3%81%B9%E3%81%8D%E4%B9%97%E8%A8%88%E7%AE%97%E3%81%AE%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%97%E3%82%92%E9%81%BF%E3%81%91%E3%82%8B%0A%20%20%20%20return%20%28num%20//%20exp%29%20%25%2010%0A%0Adef%20counting_sort_digit%28nums%3A%20list%5Bint%5D,%20exp%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%EF%BC%88nums%20%E3%81%AE%E4%B8%8B%E3%81%8B%E3%82%89%20k%20%E6%A1%81%E7%9B%AE%E3%81%A7%E3%82%BD%E3%83%BC%E3%83%88%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E5%8D%81%E9%80%B2%E6%95%B0%E3%81%AE%E5%90%84%E6%A1%81%E3%81%AF%200%EF%BD%9E9%20%E3%81%AA%E3%81%AE%E3%81%A7%E3%80%81%E9%95%B7%E3%81%95%2010%20%E3%81%AE%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E9%85%8D%E5%88%97%E3%82%92%E7%94%A8%E6%84%8F%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%200%EF%BD%9E9%20%E3%81%AE%E5%90%84%E6%95%B0%E5%AD%97%E3%81%AE%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E6%95%B0%E3%81%88%E3%82%8B%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%20%20%23%20nums%5Bi%5D%20%E3%81%AE%E4%B8%8B%E3%81%8B%E3%82%89%20k%20%E6%A1%81%E7%9B%AE%E3%82%92%20d%20%E3%81%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20%2B%3D%201%20%20%23%20%E6%95%B0%E5%AD%97%20d%20%E3%81%AE%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E6%95%B0%E3%81%88%E3%82%8B%0A%20%20%20%20%23%20%E7%B4%AF%E7%A9%8D%E5%92%8C%E3%82%92%E6%B1%82%E3%82%81%E3%80%81%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E9%85%8D%E5%88%97%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AB%E5%AF%BE%E5%BF%9C%E3%81%99%E3%82%8B%E5%80%A4%E3%81%AB%E5%A4%89%E6%8F%9B%0A%20%20%20%20for%20i%20in%20range%281,%2010%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%5D%20%2B%3D%20counter%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%E3%82%92%E9%80%86%E9%A0%86%E3%81%AB%E8%B5%B0%E6%9F%BB%E3%81%97%E3%80%81%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%81%AE%E9%9B%86%E8%A8%88%E5%80%A4%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E5%90%84%E8%A6%81%E7%B4%A0%E3%82%92%20res%20%E3%81%AB%E6%9B%B8%E3%81%8D%E8%BE%BC%E3%82%80%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%0A%20%20%20%20%20%20%20%20j%20%3D%20counter%5Bd%5D%20-%201%20%20%23%20%E9%85%8D%E5%88%97%E5%86%85%E3%81%A7%E3%81%AE%20d%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20j%20%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20%20%20%20%20res%5Bj%5D%20%3D%20nums%5Bi%5D%20%20%23%20%E7%8F%BE%E5%9C%A8%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20j%20%E3%81%AB%E6%9B%B8%E3%81%8D%E8%BE%BC%E3%82%80%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20-%3D%201%20%20%23%20d%20%E3%81%AE%E5%80%8B%E6%95%B0%E3%82%92%201%20%E6%B8%9B%E3%82%89%E3%81%99%0A%20%20%20%20%23%20%E7%B5%90%E6%9E%9C%E3%81%A7%E5%85%83%E3%81%AE%E9%85%8D%E5%88%97%20nums%20%E3%82%92%E4%B8%8A%E6%9B%B8%E3%81%8D%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0Adef%20radix_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E6%95%B0%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%E3%81%AE%E6%9C%80%E5%A4%A7%E5%80%A4%E3%81%8B%E3%82%89%E6%9C%80%E5%A4%A7%E6%A1%81%E6%95%B0%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%20%E4%B8%8B%E4%BD%8D%E6%A1%81%E3%81%8B%E3%82%89%E4%B8%8A%E4%BD%8D%E6%A1%81%E3%81%B8%E9%A0%86%E3%81%AB%E8%B5%B0%E6%9F%BB%0A%20%20%20%20exp%20%3D%201%0A%20%20%20%20while%20exp%20%3C%3D%20m%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%85%8D%E5%88%97%E8%A6%81%E7%B4%A0%E3%81%AE%E4%B8%8B%E3%81%8B%E3%82%89%20k%20%E6%A1%81%E7%9B%AE%E3%81%AB%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%E3%82%92%E9%81%A9%E7%94%A8%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%201%20-%3E%20exp%20%3D%201%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%202%20-%3E%20exp%20%3D%2010%0A%20%20%20%20%20%20%20%20%23%20%E3%81%99%E3%81%AA%E3%82%8F%E3%81%A1%20exp%20%3D%2010%5E%28k-1%29%0A%20%20%20%20%20%20%20%20counting_sort_digit%28nums,%20exp%29%0A%20%20%20%20%20%20%20%20exp%20%2A%3D%2010%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%9F%BA%E6%95%B0%E3%82%BD%E3%83%BC%E3%83%88%0A%20%20%20%20nums%20%3D%20%5B%0A%20%20%20%20%20%20%20%20105,%0A%20%20%20%20%20%20%20%20356,%0A%20%20%20%20%20%20%20%20428,%0A%20%20%20%20%20%20%20%20348,%0A%20%20%20%20%20%20%20%20818,%0A%20%20%20%20%5D%0A%20%20%20%20radix_sort%28nums%29%0A%20%20%20%20print%28%22%E5%9F%BA%E6%95%B0%E3%82%BD%E3%83%BC%E3%83%88%E5%BE%8C%E3%81%AE%20nums%20%3D%22,%20nums%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20digit%28num%3A%20int,%20exp%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E8%A6%81%E7%B4%A0%20num%20%E3%81%AE%E4%B8%8B%E3%81%8B%E3%82%89%20k%20%E6%A1%81%E7%9B%AE%E3%82%92%E5%8F%96%E5%BE%97%E3%80%82%E3%81%93%E3%81%93%E3%81%A7%20exp%20%3D%2010%5E%28k-1%29%22%22%22%0A%20%20%20%20%23%20k%20%E3%81%A7%E3%81%AF%E3%81%AA%E3%81%8F%20exp%20%E3%82%92%E6%B8%A1%E3%81%97%E3%80%81%E8%B2%A0%E8%8D%B7%E3%81%AE%E9%AB%98%E3%81%84%E3%81%B9%E3%81%8D%E4%B9%97%E8%A8%88%E7%AE%97%E3%81%AE%E7%B9%B0%E3%82%8A%E8%BF%94%E3%81%97%E3%82%92%E9%81%BF%E3%81%91%E3%82%8B%0A%20%20%20%20return%20%28num%20//%20exp%29%20%25%2010%0A%0Adef%20counting_sort_digit%28nums%3A%20list%5Bint%5D,%20exp%3A%20int%29%3A%0A%20%20%20%20%22%22%22%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%EF%BC%88nums%20%E3%81%AE%E4%B8%8B%E3%81%8B%E3%82%89%20k%20%E6%A1%81%E7%9B%AE%E3%81%A7%E3%82%BD%E3%83%BC%E3%83%88%EF%BC%89%22%22%22%0A%20%20%20%20%23%20%E5%8D%81%E9%80%B2%E6%95%B0%E3%81%AE%E5%90%84%E6%A1%81%E3%81%AF%200%EF%BD%9E9%20%E3%81%AA%E3%81%AE%E3%81%A7%E3%80%81%E9%95%B7%E3%81%95%2010%20%E3%81%AE%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E9%85%8D%E5%88%97%E3%82%92%E7%94%A8%E6%84%8F%0A%20%20%20%20counter%20%3D%20%5B0%5D%20%2A%2010%0A%20%20%20%20n%20%3D%20len%28nums%29%0A%20%20%20%20%23%200%EF%BD%9E9%20%E3%81%AE%E5%90%84%E6%95%B0%E5%AD%97%E3%81%AE%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E6%95%B0%E3%81%88%E3%82%8B%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%20%20%23%20nums%5Bi%5D%20%E3%81%AE%E4%B8%8B%E3%81%8B%E3%82%89%20k%20%E6%A1%81%E7%9B%AE%E3%82%92%20d%20%E3%81%A8%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20%2B%3D%201%20%20%23%20%E6%95%B0%E5%AD%97%20d%20%E3%81%AE%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E6%95%B0%E3%81%88%E3%82%8B%0A%20%20%20%20%23%20%E7%B4%AF%E7%A9%8D%E5%92%8C%E3%82%92%E6%B1%82%E3%82%81%E3%80%81%E5%87%BA%E7%8F%BE%E5%9B%9E%E6%95%B0%E3%82%92%E9%85%8D%E5%88%97%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%AB%E5%AF%BE%E5%BF%9C%E3%81%99%E3%82%8B%E5%80%A4%E3%81%AB%E5%A4%89%E6%8F%9B%0A%20%20%20%20for%20i%20in%20range%281,%2010%29%3A%0A%20%20%20%20%20%20%20%20counter%5Bi%5D%20%2B%3D%20counter%5Bi%20-%201%5D%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%E3%82%92%E9%80%86%E9%A0%86%E3%81%AB%E8%B5%B0%E6%9F%BB%E3%81%97%E3%80%81%E3%83%90%E3%82%B1%E3%83%83%E3%83%88%E3%81%AE%E9%9B%86%E8%A8%88%E5%80%A4%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E5%90%84%E8%A6%81%E7%B4%A0%E3%82%92%20res%20%E3%81%AB%E6%9B%B8%E3%81%8D%E8%BE%BC%E3%82%80%0A%20%20%20%20res%20%3D%20%5B0%5D%20%2A%20n%0A%20%20%20%20for%20i%20in%20range%28n%20-%201,%20-1,%20-1%29%3A%0A%20%20%20%20%20%20%20%20d%20%3D%20digit%28nums%5Bi%5D,%20exp%29%0A%20%20%20%20%20%20%20%20j%20%3D%20counter%5Bd%5D%20-%201%20%20%23%20%E9%85%8D%E5%88%97%E5%86%85%E3%81%A7%E3%81%AE%20d%20%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20j%20%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20%20%20%20%20res%5Bj%5D%20%3D%20nums%5Bi%5D%20%20%23%20%E7%8F%BE%E5%9C%A8%E3%81%AE%E8%A6%81%E7%B4%A0%E3%82%92%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%20j%20%E3%81%AB%E6%9B%B8%E3%81%8D%E8%BE%BC%E3%82%80%0A%20%20%20%20%20%20%20%20counter%5Bd%5D%20-%3D%201%20%20%23%20d%20%E3%81%AE%E5%80%8B%E6%95%B0%E3%82%92%201%20%E6%B8%9B%E3%82%89%E3%81%99%0A%20%20%20%20%23%20%E7%B5%90%E6%9E%9C%E3%81%A7%E5%85%83%E3%81%AE%E9%85%8D%E5%88%97%20nums%20%E3%82%92%E4%B8%8A%E6%9B%B8%E3%81%8D%0A%20%20%20%20for%20i%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20nums%5Bi%5D%20%3D%20res%5Bi%5D%0A%0Adef%20radix_sort%28nums%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%9F%BA%E6%95%B0%E3%82%BD%E3%83%BC%E3%83%88%22%22%22%0A%20%20%20%20%23%20%E9%85%8D%E5%88%97%E3%81%AE%E6%9C%80%E5%A4%A7%E5%80%A4%E3%81%8B%E3%82%89%E6%9C%80%E5%A4%A7%E6%A1%81%E6%95%B0%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20m%20%3D%20max%28nums%29%0A%20%20%20%20%23%20%E4%B8%8B%E4%BD%8D%E6%A1%81%E3%81%8B%E3%82%89%E4%B8%8A%E4%BD%8D%E6%A1%81%E3%81%B8%E9%A0%86%E3%81%AB%E8%B5%B0%E6%9F%BB%0A%20%20%20%20exp%20%3D%201%0A%20%20%20%20while%20exp%20%3C%3D%20m%3A%0A%20%20%20%20%20%20%20%20%23%20%E9%85%8D%E5%88%97%E8%A6%81%E7%B4%A0%E3%81%AE%E4%B8%8B%E3%81%8B%E3%82%89%20k%20%E6%A1%81%E7%9B%AE%E3%81%AB%E3%82%AB%E3%82%A6%E3%83%B3%E3%83%88%E3%82%BD%E3%83%BC%E3%83%88%E3%82%92%E9%81%A9%E7%94%A8%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%201%20-%3E%20exp%20%3D%201%0A%20%20%20%20%20%20%20%20%23%20k%20%3D%202%20-%3E%20exp%20%3D%2010%0A%20%20%20%20%20%20%20%20%23%20%E3%81%99%E3%81%AA%E3%82%8F%E3%81%A1%20exp%20%3D%2010%5E%28k-1%29%0A%20%20%20%20%20%20%20%20counting_sort_digit%28nums,%20exp%29%0A%20%20%20%20%20%20%20%20exp%20%2A%3D%2010%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E5%9F%BA%E6%95%B0%E3%82%BD%E3%83%BC%E3%83%88%0A%20%20%20%20nums%20%3D%20%5B%0A%20%20%20%20%20%20%20%20105,%0A%20%20%20%20%20%20%20%20356,%0A%20%20%20%20%20%20%20%20428,%0A%20%20%20%20%20%20%20%20348,%0A%20%20%20%20%20%20%20%20818,%0A%20%20%20%20%5D%0A%20%20%20%20radix_sort%28nums%29%0A%20%20%20%20print%28%22%E5%9F%BA%E6%95%B0%E3%82%BD%E3%83%BC%E3%83%88%E5%BE%8C%E3%81%AE%20nums%20%3D%22,%20nums%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

!!! question "なぜ最下位桁からソートするのか"

    何回か続けてソートすると、後の回の結果が前の回の並びに優先します。たとえば 1 回目の結果が $a < b$ で、2 回目の結果が $a > b$ なら、2 回目の結果が採用されます。数値の大小では上位桁が優先されるため、先に下位桁をソートし、次に上位桁をソートします。

## 11.10.2 &nbsp; アルゴリズムの特性

カウントソートと比べ、基数ソートは値の範囲が広い場合にも適しています。**ただし、データを固定桁数で表せて、桁数が大きすぎないことが条件です**。たとえば浮動小数点数では桁数 $k$ が大きくなりすぎ、時間計算量が $O(nk) \gg O(n^2)$ になる可能性があるため、基数ソートには適していません。

- **時間計算量は $O(nk)$、非適応的なソート**。データ数を $n$、基数を $d$、最大桁数を $k$ とすると、1 桁のカウントソートには $O(n + d)$、全 $k$ 桁には $O((n + d)k)$ の時間がかかります。通常は $d$ と $k$ が比較的小さいため、時間計算量は $O(n)$ に近づきます。
- **空間計算量は $O(n + d)$、インプレースではないソート**。カウントソートと同じく、長さがそれぞれ $n$ と $d$ の配列 `res` と `counter` を使います。
- **安定ソート**。各桁のカウントソートが安定なら、基数ソートも安定です。カウントソートが不安定なら、基数ソートの結果が正しく並ぶ保証はありません。
