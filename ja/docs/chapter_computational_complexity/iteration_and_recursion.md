---
comments: true
---

# 2.2 &nbsp; 反復と再帰

アルゴリズムでは、同じ処理を繰り返すことがよくあり、計算量の解析とも密接に関わります。そこで時間計算量と空間計算量を説明する前に、繰り返しを実現する二つの基本的な制御構造、反復と再帰を学びます。

## 2.2.1 &nbsp; 反復

<u>反復（iteration）</u>は、ある処理を繰り返し実行する制御構造です。一定の条件を満たす間、同じコードを実行し続け、条件を満たさなくなったら終了します。

### 1. &nbsp; for ループ

`for` ループは最も一般的な反復の形の一つで、**繰り返し回数があらかじめわかっている場合に適しています**。

次の関数は、`for` ループで $1 + 2 + \dots + n$ を計算し、結果を変数 `res` に記録します。Python の `range(a, b)` は左端を含み右端を含まない区間なので、走査する範囲は $a, a + 1, \dots, b-1$ です。

=== "Python"

    ```python title="iteration.py"
    def for_loop(n: int) -> int:
        """for ループ"""
        res = 0
        # ループで 1, 2, ..., n-1, n の和を求める
        for i in range(1, n + 1):
            res += i
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* for ループ */
    int forLoop(int n) {
        int res = 0;
        // ループで 1, 2, ..., n-1, n の和を求める
        for (int i = 1; i <= n; ++i) {
            res += i;
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* for ループ */
    int forLoop(int n) {
        int res = 0;
        // ループで 1, 2, ..., n-1, n の和を求める
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* for ループ */
    int ForLoop(int n) {
        int res = 0;
        // ループで 1, 2, ..., n-1, n の和を求める
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* for ループ */
    func forLoop(n int) int {
        res := 0
        // ループで 1, 2, ..., n-1, n の和を求める
        for i := 1; i <= n; i++ {
            res += i
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* for ループ */
    func forLoop(n: Int) -> Int {
        var res = 0
        // ループで 1, 2, ..., n-1, n の和を求める
        for i in 1 ... n {
            res += i
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* for ループ */
    function forLoop(n) {
        let res = 0;
        // ループで 1, 2, ..., n-1, n の和を求める
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* for ループ */
    function forLoop(n: number): number {
        let res = 0;
        // ループで 1, 2, ..., n-1, n の和を求める
        for (let i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* for ループ */
    int forLoop(int n) {
      int res = 0;
      // ループで 1, 2, ..., n-1, n の和を求める
      for (int i = 1; i <= n; i++) {
        res += i;
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* for ループ */
    fn for_loop(n: i32) -> i32 {
        let mut res = 0;
        // ループで 1, 2, ..., n-1, n の和を求める
        for i in 1..=n {
            res += i;
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* for ループ */
    int forLoop(int n) {
        int res = 0;
        // ループで 1, 2, ..., n-1, n の和を求める
        for (int i = 1; i <= n; i++) {
            res += i;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* for ループ */
    fun forLoop(n: Int): Int {
        var res = 0
        // ループで 1, 2, ..., n-1, n の和を求める
        for (i in 1..n) {
            res += i
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### for ループ ###
    def for_loop(n)
      res = 0

      # ループで 1, 2, ..., n-1, n の和を求める
      for i in 1..n
        res += i
      end

      res
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20for_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22for%20%E3%83%AB%E3%83%BC%E3%83%97%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%201,%202,%20...,%20n-1,%20n%20%E3%81%AE%E5%92%8C%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnfor%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%E6%B1%82%E3%82%81%E3%81%9F%E5%92%8C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20for_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22for%20%E3%83%AB%E3%83%BC%E3%83%97%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%201,%202,%20...,%20n-1,%20n%20%E3%81%AE%E5%92%8C%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnfor%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%E6%B1%82%E3%82%81%E3%81%9F%E5%92%8C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 2-1 に、この合計を求める関数のフローチャートを示します。

![合計を求める関数のフローチャート](iteration_and_recursion.assets/iteration.png){ class="animation-figure" }

<p align="center"> 図 2-1 &nbsp; 合計を求める関数のフローチャート </p>

この関数の操作回数は入力の大きさ $n$ に比例し、「線形の関係」にあります。実際、**時間計算量が記述するのは、この「線形の関係」です**。詳しくは次の節で説明します。

### 2. &nbsp; while ループ

`for` と同様に、`while` ループも反復を実現する方法です。毎回、最初に条件を調べ、真なら処理を続け、偽ならループを終了します。

`while` ループで $1 + 2 + \dots + n$ を計算してみましょう。

=== "Python"

    ```python title="iteration.py"
    def while_loop(n: int) -> int:
        """while ループ"""
        res = 0
        i = 1  # 条件変数を初期化する
        # ループで 1, 2, ..., n-1, n の和を求める
        while i <= n:
            res += i
            i += 1  # 条件変数を更新する
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* while ループ */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // ループで 1, 2, ..., n-1, n の和を求める
        while (i <= n) {
            res += i;
            i++; // 条件変数を更新する
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* while ループ */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // ループで 1, 2, ..., n-1, n の和を求める
        while (i <= n) {
            res += i;
            i++; // 条件変数を更新する
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* while ループ */
    int WhileLoop(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // ループで 1, 2, ..., n-1, n の和を求める
        while (i <= n) {
            res += i;
            i += 1; // 条件変数を更新する
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* while ループ */
    func whileLoop(n int) int {
        res := 0
        // 条件変数を初期化する
        i := 1
        // ループで 1, 2, ..., n-1, n の和を求める
        for i <= n {
            res += i
            // 条件変数を更新する
            i++
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* while ループ */
    func whileLoop(n: Int) -> Int {
        var res = 0
        var i = 1 // 条件変数を初期化する
        // ループで 1, 2, ..., n-1, n の和を求める
        while i <= n {
            res += i
            i += 1 // 条件変数を更新する
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* while ループ */
    function whileLoop(n) {
        let res = 0;
        let i = 1; // 条件変数を初期化する
        // ループで 1, 2, ..., n-1, n の和を求める
        while (i <= n) {
            res += i;
            i++; // 条件変数を更新する
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* while ループ */
    function whileLoop(n: number): number {
        let res = 0;
        let i = 1; // 条件変数を初期化する
        // ループで 1, 2, ..., n-1, n の和を求める
        while (i <= n) {
            res += i;
            i++; // 条件変数を更新する
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* while ループ */
    int whileLoop(int n) {
      int res = 0;
      int i = 1; // 条件変数を初期化する
      // ループで 1, 2, ..., n-1, n の和を求める
      while (i <= n) {
        res += i;
        i++; // 条件変数を更新する
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* while ループ */
    fn while_loop(n: i32) -> i32 {
        let mut res = 0;
        let mut i = 1; // 条件変数を初期化する

        // ループで 1, 2, ..., n-1, n の和を求める
        while i <= n {
            res += i;
            i += 1; // 条件変数を更新する
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* while ループ */
    int whileLoop(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // ループで 1, 2, ..., n-1, n の和を求める
        while (i <= n) {
            res += i;
            i++; // 条件変数を更新する
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* while ループ */
    fun whileLoop(n: Int): Int {
        var res = 0
        var i = 1 // 条件変数を初期化する
        // ループで 1, 2, ..., n-1, n の和を求める
        while (i <= n) {
            res += i
            i++ // 条件変数を更新する
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### while ループ ###
    def while_loop(n)
      res = 0
      i = 1 # 条件変数を初期化する

      # ループで 1, 2, ..., n-1, n の和を求める
      while i <= n
        res += i
        i += 1 # 条件変数を更新する
      end

      res
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20while_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%E3%83%AB%E3%83%BC%E3%83%97%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%E6%9D%A1%E4%BB%B6%E5%A4%89%E6%95%B0%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%201,%202,%20...,%20n-1,%20n%20%E3%81%AE%E5%92%8C%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E6%9D%A1%E4%BB%B6%E5%A4%89%E6%95%B0%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%0A%20%20%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%E6%B1%82%E3%82%81%E3%81%9F%E5%92%8C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20while_loop%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%E3%83%AB%E3%83%BC%E3%83%97%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%E6%9D%A1%E4%BB%B6%E5%A4%89%E6%95%B0%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%201,%202,%20...,%20n-1,%20n%20%E3%81%AE%E5%92%8C%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%20%20%23%20%E6%9D%A1%E4%BB%B6%E5%A4%89%E6%95%B0%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%0A%20%20%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%E6%B1%82%E3%82%81%E3%81%9F%E5%92%8C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

**`while` ループは `for` ループより自由度が高く**、条件変数の初期化と更新の手順を自由に設計できます。

たとえば次のコードでは、条件変数 $i$ を各回で 2 回更新します。このような処理は、`for` ループではやや書きにくくなります。

=== "Python"

    ```python title="iteration.py"
    def while_loop_ii(n: int) -> int:
        """while ループ（2 回の更新）"""
        res = 0
        i = 1  # 条件変数を初期化する
        # ループで 1, 4, 10, ... の和を求める
        while i <= n:
            res += i
            # 条件変数を更新する
            i += 1
            i *= 2
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* while ループ（2 回の更新） */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // ループで 1, 4, 10, ... の和を求める
        while (i <= n) {
            res += i;
            // 条件変数を更新する
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* while ループ（2 回の更新） */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // ループで 1, 4, 10, ... の和を求める
        while (i <= n) {
            res += i;
            // 条件変数を更新する
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* while ループ（2 回の更新） */
    int WhileLoopII(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // ループで 1, 4, 10, ... の和を求める
        while (i <= n) {
            res += i;
            // 条件変数を更新する
            i += 1; 
            i *= 2;
        }
        return res;
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* while ループ（2 回の更新） */
    func whileLoopII(n int) int {
        res := 0
        // 条件変数を初期化する
        i := 1
        // ループで 1, 4, 10, ... の和を求める
        for i <= n {
            res += i
            // 条件変数を更新する
            i++
            i *= 2
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* while ループ（2 回の更新） */
    func whileLoopII(n: Int) -> Int {
        var res = 0
        var i = 1 // 条件変数を初期化する
        // ループで 1, 4, 10, ... の和を求める
        while i <= n {
            res += i
            // 条件変数を更新する
            i += 1
            i *= 2
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* while ループ（2 回の更新） */
    function whileLoopII(n) {
        let res = 0;
        let i = 1; // 条件変数を初期化する
        // ループで 1, 4, 10, ... の和を求める
        while (i <= n) {
            res += i;
            // 条件変数を更新する
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* while ループ（2 回の更新） */
    function whileLoopII(n: number): number {
        let res = 0;
        let i = 1; // 条件変数を初期化する
        // ループで 1, 4, 10, ... の和を求める
        while (i <= n) {
            res += i;
            // 条件変数を更新する
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* while ループ（2 回の更新） */
    int whileLoopII(int n) {
      int res = 0;
      int i = 1; // 条件変数を初期化する
      // ループで 1, 4, 10, ... の和を求める
      while (i <= n) {
        res += i;
        // 条件変数を更新する
        i++;
        i *= 2;
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* while ループ（2 回の更新） */
    fn while_loop_ii(n: i32) -> i32 {
        let mut res = 0;
        let mut i = 1; // 条件変数を初期化する

        // ループで 1, 4, 10, ... の和を求める
        while i <= n {
            res += i;
            // 条件変数を更新する
            i += 1;
            i *= 2;
        }
        res
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* while ループ（2 回の更新） */
    int whileLoopII(int n) {
        int res = 0;
        int i = 1; // 条件変数を初期化する
        // ループで 1, 4, 10, ... の和を求める
        while (i <= n) {
            res += i;
            // 条件変数を更新する
            i++;
            i *= 2;
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* while ループ（2 回の更新） */
    fun whileLoopII(n: Int): Int {
        var res = 0
        var i = 1 // 条件変数を初期化する
        // ループで 1, 4, 10, ... の和を求める
        while (i <= n) {
            res += i
            // 条件変数を更新する
            i++
            i *= 2
        }
        return res
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### while ループ（2 回の更新）###
    def while_loop_ii(n)
      res = 0
      i = 1 # 条件変数を初期化する

      # ループで 1, 4, 10, ... の和を求める
      while i <= n
        res += i
        # 条件変数を更新する
        i += 1
        i *= 2
      end

      res
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 495px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20while_loop_ii%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%882%20%E5%9B%9E%E3%81%AE%E6%9B%B4%E6%96%B0%EF%BC%89%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%E6%9D%A1%E4%BB%B6%E5%A4%89%E6%95%B0%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%201,%204,%2010,%20...%20%E3%81%AE%E5%92%8C%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20%23%20%E6%9D%A1%E4%BB%B6%E5%A4%89%E6%95%B0%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20i%20%2A%3D%202%0A%20%20%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop_ii%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%882%20%E5%9B%9E%E3%81%AE%E6%9B%B4%E6%96%B0%EF%BC%89%E3%81%A7%E6%B1%82%E3%82%81%E3%81%9F%E5%92%8C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20while_loop_ii%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22while%20%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%882%20%E5%9B%9E%E3%81%AE%E6%9B%B4%E6%96%B0%EF%BC%89%22%22%22%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20i%20%3D%201%20%20%23%20%E6%9D%A1%E4%BB%B6%E5%A4%89%E6%95%B0%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20%23%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%A7%201,%204,%2010,%20...%20%E3%81%AE%E5%92%8C%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20while%20i%20%3C%3D%20n%3A%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20i%0A%20%20%20%20%20%20%20%20%23%20%E6%9D%A1%E4%BB%B6%E5%A4%89%E6%95%B0%E3%82%92%E6%9B%B4%E6%96%B0%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20i%20%2B%3D%201%0A%20%20%20%20%20%20%20%20i%20%2A%3D%202%0A%20%20%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20while_loop_ii%28n%29%0A%20%20%20%20print%28f%22%5Cnwhile%20%E3%83%AB%E3%83%BC%E3%83%97%EF%BC%882%20%E5%9B%9E%E3%81%AE%E6%9B%B4%E6%96%B0%EF%BC%89%E3%81%A7%E6%B1%82%E3%82%81%E3%81%9F%E5%92%8C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

全体として、**`for` はコードが簡潔で、`while` は柔軟です**。どちらも反復を実現でき、問題の要件に応じて選びます。

### 3. &nbsp; 入れ子のループ

ループの中に別のループを入れられます。`for` の例を示します。

=== "Python"

    ```python title="iteration.py"
    def nested_for_loop(n: int) -> str:
        """二重 for ループ"""
        res = ""
        # i = 1, 2, ..., n-1, n のループ
        for i in range(1, n + 1):
            # j = 1, 2, ..., n-1, n のループ
            for j in range(1, n + 1):
                res += f"({i}, {j}), "
        return res
    ```

=== "C++"

    ```cpp title="iteration.cpp"
    /* 二重 for ループ */
    string nestedForLoop(int n) {
        ostringstream res;
        // i = 1, 2, ..., n-1, n のループ
        for (int i = 1; i <= n; ++i) {
            // j = 1, 2, ..., n-1, n のループ
            for (int j = 1; j <= n; ++j) {
                res << "(" << i << ", " << j << "), ";
            }
        }
        return res.str();
    }
    ```

=== "Java"

    ```java title="iteration.java"
    /* 二重 for ループ */
    String nestedForLoop(int n) {
        StringBuilder res = new StringBuilder();
        // i = 1, 2, ..., n-1, n のループ
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n のループ
            for (int j = 1; j <= n; j++) {
                res.append("(" + i + ", " + j + "), ");
            }
        }
        return res.toString();
    }
    ```

=== "C#"

    ```csharp title="iteration.cs"
    /* 二重 for ループ */
    string NestedForLoop(int n) {
        StringBuilder res = new();
        // i = 1, 2, ..., n-1, n のループ
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n のループ
            for (int j = 1; j <= n; j++) {
                res.Append($"({i}, {j}), ");
            }
        }
        return res.ToString();
    }
    ```

=== "Go"

    ```go title="iteration.go"
    /* 二重 for ループ */
    func nestedForLoop(n int) string {
        res := ""
        // i = 1, 2, ..., n-1, n のループ
        for i := 1; i <= n; i++ {
            for j := 1; j <= n; j++ {
                // j = 1, 2, ..., n-1, n のループ
                res += fmt.Sprintf("(%d, %d), ", i, j)
            }
        }
        return res
    }
    ```

=== "Swift"

    ```swift title="iteration.swift"
    /* 二重 for ループ */
    func nestedForLoop(n: Int) -> String {
        var res = ""
        // i = 1, 2, ..., n-1, n のループ
        for i in 1 ... n {
            // j = 1, 2, ..., n-1, n のループ
            for j in 1 ... n {
                res.append("(\(i), \(j)), ")
            }
        }
        return res
    }
    ```

=== "JS"

    ```javascript title="iteration.js"
    /* 二重 for ループ */
    function nestedForLoop(n) {
        let res = '';
        // i = 1, 2, ..., n-1, n のループ
        for (let i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n のループ
            for (let j = 1; j <= n; j++) {
                res += `(${i}, ${j}), `;
            }
        }
        return res;
    }
    ```

=== "TS"

    ```typescript title="iteration.ts"
    /* 二重 for ループ */
    function nestedForLoop(n: number): string {
        let res = '';
        // i = 1, 2, ..., n-1, n のループ
        for (let i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n のループ
            for (let j = 1; j <= n; j++) {
                res += `(${i}, ${j}), `;
            }
        }
        return res;
    }
    ```

=== "Dart"

    ```dart title="iteration.dart"
    /* 二重 for ループ */
    String nestedForLoop(int n) {
      String res = "";
      // i = 1, 2, ..., n-1, n のループ
      for (int i = 1; i <= n; i++) {
        // j = 1, 2, ..., n-1, n のループ
        for (int j = 1; j <= n; j++) {
          res += "($i, $j), ";
        }
      }
      return res;
    }
    ```

=== "Rust"

    ```rust title="iteration.rs"
    /* 二重 for ループ */
    fn nested_for_loop(n: i32) -> String {
        let mut res = vec![];
        // i = 1, 2, ..., n-1, n のループ
        for i in 1..=n {
            // j = 1, 2, ..., n-1, n のループ
            for j in 1..=n {
                res.push(format!("({}, {}), ", i, j));
            }
        }
        res.join("")
    }
    ```

=== "C"

    ```c title="iteration.c"
    /* 二重 for ループ */
    char *nestedForLoop(int n) {
        // n * n は点の個数であり、文字列 "(i, j), " の長さは最大 6+10*2 である。さらに末尾のヌル文字 \0 のための領域を加える
        int size = n * n * 26 + 1;
        char *res = malloc(size * sizeof(char));
        // i = 1, 2, ..., n-1, n のループ
        for (int i = 1; i <= n; i++) {
            // j = 1, 2, ..., n-1, n のループ
            for (int j = 1; j <= n; j++) {
                char tmp[26];
                snprintf(tmp, sizeof(tmp), "(%d, %d), ", i, j);
                strncat(res, tmp, size - strlen(res) - 1);
            }
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="iteration.kt"
    /* 二重 for ループ */
    fun nestedForLoop(n: Int): String {
        val res = StringBuilder()
        // i = 1, 2, ..., n-1, n のループ
        for (i in 1..n) {
            // j = 1, 2, ..., n-1, n のループ
            for (j in 1..n) {
                res.append(" ($i, $j), ")
            }
        }
        return res.toString()
    }
    ```

=== "Ruby"

    ```ruby title="iteration.rb"
    ### 二重 for ループ ###
    def nested_for_loop(n)
      res = ""

      # i = 1, 2, ..., n-1, n のループ
      for i in 1..n
        # j = 1, 2, ..., n-1, n のループ
        for j in 1..n
          res += "(#{i}, #{j}), "
        end
      end

      res
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20nested_for_loop%28n%3A%20int%29%20-%3E%20str%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E9%87%8D%20for%20%E3%83%AB%E3%83%BC%E3%83%97%22%22%22%0A%20%20%20%20res%20%3D%20%22%22%0A%20%20%20%20%23%20i%20%3D%201,%202,%20...,%20n-1,%20n%20%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20j%20%3D%201,%202,%20...,%20n-1,%20n%20%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20f%22%28%7Bi%7D,%20%7Bj%7D%29,%20%22%0A%20%20%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20nested_for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%E4%BA%8C%E9%87%8D%20for%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AE%E8%B5%B0%E6%9F%BB%E7%B5%90%E6%9E%9C%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20nested_for_loop%28n%3A%20int%29%20-%3E%20str%3A%0A%20%20%20%20%22%22%22%E4%BA%8C%E9%87%8D%20for%20%E3%83%AB%E3%83%BC%E3%83%97%22%22%22%0A%20%20%20%20res%20%3D%20%22%22%0A%20%20%20%20%23%20i%20%3D%201,%202,%20...,%20n-1,%20n%20%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%23%20j%20%3D%201,%202,%20...,%20n-1,%20n%20%E3%81%AE%E3%83%AB%E3%83%BC%E3%83%97%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20res%20%2B%3D%20f%22%28%7Bi%7D,%20%7Bj%7D%29,%20%22%0A%20%20%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20nested_for_loop%28n%29%0A%20%20%20%20print%28f%22%5Cn%E4%BA%8C%E9%87%8D%20for%20%E3%83%AB%E3%83%BC%E3%83%97%E3%81%AE%E8%B5%B0%E6%9F%BB%E7%B5%90%E6%9E%9C%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 2-2 に、この入れ子のループのフローチャートを示します。

![入れ子のループのフローチャート](iteration_and_recursion.assets/nested_iteration.png){ class="animation-figure" }

<p align="center"> 図 2-2 &nbsp; 入れ子のループのフローチャート </p>

この場合、操作回数は $n^2$ に比例します。言い換えると、実行時間は入力の大きさ $n$ と「二乗の関係」にあります。

さらにループを入れ子にすると、そのたびに「次元が上がり」、時間計算量は「三乗」「四乗」というように増えていきます。

## 2.2.2 &nbsp; 再帰

 <u>再帰（recursion）</u>は、関数が自分自身を呼び出して問題を解くアルゴリズム戦略です。主に二つの段階があります。

1. **呼び出しを進める**：通常は小さく、または単純になった引数を渡して自分自身を呼び出し続け、「終了条件」に到達するまで深く進みます。
2. **戻る**：「終了条件」に達したら、最も深い再帰関数から順に戻り、各段階の結果を集めます。

実装の観点では、再帰のコードは主に三つの要素からなります。

1. **終了条件**：呼び出しを進める段階から、戻る段階へ切り替える時点を決めます。
2. **再帰呼び出し**：関数が自分自身を呼び出し、通常は小さく、または単純になった引数を渡します。
3. **結果の返却**：現在の再帰段階の結果を、一つ上の段階へ返します。

次のコードでは、`recur(n)` を呼び出すだけで $1 + 2 + \dots + n$ を計算できます。

=== "Python"

    ```python title="recursion.py"
    def recur(n: int) -> int:
        """再帰"""
        # 終了条件
        if n == 1:
            return 1
        # 往路：再帰呼び出し
        res = recur(n - 1)
        # 復路：結果を返す
        return n + res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* 再帰 */
    int recur(int n) {
        // 終了条件
        if (n == 1)
            return 1;
        // 往路：再帰呼び出し
        int res = recur(n - 1);
        // 復路：結果を返す
        return n + res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* 再帰 */
    int recur(int n) {
        // 終了条件
        if (n == 1)
            return 1;
        // 往路：再帰呼び出し
        int res = recur(n - 1);
        // 復路：結果を返す
        return n + res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* 再帰 */
    int Recur(int n) {
        // 終了条件
        if (n == 1)
            return 1;
        // 往路：再帰呼び出し
        int res = Recur(n - 1);
        // 復路：結果を返す
        return n + res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* 再帰 */
    func recur(n int) int {
        // 終了条件
        if n == 1 {
            return 1
        }
        // 往路：再帰呼び出し
        res := recur(n - 1)
        // 復路：結果を返す
        return n + res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* 再帰 */
    func recur(n: Int) -> Int {
        // 終了条件
        if n == 1 {
            return 1
        }
        // 往路：再帰呼び出し
        let res = recur(n: n - 1)
        // 復路：結果を返す
        return n + res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* 再帰 */
    function recur(n) {
        // 終了条件
        if (n === 1) return 1;
        // 往路：再帰呼び出し
        const res = recur(n - 1);
        // 復路：結果を返す
        return n + res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* 再帰 */
    function recur(n: number): number {
        // 終了条件
        if (n === 1) return 1;
        // 往路：再帰呼び出し
        const res = recur(n - 1);
        // 復路：結果を返す
        return n + res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* 再帰 */
    int recur(int n) {
      // 終了条件
      if (n == 1) return 1;
      // 往路：再帰呼び出し
      int res = recur(n - 1);
      // 復路：結果を返す
      return n + res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* 再帰 */
    fn recur(n: i32) -> i32 {
        // 終了条件
        if n == 1 {
            return 1;
        }
        // 往路：再帰呼び出し
        let res = recur(n - 1);
        // 復路：結果を返す
        n + res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* 再帰 */
    int recur(int n) {
        // 終了条件
        if (n == 1)
            return 1;
        // 往路：再帰呼び出し
        int res = recur(n - 1);
        // 復路：結果を返す
        return n + res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* 再帰 */
    fun recur(n: Int): Int {
        // 終了条件
        if (n == 1)
            return 1
        // 往路：再帰呼び出し
        val res = recur(n - 1)
        // 復路：結果を返す
        return n + res
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### 再帰 ###
    def recur(n)
      # 終了条件
      return 1 if n == 1
      # 往路：再帰呼び出し
      res = recur(n - 1)
      # 復路：結果を返す
      n + res
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%86%8D%E5%B8%B0%22%22%22%0A%20%20%20%20%23%20%E7%B5%82%E4%BA%86%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%E5%BE%80%E8%B7%AF%EF%BC%9A%E5%86%8D%E5%B8%B0%E5%91%BC%E3%81%B3%E5%87%BA%E3%81%97%0A%20%20%20%20res%20%3D%20recur%28n%20-%201%29%0A%20%20%20%20%23%20%E5%BE%A9%E8%B7%AF%EF%BC%9A%E7%B5%90%E6%9E%9C%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20n%20%2B%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%E5%86%8D%E5%B8%B0%E9%96%A2%E6%95%B0%E3%81%A7%E6%B1%82%E3%82%81%E3%81%9F%E5%92%8C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%86%8D%E5%B8%B0%22%22%22%0A%20%20%20%20%23%20%E7%B5%82%E4%BA%86%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20n%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%E5%BE%80%E8%B7%AF%EF%BC%9A%E5%86%8D%E5%B8%B0%E5%91%BC%E3%81%B3%E5%87%BA%E3%81%97%0A%20%20%20%20res%20%3D%20recur%28n%20-%201%29%0A%20%20%20%20%23%20%E5%BE%A9%E8%B7%AF%EF%BC%9A%E7%B5%90%E6%9E%9C%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20n%20%2B%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%E5%86%8D%E5%B8%B0%E9%96%A2%E6%95%B0%E3%81%A7%E6%B1%82%E3%82%81%E3%81%9F%E5%92%8C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 2-3 に、この関数の再帰の流れを示します。

![合計を求める関数の再帰の流れ](iteration_and_recursion.assets/recursion_sum.png){ class="animation-figure" }

<p align="center"> 図 2-3 &nbsp; 合計を求める関数の再帰の流れ </p>

計算結果は反復でも再帰でも同じですが、**考え方と問題の解き方はまったく異なります**。

- **反復**：「下から上へ」解きます。最も基本的な手順から始め、それを繰り返したり積み重ねたりして、処理を完了します。
- **再帰**：「上から下へ」解きます。元の問題を同じ形の小さな部分問題に分解し、さらに小さくしていき、解が既知の基本ケースに達したら止めます。

先ほどの合計を例に、問題を $f(n) = 1 + 2 + \dots + n$ とします。

- **反復**：$1$ から $n$ までループし、毎回加算することで、$f(n)$ を求めます。
- **再帰**：問題を $f(n) = n + f(n-1)$ に分解し、基本ケース $f(1) = 1$ まで再帰的に分解し続けます。

### 1. &nbsp; 呼び出しスタック

再帰関数が自分自身を呼ぶたびに、システムは新しい呼び出し用のメモリを確保し、ローカル変数、呼び出しアドレスなどを保存します。これにより、二つの影響が生じます。

- 関数の実行に必要な情報は「スタックフレーム」と呼ぶメモリ領域に保存され、関数から戻るまで解放されません。そのため、**再帰は通常、反復より多くのメモリを使います**。
- 再帰呼び出しには追加のコストがかかります。**そのため、再帰は通常、ループより時間効率が低くなります**。

図 2-4 のように、終了条件に到達する直前には、まだ戻っていない再帰関数が $n$ 個あり、**再帰の深さは $n$ です**。

![再帰呼び出しの深さ](iteration_and_recursion.assets/recursion_sum_depth.png){ class="animation-figure" }

<p align="center"> 図 2-4 &nbsp; 再帰呼び出しの深さ </p>

実際には、言語が許す再帰の深さには通常、制限があります。深すぎる再帰はスタックオーバーフローを引き起こす可能性があります。

### 2. &nbsp; 末尾再帰

興味深いことに、**関数が戻る直前の最後の処理として再帰呼び出しを行う場合**、コンパイラやインタプリタは、空間効率が反復と同程度になるよう最適化できます。これを<u>末尾再帰（tail recursion）</u>と呼びます。

- **通常の再帰**：一つ上の関数に戻った後も処理を続けるため、前の呼び出しの実行状態を保存する必要があります。
- **末尾再帰**：再帰呼び出しが戻る直前の最後の操作なので、一つ上に戻った後に実行する処理はありません。そのため、前の関数の実行状態を保存する必要がありません。

$1 + 2 + \dots + n$ の計算では、結果の変数 `res` を関数の引数にすれば、末尾再帰にできます。

=== "Python"

    ```python title="recursion.py"
    def tail_recur(n, res):
        """末尾再帰"""
        # 終了条件
        if n == 0:
            return res
        # 末尾再帰呼び出し
        return tail_recur(n - 1, res + n)
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* 末尾再帰 */
    int tailRecur(int n, int res) {
        // 終了条件
        if (n == 0)
            return res;
        // 末尾再帰呼び出し
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* 末尾再帰 */
    int tailRecur(int n, int res) {
        // 終了条件
        if (n == 0)
            return res;
        // 末尾再帰呼び出し
        return tailRecur(n - 1, res + n);
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* 末尾再帰 */
    int TailRecur(int n, int res) {
        // 終了条件
        if (n == 0)
            return res;
        // 末尾再帰呼び出し
        return TailRecur(n - 1, res + n);
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* 末尾再帰 */
    func tailRecur(n int, res int) int {
        // 終了条件
        if n == 0 {
            return res
        }
        // 末尾再帰呼び出し
        return tailRecur(n-1, res+n)
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* 末尾再帰 */
    func tailRecur(n: Int, res: Int) -> Int {
        // 終了条件
        if n == 0 {
            return res
        }
        // 末尾再帰呼び出し
        return tailRecur(n: n - 1, res: res + n)
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* 末尾再帰 */
    function tailRecur(n, res) {
        // 終了条件
        if (n === 0) return res;
        // 末尾再帰呼び出し
        return tailRecur(n - 1, res + n);
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* 末尾再帰 */
    function tailRecur(n: number, res: number): number {
        // 終了条件
        if (n === 0) return res;
        // 末尾再帰呼び出し
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* 末尾再帰 */
    int tailRecur(int n, int res) {
      // 終了条件
      if (n == 0) return res;
      // 末尾再帰呼び出し
      return tailRecur(n - 1, res + n);
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* 末尾再帰 */
    fn tail_recur(n: i32, res: i32) -> i32 {
        // 終了条件
        if n == 0 {
            return res;
        }
        // 末尾再帰呼び出し
        tail_recur(n - 1, res + n)
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* 末尾再帰 */
    int tailRecur(int n, int res) {
        // 終了条件
        if (n == 0)
            return res;
        // 末尾再帰呼び出し
        return tailRecur(n - 1, res + n);
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* 末尾再帰 */
    tailrec fun tailRecur(n: Int, res: Int): Int {
        // tailrec キーワードを追加し、末尾再帰の最適化を有効にする
        // 終了条件
        if (n == 0)
            return res
        // 末尾再帰呼び出し
        return tailRecur(n - 1, res + n)
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### 末尾再帰 ###
    def tail_recur(n, res)
      # 終了条件
      return res if n == 0
      # 末尾再帰呼び出し
      tail_recur(n - 1, res + n)
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 423px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20tail_recur%28n,%20res%29%3A%0A%20%20%20%20%22%22%22%E6%9C%AB%E5%B0%BE%E5%86%8D%E5%B8%B0%22%22%22%0A%20%20%20%20%23%20%E7%B5%82%E4%BA%86%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20res%0A%20%20%20%20%23%20%E6%9C%AB%E5%B0%BE%E5%86%8D%E5%B8%B0%E5%91%BC%E3%81%B3%E5%87%BA%E3%81%97%0A%20%20%20%20return%20tail_recur%28n%20-%201,%20res%20%2B%20n%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20tail_recur%28n,%200%29%0A%20%20%20%20print%28f%22%5Cn%E6%9C%AB%E5%B0%BE%E5%86%8D%E5%B8%B0%E9%96%A2%E6%95%B0%E3%81%A7%E6%B1%82%E3%82%81%E3%81%9F%E5%92%8C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20tail_recur%28n,%20res%29%3A%0A%20%20%20%20%22%22%22%E6%9C%AB%E5%B0%BE%E5%86%8D%E5%B8%B0%22%22%22%0A%20%20%20%20%23%20%E7%B5%82%E4%BA%86%E6%9D%A1%E4%BB%B6%0A%20%20%20%20if%20n%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20res%0A%20%20%20%20%23%20%E6%9C%AB%E5%B0%BE%E5%86%8D%E5%B8%B0%E5%91%BC%E3%81%B3%E5%87%BA%E3%81%97%0A%20%20%20%20return%20tail_recur%28n%20-%201,%20res%20%2B%20n%29%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20tail_recur%28n,%200%29%0A%20%20%20%20print%28f%22%5Cn%E6%9C%AB%E5%B0%BE%E5%86%8D%E5%B8%B0%E9%96%A2%E6%95%B0%E3%81%A7%E6%B1%82%E3%82%81%E3%81%9F%E5%92%8C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 2-5 に末尾再帰の流れを示します。通常の再帰とは、加算を行うタイミングが異なります。

- **通常の再帰**：戻る段階で加算し、各呼び出しから戻った後に 1 回ずつ加算します。
- **末尾再帰**：呼び出しを進める段階で加算し、戻る段階では順に戻るだけです。

![末尾再帰の流れ](iteration_and_recursion.assets/tail_recursion_sum.png){ class="animation-figure" }

<p align="center"> 図 2-5 &nbsp; 末尾再帰の流れ </p>

!!! tip "ヒント"

    多くのコンパイラやインタプリタは末尾再帰最適化に対応していないことに注意してください。たとえば Python は標準では対応していないため、末尾再帰の形でもスタックオーバーフローが起こる可能性があります。

### 3. &nbsp; 再帰木

分割統治に関わる問題では、反復より再帰の方が直感的で、読みやすいコードになることがよくあります。「フィボナッチ数列」を例に考えます。

!!! question "問題"

    フィボナッチ数列 $0, 1, 1, 2, 3, 5, 8, 13, \dots$ の、第 $n$ 番目の数を求めてください。

第 $n$ 番目の数を $f(n)$ とすると、二つのことがわかります。

- 最初の二つの数は、$f(1) = 0$ と $f(2) = 1$ です。
- 各数は直前の二つの数の和であり、$f(n) = f(n - 1) + f(n - 2)$ です。

この漸化式に従って再帰呼び出しを行い、最初の二つの数を終了条件にすれば、再帰のコードを書けます。`fib(n)` を呼ぶと、第 $n$ 番目の数が得られます。

=== "Python"

    ```python title="recursion.py"
    def fib(n: int) -> int:
        """フィボナッチ数列：再帰"""
        # 終了条件 f(1) = 0, f(2) = 1
        if n == 1 or n == 2:
            return n - 1
        # 再帰呼び出し f(n) = f(n-1) + f(n-2)
        res = fib(n - 1) + fib(n - 2)
        # 結果 f(n) を返す
        return res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* フィボナッチ数列：再帰 */
    int fib(int n) {
        // 終了条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 再帰呼び出し f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // 結果 f(n) を返す
        return res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* フィボナッチ数列：再帰 */
    int fib(int n) {
        // 終了条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 再帰呼び出し f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // 結果 f(n) を返す
        return res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* フィボナッチ数列：再帰 */
    int Fib(int n) {
        // 終了条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 再帰呼び出し f(n) = f(n-1) + f(n-2)
        int res = Fib(n - 1) + Fib(n - 2);
        // 結果 f(n) を返す
        return res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* フィボナッチ数列：再帰 */
    func fib(n int) int {
        // 終了条件 f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1
        }
        // 再帰呼び出し f(n) = f(n-1) + f(n-2)
        res := fib(n-1) + fib(n-2)
        // 結果 f(n) を返す
        return res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* フィボナッチ数列：再帰 */
    func fib(n: Int) -> Int {
        // 終了条件 f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1
        }
        // 再帰呼び出し f(n) = f(n-1) + f(n-2)
        let res = fib(n: n - 1) + fib(n: n - 2)
        // 結果 f(n) を返す
        return res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* フィボナッチ数列：再帰 */
    function fib(n) {
        // 終了条件 f(1) = 0, f(2) = 1
        if (n === 1 || n === 2) return n - 1;
        // 再帰呼び出し f(n) = f(n-1) + f(n-2)
        const res = fib(n - 1) + fib(n - 2);
        // 結果 f(n) を返す
        return res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* フィボナッチ数列：再帰 */
    function fib(n: number): number {
        // 終了条件 f(1) = 0, f(2) = 1
        if (n === 1 || n === 2) return n - 1;
        // 再帰呼び出し f(n) = f(n-1) + f(n-2)
        const res = fib(n - 1) + fib(n - 2);
        // 結果 f(n) を返す
        return res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* フィボナッチ数列：再帰 */
    int fib(int n) {
      // 終了条件 f(1) = 0, f(2) = 1
      if (n == 1 || n == 2) return n - 1;
      // 再帰呼び出し f(n) = f(n-1) + f(n-2)
      int res = fib(n - 1) + fib(n - 2);
      // 結果 f(n) を返す
      return res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* フィボナッチ数列：再帰 */
    fn fib(n: i32) -> i32 {
        // 終了条件 f(1) = 0, f(2) = 1
        if n == 1 || n == 2 {
            return n - 1;
        }
        // 再帰呼び出し f(n) = f(n-1) + f(n-2)
        let res = fib(n - 1) + fib(n - 2);
        // 結果を返す
        res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* フィボナッチ数列：再帰 */
    int fib(int n) {
        // 終了条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1;
        // 再帰呼び出し f(n) = f(n-1) + f(n-2)
        int res = fib(n - 1) + fib(n - 2);
        // 結果 f(n) を返す
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* フィボナッチ数列：再帰 */
    fun fib(n: Int): Int {
        // 終了条件 f(1) = 0, f(2) = 1
        if (n == 1 || n == 2)
            return n - 1
        // 再帰呼び出し f(n) = f(n-1) + f(n-2)
        val res = fib(n - 1) + fib(n - 2)
        // 結果 f(n) を返す
        return res
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### フィボナッチ数列：再帰 ###
    def fib(n)
      # 終了条件 f(1) = 0, f(2) = 1
      return n - 1 if n == 1 || n == 2
      # 再帰呼び出し f(n) = f(n-1) + f(n-2)
      res = fib(n - 1) + fib(n - 2)
      # 結果 f(n) を返す
      res
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 459px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20fib%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E3%83%95%E3%82%A3%E3%83%9C%E3%83%8A%E3%83%83%E3%83%81%E6%95%B0%E5%88%97%EF%BC%9A%E5%86%8D%E5%B8%B0%22%22%22%0A%20%20%20%20%23%20%E7%B5%82%E4%BA%86%E6%9D%A1%E4%BB%B6%20f%281%29%20%3D%200,%20f%282%29%20%3D%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%20-%201%0A%20%20%20%20%23%20%E5%86%8D%E5%B8%B0%E5%91%BC%E3%81%B3%E5%87%BA%E3%81%97%20f%28n%29%20%3D%20f%28n-1%29%20%2B%20f%28n-2%29%0A%20%20%20%20res%20%3D%20fib%28n%20-%201%29%20%2B%20fib%28n%20-%202%29%0A%20%20%20%20%23%20%E7%B5%90%E6%9E%9C%20f%28n%29%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20fib%28n%29%0A%20%20%20%20print%28f%22%5Cn%E3%83%95%E3%82%A3%E3%83%9C%E3%83%8A%E3%83%83%E3%83%81%E6%95%B0%E5%88%97%E3%81%AE%E7%AC%AC%20%7Bn%7D%20%E9%A0%85%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20fib%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E3%83%95%E3%82%A3%E3%83%9C%E3%83%8A%E3%83%83%E3%83%81%E6%95%B0%E5%88%97%EF%BC%9A%E5%86%8D%E5%B8%B0%22%22%22%0A%20%20%20%20%23%20%E7%B5%82%E4%BA%86%E6%9D%A1%E4%BB%B6%20f%281%29%20%3D%200,%20f%282%29%20%3D%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20n%20-%201%0A%20%20%20%20%23%20%E5%86%8D%E5%B8%B0%E5%91%BC%E3%81%B3%E5%87%BA%E3%81%97%20f%28n%29%20%3D%20f%28n-1%29%20%2B%20f%28n-2%29%0A%20%20%20%20res%20%3D%20fib%28n%20-%201%29%20%2B%20fib%28n%20-%202%29%0A%20%20%20%20%23%20%E7%B5%90%E6%9E%9C%20f%28n%29%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20fib%28n%29%0A%20%20%20%20print%28f%22%5Cn%E3%83%95%E3%82%A3%E3%83%9C%E3%83%8A%E3%83%83%E3%83%81%E6%95%B0%E5%88%97%E3%81%AE%E7%AC%AC%20%7Bn%7D%20%E9%A0%85%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

このコードでは、関数内で再帰呼び出しを 2 回行い、**一つの呼び出しから二つの分岐が生じます**。図 2-6 のように呼び出しを繰り返すと、最終的に $n$ 層の<u>再帰木（recursion tree）</u>ができます。

![フィボナッチ数列の再帰木](iteration_and_recursion.assets/recursion_tree.png){ class="animation-figure" }

<p align="center"> 図 2-6 &nbsp; フィボナッチ数列の再帰木 </p>

本質的に、再帰は「問題を小さな部分問題に分解する」という考え方を表しており、この分割統治戦略は非常に重要です。

- アルゴリズムの面では、探索、ソート、バックトラッキング、分割統治、動的計画法など、多くの重要な戦略が直接または間接的にこの考え方を使っています。
- データ構造の面では、連結リスト、木、グラフの問題は分割統治で分析しやすいため、再帰が自然に適しています。

## 2.2.3 &nbsp; 反復と再帰の比較

ここまでの内容をまとめると、表 2-1 のように実装、性能、用途に違いがあります。

<p align="center"> 表 2-1 &nbsp; 反復と再帰の特徴の比較 </p>

<div class="center-table" markdown>

|          | 反復                                   | 再帰                                                         |
| -------- | -------------------------------------- | ------------------------------------------------------------ |
| 実装方法 | ループ構造                               | 関数が自分自身を呼び出す                                                 |
| 時間効率 | 通常は高く、関数呼び出しのコストがない           | 各関数呼び出しにコストがかかる                                     |
| メモリ使用量 | 通常は一定量のメモリを使う             | 呼び出しの積み重ねで大量のスタックフレームを使う場合がある                           |
| 適した問題 | 単純な繰り返し処理に適し、コードが直感的で読みやすい | 木、グラフ、分割統治、バックトラッキングなど、部分問題への分解に適し、コード構造が簡潔で明快 |

</div>

!!! tip "ヒント"

    以下の内容が難しく感じられたら、「スタック」の章を読んでから復習してください。

では、反復と再帰にはどのような関係があるのでしょうか。先ほどの再帰関数では、戻る段階で加算します。つまり、最初に呼ばれた関数が、最後に加算を終えます。**この仕組みは、スタックの「先入れ後出し」の原則と共通しています**。

実際、「呼び出しスタック」や「スタックフレーム」という用語自体が、再帰とスタックの密接な関係を示しています。

1. **呼び出しを進める**：関数を呼ぶと、システムは「呼び出しスタック」に新しいフレームを確保し、ローカル変数、引数、戻り先アドレスなどを保存します。
2. **戻る**：関数の実行が終わって戻ると、対応するフレームを「呼び出しスタック」から取り除き、前の関数の実行環境を復元します。

したがって、**明示的なスタックで呼び出しスタックの動作を模倣すれば**、再帰を反復に変換できます。

=== "Python"

    ```python title="recursion.py"
    def for_loop_recur(n: int) -> int:
        """反復を使って再帰を再現する"""
        # 明示的なスタックを使って、システムの呼び出しスタックを再現する
        stack = []
        res = 0
        # 往路：再帰呼び出し
        for i in range(n, 0, -1):
            # 「プッシュ操作」で再帰の「往路」を再現する
            stack.append(i)
        # 復路：結果を返す
        while stack:
            # 「ポップ操作」で再帰の「復路」を再現する
            res += stack.pop()
        # res = 1+2+3+...+n
        return res
    ```

=== "C++"

    ```cpp title="recursion.cpp"
    /* 反復を使って再帰を再現する */
    int forLoopRecur(int n) {
        // 明示的なスタックを使って、システムの呼び出しスタックを再現する
        stack<int> stack;
        int res = 0;
        // 往路：再帰呼び出し
        for (int i = n; i > 0; i--) {
            // 「プッシュ操作」で再帰の「往路」を再現する
            stack.push(i);
        }
        // 復路：結果を返す
        while (!stack.empty()) {
            // 「ポップ操作」で再帰の「復路」を再現する
            res += stack.top();
            stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Java"

    ```java title="recursion.java"
    /* 反復を使って再帰を再現する */
    int forLoopRecur(int n) {
        // 明示的なスタックを使って、システムの呼び出しスタックを再現する
        Stack<Integer> stack = new Stack<>();
        int res = 0;
        // 往路：再帰呼び出し
        for (int i = n; i > 0; i--) {
            // 「プッシュ操作」で再帰の「往路」を再現する
            stack.push(i);
        }
        // 復路：結果を返す
        while (!stack.isEmpty()) {
            // 「ポップ操作」で再帰の「復路」を再現する
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "C#"

    ```csharp title="recursion.cs"
    /* 反復を使って再帰を再現する */
    int ForLoopRecur(int n) {
        // 明示的なスタックを使って、システムの呼び出しスタックを再現する
        Stack<int> stack = new();
        int res = 0;
        // 往路：再帰呼び出し
        for (int i = n; i > 0; i--) {
            // 「プッシュ操作」で再帰の「往路」を再現する
            stack.Push(i);
        }
        // 復路：結果を返す
        while (stack.Count > 0) {
            // 「ポップ操作」で再帰の「復路」を再現する
            res += stack.Pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Go"

    ```go title="recursion.go"
    /* 反復を使って再帰を再現する */
    func forLoopRecur(n int) int {
        // 明示的なスタックを使って、システムの呼び出しスタックを再現する
        stack := list.New()
        res := 0
        // 往路：再帰呼び出し
        for i := n; i > 0; i-- {
            // 「プッシュ操作」で再帰の「往路」を再現する
            stack.PushBack(i)
        }
        // 復路：結果を返す
        for stack.Len() != 0 {
            // 「ポップ操作」で再帰の「復路」を再現する
            res += stack.Back().Value.(int)
            stack.Remove(stack.Back())
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "Swift"

    ```swift title="recursion.swift"
    /* 反復を使って再帰を再現する */
    func forLoopRecur(n: Int) -> Int {
        // 明示的なスタックを使って、システムの呼び出しスタックを再現する
        var stack: [Int] = []
        var res = 0
        // 往路：再帰呼び出し
        for i in (1 ... n).reversed() {
            // 「プッシュ操作」で再帰の「往路」を再現する
            stack.append(i)
        }
        // 復路：結果を返す
        while !stack.isEmpty {
            // 「ポップ操作」で再帰の「復路」を再現する
            res += stack.removeLast()
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "JS"

    ```javascript title="recursion.js"
    /* 反復を使って再帰を再現する */
    function forLoopRecur(n) {
        // 明示的なスタックを使って、システムの呼び出しスタックを再現する
        const stack = [];
        let res = 0;
        // 往路：再帰呼び出し
        for (let i = n; i > 0; i--) {
            // 「プッシュ操作」で再帰の「往路」を再現する
            stack.push(i);
        }
        // 復路：結果を返す
        while (stack.length) {
            // 「ポップ操作」で再帰の「復路」を再現する
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "TS"

    ```typescript title="recursion.ts"
    /* 反復を使って再帰を再現する */
    function forLoopRecur(n: number): number {
        // 明示的なスタックを使って、システムの呼び出しスタックを再現する 
        const stack: number[] = [];
        let res: number = 0;
        // 往路：再帰呼び出し
        for (let i = n; i > 0; i--) {
            // 「プッシュ操作」で再帰の「往路」を再現する
            stack.push(i);
        }
        // 復路：結果を返す
        while (stack.length) {
            // 「ポップ操作」で再帰の「復路」を再現する
            res += stack.pop();
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Dart"

    ```dart title="recursion.dart"
    /* 反復を使って再帰を再現する */
    int forLoopRecur(int n) {
      // 明示的なスタックを使って、システムの呼び出しスタックを再現する
      List<int> stack = [];
      int res = 0;
      // 往路：再帰呼び出し
      for (int i = n; i > 0; i--) {
        // 「プッシュ操作」で再帰の「往路」を再現する
        stack.add(i);
      }
      // 復路：結果を返す
      while (!stack.isEmpty) {
        // 「ポップ操作」で再帰の「復路」を再現する
        res += stack.removeLast();
      }
      // res = 1+2+3+...+n
      return res;
    }
    ```

=== "Rust"

    ```rust title="recursion.rs"
    /* 反復を使って再帰を再現する */
    fn for_loop_recur(n: i32) -> i32 {
        // 明示的なスタックを使って、システムの呼び出しスタックを再現する
        let mut stack = Vec::new();
        let mut res = 0;
        // 往路：再帰呼び出し
        for i in (1..=n).rev() {
            // 「プッシュ操作」で再帰の「往路」を再現する
            stack.push(i);
        }
        // 復路：結果を返す
        while !stack.is_empty() {
            // 「ポップ操作」で再帰の「復路」を再現する
            res += stack.pop().unwrap();
        }
        // res = 1+2+3+...+n
        res
    }
    ```

=== "C"

    ```c title="recursion.c"
    /* 反復を使って再帰を再現する */
    int forLoopRecur(int n) {
        int stack[1000]; // 大きな配列を使ってスタックを再現する
        int top = -1;    // スタックの先頭のインデックス
        int res = 0;
        // 往路：再帰呼び出し
        for (int i = n; i > 0; i--) {
            // 「プッシュ操作」で再帰の「往路」を再現する
            stack[1 + top++] = i;
        }
        // 復路：結果を返す
        while (top >= 0) {
            // 「ポップ操作」で再帰の「復路」を再現する
            res += stack[top--];
        }
        // res = 1+2+3+...+n
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="recursion.kt"
    /* 反復を使って再帰を再現する */
    fun forLoopRecur(n: Int): Int {
        // 明示的なスタックを使って、システムの呼び出しスタックを再現する
        val stack = Stack<Int>()
        var res = 0
        // 往路：再帰呼び出し
        for (i in n downTo 0) {
            // 「プッシュ操作」で再帰の「往路」を再現する
            stack.push(i)
        }
        // 復路：結果を返す
        while (stack.isNotEmpty()) {
            // 「ポップ操作」で再帰の「復路」を再現する
            res += stack.pop()
        }
        // res = 1+2+3+...+n
        return res
    }
    ```

=== "Ruby"

    ```ruby title="recursion.rb"
    ### 反復を使って再帰を再現する ###
    def for_loop_recur(n)
      # 明示的なスタックを使って、システムの呼び出しスタックを再現する
      stack = []
      res = 0

      # 往路：再帰呼び出し
      for i in n.downto(0)
        # 「プッシュ操作」で再帰の「往路」を再現する
        stack << i
      end
      # 復路：結果を返す
      while !stack.empty?
        res += stack.pop
      end

      # res = 1+2+3+...+n
      res
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20for_loop_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%8D%E5%BE%A9%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E5%86%8D%E5%B8%B0%E3%82%92%E5%86%8D%E7%8F%BE%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%23%20%E6%98%8E%E7%A4%BA%E7%9A%84%E3%81%AA%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%80%81%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E3%81%AE%E5%91%BC%E3%81%B3%E5%87%BA%E3%81%97%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%86%8D%E7%8F%BE%E3%81%99%E3%82%8B%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E5%BE%80%E8%B7%AF%EF%BC%9A%E5%86%8D%E5%B8%B0%E5%91%BC%E3%81%B3%E5%87%BA%E3%81%97%0A%20%20%20%20for%20i%20in%20range%28n,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E3%80%8C%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%E6%93%8D%E4%BD%9C%E3%80%8D%E3%81%A7%E5%86%8D%E5%B8%B0%E3%81%AE%E3%80%8C%E5%BE%80%E8%B7%AF%E3%80%8D%E3%82%92%E5%86%8D%E7%8F%BE%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20stack.append%28i%29%0A%20%20%20%20%23%20%E5%BE%A9%E8%B7%AF%EF%BC%9A%E7%B5%90%E6%9E%9C%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20while%20stack%3A%0A%20%20%20%20%20%20%20%20%23%20%E3%80%8C%E3%83%9D%E3%83%83%E3%83%97%E6%93%8D%E4%BD%9C%E3%80%8D%E3%81%A7%E5%86%8D%E5%B8%B0%E3%81%AE%E3%80%8C%E5%BE%A9%E8%B7%AF%E3%80%8D%E3%82%92%E5%86%8D%E7%8F%BE%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20stack.pop%28%29%0A%20%20%20%20%23%20res%20%3D%201%2B2%2B3%2B...%2Bn%0A%20%20%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop_recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%E5%8F%8D%E5%BE%A9%E3%81%A7%E5%86%8D%E5%B8%B0%E3%82%92%E5%86%8D%E7%8F%BE%E3%81%97%E3%81%A6%E6%B1%82%E3%82%81%E3%81%9F%E5%92%8C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20for_loop_recur%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%8F%8D%E5%BE%A9%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E5%86%8D%E5%B8%B0%E3%82%92%E5%86%8D%E7%8F%BE%E3%81%99%E3%82%8B%22%22%22%0A%20%20%20%20%23%20%E6%98%8E%E7%A4%BA%E7%9A%84%E3%81%AA%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E4%BD%BF%E3%81%A3%E3%81%A6%E3%80%81%E3%82%B7%E3%82%B9%E3%83%86%E3%83%A0%E3%81%AE%E5%91%BC%E3%81%B3%E5%87%BA%E3%81%97%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF%E3%82%92%E5%86%8D%E7%8F%BE%E3%81%99%E3%82%8B%0A%20%20%20%20stack%20%3D%20%5B%5D%0A%20%20%20%20res%20%3D%200%0A%20%20%20%20%23%20%E5%BE%80%E8%B7%AF%EF%BC%9A%E5%86%8D%E5%B8%B0%E5%91%BC%E3%81%B3%E5%87%BA%E3%81%97%0A%20%20%20%20for%20i%20in%20range%28n,%200,%20-1%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E3%80%8C%E3%83%97%E3%83%83%E3%82%B7%E3%83%A5%E6%93%8D%E4%BD%9C%E3%80%8D%E3%81%A7%E5%86%8D%E5%B8%B0%E3%81%AE%E3%80%8C%E5%BE%80%E8%B7%AF%E3%80%8D%E3%82%92%E5%86%8D%E7%8F%BE%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20stack.append%28i%29%0A%20%20%20%20%23%20%E5%BE%A9%E8%B7%AF%EF%BC%9A%E7%B5%90%E6%9E%9C%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20while%20stack%3A%0A%20%20%20%20%20%20%20%20%23%20%E3%80%8C%E3%83%9D%E3%83%83%E3%83%97%E6%93%8D%E4%BD%9C%E3%80%8D%E3%81%A7%E5%86%8D%E5%B8%B0%E3%81%AE%E3%80%8C%E5%BE%A9%E8%B7%AF%E3%80%8D%E3%82%92%E5%86%8D%E7%8F%BE%E3%81%99%E3%82%8B%0A%20%20%20%20%20%20%20%20res%20%2B%3D%20stack.pop%28%29%0A%20%20%20%20%23%20res%20%3D%201%2B2%2B3%2B...%2Bn%0A%20%20%20%20return%20res%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%205%0A%20%20%20%20res%20%3D%20for_loop_recur%28n%29%0A%20%20%20%20print%28f%22%5Cn%E5%8F%8D%E5%BE%A9%E3%81%A7%E5%86%8D%E5%B8%B0%E3%82%92%E5%86%8D%E7%8F%BE%E3%81%97%E3%81%A6%E6%B1%82%E3%82%81%E3%81%9F%E5%92%8C%20res%20%3D%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=3&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

このコードでは、反復に変換したことで複雑になっています。反復と再帰は多くの場合、相互に変換できますが、必ずしもそうする価値があるとは限りません。理由は二つあります。

- 変換後のコードの方が理解しにくく、可読性が下がる可能性があります。
- 複雑な問題では、システムの呼び出しスタックの動作を模倣すること自体が非常に難しい場合があります。

**反復と再帰のどちらを選ぶかは、問題の性質によって決まります**。実際のプログラミングでは、両者の利点と欠点を比較し、状況に合った方法を選ぶことが大切です。
