---
comments: true
---

# 12.6 &nbsp; 練習問題

## 12.6.1 &nbsp; 知識の確認

### 1. &nbsp; 分割統治に適した作業

ある生徒が「まず半分に分け、それぞれを解き、結果を結合する」方法で次の作業を行おうとしています。
それぞれを「分割統治に適している」「分割統治はできるが総作業量は減らない」「二つを独立に解けない」のいずれかに分類し、理由を説明してください。

<!-- numbered-subquestions -->

1. 未整列配列をソートします。
2. 配列の最大値を求めます。
3. 一連のスタック操作 `push(x)`、`pop()` を順に実行し、各 `pop()` で得た要素を出力します。

??? success "解答例"

    1. 適しています。半分に分割し、それぞれを独立にソートして、$O(n)$ 時間で結合します。これはマージソートそのものです。
    2. 分割統治はできますが、総作業量は減りません。左右の半分を合わせると、全 $n$ 要素を調べる必要があり、
        直接走査する場合と同じ $O(n)$ 時間です。
    3. 二つを独立には解けません。後半開始時のスタックの内容は前半の実行結果に依存するため、
        互いの結果を知らずに独立して完了することはできません。

### 2. &nbsp; 高速べき乗で計算を減らす仕組み

次の再帰関数は、分割統治で $x^n$ を計算します。

=== "Python"

    ```python title="fast_power.py"
    def fast_pow(x: int, n: int) -> int:
        """高速べき乗法"""
        if n == 0:
            return 1
        half = fast_pow(x, n // 2)
        if n % 2 == 0:
            return half * half
        return half * half * x
    ```

=== "C++"

    ```cpp title="fast_power.cpp"
    /* 高速べき乗法 */
    int fastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = fastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "Java"

    ```java title="fast_power.java"
    /* 高速べき乗法 */
    int fastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = fastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "C#"

    ```csharp title="fast_power.cs"
    /* 高速べき乗法 */
    int FastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = FastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "Go"

    ```go title="fast_power.go"
    /* 高速べき乗法 */
    func fastPow(x, n int) int {
        if n == 0 {
            return 1
        }
        half := fastPow(x, n/2)
        if n%2 == 0 {
            return half * half
        }
        return half * half * x
    }
    ```

=== "Swift"

    ```swift title="fast_power.swift"
    /* 高速べき乗法 */
    func fastPow(x: Int, n: Int) -> Int {
        if n == 0 {
            return 1
        }
        let half = fastPow(x: x, n: n / 2)
        if n % 2 == 0 {
            return half * half
        }
        return half * half * x
    }
    ```

=== "JS"

    ```javascript title="fast_power.js"
    /* 高速べき乗法 */
    function fastPow(x, n) {
        if (n === 0) {
            return 1;
        }
        const half = fastPow(x, Math.floor(n / 2));
        if (n % 2 === 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "TS"

    ```typescript title="fast_power.ts"
    /* 高速べき乗法 */
    function fastPow(x: number, n: number): number {
        if (n === 0) {
            return 1;
        }
        const half = fastPow(x, Math.floor(n / 2));
        if (n % 2 === 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "Dart"

    ```dart title="fast_power.dart"
    /* 高速べき乗法 */
    int fastPow(int x, int n) {
      if (n == 0) {
        return 1;
      }
      int half = fastPow(x, n ~/ 2);
      if (n % 2 == 0) {
        return half * half;
      }
      return half * half * x;
    }
    ```

=== "Rust"

    ```rust title="fast_power.rs"
    /* 高速べき乗法 */
    fn fast_pow(x: i32, n: i32) -> i32 {
        if n == 0 {
            return 1;
        }
        let half = fast_pow(x, n / 2);
        if n % 2 == 0 {
            return half * half;
        }
        half * half * x
    }
    ```

=== "C"

    ```c title="fast_power.c"
    /* 高速べき乗法 */
    int fastPow(int x, int n) {
        if (n == 0) {
            return 1;
        }
        int half = fastPow(x, n / 2);
        if (n % 2 == 0) {
            return half * half;
        }
        return half * half * x;
    }
    ```

=== "Kotlin"

    ```kotlin title="fast_power.kt"
    /* 高速べき乗法 */
    fun fastPow(x: Int, n: Int): Int {
        if (n == 0) {
            return 1
        }
        val half = fastPow(x, n / 2)
        if (n % 2 == 0) {
            return half * half
        }
        return half * half * x
    }
    ```

=== "Ruby"

    ```ruby title="fast_power.rb"
    ### 高速べき乗法 ###
    def fast_pow(x, n)
      return 1 if n == 0

      half = fast_pow(x, n / 2)
      return half * half if n.even?

      half * half * x
    end
    ```

`x = 3`、`n = 5` として、この関数で計算します。

<!-- numbered-subquestions -->

1. 再帰呼び出しで、引数 `n` は順にどの値になりますか。
2. 最も深い呼び出しから戻るとき、各呼び出しは順にどの値を返しますか。
3. 乗算の両側で同じ部分問題を一回ずつ呼び出さず、先に再帰の結果を `half` に保存するのはなぜですか。

??? success "解答例"

    1. 引数は順に `5 → 2 → 1 → 0` となり、終了条件に達するまで、毎回指数を半分にします。

    2. `n = 0` で 1、`n = 1` で $1×1×3=3$、
        `n = 2` で $3×3=9$、`n = 5` で $9×9×3=243$ を返します。

    3. 乗算の両側で同じ部分問題を呼び出すと、二回の再帰でまったく同じ計算を行います。
        先に結果を `half` に保存すれば、各層での再帰は一回だけとなり、再帰の深さは約 $\log n$ です。
        二回呼び出すと、大量の重複計算が生じます。

### 3. &nbsp; 走査列を左右の部分木に分ける

重複するノードのない二分木の行きがけ順と通りがけ順の走査列は、次のとおりです。

- 行きがけ順：`[A, B, D, E, C]`
- 通りがけ順：`[D, B, E, A, C]`

根の層での分割だけを行ってください。それ以上再帰したり、木全体を描いたりする必要はありません。

<!-- numbered-subquestions -->

1. 根ノードはどれですか。
2. 左右の部分木は、通りがけ順の列のどの部分に対応しますか。
3. 左右の部分木は、行きがけ順の列のどの部分に対応しますか。根の直接の子はどれですか。

??? success "解答例"

    1. 行きがけ順の最初のノードが根なので、根は `A` です。

    2. `A` が通りがけ順の列を二つに分けます。左部分木は `[D, B, E]`、右部分木は `[C]` です。

    3. 左部分木には 3 個のノードがあるため、行きがけ順で根 `A` の後ろの 3 要素が左部分木に属し、
        `[B, D, E]` となります。残りの `[C]` が右部分木です。
        したがって、根の左の子は `B`、右の子は `C` です。

## 12.6.2 &nbsp; プログラミング演習

### 1. &nbsp; 高速べき乗

実数 `x` と整数 `n` が与えられます。言語に組み込まれたべき乗関数を呼び出さず、$x^n$ を計算してください。
再帰的な分割統治を使い、毎回指数を半分にし、計算済みの部分問題の結果を再利用してください。
この問題では `x = 0` の場合も含めて $x^0=1$ とします。`n < 0` の場合は `x != 0` が保証され、答えを $(1/x)^{-n}$ に変形できます。

??? tip "解くためのヒント"

    1. n が 0 なら答えは 1 です
    2. x の n // 2 乗を計算したら half に保存し、同じ再帰を二度呼び出さないようにします
    3. n < 0 の場合は、まず x を 1 / x に、n を -n に変えます。C++ や Java では、n を先に 64 ビット整数へ変換すると、32 ビット整数の最小値の符号を反転するときのオーバーフローを防げます

[LeetCode](https://leetcode.com/problems/powx-n/){ .rounded-button .exercise-button target="_blank" rel="noopener noreferrer" }
