---
comments: true
---

# 2.6 &nbsp; 練習問題

## 2.6.1 &nbsp; 理解を確かめる問題

### 1. &nbsp; 反復と再帰の時間計算量と空間計算量

次の 2 つのコードは、どちらも $1 + 2 + \dots + n$ を計算します（$n \ge 1$ とします）。`n` を 4 に設定し、
プログラムが実際に実行される順に沿って問いに答え、2 つの書き方の効率を比較してください。

=== "Python"

    ```python title="complexity_exercises.py"
    def sum_iter(n: int) -> int:
        """反復による総和"""
        res = 0
        for i in range(1, n + 1):
            res += i
        return res

    def sum_recur(n: int) -> int:
        """再帰による総和"""
        if n == 1:
            return 1
        return n + sum_recur(n - 1)
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* 反復による総和 */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; ++i) {
            res += i;
        }
        return res;
    }

    /* 再帰による総和 */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* 反復による総和 */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 再帰による総和 */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* 反復による総和 */
    int SumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 再帰による総和 */
    int SumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + SumRecur(n - 1);
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* 反復による総和 */
    func sumIter(n int) int {
        res := 0
        for i := 1; i <= n; i++ {
            res += i
        }
        return res
    }

    /* 再帰による総和 */
    func sumRecur(n int) int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n-1)
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* 反復による総和 */
    func sumIter(n: Int) -> Int {
        var res = 0
        for i in 1 ... n {
            res += i
        }
        return res
    }

    /* 再帰による総和 */
    func sumRecur(n: Int) -> Int {
        if n == 1 {
            return 1
        }
        return n + sumRecur(n: n - 1)
    }
    ```

=== "JS"

    ```javascript title="complexity_exercises.js"
    /* 反復による総和 */
    function sumIter(n) {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 再帰による総和 */
    function sumRecur(n) {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* 反復による総和 */
    function sumIter(n: number): number {
        let res = 0;
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 再帰による総和 */
    function sumRecur(n: number): number {
        if (n === 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* 反復による総和 */
    int sumIter(int n) {
      int res = 0;
      for (int i = 1; i <= n; i++) {
        res += i;
      }
      return res;
    }

    /* 再帰による総和 */
    int sumRecur(int n) {
      if (n == 1) {
        return 1;
      }
      return n + sumRecur(n - 1);
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* 反復による総和 */
    fn sum_iter(n: i32) -> i32 {
        let mut res = 0;
        for i in 1..=n {
            res += i;
        }
        res
    }

    /* 再帰による総和 */
    fn sum_recur(n: i32) -> i32 {
        if n == 1 {
            return 1;
        }
        n + sum_recur(n - 1)
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* 反復による総和 */
    int sumIter(int n) {
        int res = 0;
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }

    /* 再帰による総和 */
    int sumRecur(int n) {
        if (n == 1) {
            return 1;
        }
        return n + sumRecur(n - 1);
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* 反復による総和 */
    fun sumIter(n: Int): Int {
        var res = 0
        for (i in 1..n) {
            res += i
        }
        return res
    }

    /* 再帰による総和 */
    fun sumRecur(n: Int): Int {
        if (n == 1) {
            return 1
        }
        return n + sumRecur(n - 1)
    }
    ```

=== "Ruby"

    ```ruby title="complexity_exercises.rb"
    ### 反復による総和 ###
    def sum_iter(n)
      res = 0
      for i in 1..n
        res += i
      end
      res
    end

    ### 再帰による総和 ###
    def sum_recur(n)
      return 1 if n == 1

      n + sum_recur(n - 1)
    end
    ```

<!-- numbered-subquestions -->

1. `n = 4` を入力して反復版の関数を実行すると、ループを 1 回終えるごとに、合計を保持する変数 `res` の値はいくつになりますか。
2. `n = 4` を入力して再帰版の関数を実行すると、引数 `n` は順にどのような値を取りますか。最も深い呼び出しから戻るとき、結果はどのように求まりますか。
3. それぞれの時間計算量と空間計算量はいくらですか。問 1、2 の実行過程を踏まえて理由を説明してください。

??? success "解答例"

    1. ループ変数 `i` は順に `1、2、3、4` となり、ループを 1 回終えるごとに `res` は順に
        `1、3、6、10` となるので、反復版の関数は 10 を返します。

    2. 引数 `n` は `4 → 3 → 2 → 1` の順に変化します。
        最も深い呼び出しが 1 を返し、そこから戻るたびに `2 + 1 = 3`、`3 + 3 = 6`、`4 + 6 = 10` が順に求まります。
        最も深い呼び出しに達した時点では、4 回の関数呼び出しはすべて実行中です。

    3. どちらも反復または呼び出しの回数が $n$ に比例するため、時間計算量はいずれも $O(n)$ です。
        空間計算量には違いがあります。反復版で使う変数の個数は一定なので $O(1)$ です。
        再帰版では終了条件に達するまで、それまでの各呼び出しが戻り値を待ちます。そのため、呼び出しスタックには最大 $n$ 回分の呼び出しが同時に保持され、
        空間計算量は $O(n)$ です。

        空間計算量を分析する際は、コード中の変数に加えて、再帰呼び出しが使う領域も考慮します。

### 2. &nbsp; 3 つのコード片の時間計算量

次の 3 つのコード片はいずれも正整数 $n$ を入力とします。時間計算量の小さい順に並べ、それぞれの計算量を書いてください。

=== "Python"

    ```python title="complexity_exercises.py"
    def linear_loop(n: int) -> int:
        """線形時間のループ"""
        res = 0
        for i in range(n):
            res += i
        return res

    def quadratic_loop(n: int) -> int:
        """二次時間のループ"""
        res = 0
        for i in range(n):
            for j in range(i, n):
                res += j
        return res

    def logarithmic_loop(n: int) -> int:
        """対数時間のループ"""
        while n > 1:
            n //= 2
        return n
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* 線形時間のループ */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            res += i;
        }
        return res;
    }

    /* 二次時間のループ */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            for (int j = i; j < n; ++j) {
                res += j;
            }
        }
        return res;
    }

    /* 対数時間のループ */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* 線形時間のループ */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 二次時間のループ */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 対数時間のループ */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* 線形時間のループ */
    int LinearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 二次時間のループ */
    int QuadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 対数時間のループ */
    int LogarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* 線形時間のループ */
    func linearLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            res += i
        }
        return res
    }

    /* 二次時間のループ */
    func quadraticLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            for j := i; j < n; j++ {
                res += j
            }
        }
        return res
    }

    /* 対数時間のループ */
    func logarithmicLoop(n int) int {
        for n > 1 {
            n /= 2
        }
        return n
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* 線形時間のループ */
    func linearLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            res += i
        }
        return res
    }

    /* 二次時間のループ */
    func quadraticLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            for j in i ..< n {
                res += j
            }
        }
        return res
    }

    /* 対数時間のループ */
    func logarithmicLoop(n: Int) -> Int {
        var n = n
        while n > 1 {
            n /= 2
        }
        return n
    }
    ```

=== "JS"

    ```javascript title="complexity_exercises.js"
    /* 線形時間のループ */
    function linearLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 二次時間のループ */
    function quadraticLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 対数時間のループ */
    function logarithmicLoop(n) {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* 線形時間のループ */
    function linearLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 二次時間のループ */
    function quadraticLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 対数時間のループ */
    function logarithmicLoop(n: number): number {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* 線形時間のループ */
    int linearLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        res += i;
      }
      return res;
    }

    /* 二次時間のループ */
    int quadraticLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
          res += j;
        }
      }
      return res;
    }

    /* 対数時間のループ */
    int logarithmicLoop(int n) {
      while (n > 1) {
        n ~/= 2;
      }
      return n;
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* 線形時間のループ */
    fn linear_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            res += i;
        }
        res
    }

    /* 二次時間のループ */
    fn quadratic_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            for j in i..n {
                res += j;
            }
        }
        res
    }

    /* 対数時間のループ */
    fn logarithmic_loop(mut n: i32) -> i32 {
        while n > 1 {
            n /= 2;
        }
        n
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* 線形時間のループ */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 二次時間のループ */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 対数時間のループ */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* 線形時間のループ */
    fun linearLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            res += i
        }
        return res
    }

    /* 二次時間のループ */
    fun quadraticLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            for (j in i until n) {
                res += j
            }
        }
        return res
    }

    /* 対数時間のループ */
    fun logarithmicLoop(n: Int): Int {
        var value = n
        while (value > 1) {
            value /= 2
        }
        return value
    }
    ```

=== "Ruby"

    ```ruby title="complexity_exercises.rb"
    ### 線形時間のループ ###
    def linear_loop(n)
      res = 0
      for i in 0...n
        res += i
      end
      res
    end

    ### 二次時間のループ ###
    def quadratic_loop(n)
      res = 0
      for i in 0...n
        for j in i...n
          res += j
        end
      end
      res
    end

    ### 対数時間のループ ###
    def logarithmic_loop(n)
      n /= 2 while n > 1
      n
    end
    ```

??? success "解答例"

    小さい順に、コード片 3 が $O(\log n)$、コード片 1 が $O(n)$、コード片 2 が $O(n^2)$ です。
    コード片 3 では、ループのたびに $n$ が半分になるので、繰り返し回数は約 $\log_2 n$ 回です。
    コード片 1 のループはちょうど $n$ 回実行されます。コード片 2 の内側のループの実行回数は順に
    $n,n-1,\dots,1$ で、合計は $n(n+1)/2$ 回となるので、二次の時間計算量です。

### 3. &nbsp; どちらの反転方法がメモリを節約できるか

配列 `nums` の要素をすべて逆順にするには、次の 2 つの方法があります。

<!-- numbered-subquestions -->

1. 同じ長さの配列 `res` を新しく作り、要素を逆順にコピーして返します。
2. 2 つのインデックス `i` と `j` をそれぞれ先頭と末尾から中央に向けて動かし、`nums[i]` と `nums[j]` を順次交換します。

    それぞれの空間計算量はいくらですか。インプレース操作に当たるのはどちらですか。

??? success "解答例"

    1. 入力と同じ長さの補助配列が必要なので、空間計算量は $O(n)$ です。

    2. 使うのは 2 つのインデックス変数だけなので、
        空間計算量は $O(1)$ で、インプレース操作です。

        インプレースで反転すると、入力配列自体が変わります。
        入力を変更してよい場合に限り、こちらを優先します。元の配列を残すには、方法 1 のコピーにかかるコストは避けられません。

## 2.6.2 &nbsp; プログラミング問題

### 1. &nbsp; フィボナッチ数

フィボナッチ数列では $F(0)=0$、$F(1)=1$ が成り立ち、$n\ge2$ のとき、
$F(n)=F(n-1)+F(n-2)$ が成り立ちます。

非負整数 `n` が与えられます。再帰を使わず、ループで $F(n)$ を計算して返してください。

??? tip "解き方のヒント"

    1. まず、n が 0 の場合と 1 の場合を個別に処理します。
    2. 次の項の計算に必要なのは直前の 2 項だけなので、数列全体を保存する必要はありません。
    3. 2 つの変数を更新するとき、まだ使う値を先に上書きしないようにしましょう。

[LeetCode](https://leetcode.com/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
