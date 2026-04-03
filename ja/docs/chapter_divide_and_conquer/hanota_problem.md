---
comments: true
---

# 12.4 &nbsp; ハノイの塔の問題

マージソートや二分木の構築では、いずれも元の問題を元問題の半分の規模をもつ 2 つの部分問題に分解していました。しかし、ハノイの塔の問題では、異なる分解戦略を採用します。

!!! question

    3 本の柱があり、それぞれを `A`、`B`、`C` とします。初期状態では、柱 `A` に $n$ 枚の円盤が通されており、上から下へ小さい順に並んでいます。私たちの課題は、この $n$ 枚の円盤を柱 `C` に移し、元の順序を保つことです（以下の図のとおり）。円盤を移動する際には、次のルールに従う必要があります。
    
    1. 円盤は 1 本の柱の頂上から取り出し、別の柱の頂上に置くことしかできません。
    2. 1 回に移動できる円盤は 1 枚だけです。
    3. 小さい円盤は常に大きい円盤の上になければなりません。

![ハノイの塔の問題の例](hanota_problem.assets/hanota_example.png){ class="animation-figure" }

<p align="center"> 図 12-10 &nbsp; ハノイの塔の問題の例 </p>

**規模が $i$ のハノイの塔の問題を $f(i)$ と表します** 。たとえば $f(3)$ は、$3$ 枚の円盤を `A` から `C` へ移動するハノイの塔の問題を表します。

### 1. &nbsp; 基本ケースを考える

以下の図に示すように、問題 $f(1)$ 、すなわち円盤が 1 枚だけの場合は、それを `A` から `C` へ直接移動すれば済みます。

=== "<1>"
    ![規模 1 の問題の解](hanota_problem.assets/hanota_f1_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f1_step2](hanota_problem.assets/hanota_f1_step2.png){ class="animation-figure" }

<p align="center"> 図 12-11 &nbsp; 規模 1 の問題の解 </p>

以下の図に示すように、問題 $f(2)$ 、すなわち円盤が 2 枚ある場合は、**小さい円盤が常に大きい円盤の上にある条件を満たすため、`B` を借りて移動を行う必要があります**。

1. まず上の小さい円盤を `A` から `B` へ移します。
2. 次に大きい円盤を `A` から `C` へ移します。
3. 最後に小さい円盤を `B` から `C` へ移します。

=== "<1>"
    ![規模 2 の問題の解](hanota_problem.assets/hanota_f2_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f2_step2](hanota_problem.assets/hanota_f2_step2.png){ class="animation-figure" }

=== "<3>"
    ![hanota_f2_step3](hanota_problem.assets/hanota_f2_step3.png){ class="animation-figure" }

=== "<4>"
    ![hanota_f2_step4](hanota_problem.assets/hanota_f2_step4.png){ class="animation-figure" }

<p align="center"> 図 12-12 &nbsp; 規模 2 の問題の解 </p>

問題 $f(2)$ を解く過程は、**2 枚の円盤を `B` を介して `A` から `C` へ移す**と要約できます。このとき、`C` を目標の柱、`B` を補助の柱と呼びます。

### 2. &nbsp; 部分問題への分解

問題 $f(3)$ 、すなわち円盤が 3 枚ある場合になると、状況はやや複雑になります。

$f(1)$ と $f(2)$ の解が既知なので、分割統治の観点から、**`A` の上部にある 2 枚の円盤をひとまとまりとみなして**、次の図の手順を実行できます。こうして 3 枚の円盤を `A` から `C` へ順調に移動できます。

1. `B` を目標の柱、`C` を補助の柱として、2 枚の円盤を `A` から `B` へ移します。
2. `A` に残った 1 枚の円盤を `A` から `C` へ直接移動します。
3. `C` を目標の柱、`A` を補助の柱として、2 枚の円盤を `B` から `C` へ移します。

=== "<1>"
    ![規模 3 の問題の解](hanota_problem.assets/hanota_f3_step1.png){ class="animation-figure" }

=== "<2>"
    ![hanota_f3_step2](hanota_problem.assets/hanota_f3_step2.png){ class="animation-figure" }

=== "<3>"
    ![hanota_f3_step3](hanota_problem.assets/hanota_f3_step3.png){ class="animation-figure" }

=== "<4>"
    ![hanota_f3_step4](hanota_problem.assets/hanota_f3_step4.png){ class="animation-figure" }

<p align="center"> 図 12-13 &nbsp; 規模 3 の問題の解 </p>

本質的には、**問題 $f(3)$ を 2 つの部分問題 $f(2)$ と 1 つの部分問題 $f(1)$ に分けています** 。この 3 つの部分問題を順に解けば、元の問題も解決されます。これは、部分問題が独立しており、解を組み合わせられることを示しています。

ここまでで、次の図に示すハノイの塔の問題を解く分割統治戦略をまとめられます。元の問題 $f(n)$ を 2 つの部分問題 $f(n-1)$ と 1 つの部分問題 $f(1)$ に分け、次の順序でこの 3 つの部分問題を解きます。

1. $n-1$ 枚の円盤を `C` を介して `A` から `B` へ移します。
2. 残り $1$ 枚の円盤を `A` から `C` へ直接移します。
3. $n-1$ 枚の円盤を `A` を介して `B` から `C` へ移します。

この 2 つの部分問題 $f(n-1)$ は、**同じ方法で再帰的に分割できます**。最小の部分問題 $f(1)$ に到達するまでこれを続けます。一方、$f(1)$ の解は既知であり、1 回の移動操作だけで済みます。

![ハノイの塔の問題を解く分割統治戦略](hanota_problem.assets/hanota_divide_and_conquer.png){ class="animation-figure" }

<p align="center"> 図 12-14 &nbsp; ハノイの塔の問題を解く分割統治戦略 </p>

### 3. &nbsp; コードの実装

コードでは、再帰関数 `dfs(i, src, buf, tar)` を定義します。その役割は、柱 `src` の上部にある $i$ 枚の円盤を、補助の柱 `buf` を使って目標の柱 `tar` へ移動することです：

=== "Python"

    ```python title="hanota.py"
    def move(src: list[int], tar: list[int]):
        """円盤を 1 枚移動"""
        # src の上から円盤を1枚取り出す
        pan = src.pop()
        # 円盤を tar の上に置く
        tar.append(pan)

    def dfs(i: int, src: list[int], buf: list[int], tar: list[int]):
        """ハノイの塔の問題 f(i) を解く"""
        # src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if i == 1:
            move(src, tar)
            return
        # 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        dfs(i - 1, src, tar, buf)
        # 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        move(src, tar)
        # 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        dfs(i - 1, buf, src, tar)

    def solve_hanota(A: list[int], B: list[int], C: list[int]):
        """ハノイの塔を解く"""
        n = len(A)
        # A の上から n 枚の円盤を B を介して C へ移す
        dfs(n, A, B, C)
    ```

=== "C++"

    ```cpp title="hanota.cpp"
    /* 円盤を 1 枚移動 */
    void move(vector<int> &src, vector<int> &tar) {
        // src の上から円盤を1枚取り出す
        int pan = src.back();
        src.pop_back();
        // 円盤を tar の上に置く
        tar.push_back(pan);
    }

    /* ハノイの塔の問題 f(i) を解く */
    void dfs(int i, vector<int> &src, vector<int> &buf, vector<int> &tar) {
        // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if (i == 1) {
            move(src, tar);
            return;
        }
        // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        dfs(i - 1, src, tar, buf);
        // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        move(src, tar);
        // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        dfs(i - 1, buf, src, tar);
    }

    /* ハノイの塔を解く */
    void solveHanota(vector<int> &A, vector<int> &B, vector<int> &C) {
        int n = A.size();
        // A の上から n 枚の円盤を B を介して C へ移す
        dfs(n, A, B, C);
    }
    ```

=== "Java"

    ```java title="hanota.java"
    /* 円盤を 1 枚移動 */
    void move(List<Integer> src, List<Integer> tar) {
        // src の上から円盤を1枚取り出す
        Integer pan = src.remove(src.size() - 1);
        // 円盤を tar の上に置く
        tar.add(pan);
    }

    /* ハノイの塔の問題 f(i) を解く */
    void dfs(int i, List<Integer> src, List<Integer> buf, List<Integer> tar) {
        // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if (i == 1) {
            move(src, tar);
            return;
        }
        // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        dfs(i - 1, src, tar, buf);
        // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        move(src, tar);
        // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        dfs(i - 1, buf, src, tar);
    }

    /* ハノイの塔を解く */
    void solveHanota(List<Integer> A, List<Integer> B, List<Integer> C) {
        int n = A.size();
        // A の上から n 枚の円盤を B を介して C へ移す
        dfs(n, A, B, C);
    }
    ```

=== "C#"

    ```csharp title="hanota.cs"
    /* 円盤を 1 枚移動 */
    void Move(List<int> src, List<int> tar) {
        // src の上から円盤を1枚取り出す
        int pan = src[^1];
        src.RemoveAt(src.Count - 1);
        // 円盤を tar の上に置く
        tar.Add(pan);
    }

    /* ハノイの塔の問題 f(i) を解く */
    void DFS(int i, List<int> src, List<int> buf, List<int> tar) {
        // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if (i == 1) {
            Move(src, tar);
            return;
        }
        // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        DFS(i - 1, src, tar, buf);
        // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        Move(src, tar);
        // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        DFS(i - 1, buf, src, tar);
    }

    /* ハノイの塔を解く */
    void SolveHanota(List<int> A, List<int> B, List<int> C) {
        int n = A.Count;
        // A の上から n 枚の円盤を B を介して C へ移す
        DFS(n, A, B, C);
    }
    ```

=== "Go"

    ```go title="hanota.go"
    /* 円盤を 1 枚移動 */
    func move(src, tar *list.List) {
        // src の上から円盤を1枚取り出す
        pan := src.Back()
        // 円盤を tar の上に置く
        tar.PushBack(pan.Value)
        // `src` の最上部の円盤を取り外す
        src.Remove(pan)
    }

    /* ハノイの塔の問題 f(i) を解く */
    func dfsHanota(i int, src, buf, tar *list.List) {
        // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if i == 1 {
            move(src, tar)
            return
        }
        // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        dfsHanota(i-1, src, tar, buf)
        // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        move(src, tar)
        // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        dfsHanota(i-1, buf, src, tar)
    }

    /* ハノイの塔を解く */
    func solveHanota(A, B, C *list.List) {
        n := A.Len()
        // A の上から n 枚の円盤を B を介して C へ移す
        dfsHanota(n, A, B, C)
    }
    ```

=== "Swift"

    ```swift title="hanota.swift"
    /* 円盤を 1 枚移動 */
    func move(src: inout [Int], tar: inout [Int]) {
        // src の上から円盤を1枚取り出す
        let pan = src.popLast()!
        // 円盤を tar の上に置く
        tar.append(pan)
    }

    /* ハノイの塔の問題 f(i) を解く */
    func dfs(i: Int, src: inout [Int], buf: inout [Int], tar: inout [Int]) {
        // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if i == 1 {
            move(src: &src, tar: &tar)
            return
        }
        // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        dfs(i: i - 1, src: &src, buf: &tar, tar: &buf)
        // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        move(src: &src, tar: &tar)
        // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        dfs(i: i - 1, src: &buf, buf: &src, tar: &tar)
    }

    /* ハノイの塔を解く */
    func solveHanota(A: inout [Int], B: inout [Int], C: inout [Int]) {
        let n = A.count
        // リストの末尾が柱の上端に対応する
        // src の上から n 個の円盤を、B を介して C に移動する
        dfs(i: n, src: &A, buf: &B, tar: &C)
    }
    ```

=== "JS"

    ```javascript title="hanota.js"
    /* 円盤を 1 枚移動 */
    function move(src, tar) {
        // src の上から円盤を1枚取り出す
        const pan = src.pop();
        // 円盤を tar の上に置く
        tar.push(pan);
    }

    /* ハノイの塔の問題 f(i) を解く */
    function dfs(i, src, buf, tar) {
        // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if (i === 1) {
            move(src, tar);
            return;
        }
        // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        dfs(i - 1, src, tar, buf);
        // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        move(src, tar);
        // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        dfs(i - 1, buf, src, tar);
    }

    /* ハノイの塔を解く */
    function solveHanota(A, B, C) {
        const n = A.length;
        // A の上から n 枚の円盤を B を介して C へ移す
        dfs(n, A, B, C);
    }
    ```

=== "TS"

    ```typescript title="hanota.ts"
    /* 円盤を 1 枚移動 */
    function move(src: number[], tar: number[]): void {
        // src の上から円盤を1枚取り出す
        const pan = src.pop();
        // 円盤を tar の上に置く
        tar.push(pan);
    }

    /* ハノイの塔の問題 f(i) を解く */
    function dfs(i: number, src: number[], buf: number[], tar: number[]): void {
        // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if (i === 1) {
            move(src, tar);
            return;
        }
        // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        dfs(i - 1, src, tar, buf);
        // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        move(src, tar);
        // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        dfs(i - 1, buf, src, tar);
    }

    /* ハノイの塔を解く */
    function solveHanota(A: number[], B: number[], C: number[]): void {
        const n = A.length;
        // A の上から n 枚の円盤を B を介して C へ移す
        dfs(n, A, B, C);
    }
    ```

=== "Dart"

    ```dart title="hanota.dart"
    /* 円盤を 1 枚移動 */
    void move(List<int> src, List<int> tar) {
      // src の上から円盤を1枚取り出す
      int pan = src.removeLast();
      // 円盤を tar の上に置く
      tar.add(pan);
    }

    /* ハノイの塔の問題 f(i) を解く */
    void dfs(int i, List<int> src, List<int> buf, List<int> tar) {
      // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
      if (i == 1) {
        move(src, tar);
        return;
      }
      // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
      dfs(i - 1, src, tar, buf);
      // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
      move(src, tar);
      // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
      dfs(i - 1, buf, src, tar);
    }

    /* ハノイの塔を解く */
    void solveHanota(List<int> A, List<int> B, List<int> C) {
      int n = A.length;
      // A の上から n 枚の円盤を B を介して C へ移す
      dfs(n, A, B, C);
    }
    ```

=== "Rust"

    ```rust title="hanota.rs"
    /* 円盤を 1 枚移動 */
    fn move_pan(src: &mut Vec<i32>, tar: &mut Vec<i32>) {
        // src の上から円盤を1枚取り出す
        let pan = src.pop().unwrap();
        // 円盤を tar の上に置く
        tar.push(pan);
    }

    /* ハノイの塔の問題 f(i) を解く */
    fn dfs(i: i32, src: &mut Vec<i32>, buf: &mut Vec<i32>, tar: &mut Vec<i32>) {
        // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if i == 1 {
            move_pan(src, tar);
            return;
        }
        // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        dfs(i - 1, src, tar, buf);
        // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        move_pan(src, tar);
        // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        dfs(i - 1, buf, src, tar);
    }

    /* ハノイの塔を解く */
    fn solve_hanota(A: &mut Vec<i32>, B: &mut Vec<i32>, C: &mut Vec<i32>) {
        let n = A.len() as i32;
        // A の上から n 枚の円盤を B を介して C へ移す
        dfs(n, A, B, C);
    }
    ```

=== "C"

    ```c title="hanota.c"
    /* 円盤を 1 枚移動 */
    void move(int *src, int *srcSize, int *tar, int *tarSize) {
        // src の上から円盤を1枚取り出す
        int pan = src[*srcSize - 1];
        src[*srcSize - 1] = 0;
        (*srcSize)--;
        // 円盤を tar の上に置く
        tar[*tarSize] = pan;
        (*tarSize)++;
    }

    /* ハノイの塔の問題 f(i) を解く */
    void dfs(int i, int *src, int *srcSize, int *buf, int *bufSize, int *tar, int *tarSize) {
        // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if (i == 1) {
            move(src, srcSize, tar, tarSize);
            return;
        }
        // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        dfs(i - 1, src, srcSize, tar, tarSize, buf, bufSize);
        // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        move(src, srcSize, tar, tarSize);
        // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        dfs(i - 1, buf, bufSize, src, srcSize, tar, tarSize);
    }

    /* ハノイの塔を解く */
    void solveHanota(int *A, int *ASize, int *B, int *BSize, int *C, int *CSize) {
        // A の上から n 枚の円盤を B を介して C へ移す
        dfs(*ASize, A, ASize, B, BSize, C, CSize);
    }
    ```

=== "Kotlin"

    ```kotlin title="hanota.kt"
    /* 円盤を 1 枚移動 */
    fun move(src: MutableList<Int>, tar: MutableList<Int>) {
        // src の上から円盤を1枚取り出す
        val pan = src.removeAt(src.size - 1)
        // 円盤を tar の上に置く
        tar.add(pan)
    }

    /* ハノイの塔の問題 f(i) を解く */
    fun dfs(i: Int, src: MutableList<Int>, buf: MutableList<Int>, tar: MutableList<Int>) {
        // src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
        if (i == 1) {
            move(src, tar)
            return
        }
        // 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
        dfs(i - 1, src, tar, buf)
        // 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
        move(src, tar)
        // 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
        dfs(i - 1, buf, src, tar)
    }

    /* ハノイの塔を解く */
    fun solveHanota(A: MutableList<Int>, B: MutableList<Int>, C: MutableList<Int>) {
        val n = A.size
        // A の上から n 枚の円盤を B を介して C へ移す
        dfs(n, A, B, C)
    }
    ```

=== "Ruby"

    ```ruby title="hanota.rb"
    ### 円盤を1枚移動 ###
    def move(src, tar)
      # src の上から円盤を1枚取り出す
      pan = src.pop
      # 円盤を tar の上に置く
      tar << pan
    end

    ### ハノイの塔 f(i) を解く ###
    def dfs(i, src, buf, tar)
      # src に円盤が 1 枚だけ残っている場合は、そのまま tar へ移す
      if i == 1
        move(src, tar)
        return
      end

      # 部分問題 f(i-1)：src の上部 i-1 枚の円盤を tar を補助にして buf へ移す
      dfs(i - 1, src, tar, buf)
      # 部分問題 f(1)：src に残る 1 枚の円盤を tar に移す
      move(src, tar)
      # 部分問題 f(i-1)：buf の上部 i-1 枚の円盤を src を補助にして tar へ移す
      dfs(i - 1, buf, src, tar)
    end

    ### ハノイの塔を解く ###
    def solve_hanota(_A, _B, _C)
      n = _A.length
      # A の上から n 枚の円盤を B を介して C へ移す
      dfs(n, _A, _B, _C)
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20move%28src%3A%20list%5Bint%5D%2C%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%86%86%E7%9B%A4%E3%82%92%201%20%E6%9E%9A%E7%A7%BB%E5%8B%95%22%22%22%0A%20%20%20%20%23%20src%20%E3%81%AE%E4%B8%8A%E3%81%8B%E3%82%89%E5%86%86%E7%9B%A4%E3%82%921%E6%9E%9A%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20pan%20%3D%20src.pop%28%29%0A%20%20%20%20%23%20%E5%86%86%E7%9B%A4%E3%82%92%20tar%20%E3%81%AE%E4%B8%8A%E3%81%AB%E7%BD%AE%E3%81%8F%0A%20%20%20%20tar.append%28pan%29%0A%0A%0Adef%20dfs%28i%3A%20int%2C%20src%3A%20list%5Bint%5D%2C%20buf%3A%20list%5Bint%5D%2C%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E3%83%8F%E3%83%8E%E3%82%A4%E3%81%AE%E5%A1%94%E3%81%AE%E5%95%8F%E9%A1%8C%20f%28i%29%20%E3%82%92%E8%A7%A3%E3%81%8F%22%22%22%0A%20%20%20%20%23%20src%20%E3%81%AB%E5%86%86%E7%9B%A4%E3%81%8C%201%20%E6%9E%9A%E3%81%A0%E3%81%91%E6%AE%8B%E3%81%A3%E3%81%A6%E3%81%84%E3%82%8B%E5%A0%B4%E5%90%88%E3%81%AF%E3%80%81%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%20tar%20%E3%81%B8%E7%A7%BB%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20move%28src%2C%20tar%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%20f%28i-1%29%EF%BC%9Asrc%20%E3%81%AE%E4%B8%8A%E9%83%A8%20i-1%20%E6%9E%9A%E3%81%AE%E5%86%86%E7%9B%A4%E3%82%92%20tar%20%E3%82%92%E8%A3%9C%E5%8A%A9%E3%81%AB%E3%81%97%E3%81%A6%20buf%20%E3%81%B8%E7%A7%BB%E3%81%99%0A%20%20%20%20dfs%28i%20-%201%2C%20src%2C%20tar%2C%20buf%29%0A%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%20f%281%29%EF%BC%9Asrc%20%E3%81%AB%E6%AE%8B%E3%82%8B%201%20%E6%9E%9A%E3%81%AE%E5%86%86%E7%9B%A4%E3%82%92%20tar%20%E3%81%AB%E7%A7%BB%E3%81%99%0A%20%20%20%20move%28src%2C%20tar%29%0A%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%20f%28i-1%29%EF%BC%9Abuf%20%E3%81%AE%E4%B8%8A%E9%83%A8%20i-1%20%E6%9E%9A%E3%81%AE%E5%86%86%E7%9B%A4%E3%82%92%20src%20%E3%82%92%E8%A3%9C%E5%8A%A9%E3%81%AB%E3%81%97%E3%81%A6%20tar%20%E3%81%B8%E7%A7%BB%E3%81%99%0A%20%20%20%20dfs%28i%20-%201%2C%20buf%2C%20src%2C%20tar%29%0A%0A%0Adef%20solve_hanota%28A%3A%20list%5Bint%5D%2C%20B%3A%20list%5Bint%5D%2C%20C%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E3%83%8F%E3%83%8E%E3%82%A4%E3%81%AE%E5%A1%94%E3%82%92%E8%A7%A3%E3%81%8F%22%22%22%0A%20%20%20%20n%20%3D%20len%28A%29%0A%20%20%20%20%23%20A%20%E3%81%AE%E4%B8%8A%E3%81%8B%E3%82%89%20n%20%E6%9E%9A%E3%81%AE%E5%86%86%E7%9B%A4%E3%82%92%20B%20%E3%82%92%E4%BB%8B%E3%81%97%E3%81%A6%20C%20%E3%81%B8%E7%A7%BB%E3%81%99%0A%20%20%20%20dfs%28n%2C%20A%2C%20B%2C%20C%29%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E6%9C%AB%E5%B0%BE%E3%81%8C%E6%9F%B1%E3%81%AE%E9%A0%82%E4%B8%8A%0A%20%20%20%20A%20%3D%20%5B5%2C%204%2C%203%2C%202%2C%201%5D%0A%20%20%20%20B%20%3D%20%5B%5D%0A%20%20%20%20C%20%3D%20%5B%5D%0A%20%20%20%20print%28%22%E5%88%9D%E6%9C%9F%E7%8A%B6%E6%85%8B%3A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29%0A%0A%20%20%20%20solve_hanota%28A%2C%20B%2C%20C%29%0A%0A%20%20%20%20print%28%22%E5%86%86%E7%9B%A4%E3%81%AE%E7%A7%BB%E5%8B%95%E5%AE%8C%E4%BA%86%E5%BE%8C%3A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20move%28src%3A%20list%5Bint%5D%2C%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E5%86%86%E7%9B%A4%E3%82%92%201%20%E6%9E%9A%E7%A7%BB%E5%8B%95%22%22%22%0A%20%20%20%20%23%20src%20%E3%81%AE%E4%B8%8A%E3%81%8B%E3%82%89%E5%86%86%E7%9B%A4%E3%82%921%E6%9E%9A%E5%8F%96%E3%82%8A%E5%87%BA%E3%81%99%0A%20%20%20%20pan%20%3D%20src.pop%28%29%0A%20%20%20%20%23%20%E5%86%86%E7%9B%A4%E3%82%92%20tar%20%E3%81%AE%E4%B8%8A%E3%81%AB%E7%BD%AE%E3%81%8F%0A%20%20%20%20tar.append%28pan%29%0A%0A%0Adef%20dfs%28i%3A%20int%2C%20src%3A%20list%5Bint%5D%2C%20buf%3A%20list%5Bint%5D%2C%20tar%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E3%83%8F%E3%83%8E%E3%82%A4%E3%81%AE%E5%A1%94%E3%81%AE%E5%95%8F%E9%A1%8C%20f%28i%29%20%E3%82%92%E8%A7%A3%E3%81%8F%22%22%22%0A%20%20%20%20%23%20src%20%E3%81%AB%E5%86%86%E7%9B%A4%E3%81%8C%201%20%E6%9E%9A%E3%81%A0%E3%81%91%E6%AE%8B%E3%81%A3%E3%81%A6%E3%81%84%E3%82%8B%E5%A0%B4%E5%90%88%E3%81%AF%E3%80%81%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%20tar%20%E3%81%B8%E7%A7%BB%E3%81%99%0A%20%20%20%20if%20i%20%3D%3D%201%3A%0A%20%20%20%20%20%20%20%20move%28src%2C%20tar%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%20f%28i-1%29%EF%BC%9Asrc%20%E3%81%AE%E4%B8%8A%E9%83%A8%20i-1%20%E6%9E%9A%E3%81%AE%E5%86%86%E7%9B%A4%E3%82%92%20tar%20%E3%82%92%E8%A3%9C%E5%8A%A9%E3%81%AB%E3%81%97%E3%81%A6%20buf%20%E3%81%B8%E7%A7%BB%E3%81%99%0A%20%20%20%20dfs%28i%20-%201%2C%20src%2C%20tar%2C%20buf%29%0A%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%20f%281%29%EF%BC%9Asrc%20%E3%81%AB%E6%AE%8B%E3%82%8B%201%20%E6%9E%9A%E3%81%AE%E5%86%86%E7%9B%A4%E3%82%92%20tar%20%E3%81%AB%E7%A7%BB%E3%81%99%0A%20%20%20%20move%28src%2C%20tar%29%0A%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%20f%28i-1%29%EF%BC%9Abuf%20%E3%81%AE%E4%B8%8A%E9%83%A8%20i-1%20%E6%9E%9A%E3%81%AE%E5%86%86%E7%9B%A4%E3%82%92%20src%20%E3%82%92%E8%A3%9C%E5%8A%A9%E3%81%AB%E3%81%97%E3%81%A6%20tar%20%E3%81%B8%E7%A7%BB%E3%81%99%0A%20%20%20%20dfs%28i%20-%201%2C%20buf%2C%20src%2C%20tar%29%0A%0A%0Adef%20solve_hanota%28A%3A%20list%5Bint%5D%2C%20B%3A%20list%5Bint%5D%2C%20C%3A%20list%5Bint%5D%29%3A%0A%20%20%20%20%22%22%22%E3%83%8F%E3%83%8E%E3%82%A4%E3%81%AE%E5%A1%94%E3%82%92%E8%A7%A3%E3%81%8F%22%22%22%0A%20%20%20%20n%20%3D%20len%28A%29%0A%20%20%20%20%23%20A%20%E3%81%AE%E4%B8%8A%E3%81%8B%E3%82%89%20n%20%E6%9E%9A%E3%81%AE%E5%86%86%E7%9B%A4%E3%82%92%20B%20%E3%82%92%E4%BB%8B%E3%81%97%E3%81%A6%20C%20%E3%81%B8%E7%A7%BB%E3%81%99%0A%20%20%20%20dfs%28n%2C%20A%2C%20B%2C%20C%29%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20%23%20%E3%83%AA%E3%82%B9%E3%83%88%E6%9C%AB%E5%B0%BE%E3%81%8C%E6%9F%B1%E3%81%AE%E9%A0%82%E4%B8%8A%0A%20%20%20%20A%20%3D%20%5B5%2C%204%2C%203%2C%202%2C%201%5D%0A%20%20%20%20B%20%3D%20%5B%5D%0A%20%20%20%20C%20%3D%20%5B%5D%0A%20%20%20%20print%28%22%E5%88%9D%E6%9C%9F%E7%8A%B6%E6%85%8B%3A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29%0A%0A%20%20%20%20solve_hanota%28A%2C%20B%2C%20C%29%0A%0A%20%20%20%20print%28%22%E5%86%86%E7%9B%A4%E3%81%AE%E7%A7%BB%E5%8B%95%E5%AE%8C%E4%BA%86%E5%BE%8C%3A%22%29%0A%20%20%20%20print%28f%22A%20%3D%20%7BA%7D%22%29%0A%20%20%20%20print%28f%22B%20%3D%20%7BB%7D%22%29%0A%20%20%20%20print%28f%22C%20%3D%20%7BC%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=12&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

以下の図に示すように、ハノイの塔の問題は高さ $n$ の再帰木を形成し、各ノードは 1 つの部分問題、すなわち 1 つ起動された `dfs()` 関数に対応します。**したがって時間計算量は $O(2^n)$ 、空間計算量は $O(n)$** です。

![ハノイの塔の問題の再帰木](hanota_problem.assets/hanota_recursive_tree.png){ class="animation-figure" }

<p align="center"> 図 12-15 &nbsp; ハノイの塔の問題の再帰木 </p>

!!! quote

    ハノイの塔の問題は古い伝説に由来します。古代インドのある寺院で、僧侶たちは 3 本の高いダイヤモンドの柱と、$64$ 枚の大きさの異なる金の円盤を持っていました。僧侶たちは絶えず円盤を動かし、最後の 1 枚が正しく置かれた瞬間に世界が終わると信じていました。

    しかし、たとえ僧侶たちが 1 秒に 1 回移動するとしても、合計でおよそ $2^{64} \approx 1.84×10^{19}$ 秒、約 $5850$ 億年が必要で、現在推定されている宇宙の年齢をはるかに上回ります。したがって、この伝説が本当だったとしても、世界の終わりを心配する必要はなさそうです。
