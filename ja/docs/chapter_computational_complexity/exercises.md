---
comments: true
---

# 2.6 &nbsp; 練習問題

## 2.6.1 &nbsp; 知識の確認

### 1. &nbsp; 反復と再帰の時間と空間

次の二つのコードは、どちらも $1 + 2 + \dots + n$（$n \ge 1$ とします）を計算します。`n` を 4 に設定し、
プログラムが実際に実行される順に沿って問いに答え、二つの書き方の効率を比較してください。

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

1. `n = 4` を入力して反復関数を実行すると、各反復の終了後に累積変数 `res` の値はそれぞれいくつになりますか。
2. `n = 4` を入力して再帰関数を実行すると、引数 `n` は順にどの値を取りますか。最も深い呼び出しから戻るとき、結果はどのように求まりますか。
3. 二つの書き方の時間計算量と空間計算量はそれぞれいくつですか。問い 1、2 の実行過程に基づいて理由を説明してください。

??? success "解答例"

    1. ループ変数 `i` は順に `1、2、3、4` となり、各反復の終了後に `res` は
        `1、3、6、10` となります。したがって、反復関数は 10 を返します。

    2. 引数 `n` は順に `4 → 3 → 2 → 1` となります。
        最も深い呼び出しが 1 を返し、その後、各呼び出しで順に `2 + 1 = 3`、`3 + 3 = 6`、`4 + 6 = 10` が求まります。
        最も深い位置では、4 回の関数呼び出しがすべて未完了です。

    3. どちらも $n$ に比例する回数のループまたは呼び出しを行うため、時間計算量はともに $O(n)$ です。
        空間計算量は異なります。反復版は定数個の変数だけを使うので、$O(1)$ です。
        再帰版では、終了条件に達するまで、先に行った関数呼び出しが結果を待ち続けます。このため、呼び出しスタックには最大で $n$ 回の呼び出しが同時に保持され、
        空間計算量は $O(n)$ となります。

        空間計算量の解析では、コード中の変数に加え、再帰呼び出しが使う領域も考慮する必要があります。

### 2. &nbsp; 三つのコードの時間計算量

次の三つのコード片には、いずれも正の整数 $n$ を入力します。時間計算量が小さい順に並べ、それぞれの計算量を書いてください。

=== "Python"

    ```python title="complexity_exercises.py"
    def linear_loop(n: int) -> int:
        """線形オーダーのループ"""
        res = 0
        for i in range(n):
            res += i
        return res

    def quadratic_loop(n: int) -> int:
        """二次オーダーのループ"""
        res = 0
        for i in range(n):
            for j in range(i, n):
                res += j
        return res

    def logarithmic_loop(n: int) -> int:
        """対数オーダーのループ"""
        while n > 1:
            n //= 2
        return n
    ```

=== "C++"

    ```cpp title="complexity_exercises.cpp"
    /* 線形オーダーのループ */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            res += i;
        }
        return res;
    }

    /* 二次オーダーのループ */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; ++i) {
            for (int j = i; j < n; ++j) {
                res += j;
            }
        }
        return res;
    }

    /* 対数オーダーのループ */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Java"

    ```java title="complexity_exercises.java"
    /* 線形オーダーのループ */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 二次オーダーのループ */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 対数オーダーのループ */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "C#"

    ```csharp title="complexity_exercises.cs"
    /* 線形オーダーのループ */
    int LinearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 二次オーダーのループ */
    int QuadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 対数オーダーのループ */
    int LogarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Go"

    ```go title="complexity_exercises.go"
    /* 線形オーダーのループ */
    func linearLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            res += i
        }
        return res
    }

    /* 二次オーダーのループ */
    func quadraticLoop(n int) int {
        res := 0
        for i := 0; i < n; i++ {
            for j := i; j < n; j++ {
                res += j
            }
        }
        return res
    }

    /* 対数オーダーのループ */
    func logarithmicLoop(n int) int {
        for n > 1 {
            n /= 2
        }
        return n
    }
    ```

=== "Swift"

    ```swift title="complexity_exercises.swift"
    /* 線形オーダーのループ */
    func linearLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            res += i
        }
        return res
    }

    /* 二次オーダーのループ */
    func quadraticLoop(n: Int) -> Int {
        var res = 0
        for i in 0 ..< n {
            for j in i ..< n {
                res += j
            }
        }
        return res
    }

    /* 対数オーダーのループ */
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
    /* 線形オーダーのループ */
    function linearLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 二次オーダーのループ */
    function quadraticLoop(n) {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 対数オーダーのループ */
    function logarithmicLoop(n) {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "TS"

    ```typescript title="complexity_exercises.ts"
    /* 線形オーダーのループ */
    function linearLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 二次オーダーのループ */
    function quadraticLoop(n: number): number {
        let res = 0;
        for (let i = 0; i < n; i++) {
            for (let j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 対数オーダーのループ */
    function logarithmicLoop(n: number): number {
        while (n > 1) {
            n = Math.floor(n / 2);
        }
        return n;
    }
    ```

=== "Dart"

    ```dart title="complexity_exercises.dart"
    /* 線形オーダーのループ */
    int linearLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        res += i;
      }
      return res;
    }

    /* 二次オーダーのループ */
    int quadraticLoop(int n) {
      int res = 0;
      for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
          res += j;
        }
      }
      return res;
    }

    /* 対数オーダーのループ */
    int logarithmicLoop(int n) {
      while (n > 1) {
        n ~/= 2;
      }
      return n;
    }
    ```

=== "Rust"

    ```rust title="complexity_exercises.rs"
    /* 線形オーダーのループ */
    fn linear_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            res += i;
        }
        res
    }

    /* 二次オーダーのループ */
    fn quadratic_loop(n: i32) -> i32 {
        let mut res = 0;
        for i in 0..n {
            for j in i..n {
                res += j;
            }
        }
        res
    }

    /* 対数オーダーのループ */
    fn logarithmic_loop(mut n: i32) -> i32 {
        while n > 1 {
            n /= 2;
        }
        n
    }
    ```

=== "C"

    ```c title="complexity_exercises.c"
    /* 線形オーダーのループ */
    int linearLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            res += i;
        }
        return res;
    }

    /* 二次オーダーのループ */
    int quadraticLoop(int n) {
        int res = 0;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                res += j;
            }
        }
        return res;
    }

    /* 対数オーダーのループ */
    int logarithmicLoop(int n) {
        while (n > 1) {
            n /= 2;
        }
        return n;
    }
    ```

=== "Kotlin"

    ```kotlin title="complexity_exercises.kt"
    /* 線形オーダーのループ */
    fun linearLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            res += i
        }
        return res
    }

    /* 二次オーダーのループ */
    fun quadraticLoop(n: Int): Int {
        var res = 0
        for (i in 0 until n) {
            for (j in i until n) {
                res += j
            }
        }
        return res
    }

    /* 対数オーダーのループ */
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
    ### 線形オーダーのループ ###
    def linear_loop(n)
      res = 0
      for i in 0...n
        res += i
      end
      res
    end

    ### 二次オーダーのループ ###
    def quadratic_loop(n)
      res = 0
      for i in 0...n
        for j in i...n
          res += j
        end
      end
      res
    end

    ### 対数オーダーのループ ###
    def logarithmic_loop(n)
      n /= 2 while n > 1
      n
    end
    ```

??? success "解答例"

    小さい順に、コード片 3 が $O(\log n)$、コード片 1 が $O(n)$、コード片 2 が $O(n^2)$ です。
    コード片 3 は、各反復で $n$ を半分にするため、約 $\log_2 n$ 回繰り返します。
    コード片 1 のループは、ちょうど $n$ 回実行されます。コード片 2 の内側のループ回数は順に
    $n,n-1,\dots,1$ で、合計 $n(n+1)/2$ 回となるため、二次のオーダーです。

### 3. &nbsp; 領域を節約できる反転方法

配列 `nums` の全要素を反転する方法として、次の二つがあります。

<!-- numbered-subquestions -->

1. 同じ長さの配列 `res` を新しく作り、逆順にコピーして返します。
2. 二つのインデックス `i` と `j` をそれぞれ先頭と末尾から中央へ進め、`nums[i]` と `nums[j]` を一組ずつ交換します。

    それぞれの空間計算量はいくつですか。どちらが「インプレース」の操作ですか。

??? success "解答例"

    1. 入力と同じ長さの補助配列が必要なので、空間計算量は $O(n)$ です。

    2. 二つのインデックス変数だけを使うため、
        空間計算量は $O(1)$ で、インプレースの操作です。

        注意点として、インプレースの反転は入力配列を変更します。
        入力の変更が許される場合に限って優先すべきです。元の配列を残す必要があれば、方法 1 のコピーにかかるコストは避けられません。

## 2.6.2 &nbsp; プログラミング演習

### 1. &nbsp; フィボナッチ数

フィボナッチ数列は、$F(0)=0$、$F(1)=1$ を満たし、$n\ge2$ のとき
$F(n)=F(n-1)+F(n-2)$ が成り立ちます。

非負整数 `n` が与えられます。再帰を使わず、ループで $F(n)$ を計算して返してください。

??? tip "解くためのヒント"

    1. まず n が 0 と 1 の場合を個別に処理します
    2. 次の項の計算には直前の二項だけが必要で、数列全体を保持する必要はありません
    3. 二つの変数を更新するときは、まだ使う古い値を先に上書きしないように注意します

[LeetCode](https://leetcode.com/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
