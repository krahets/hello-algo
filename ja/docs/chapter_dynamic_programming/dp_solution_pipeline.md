---
comments: true
---

# 14.3 &nbsp; 動的計画法で解くための考え方

前の 2 節では、動的計画法で解ける問題の主な特徴を学びました。ここからは、実際に解くときに役立つ 2 つの問いを考えます。

1. 動的計画法に適した問題かどうかを、どのように判断すればよいでしょうか。
2. 動的計画法で解くにはどこから始め、どのような手順で進めればよいでしょうか。

## 14.3.1 &nbsp; 問題の見極め方

一般に、部分問題の重複と最適部分構造があり、以後の選択が過去の経緯に依存しない問題は、動的計画法で解くのに適しています。ただし、問題文からこれらを直接読み取るのは難しいため、条件を緩めて、**まずはバックトラック（全探索）で解きやすいかを考えます**。

**バックトラックに適した問題は、多くの場合「決定木」で表せます**。各ノードが 1 回の選択を表し、各経路が一連の選択を表す木構造です。

言い換えると、何を選ぶかが明確で、一連の選択によって解が得られる問題なら、決定木で表すことができ、通常はバックトラックで解けます。

そのうえで、次の特徴があれば動的計画法に向いている可能性が高まります。

- 最大値や最小値、最多や最少といった最適化が求められています。
- 状態をリスト、多次元配列、あるいは木で表せて、ある状態とその周囲の状態の間に漸化式が成り立ちます。

逆に、次の特徴があると動的計画法には向かない可能性があります。

- 目的が最適解を求めることではなく、考えられるすべての解を求めることです。
- 順列や組合せを扱うことが問題文から明らかで、具体的な解を複数返す必要があります。

決定木で表せて、動的計画法に向いている特徴がはっきりしていれば、まずは動的計画法が使えると仮定し、解く過程で確かめられます。

## 14.3.2 &nbsp; 問題を解く手順

動的計画法で解く手順は問題の性質や難しさによって異なりますが、通常は、各段階の選択を整理し、状態を定義し、$dp$ テーブルを作り、状態遷移式を導き、境界条件を決める、という流れになります。

具体的な手順を、代表的な「最小経路和」の問題で見ていきましょう。

!!! question "問題"

    $n \times m$ の 2 次元グリッド `grid` が与えられます。各マスには、そのマスのコストを表す非負整数が入っています。ロボットは左上のマスから出発し、1 歩で下か右に 1 マスずつ進んで右下のマスを目指します。左上から右下までの経路和の最小値を返してください。

図 14-10 の例では、与えられたグリッドの最小経路和は $13$ です。

![最小経路和の例](dp_solution_pipeline.assets/min_path_sum_example.svg){ class="animation-figure" }

<p align="center"> 図 14-10 &nbsp; 最小経路和の例 </p>

**手順 1：各段階の選択を考え、状態を定義して $dp$ テーブルを作る**

各段階での選択は、今いるマスから下に 1 マス進むか、右に 1 マス進むかです。現在の行と列の添字を $[i, j]$ とすると、下に進めば $[i+1, j]$、右に進めば $[i, j+1]$ になります。そこで状態には行と列の添字という 2 つの変数を含め、$[i, j]$ と表します。

状態 $[i, j]$ に対応する部分問題は、始点 $[0, 0]$ から $[i, j]$ までの最小経路和を求めることです。その解を $dp[i, j]$ と書きます。

こうして図 14-11 の 2 次元の $dp$ 行列が得られます。大きさは入力グリッド $grid$ と同じです。

![状態の定義と dp テーブル](dp_solution_pipeline.assets/min_path_sum_solution_state_definition.svg){ class="animation-figure" }

<p align="center"> 図 14-11 &nbsp; 状態の定義と dp テーブル </p>

!!! note "注記"

    動的計画法もバックトラックも、一連の選択として表せます。状態を構成するのは選択に関わる変数です。どこまで解き進めたかを表す変数をすべて含めることで、次の状態を導くために十分な情報がそろいます。
    
    各状態には部分問題が 1 つ対応します。すべての部分問題の解を保存する $dp$ テーブルを定義すると、状態に含まれる独立した変数がそれぞれ $dp$ テーブルの 1 つの次元に対応します。つまり、$dp$ テーブルは状態と部分問題の解の対応表です。

**手順 2：最適部分構造を見つけ、状態遷移式を導く**

状態 $[i, j]$ に遷移できるのは、上のマス $[i-1, j]$ と左のマス $[i, j-1]$ だけです。したがって、$[i, j]$ までの最小経路和は、$[i, j-1]$ までの最小経路和と $[i-1, j]$ までの最小経路和のうち小さい方で決まります。これが最適部分構造です。

以上から、図 14-12 の状態遷移式が得られます。

$$
dp[i, j] = \min(dp[i-1, j], dp[i, j-1]) + grid[i, j]
$$

![最適部分構造と状態遷移式](dp_solution_pipeline.assets/min_path_sum_solution_state_transition.svg){ class="animation-figure" }

<p align="center"> 図 14-12 &nbsp; 最適部分構造と状態遷移式 </p>

!!! note "注記"

    定義した $dp$ テーブルをもとに、元の問題と部分問題の関係を考えます。部分問題の最適解から元の問題の最適解を組み立てる方法、すなわち最適部分構造を見つけましょう。

    最適部分構造がわかれば、それをもとに状態遷移式を組み立てられます。

**手順 3：境界条件と状態遷移の順序を決める**

先頭行の状態には左の状態からしか到達できず、先頭列の状態には上の状態からしか到達できません。そこで、先頭行 $i = 0$ と先頭列 $j = 0$ が境界条件になります。

図 14-13 のように各マスへは左と上のマスから遷移するので、行列を二重ループで走査し、外側のループで行を、内側のループで列を順にたどります。

![境界条件と状態遷移の順序](dp_solution_pipeline.assets/min_path_sum_solution_initial_state.svg){ class="animation-figure" }

<p align="center"> 図 14-13 &nbsp; 境界条件と状態遷移の順序 </p>

!!! note "注記"

    境界条件は、動的計画法では $dp$ テーブルの初期化に、探索では枝刈りに使います。
    
    状態遷移の順序を決める際に大切なのは、ある問題の解を求める時点で、その計算に必要な小さい部分問題がすべて正しく解けていることです。

ここまでの考察から、動的計画法のコードを直接書くこともできます。ただ、部分問題への分解はトップダウンの発想なので、「全探索 $\rightarrow$ メモ化探索 $\rightarrow$ 動的計画法」の順に実装すると自然に考えを進められます。

### 1. &nbsp; 方法 1：全探索

状態 $[i, j]$ から探索を始め、より小さい状態 $[i-1, j]$ と $[i, j-1]$ に繰り返し分解します。再帰関数を構成する要素は次のとおりです。

- **再帰関数の引数**：状態 $[i, j]$ です。
- **戻り値**：$[0, 0]$ から $[i, j]$ までの最小経路和 $dp[i, j]$ です。
- **終了条件**：$i = 0$ かつ $j = 0$ なら、コスト $grid[0, 0]$ を返します。
- **枝刈り**：$i < 0$ または $j < 0$ なら添字が範囲外です。その経路を使えないことを示すコスト $+\infty$ を返します。

実装は次のとおりです。

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dfs(grid: list[list[int]], i: int, j: int) -> int:
        """最小経路和：全探索"""
        # 左上のマスに着いたら探索を終了する
        if i == 0 and j == 0:
            return grid[0][0]
        # 行または列の添字が範囲外ならコスト +∞ を返す
        if i < 0 or j < 0:
            return inf
        # 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
        up = min_path_sum_dfs(grid, i - 1, j)
        left = min_path_sum_dfs(grid, i, j - 1)
        # 左上から (i, j) までの最小経路コストを返す
        return min(left, up) + grid[i][j]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    /* 最小経路和：全探索 */
    int minPathSumDFS(vector<vector<int>> &grid, int i, int j) {
        // 左上のマスに着いたら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 左上から (i, j) までの最小経路コストを返す
        return min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
    }
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* 最小経路和：全探索 */
    int minPathSumDFS(int[][] grid, int i, int j) {
        // 左上のマスに着いたら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 左上から (i, j) までの最小経路コストを返す
        return Math.min(left, up) + grid[i][j];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    /* 最小経路和：全探索 */
    int MinPathSumDFS(int[][] grid, int i, int j) {
        // 左上のマスに着いたら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
        int up = MinPathSumDFS(grid, i - 1, j);
        int left = MinPathSumDFS(grid, i, j - 1);
        // 左上から (i, j) までの最小経路コストを返す
        return Math.Min(left, up) + grid[i][j];
    }
    ```

=== "Go"

    ```go title="min_path_sum.go"
    /* 最小経路和：全探索 */
    func minPathSumDFS(grid [][]int, i, j int) int {
        // 左上のマスに着いたら探索を終了する
        if i == 0 && j == 0 {
            return grid[0][0]
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if i < 0 || j < 0 {
            return math.MaxInt
        }
        // 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
        up := minPathSumDFS(grid, i-1, j)
        left := minPathSumDFS(grid, i, j-1)
        // 左上から (i, j) までの最小経路コストを返す
        return int(math.Min(float64(left), float64(up))) + grid[i][j]
    }
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    /* 最小経路和：全探索 */
    func minPathSumDFS(grid: [[Int]], i: Int, j: Int) -> Int {
        // 左上のマスに着いたら探索を終了する
        if i == 0, j == 0 {
            return grid[0][0]
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if i < 0 || j < 0 {
            return .max
        }
        // 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
        let up = minPathSumDFS(grid: grid, i: i - 1, j: j)
        let left = minPathSumDFS(grid: grid, i: i, j: j - 1)
        // 左上から (i, j) までの最小経路コストを返す
        return min(left, up) + grid[i][j]
    }
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    /* 最小経路和：全探索 */
    function minPathSumDFS(grid, i, j) {
        // 左上のマスに着いたら探索を終了する
        if (i === 0 && j === 0) {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
        const up = minPathSumDFS(grid, i - 1, j);
        const left = minPathSumDFS(grid, i, j - 1);
        // 左上から (i, j) までの最小経路コストを返す
        return Math.min(left, up) + grid[i][j];
    }
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    /* 最小経路和：全探索 */
    function minPathSumDFS(
        grid: Array<Array<number>>,
        i: number,
        j: number
    ): number {
        // 左上のマスに着いたら探索を終了する
        if (i === 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
        const up = minPathSumDFS(grid, i - 1, j);
        const left = minPathSumDFS(grid, i, j - 1);
        // 左上から (i, j) までの最小経路コストを返す
        return Math.min(left, up) + grid[i][j];
    }
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    /* 最小経路和：全探索 */
    int minPathSumDFS(List<List<int>> grid, int i, int j) {
      // 左上のマスに着いたら探索を終了する
      if (i == 0 && j == 0) {
        return grid[0][0];
      }
      // 行または列の添字が範囲外ならコスト +∞ を返す
      if (i < 0 || j < 0) {
        // Dart の int 型は値の範囲が決まっており、無限大を表す値はない
        return BigInt.from(2).pow(31).toInt();
      }
      // 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
      int up = minPathSumDFS(grid, i - 1, j);
      int left = minPathSumDFS(grid, i, j - 1);
      // 左上から (i, j) までの最小経路コストを返す
      return min(left, up) + grid[i][j];
    }
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    /* 最小経路和：全探索 */
    fn min_path_sum_dfs(grid: &Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
        // 左上のマスに着いたら探索を終了する
        if i == 0 && j == 0 {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if i < 0 || j < 0 {
            return i32::MAX;
        }
        // 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
        let up = min_path_sum_dfs(grid, i - 1, j);
        let left = min_path_sum_dfs(grid, i, j - 1);
        // 左上から (i, j) までの最小経路コストを返す
        std::cmp::min(left, up) + grid[i as usize][j as usize]
    }
    ```

=== "C"

    ```c title="min_path_sum.c"
    /* 最小経路和：全探索 */
    int minPathSumDFS(int grid[MAX_SIZE][MAX_SIZE], int i, int j) {
        // 左上のマスに着いたら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 左上から (i, j) までの最小経路コストを返す
        return myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    /* 最小経路和：全探索 */
    fun minPathSumDFS(grid: Array<IntArray>, i: Int, j: Int): Int {
        // 左上のマスに着いたら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0]
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return Int.MAX_VALUE
        }
        // 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
        val up = minPathSumDFS(grid, i - 1, j)
        val left = minPathSumDFS(grid, i, j - 1)
        // 左上から (i, j) までの最小経路コストを返す
        return min(left, up) + grid[i][j]
    }
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    ### 最小経路和：全探索 ###
    def min_path_sum_dfs(grid, i, j)
      # 左上のマスに着いたら探索を終了する
      return grid[i][j] if i == 0 && j == 0
      # 行または列の添字が範囲外ならコスト +∞ を返す
      return Float::INFINITY if i < 0 || j < 0
      # 左上から (i-1, j) と (i, j-1) までの最小経路コストを求める
      up = min_path_sum_dfs(grid, i - 1, j)
      left = min_path_sum_dfs(grid, i, j - 1)
      # 左上から (i, j) までの最小経路コストを返す
      [left, up].min + grid[i][j]
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs%28grid%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E5%85%A8%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%AE%E3%83%9E%E3%82%B9%E3%81%AB%E7%9D%80%E3%81%84%E3%81%9F%E3%82%89%E6%8E%A2%E7%B4%A2%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%BE%E3%81%9F%E3%81%AF%E5%88%97%E3%81%AE%E6%B7%BB%E5%AD%97%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%82%B3%E3%82%B9%E3%83%88%20%2B%E2%88%9E%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i-1,%20j%29%20%E3%81%A8%20%28i,%20j-1%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20up%20%3D%20min_path_sum_dfs%28grid,%20i%20-%201,%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs%28grid,%20i,%20j%20-%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i,%20j%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20min%28left,%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E5%85%A8%E6%8E%A2%E7%B4%A2%0A%20%20%20%20res%20%3D%20min_path_sum_dfs%28grid,%20n%20-%201,%20m%20-%201%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs%28grid%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E5%85%A8%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%AE%E3%83%9E%E3%82%B9%E3%81%AB%E7%9D%80%E3%81%84%E3%81%9F%E3%82%89%E6%8E%A2%E7%B4%A2%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%BE%E3%81%9F%E3%81%AF%E5%88%97%E3%81%AE%E6%B7%BB%E5%AD%97%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%82%B3%E3%82%B9%E3%83%88%20%2B%E2%88%9E%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i-1,%20j%29%20%E3%81%A8%20%28i,%20j-1%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E6%B1%82%E3%82%81%E3%82%8B%0A%20%20%20%20up%20%3D%20min_path_sum_dfs%28grid,%20i%20-%201,%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs%28grid,%20i,%20j%20-%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i,%20j%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20min%28left,%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E5%85%A8%E6%8E%A2%E7%B4%A2%0A%20%20%20%20res%20%3D%20min_path_sum_dfs%28grid,%20n%20-%201,%20m%20-%201%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 14-14 は $dp[2, 1]$ を根とする再帰木です。部分問題に重複があり、その数はグリッド `grid` が大きくなるにつれて急増します。

部分問題が重複する根本的な理由は、**左上から同じマスに到達する経路が複数あること**です。

![全探索の再帰木](dp_solution_pipeline.assets/min_path_sum_dfs.svg){ class="animation-figure" }

<p align="center"> 図 14-14 &nbsp; 全探索の再帰木 </p>

各状態では下か右の 2 方向を選べます。左上から右下までは合計 $m + n - 2$ 歩なので、最悪時間計算量は $O(2^{m + n})$ です。ここで $n$ と $m$ はそれぞれ行数と列数です。この見積もりでは境界付近の事情を考慮していません。グリッドの端に着くと選択肢は 1 つになるため、実際の経路数はもう少し少なくなります。

### 2. &nbsp; 方法 2：メモ化探索

グリッド `grid` と同じ大きさのメモ用配列 `mem` に各部分問題の解を記録し、重複する部分問題の探索を枝刈りします。

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dfs_mem(
        grid: list[list[int]], mem: list[list[int]], i: int, j: int
    ) -> int:
        """最小経路和：メモ化探索"""
        # 左上のマスに着いたら探索を終了する
        if i == 0 and j == 0:
            return grid[0][0]
        # 行または列の添字が範囲外ならコスト +∞ を返す
        if i < 0 or j < 0:
            return inf
        # 記録済みなら、その値を返す
        if mem[i][j] != -1:
            return mem[i][j]
        # 左と上のマスまでの最小経路コスト
        up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
        left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
        # 左上から (i, j) までの最小経路コストを記録して返す
        mem[i][j] = min(left, up) + grid[i][j]
        return mem[i][j]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    /* 最小経路和：メモ化探索 */
    int minPathSumDFSMem(vector<vector<int>> &grid, vector<vector<int>> &mem, int i, int j) {
        // 左上のマスに着いたら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 記録済みなら、その値を返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のマスまでの最小経路コスト
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 左上から (i, j) までの最小経路コストを記録して返す
        mem[i][j] = min(left, up) != INT_MAX ? min(left, up) + grid[i][j] : INT_MAX;
        return mem[i][j];
    }
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* 最小経路和：メモ化探索 */
    int minPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // 左上のマスに着いたら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 記録済みなら、その値を返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のマスまでの最小経路コスト
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 左上から (i, j) までの最小経路コストを記録して返す
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    /* 最小経路和：メモ化探索 */
    int MinPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // 左上のマスに着いたら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 記録済みなら、その値を返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のマスまでの最小経路コスト
        int up = MinPathSumDFSMem(grid, mem, i - 1, j);
        int left = MinPathSumDFSMem(grid, mem, i, j - 1);
        // 左上から (i, j) までの最小経路コストを記録して返す
        mem[i][j] = Math.Min(left, up) + grid[i][j];
        return mem[i][j];
    }
    ```

=== "Go"

    ```go title="min_path_sum.go"
    /* 最小経路和：メモ化探索 */
    func minPathSumDFSMem(grid, mem [][]int, i, j int) int {
        // 左上のマスに着いたら探索を終了する
        if i == 0 && j == 0 {
            return grid[0][0]
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if i < 0 || j < 0 {
            return math.MaxInt
        }
        // 記録済みなら、その値を返す
        if mem[i][j] != -1 {
            return mem[i][j]
        }
        // 左と上のマスまでの最小経路コスト
        up := minPathSumDFSMem(grid, mem, i-1, j)
        left := minPathSumDFSMem(grid, mem, i, j-1)
        // 左上から (i, j) までの最小経路コストを記録して返す
        mem[i][j] = int(math.Min(float64(left), float64(up))) + grid[i][j]
        return mem[i][j]
    }
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    /* 最小経路和：メモ化探索 */
    func minPathSumDFSMem(grid: [[Int]], mem: inout [[Int]], i: Int, j: Int) -> Int {
        // 左上のマスに着いたら探索を終了する
        if i == 0, j == 0 {
            return grid[0][0]
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if i < 0 || j < 0 {
            return .max
        }
        // 記録済みなら、その値を返す
        if mem[i][j] != -1 {
            return mem[i][j]
        }
        // 左と上のマスまでの最小経路コスト
        let up = minPathSumDFSMem(grid: grid, mem: &mem, i: i - 1, j: j)
        let left = minPathSumDFSMem(grid: grid, mem: &mem, i: i, j: j - 1)
        // 左上から (i, j) までの最小経路コストを記録して返す
        mem[i][j] = min(left, up) + grid[i][j]
        return mem[i][j]
    }
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    /* 最小経路和：メモ化探索 */
    function minPathSumDFSMem(grid, mem, i, j) {
        // 左上のマスに着いたら探索を終了する
        if (i === 0 && j === 0) {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 記録済みなら、その値を返す
        if (mem[i][j] !== -1) {
            return mem[i][j];
        }
        // 左と上のマスまでの最小経路コスト
        const up = minPathSumDFSMem(grid, mem, i - 1, j);
        const left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 左上から (i, j) までの最小経路コストを記録して返す
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    /* 最小経路和：メモ化探索 */
    function minPathSumDFSMem(
        grid: Array<Array<number>>,
        mem: Array<Array<number>>,
        i: number,
        j: number
    ): number {
        // 左上のマスに着いたら探索を終了する
        if (i === 0 && j === 0) {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 記録済みなら、その値を返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のマスまでの最小経路コスト
        const up = minPathSumDFSMem(grid, mem, i - 1, j);
        const left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 左上から (i, j) までの最小経路コストを記録して返す
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    /* 最小経路和：メモ化探索 */
    int minPathSumDFSMem(List<List<int>> grid, List<List<int>> mem, int i, int j) {
      // 左上のマスに着いたら探索を終了する
      if (i == 0 && j == 0) {
        return grid[0][0];
      }
      // 行または列の添字が範囲外ならコスト +∞ を返す
      if (i < 0 || j < 0) {
        // Dart の int 型は値の範囲が決まっており、無限大を表す値はない
        return BigInt.from(2).pow(31).toInt();
      }
      // 記録済みなら、その値を返す
      if (mem[i][j] != -1) {
        return mem[i][j];
      }
      // 左と上のマスまでの最小経路コスト
      int up = minPathSumDFSMem(grid, mem, i - 1, j);
      int left = minPathSumDFSMem(grid, mem, i, j - 1);
      // 左上から (i, j) までの最小経路コストを記録して返す
      mem[i][j] = min(left, up) + grid[i][j];
      return mem[i][j];
    }
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    /* 最小経路和：メモ化探索 */
    fn min_path_sum_dfs_mem(grid: &Vec<Vec<i32>>, mem: &mut Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
        // 左上のマスに着いたら探索を終了する
        if i == 0 && j == 0 {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if i < 0 || j < 0 {
            return i32::MAX;
        }
        // 記録済みなら、その値を返す
        if mem[i as usize][j as usize] != -1 {
            return mem[i as usize][j as usize];
        }
        // 左と上のマスまでの最小経路コスト
        let up = min_path_sum_dfs_mem(grid, mem, i - 1, j);
        let left = min_path_sum_dfs_mem(grid, mem, i, j - 1);
        // 左上から (i, j) までの最小経路コストを記録して返す
        mem[i as usize][j as usize] = std::cmp::min(left, up) + grid[i as usize][j as usize];
        mem[i as usize][j as usize]
    }
    ```

=== "C"

    ```c title="min_path_sum.c"
    /* 最小経路和：メモ化探索 */
    int minPathSumDFSMem(int grid[MAX_SIZE][MAX_SIZE], int mem[MAX_SIZE][MAX_SIZE], int i, int j) {
        // 左上のマスに着いたら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 記録済みなら、その値を返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のマスまでの最小経路コスト
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 左上から (i, j) までの最小経路コストを記録して返す
        mem[i][j] = myMin(left, up) != INT_MAX ? myMin(left, up) + grid[i][j] : INT_MAX;
        return mem[i][j];
    }
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    /* 最小経路和：メモ化探索 */
    fun minPathSumDFSMem(
        grid: Array<IntArray>,
        mem: Array<IntArray>,
        i: Int,
        j: Int
    ): Int {
        // 左上のマスに着いたら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0]
        }
        // 行または列の添字が範囲外ならコスト +∞ を返す
        if (i < 0 || j < 0) {
            return Int.MAX_VALUE
        }
        // 記録済みなら、その値を返す
        if (mem[i][j] != -1) {
            return mem[i][j]
        }
        // 左と上のマスまでの最小経路コスト
        val up = minPathSumDFSMem(grid, mem, i - 1, j)
        val left = minPathSumDFSMem(grid, mem, i, j - 1)
        // 左上から (i, j) までの最小経路コストを記録して返す
        mem[i][j] = min(left, up) + grid[i][j]
        return mem[i][j]
    }
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    ### 最小経路和：メモ化探索 ###
    def min_path_sum_dfs_mem(grid, mem, i, j)
      # 左上のマスに着いたら探索を終了する
      return grid[0][0] if i == 0 && j == 0
      # 行または列の添字が範囲外ならコスト +∞ を返す
      return Float::INFINITY if i < 0 || j < 0
      # 記録済みなら、その値を返す
      return mem[i][j] if mem[i][j] != -1
      # 左と上のマスまでの最小経路コスト
      up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
      left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
      # 左上から (i, j) までの最小経路コストを記録して返す
      mem[i][j] = [left, up].min + grid[i][j]
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs_mem%28%0A%20%20%20%20grid%3A%20list%5Blist%5Bint%5D%5D,%20mem%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20j%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%AE%E3%83%9E%E3%82%B9%E3%81%AB%E7%9D%80%E3%81%84%E3%81%9F%E3%82%89%E6%8E%A2%E7%B4%A2%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%BE%E3%81%9F%E3%81%AF%E5%88%97%E3%81%AE%E6%B7%BB%E5%AD%97%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%82%B3%E3%82%B9%E3%83%88%20%2B%E2%88%9E%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%E8%A8%98%E9%8C%B2%E6%B8%88%E3%81%BF%E3%81%AA%E3%82%89%E3%80%81%E3%81%9D%E3%81%AE%E5%80%A4%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20mem%5Bi%5D%5Bj%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%20%20%20%20%23%20%E5%B7%A6%E3%81%A8%E4%B8%8A%E3%81%AE%E3%83%9E%E3%82%B9%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%0A%20%20%20%20up%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20i%20-%201,%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20i,%20j%20-%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i,%20j%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%97%E3%81%A6%E8%BF%94%E3%81%99%0A%20%20%20%20mem%5Bi%5D%5Bj%5D%20%3D%20min%28left,%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%23%20%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20res%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20n%20-%201,%20m%20-%201%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs_mem%28%0A%20%20%20%20grid%3A%20list%5Blist%5Bint%5D%5D,%20mem%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20j%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%AE%E3%83%9E%E3%82%B9%E3%81%AB%E7%9D%80%E3%81%84%E3%81%9F%E3%82%89%E6%8E%A2%E7%B4%A2%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%BE%E3%81%9F%E3%81%AF%E5%88%97%E3%81%AE%E6%B7%BB%E5%AD%97%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%82%B3%E3%82%B9%E3%83%88%20%2B%E2%88%9E%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%E8%A8%98%E9%8C%B2%E6%B8%88%E3%81%BF%E3%81%AA%E3%82%89%E3%80%81%E3%81%9D%E3%81%AE%E5%80%A4%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20mem%5Bi%5D%5Bj%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%20%20%20%20%23%20%E5%B7%A6%E3%81%A8%E4%B8%8A%E3%81%AE%E3%83%9E%E3%82%B9%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%0A%20%20%20%20up%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20i%20-%201,%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20i,%20j%20-%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i,%20j%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%97%E3%81%A6%E8%BF%94%E3%81%99%0A%20%20%20%20mem%5Bi%5D%5Bj%5D%20%3D%20min%28left,%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%23%20%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20res%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20n%20-%201,%20m%20-%201%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 14-15 のように、メモ化すると各部分問題の解を 1 回ずつ計算するだけで済みます。時間計算量は状態の総数、すなわちグリッドの大きさ $O(nm)$ で決まります。

![メモ化探索の再帰木](dp_solution_pipeline.assets/min_path_sum_dfs_mem.svg){ class="animation-figure" }

<p align="center"> 図 14-15 &nbsp; メモ化探索の再帰木 </p>

### 3. &nbsp; 方法 3：動的計画法

反復による動的計画法の実装を以下に示します。

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dp(grid: list[list[int]]) -> int:
        """最小経路和：動的計画法"""
        n, m = len(grid), len(grid[0])
        # dp テーブルを初期化する
        dp = [[0] * m for _ in range(n)]
        dp[0][0] = grid[0][0]
        # 状態遷移：先頭行
        for j in range(1, m):
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        # 状態遷移：先頭列
        for i in range(1, n):
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        # 状態遷移：残りの行と列
        for i in range(1, n):
            for j in range(1, m):
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
        return dp[n - 1][m - 1]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    /* 最小経路和：動的計画法 */
    int minPathSumDP(vector<vector<int>> &grid) {
        int n = grid.size(), m = grid[0].size();
        // dp テーブルを初期化する
        vector<vector<int>> dp(n, vector<int>(m));
        dp[0][0] = grid[0][0];
        // 状態遷移：先頭行
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 状態遷移：先頭列
        for (int i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* 最小経路和：動的計画法 */
    int minPathSumDP(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // dp テーブルを初期化する
        int[][] dp = new int[n][m];
        dp[0][0] = grid[0][0];
        // 状態遷移：先頭行
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 状態遷移：先頭列
        for (int i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    /* 最小経路和：動的計画法 */
    int MinPathSumDP(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // dp テーブルを初期化する
        int[,] dp = new int[n, m];
        dp[0, 0] = grid[0][0];
        // 状態遷移：先頭行
        for (int j = 1; j < m; j++) {
            dp[0, j] = dp[0, j - 1] + grid[0][j];
        }
        // 状態遷移：先頭列
        for (int i = 1; i < n; i++) {
            dp[i, 0] = dp[i - 1, 0] + grid[i][0];
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i, j] = Math.Min(dp[i, j - 1], dp[i - 1, j]) + grid[i][j];
            }
        }
        return dp[n - 1, m - 1];
    }
    ```

=== "Go"

    ```go title="min_path_sum.go"
    /* 最小経路和：動的計画法 */
    func minPathSumDP(grid [][]int) int {
        n, m := len(grid), len(grid[0])
        // dp テーブルを初期化する
        dp := make([][]int, n)
        for i := 0; i < n; i++ {
            dp[i] = make([]int, m)
        }
        dp[0][0] = grid[0][0]
        // 状態遷移：先頭行
        for j := 1; j < m; j++ {
            dp[0][j] = dp[0][j-1] + grid[0][j]
        }
        // 状態遷移：先頭列
        for i := 1; i < n; i++ {
            dp[i][0] = dp[i-1][0] + grid[i][0]
        }
        // 状態遷移：残りの行と列
        for i := 1; i < n; i++ {
            for j := 1; j < m; j++ {
                dp[i][j] = int(math.Min(float64(dp[i][j-1]), float64(dp[i-1][j]))) + grid[i][j]
            }
        }
        return dp[n-1][m-1]
    }
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    /* 最小経路和：動的計画法 */
    func minPathSumDP(grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        // dp テーブルを初期化する
        var dp = Array(repeating: Array(repeating: 0, count: m), count: n)
        dp[0][0] = grid[0][0]
        // 状態遷移：先頭行
        for j in 1 ..< m {
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        }
        // 状態遷移：先頭列
        for i in 1 ..< n {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }
        // 状態遷移：残りの行と列
        for i in 1 ..< n {
            for j in 1 ..< m {
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
            }
        }
        return dp[n - 1][m - 1]
    }
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    /* 最小経路和：動的計画法 */
    function minPathSumDP(grid) {
        const n = grid.length,
            m = grid[0].length;
        // dp テーブルを初期化する
        const dp = Array.from({ length: n }, () =>
            Array.from({ length: m }, () => 0)
        );
        dp[0][0] = grid[0][0];
        // 状態遷移：先頭行
        for (let j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 状態遷移：先頭列
        for (let i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 状態遷移：残りの行と列
        for (let i = 1; i < n; i++) {
            for (let j = 1; j < m; j++) {
                dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    /* 最小経路和：動的計画法 */
    function minPathSumDP(grid: Array<Array<number>>): number {
        const n = grid.length,
            m = grid[0].length;
        // dp テーブルを初期化する
        const dp = Array.from({ length: n }, () =>
            Array.from({ length: m }, () => 0)
        );
        dp[0][0] = grid[0][0];
        // 状態遷移：先頭行
        for (let j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 状態遷移：先頭列
        for (let i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 状態遷移：残りの行と列
        for (let i = 1; i < n; i++) {
            for (let j: number = 1; j < m; j++) {
                dp[i][j] = Math.min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    /* 最小経路和：動的計画法 */
    int minPathSumDP(List<List<int>> grid) {
      int n = grid.length, m = grid[0].length;
      // dp テーブルを初期化する
      List<List<int>> dp = List.generate(n, (i) => List.filled(m, 0));
      dp[0][0] = grid[0][0];
      // 状態遷移：先頭行
      for (int j = 1; j < m; j++) {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
      }
      // 状態遷移：先頭列
      for (int i = 1; i < n; i++) {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
      }
      // 状態遷移：残りの行と列
      for (int i = 1; i < n; i++) {
        for (int j = 1; j < m; j++) {
          dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
      }
      return dp[n - 1][m - 1];
    }
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    /* 最小経路和：動的計画法 */
    fn min_path_sum_dp(grid: &Vec<Vec<i32>>) -> i32 {
        let (n, m) = (grid.len(), grid[0].len());
        // dp テーブルを初期化する
        let mut dp = vec![vec![0; m]; n];
        dp[0][0] = grid[0][0];
        // 状態遷移：先頭行
        for j in 1..m {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 状態遷移：先頭列
        for i in 1..n {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 状態遷移：残りの行と列
        for i in 1..n {
            for j in 1..m {
                dp[i][j] = std::cmp::min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        dp[n - 1][m - 1]
    }
    ```

=== "C"

    ```c title="min_path_sum.c"
    /* 最小経路和：動的計画法 */
    int minPathSumDP(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
        // dp テーブルを初期化する
        int **dp = malloc(n * sizeof(int *));
        for (int i = 0; i < n; i++) {
            dp[i] = calloc(m, sizeof(int));
        }
        dp[0][0] = grid[0][0];
        // 状態遷移：先頭行
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 状態遷移：先頭列
        for (int i = 1; i < n; i++) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i < n; i++) {
            for (int j = 1; j < m; j++) {
                dp[i][j] = myMin(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
            }
        }
        int res = dp[n - 1][m - 1];
        // メモリを解放する
        for (int i = 0; i < n; i++) {
            free(dp[i]);
        }
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    /* 最小経路和：動的計画法 */
    fun minPathSumDP(grid: Array<IntArray>): Int {
        val n = grid.size
        val m = grid[0].size
        // dp テーブルを初期化する
        val dp = Array(n) { IntArray(m) }
        dp[0][0] = grid[0][0]
        // 状態遷移：先頭行
        for (j in 1..<m) {
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        }
        // 状態遷移：先頭列
        for (i in 1..<n) {
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        }
        // 状態遷移：残りの行と列
        for (i in 1..<n) {
            for (j in 1..<m) {
                dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
            }
        }
        return dp[n - 1][m - 1]
    }
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    ### 最小経路和：動的計画法 ###
    def min_path_sum_dp(grid)
      n, m = grid.length, grid.first.length
      # dp テーブルを初期化する
      dp = Array.new(n) { Array.new(m, 0) }
      dp[0][0] = grid[0][0]
      # 状態遷移：先頭行
      (1...m).each { |j| dp[0][j] = dp[0][j - 1] + grid[0][j] }
      # 状態遷移：先頭列
      (1...n).each { |i| dp[i][0] = dp[i - 1][0] + grid[i][0] }
      # 状態遷移：残りの行と列
      for i in 1...n
        for j in 1...m
          dp[i][j] = [dp[i][j - 1], dp[i - 1][j]].min + grid[i][j]
        end
      end
      dp[n -1][m -1]
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20dp%5B0%5D%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%0A%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Bj%5D%20%3D%20dp%5B0%5D%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%20dp%5Bi%20-%201%5D%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%E3%81%A8%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20min%28dp%5Bi%5D%5Bj%20-%201%5D,%20dp%5Bi%20-%201%5D%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bn%20-%201%5D%5Bm%20-%201%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp%28grid%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20dp%5B0%5D%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%0A%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Bj%5D%20%3D%20dp%5B0%5D%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%20dp%5Bi%20-%201%5D%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%E3%81%A8%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20min%28dp%5Bi%5D%5Bj%20-%201%5D,%20dp%5Bi%20-%201%5D%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bn%20-%201%5D%5Bm%20-%201%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp%28grid%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 14-16 は最小経路和を求める状態遷移の過程です。グリッド全体を走査するので、**時間計算量は $O(nm)$ です**。

配列 `dp` の大きさは $n \times m$ なので、**空間計算量は $O(nm)$ です**。

=== "<1>"
    ![動的計画法で最小経路和を求める手順](dp_solution_pipeline.assets/min_path_sum_dp_step1.svg){ class="animation-figure" }

=== "<2>"
    ![min_path_sum_dp_step2](dp_solution_pipeline.assets/min_path_sum_dp_step2.svg){ class="animation-figure" }

=== "<3>"
    ![min_path_sum_dp_step3](dp_solution_pipeline.assets/min_path_sum_dp_step3.svg){ class="animation-figure" }

=== "<4>"
    ![min_path_sum_dp_step4](dp_solution_pipeline.assets/min_path_sum_dp_step4.svg){ class="animation-figure" }

=== "<5>"
    ![min_path_sum_dp_step5](dp_solution_pipeline.assets/min_path_sum_dp_step5.svg){ class="animation-figure" }

=== "<6>"
    ![min_path_sum_dp_step6](dp_solution_pipeline.assets/min_path_sum_dp_step6.svg){ class="animation-figure" }

=== "<7>"
    ![min_path_sum_dp_step7](dp_solution_pipeline.assets/min_path_sum_dp_step7.svg){ class="animation-figure" }

=== "<8>"
    ![min_path_sum_dp_step8](dp_solution_pipeline.assets/min_path_sum_dp_step8.svg){ class="animation-figure" }

=== "<9>"
    ![min_path_sum_dp_step9](dp_solution_pipeline.assets/min_path_sum_dp_step9.svg){ class="animation-figure" }

=== "<10>"
    ![min_path_sum_dp_step10](dp_solution_pipeline.assets/min_path_sum_dp_step10.svg){ class="animation-figure" }

=== "<11>"
    ![min_path_sum_dp_step11](dp_solution_pipeline.assets/min_path_sum_dp_step11.svg){ class="animation-figure" }

=== "<12>"
    ![min_path_sum_dp_step12](dp_solution_pipeline.assets/min_path_sum_dp_step12.svg){ class="animation-figure" }

<p align="center"> 図 14-16 &nbsp; 動的計画法で最小経路和を求める手順 </p>

### 4. &nbsp; 使用メモリの削減

各マスが依存するのは左と上のマスだけなので、$dp$ テーブルは 1 行分の配列だけで表せます。

配列 `dp` で表現できる状態は 1 行分だけです。先頭列をあらかじめすべて初期化できないため、各行を走査するときに更新します。

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dp_comp(grid: list[list[int]]) -> int:
        """最小経路和：使用メモリを削減した動的計画法"""
        n, m = len(grid), len(grid[0])
        # dp テーブルを初期化する
        dp = [0] * m
        # 状態遷移：先頭行
        dp[0] = grid[0][0]
        for j in range(1, m):
            dp[j] = dp[j - 1] + grid[0][j]
        # 状態遷移：残りの行
        for i in range(1, n):
            # 状態遷移：先頭列
            dp[0] = dp[0] + grid[i][0]
            # 状態遷移：残りの列
            for j in range(1, m):
                dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
        return dp[m - 1]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    /* 最小経路和：使用メモリを削減した動的計画法 */
    int minPathSumDPComp(vector<vector<int>> &grid) {
        int n = grid.size(), m = grid[0].size();
        // dp テーブルを初期化する
        vector<int> dp(m);
        // 状態遷移：先頭行
        dp[0] = grid[0][0];
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 状態遷移：残りの行
        for (int i = 1; i < n; i++) {
            // 状態遷移：先頭列
            dp[0] = dp[0] + grid[i][0];
            // 状態遷移：残りの列
            for (int j = 1; j < m; j++) {
                dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* 最小経路和：使用メモリを削減した動的計画法 */
    int minPathSumDPComp(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // dp テーブルを初期化する
        int[] dp = new int[m];
        // 状態遷移：先頭行
        dp[0] = grid[0][0];
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 状態遷移：残りの行
        for (int i = 1; i < n; i++) {
            // 状態遷移：先頭列
            dp[0] = dp[0] + grid[i][0];
            // 状態遷移：残りの列
            for (int j = 1; j < m; j++) {
                dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    /* 最小経路和：使用メモリを削減した動的計画法 */
    int MinPathSumDPComp(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // dp テーブルを初期化する
        int[] dp = new int[m];
        dp[0] = grid[0][0];
        // 状態遷移：先頭行
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 状態遷移：残りの行
        for (int i = 1; i < n; i++) {
            // 状態遷移：先頭列
            dp[0] = dp[0] + grid[i][0];
            // 状態遷移：残りの列
            for (int j = 1; j < m; j++) {
                dp[j] = Math.Min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }
    ```

=== "Go"

    ```go title="min_path_sum.go"
    /* 最小経路和：使用メモリを削減した動的計画法 */
    func minPathSumDPComp(grid [][]int) int {
        n, m := len(grid), len(grid[0])
        // dp テーブルを初期化する
        dp := make([]int, m)
        // 状態遷移：先頭行
        dp[0] = grid[0][0]
        for j := 1; j < m; j++ {
            dp[j] = dp[j-1] + grid[0][j]
        }
        // 状態遷移：残りの行と列
        for i := 1; i < n; i++ {
            // 状態遷移：先頭列
            dp[0] = dp[0] + grid[i][0]
            // 状態遷移：残りの列
            for j := 1; j < m; j++ {
                dp[j] = int(math.Min(float64(dp[j-1]), float64(dp[j]))) + grid[i][j]
            }
        }
        return dp[m-1]
    }
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    /* 最小経路和：使用メモリを削減した動的計画法 */
    func minPathSumDPComp(grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        // dp テーブルを初期化する
        var dp = Array(repeating: 0, count: m)
        // 状態遷移：先頭行
        dp[0] = grid[0][0]
        for j in 1 ..< m {
            dp[j] = dp[j - 1] + grid[0][j]
        }
        // 状態遷移：残りの行
        for i in 1 ..< n {
            // 状態遷移：先頭列
            dp[0] = dp[0] + grid[i][0]
            // 状態遷移：残りの列
            for j in 1 ..< m {
                dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
            }
        }
        return dp[m - 1]
    }
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    /* 最小経路和：使用メモリを削減した動的計画法 */
    function minPathSumDPComp(grid) {
        const n = grid.length,
            m = grid[0].length;
        // dp テーブルを初期化する
        const dp = new Array(m);
        // 状態遷移：先頭行
        dp[0] = grid[0][0];
        for (let j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 状態遷移：残りの行
        for (let i = 1; i < n; i++) {
            // 状態遷移：先頭列
            dp[0] = dp[0] + grid[i][0];
            // 状態遷移：残りの列
            for (let j = 1; j < m; j++) {
                dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    /* 最小経路和：使用メモリを削減した動的計画法 */
    function minPathSumDPComp(grid: Array<Array<number>>): number {
        const n = grid.length,
            m = grid[0].length;
        // dp テーブルを初期化する
        const dp = new Array(m);
        // 状態遷移：先頭行
        dp[0] = grid[0][0];
        for (let j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 状態遷移：残りの行
        for (let i = 1; i < n; i++) {
            // 状態遷移：先頭列
            dp[0] = dp[0] + grid[i][0];
            // 状態遷移：残りの列
            for (let j = 1; j < m; j++) {
                dp[j] = Math.min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        return dp[m - 1];
    }
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    /* 最小経路和：使用メモリを削減した動的計画法 */
    int minPathSumDPComp(List<List<int>> grid) {
      int n = grid.length, m = grid[0].length;
      // dp テーブルを初期化する
      List<int> dp = List.filled(m, 0);
      dp[0] = grid[0][0];
      for (int j = 1; j < m; j++) {
        dp[j] = dp[j - 1] + grid[0][j];
      }
      // 状態遷移：残りの行
      for (int i = 1; i < n; i++) {
        // 状態遷移：先頭列
        dp[0] = dp[0] + grid[i][0];
        // 状態遷移：残りの列
        for (int j = 1; j < m; j++) {
          dp[j] = min(dp[j - 1], dp[j]) + grid[i][j];
        }
      }
      return dp[m - 1];
    }
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    /* 最小経路和：使用メモリを削減した動的計画法 */
    fn min_path_sum_dp_comp(grid: &Vec<Vec<i32>>) -> i32 {
        let (n, m) = (grid.len(), grid[0].len());
        // dp テーブルを初期化する
        let mut dp = vec![0; m];
        // 状態遷移：先頭行
        dp[0] = grid[0][0];
        for j in 1..m {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 状態遷移：残りの行
        for i in 1..n {
            // 状態遷移：先頭列
            dp[0] = dp[0] + grid[i][0];
            // 状態遷移：残りの列
            for j in 1..m {
                dp[j] = std::cmp::min(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        dp[m - 1]
    }
    ```

=== "C"

    ```c title="min_path_sum.c"
    /* 最小経路和：使用メモリを削減した動的計画法 */
    int minPathSumDPComp(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
        // dp テーブルを初期化する
        int *dp = calloc(m, sizeof(int));
        // 状態遷移：先頭行
        dp[0] = grid[0][0];
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 状態遷移：残りの行
        for (int i = 1; i < n; i++) {
            // 状態遷移：先頭列
            dp[0] = dp[0] + grid[i][0];
            // 状態遷移：残りの列
            for (int j = 1; j < m; j++) {
                dp[j] = myMin(dp[j - 1], dp[j]) + grid[i][j];
            }
        }
        int res = dp[m - 1];
        // メモリを解放する
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    /* 最小経路和：使用メモリを削減した動的計画法 */
    fun minPathSumDPComp(grid: Array<IntArray>): Int {
        val n = grid.size
        val m = grid[0].size
        // dp テーブルを初期化する
        val dp = IntArray(m)
        // 状態遷移：先頭行
        dp[0] = grid[0][0]
        for (j in 1..<m) {
            dp[j] = dp[j - 1] + grid[0][j]
        }
        // 状態遷移：残りの行
        for (i in 1..<n) {
            // 状態遷移：先頭列
            dp[0] = dp[0] + grid[i][0]
            // 状態遷移：残りの列
            for (j in 1..<m) {
                dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
            }
        }
        return dp[m - 1]
    }
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    ### 最小経路和：使用メモリを削減した動的計画法 ###
    def min_path_sum_dp_comp(grid)
      n, m = grid.length, grid.first.length
      # dp テーブルを初期化する
      dp = Array.new(m, 0)
      # 状態遷移：先頭行
      dp[0] = grid[0][0]
      (1...m).each { |j| dp[j] = dp[j - 1] + grid[0][j] }
      # 状態遷移：残りの行
      for i in 1...n
        # 状態遷移：先頭列
        dp[0] = dp[0] + grid[i][0]
        # 状態遷移：残りの列
        (1...m).each { |j| dp[j] = [dp[j - 1], dp[j]].min + grid[i][j] }
      end
      dp[m - 1]
    end
    ```

??? pythontutor "実行の様子を見る"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の様子を見る" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp_comp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E4%BD%BF%E7%94%A8%E3%83%A1%E3%83%A2%E3%83%AA%E3%82%92%E5%89%8A%E6%B8%9B%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20m%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%0A%20%20%20%20dp%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20dp%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20%20%20%20%20dp%5B0%5D%20%3D%20dp%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E5%88%97%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20min%28dp%5Bj%20-%201%5D,%20dp%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bm%20-%201%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E3%83%A1%E3%83%A2%E3%83%AA%E3%82%92%E5%89%8A%E6%B8%9B%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp_comp%28grid%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp_comp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E4%BD%BF%E7%94%A8%E3%83%A1%E3%83%A2%E3%83%AA%E3%82%92%E5%89%8A%E6%B8%9B%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20m%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%0A%20%20%20%20dp%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20dp%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20%20%20%20%20dp%5B0%5D%20%3D%20dp%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E5%88%97%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20min%28dp%5Bj%20-%201%5D,%20dp%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bm%20-%201%5D%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E4%BD%BF%E7%94%A8%E3%83%A1%E3%83%A2%E3%83%AA%E3%82%92%E5%89%8A%E6%B8%9B%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp_comp%28grid%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>
