---
comments: true
---

# 2.6 &nbsp; 演習

## 2.6.1 &nbsp; 確認問題

### 1. &nbsp; 反復と再帰の時間・空間計算量

次の 2 つのコードは、どちらも $1 + 2 + \dots + n$ を計算します（$n \ge 1$ とします）。`n` を 4 として、
プログラムが実際に実行される順序に沿って次の問いに答え、2 つの書き方の効率を比較してください。

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

1. `n = 4` を入力して反復関数を実行すると、各ループの終了時に累積変数 `res` はそれぞれいくつになりますか？
2. `n = 4` を入力して再帰関数を実行すると、引数 `n` はどの値を順に取りますか？最も深い呼び出しから戻るとき、結果はどのように求められますか？
3. 2 つの書き方の時間計算量と空間計算量は、それぞれいくつですか？問い 1、2 の実行過程と結び付けて理由を説明してください。

??? success "解答"

    1. ループ変数 `i` は `1、2、3、4` の順に変化し、各ループの終了時に `res` は
        `1、3、6、10` となります。したがって、反復関数は 10 を返します。

    2. 引数 `n` は `4 → 3 → 2 → 1` の順に変化します。
        最も深い呼び出しが 1 を返した後、各呼び出しは順に `2 + 1 = 3`、`3 + 3 = 6`、`4 + 6 = 10` を得ます。
        最も深い呼び出しに到達した時点では、4 回の関数呼び出しはどれもまだ終了していません。

    3. どちらのコードも、$n$ に比例する回数のループまたは呼び出しを行うため、時間計算量はともに $O(n)$ です。
        一方、空間計算量は異なります。反復版が使う変数は定数個だけなので $O(1)$ です。
        再帰版では、終了条件に到達するまで、それまでの関数呼び出しが結果を待つ必要があります。そのため、呼び出しスタックには最大で $n$ 回分の呼び出しが同時に保存され、
        空間計算量は $O(n)$ です。

        空間計算量を分析するときは、コード中の変数だけでなく、再帰呼び出しが使う空間も考える必要があります。

### 2. &nbsp; 3 つのコードの時間計算量

次の 3 つのコード片はいずれも、正の整数 $n$ を入力とします。時間計算量が小さい順に並べ、それぞれの計算量を書いてください。

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

??? success "解答"

    小さい順に、コード片 3 は $O(\log n)$、コード片 1 は $O(n)$、コード片 2 は $O(n^2)$ です。
    コード片 3 では、ループのたびに $n$ が半分になるため、ループ回数は約 $\log_2 n$ 回です。
    コード片 1 のループはちょうど $n$ 回実行されます。コード片 2 の内側のループ回数は順に
    $n,n-1,\dots,1$ で、合計は $n(n+1)/2$ となるため、二次の計算量です。

### 3. &nbsp; どちらの反転が空間を節約できるか

配列 `nums` のすべての要素を逆順にする方法として、次の 2 つがあります。

<!-- numbered-subquestions -->

1. 同じ長さの新しい配列 `res` を作り、逆順にコピーして返す。
2. 2 つのインデックス `i` と `j` をそれぞれ先頭と末尾から中央へ動かし、`nums[i]` と `nums[j]` を順に交換する。

    2 つの方法の空間計算量は、それぞれいくつですか？どちらが「インプレース」な操作ですか？

??? success "解答"

    1. 入力と同じ長さの補助配列が必要なため、空間計算量は $O(n)$ です。

    2. 使うのは 2 つのインデックス変数だけなので、
        空間計算量は $O(1)$ であり、インプレースな操作です。

        ただし、インプレースな反転は入力配列を変更します。
        入力の変更が許される場合にのみ優先して使うべきです。元の配列を残す必要がある場合は、方法 1 のコピーにかかる空間を省くことはできません。

## 2.6.2 &nbsp; プログラミング演習

### 1. &nbsp; フィボナッチ数

フィボナッチ数列は、$F(0)=0$、$F(1)=1$ を満たし、$n\ge2$ のとき
$F(n)=F(n-1)+F(n-2)$ となります。

0 以上の整数 `n` が与えられます。再帰を使わず、ループを使って $F(n)$ を計算し、返してください。

??? tip "解法のヒント"

    1. まず、n が 0 と 1 の場合をそれぞれ処理します
    2. 次の項の計算に必要なのは直前の 2 項だけで、数列全体を保存する必要はありません
    3. 2 つの変数を更新するときは、後で使う古い値を先に上書きしないよう注意します

[LeetCode](https://leetcode.com/problems/fibonacci-number/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
