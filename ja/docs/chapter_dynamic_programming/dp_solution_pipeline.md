---
comments: true
---

# 14.3 &nbsp; 動的計画法の解き方

前の 2 節では、動的計画法の問題の主な特徴を説明しました。ここからは、より実践的な二つの疑問を考えていきます。

1. ある問題が動的計画法に適しているかどうかは、どのように判断するのでしょうか。
2. 動的計画法の問題は何から手を付け、どのような手順で解けばよいのでしょうか。

## 14.3.1 &nbsp; 問題の見極め

一般に、部分問題の重複と最適部分構造があり、後続の判断が過去の経路に依存しない問題は、動的計画法に適しています。ただし、問題文からこれらの性質を直接見抜くのは難しいため、通常は条件を緩め、**まずバックトラッキング（総当たり）で解けそうかを考えます**。

**バックトラッキングに適した問題は、通常「決定木モデル」で表せます**。木構造で記述でき、各ノードが判断を、各経路が一連の判断を表す問題です。

言い換えると、明確な選択があり、その選択を順に行って解が得られるなら、決定木モデルに当てはまり、通常はバックトラッキングで解けます。

これに加え、動的計画法の問題らしいと判断する「プラス材料」があります。

- 最大・最小、最多・最少などの最適化を求めています。
- 状態をリスト、多次元行列、木などで表せ、ある状態とその周囲の状態の間に漸化式があります。

反対に、次のような「マイナス材料」もあります。

- 最適解ではなく、可能な解をすべて求めることが目標です。
- 順列や組合せの特徴が明らかで、具体的な複数の方法を返す必要があります。

決定木モデルに当てはまり、「プラス材料」もはっきりしているなら、動的計画法の問題と仮定して取り組み、解く過程で確かめていけます。

## 14.3.2 &nbsp; 問題を解く手順

動的計画法の手順は問題の性質や難しさによって異なりますが、通常は、選択の記述、状態の定義、$dp$ テーブルの作成、状態遷移式の導出、境界条件の決定などの順で進めます。

手順を具体的に示すため、典型的な「経路和の最小化」問題を使います。

!!! question "問題"

    $n \times m$ の二次元グリッド `grid` が与えられます。各マスには、そのマスのコストを表す非負の整数があります。ロボットは左上のマスから出発し、毎回、下または右に 1 マスだけ進んで、右下のマスを目指します。左上から右下までの経路和の最小値を返してください。

図 14-10 のグリッドでは、経路和の最小値は $13$ です。

![経路和の最小化問題のデータ例](dp_solution_pipeline.assets/min_path_sum_example.png){ class="animation-figure" }

<p align="center"> 図 14-10 &nbsp; 経路和の最小化問題のデータ例 </p>

**第 1 段階：各回の選択を考えて状態を定義し、$dp$ テーブルを作る**

各回の選択は、現在のマスから下または右に 1 マス進むことです。現在の行と列のインデックスを $[i, j]$ とすると、移動後は $[i+1, j]$ または $[i, j+1]$ になります。したがって、状態は行と列の二つの変数を含む $[i, j]$ とします。

状態 $[i, j]$ に対応する部分問題は、開始点 $[0, 0]$ から $[i, j]$ までの経路和の最小値を求めることで、その解を $dp[i, j]$ とします。

これで、図 14-11 の二次元の $dp$ 行列が得られます。大きさは入力グリッド $grid$ と同じです。

![状態の定義と dp テーブル](dp_solution_pipeline.assets/min_path_sum_solution_state_definition.png){ class="animation-figure" }

<p align="center"> 図 14-11 &nbsp; 状態の定義と dp テーブル </p>

!!! note "注記"

    動的計画法やバックトラッキングの過程は、一連の判断として表せます。状態はすべての判断変数で構成し、問題を解く過程の進み具合を表す変数をすべて含めます。次の状態を導くのに十分な情報を持たせる必要があります。
    
    各状態は一つの部分問題に対応し、$dp$ テーブルにすべての部分問題の解を保存します。状態の各独立変数が、$dp$ テーブルの一つの次元になります。本質的には、$dp$ テーブルは状態から部分問題の解への対応表です。

**第 2 段階：最適部分構造を見つけ、状態遷移式を導く**

状態 $[i, j]$ には、上のマス $[i-1, j]$ または左のマス $[i, j-1]$ からしか到達できません。したがって、最適部分構造は、$[i, j]$ までの経路和の最小値が、$[i, j-1]$ までの最小値と $[i-1, j]$ までの最小値のうち、小さい方で決まることです。

この分析から、図 14-12 の状態遷移式を導けます。

$$
dp[i, j] = \min(dp[i-1, j], dp[i, j-1]) + grid[i, j]
$$

![最適部分構造と状態遷移式](dp_solution_pipeline.assets/min_path_sum_solution_state_transition.png){ class="animation-figure" }

<p align="center"> 図 14-12 &nbsp; 最適部分構造と状態遷移式 </p>

!!! note "注記"

    定義した $dp$ テーブルをもとに、元の問題と部分問題の関係を考えます。部分問題の最適解から元の問題の最適解を組み立てる方法、すなわち最適部分構造を見つけます。

    最適部分構造が見つかれば、それを使って状態遷移式を組み立てられます。

**第 3 段階：境界条件と状態遷移の順序を決める**

この問題では、先頭行の状態には左からしか到達できず、先頭列の状態には上からしか到達できません。そのため、先頭行 $i = 0$ と先頭列 $j = 0$ が境界条件になります。

図 14-13 のように、各マスは左と上のマスから遷移するため、ループで行列を走査します。外側のループで行を、内側のループで列を走査します。

![境界条件と状態遷移の順序](dp_solution_pipeline.assets/min_path_sum_solution_initial_state.png){ class="animation-figure" }

<p align="center"> 図 14-13 &nbsp; 境界条件と状態遷移の順序 </p>

!!! note "注記"

    境界条件は、動的計画法では $dp$ テーブルの初期化に、探索では枝刈りに使います。
    
    状態遷移の順序で重要なのは、現在の問題の解を計算する時点で、依存するすべての小さな部分問題の解が正しく計算済みであることです。

ここまでの分析から、動的計画法のコードを直接書けます。ただし、部分問題への分解は上から下への考え方なので、「全探索 $\rightarrow$ メモ化探索 $\rightarrow$ 動的計画法」の順に実装する方が、自然な思考の流れに沿っています。

### 1. &nbsp; 方法 1：全探索

状態 $[i, j]$ から探索を始め、より小さな状態 $[i-1, j]$ と $[i, j-1]$ へ分解していきます。再帰関数には、次の要素があります。

- **再帰の引数**：状態 $[i, j]$ です。
- **戻り値**：$[0, 0]$ から $[i, j]$ までの経路和の最小値 $dp[i, j]$ です。
- **終了条件**：$i = 0$ かつ $j = 0$ なら、コスト $grid[0, 0]$ を返します。
- **枝刈り**：$i < 0$ または $j < 0$ なら範囲外なので、到達不可能を表すコスト $+\infty$ を返します。

実装は次のとおりです。

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dfs(grid: list[list[int]], i: int, j: int) -> int:
        """最小経路和：全探索"""
        # 左上のセルなら探索を終了する
        if i == 0 and j == 0:
            return grid[0][0]
        # 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if i < 0 or j < 0:
            return inf
        # 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        up = min_path_sum_dfs(grid, i - 1, j)
        left = min_path_sum_dfs(grid, i, j - 1)
        # 左上から (i, j) までの最小経路コストを返す
        return min(left, up) + grid[i][j]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    /* 最小経路和：全探索 */
    int minPathSumDFS(vector<vector<int>> &grid, int i, int j) {
        // 左上のセルなら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
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
        // 左上のセルなら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
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
        // 左上のセルなら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
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
        // 左上のセルなら探索を終了する
        if i == 0 && j == 0 {
            return grid[0][0]
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if i < 0 || j < 0 {
            return math.MaxInt
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
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
        // 左上のセルなら探索を終了する
        if i == 0, j == 0 {
            return grid[0][0]
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if i < 0 || j < 0 {
            return .max
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
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
        // 左上のセルなら探索を終了する
        if (i === 0 && j === 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
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
        // 左上のセルなら探索を終了する
        if (i === 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
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
      // 左上のセルなら探索を終了する
      if (i == 0 && j == 0) {
        return grid[0][0];
      }
      // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
      if (i < 0 || j < 0) {
        // Dart の int 型は固定範囲の整数であり、「無限大」を表す値は存在しない
        return BigInt.from(2).pow(31).toInt();
      }
      // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
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
        // 左上のセルなら探索を終了する
        if i == 0 && j == 0 {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if i < 0 || j < 0 {
            return i32::MAX;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
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
        // 左上のセルなら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
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
        // 左上のセルなら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0]
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Int.MAX_VALUE
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
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
      # 左上のセルなら探索を終了する
      return grid[i][j] if i == 0 && j == 0
      # 行または列のインデックスが範囲外の場合、コスト +∞ を返す
      return Float::INFINITY if i < 0 || j < 0
      # 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
      up = min_path_sum_dfs(grid, i - 1, j)
      left = min_path_sum_dfs(grid, i, j - 1)
      # 左上から (i, j) までの最小経路コストを返す
      [left, up].min + grid[i][j]
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs%28grid%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E5%85%A8%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%AA%E3%82%89%E6%8E%A2%E7%B4%A2%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%BE%E3%81%9F%E3%81%AF%E5%88%97%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E3%82%B3%E3%82%B9%E3%83%88%20%2B%E2%88%9E%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i-1,%20j%29%20%E3%81%8A%E3%82%88%E3%81%B3%20%28i,%20j-1%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20up%20%3D%20min_path_sum_dfs%28grid,%20i%20-%201,%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs%28grid,%20i,%20j%20-%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i,%20j%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20min%28left,%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E5%85%A8%E6%8E%A2%E7%B4%A2%0A%20%20%20%20res%20%3D%20min_path_sum_dfs%28grid,%20n%20-%201,%20m%20-%201%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs%28grid%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E5%85%A8%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%AA%E3%82%89%E6%8E%A2%E7%B4%A2%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%BE%E3%81%9F%E3%81%AF%E5%88%97%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E3%82%B3%E3%82%B9%E3%83%88%20%2B%E2%88%9E%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i-1,%20j%29%20%E3%81%8A%E3%82%88%E3%81%B3%20%28i,%20j-1%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20up%20%3D%20min_path_sum_dfs%28grid,%20i%20-%201,%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs%28grid,%20i,%20j%20-%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i,%20j%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20min%28left,%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E5%85%A8%E6%8E%A2%E7%B4%A2%0A%20%20%20%20res%20%3D%20min_path_sum_dfs%28grid,%20n%20-%201,%20m%20-%201%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 14-14 は、$dp[2, 1]$ を根とする再帰木です。部分問題の重複が含まれており、グリッド `grid` が大きくなると、その数は急激に増えます。

部分問題が重複する本質的な理由は、**左上からあるマスに到達する経路が複数あること**です。

![全探索の再帰木](dp_solution_pipeline.assets/min_path_sum_dfs.png){ class="animation-figure" }

<p align="center"> 図 14-14 &nbsp; 全探索の再帰木 </p>

各状態で下と右の二つの選択肢があり、左上から右下までは計 $m + n - 2$ 歩なので、最悪時間計算量は $O(2^{m + n})$ です。ここで $n$ と $m$ はそれぞれ行数と列数です。ただし、この計算ではグリッドの端付近を考慮していません。端に達すると選択肢は一つになるため、実際の経路数はこれより少なくなります。

### 2. &nbsp; 方法 2：メモ化探索

グリッド `grid` と同じ大きさの記録用リスト `mem` を導入し、各部分問題の解を保存して、重複する部分問題を枝刈りします。

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dfs_mem(
        grid: list[list[int]], mem: list[list[int]], i: int, j: int
    ) -> int:
        """最小経路和：メモ化探索"""
        # 左上のセルなら探索を終了する
        if i == 0 and j == 0:
            return grid[0][0]
        # 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if i < 0 or j < 0:
            return inf
        # 記録済みなら、その値をそのまま返す
        if mem[i][j] != -1:
            return mem[i][j]
        # 左隣と上隣のセルまでの最小経路コスト
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
        // 左上のセルなら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 記録済みなら、その値をそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左隣と上隣のセルまでの最小経路コスト
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
        // 左上のセルなら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 記録済みなら、その値をそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左隣と上隣のセルまでの最小経路コスト
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
        // 左上のセルなら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 記録済みなら、その値をそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左隣と上隣のセルまでの最小経路コスト
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
        // 左上のセルなら探索を終了する
        if i == 0 && j == 0 {
            return grid[0][0]
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if i < 0 || j < 0 {
            return math.MaxInt
        }
        // 記録済みなら、その値をそのまま返す
        if mem[i][j] != -1 {
            return mem[i][j]
        }
        // 左隣と上隣のセルまでの最小経路コスト
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
        // 左上のセルなら探索を終了する
        if i == 0, j == 0 {
            return grid[0][0]
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if i < 0 || j < 0 {
            return .max
        }
        // 記録済みなら、その値をそのまま返す
        if mem[i][j] != -1 {
            return mem[i][j]
        }
        // 左隣と上隣のセルまでの最小経路コスト
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
        // 左上のセルなら探索を終了する
        if (i === 0 && j === 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 記録済みなら、その値をそのまま返す
        if (mem[i][j] !== -1) {
            return mem[i][j];
        }
        // 左隣と上隣のセルまでの最小経路コスト
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
        // 左上のセルなら探索を終了する
        if (i === 0 && j === 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 記録済みなら、その値をそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左隣と上隣のセルまでの最小経路コスト
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
      // 左上のセルなら探索を終了する
      if (i == 0 && j == 0) {
        return grid[0][0];
      }
      // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
      if (i < 0 || j < 0) {
        // Dart の int 型は固定範囲の整数であり、「無限大」を表す値は存在しない
        return BigInt.from(2).pow(31).toInt();
      }
      // 記録済みなら、その値をそのまま返す
      if (mem[i][j] != -1) {
        return mem[i][j];
      }
      // 左隣と上隣のセルまでの最小経路コスト
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
        // 左上のセルなら探索を終了する
        if i == 0 && j == 0 {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if i < 0 || j < 0 {
            return i32::MAX;
        }
        // 記録済みなら、その値をそのまま返す
        if mem[i as usize][j as usize] != -1 {
            return mem[i as usize][j as usize];
        }
        // 左隣と上隣のセルまでの最小経路コスト
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
        // 左上のセルなら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 記録済みなら、その値をそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左隣と上隣のセルまでの最小経路コスト
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
        // 左上のセルなら探索を終了する
        if (i == 0 && j == 0) {
            return grid[0][0]
        }
        // 行または列のインデックスが範囲外の場合、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Int.MAX_VALUE
        }
        // 記録済みなら、その値をそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j]
        }
        // 左隣と上隣のセルまでの最小経路コスト
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
      # 左上のセルなら探索を終了する
      return grid[0][0] if i == 0 && j == 0
      # 行または列のインデックスが範囲外の場合、コスト +∞ を返す
      return Float::INFINITY if i < 0 || j < 0
      # 記録済みなら、その値をそのまま返す
      return mem[i][j] if mem[i][j] != -1
      # 左隣と上隣のセルまでの最小経路コスト
      up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
      left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
      # 左上から (i, j) までの最小経路コストを記録して返す
      mem[i][j] = [left, up].min + grid[i][j]
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs_mem%28%0A%20%20%20%20grid%3A%20list%5Blist%5Bint%5D%5D,%20mem%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20j%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%AA%E3%82%89%E6%8E%A2%E7%B4%A2%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%BE%E3%81%9F%E3%81%AF%E5%88%97%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E3%82%B3%E3%82%B9%E3%83%88%20%2B%E2%88%9E%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%E8%A8%98%E9%8C%B2%E6%B8%88%E3%81%BF%E3%81%AA%E3%82%89%E3%80%81%E3%81%9D%E3%81%AE%E5%80%A4%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E8%BF%94%E3%81%99%0A%20%20%20%20if%20mem%5Bi%5D%5Bj%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%20%20%20%20%23%20%E5%B7%A6%E9%9A%A3%E3%81%A8%E4%B8%8A%E9%9A%A3%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%0A%20%20%20%20up%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20i%20-%201,%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20i,%20j%20-%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i,%20j%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%97%E3%81%A6%E8%BF%94%E3%81%99%0A%20%20%20%20mem%5Bi%5D%5Bj%5D%20%3D%20min%28left,%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%23%20%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20res%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20n%20-%201,%20m%20-%201%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs_mem%28%0A%20%20%20%20grid%3A%20list%5Blist%5Bint%5D%5D,%20mem%3A%20list%5Blist%5Bint%5D%5D,%20i%3A%20int,%20j%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%AA%E3%82%89%E6%8E%A2%E7%B4%A2%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%BE%E3%81%9F%E3%81%AF%E5%88%97%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AE%E5%A0%B4%E5%90%88%E3%80%81%E3%82%B3%E3%82%B9%E3%83%88%20%2B%E2%88%9E%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%E8%A8%98%E9%8C%B2%E6%B8%88%E3%81%BF%E3%81%AA%E3%82%89%E3%80%81%E3%81%9D%E3%81%AE%E5%80%A4%E3%82%92%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E8%BF%94%E3%81%99%0A%20%20%20%20if%20mem%5Bi%5D%5Bj%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%20%20%20%20%23%20%E5%B7%A6%E9%9A%A3%E3%81%A8%E4%B8%8A%E9%9A%A3%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%0A%20%20%20%20up%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20i%20-%201,%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20i,%20j%20-%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i,%20j%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%97%E3%81%A6%E8%BF%94%E3%81%99%0A%20%20%20%20mem%5Bi%5D%5Bj%5D%20%3D%20min%28left,%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%23%20%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20res%20%3D%20min_path_sum_dfs_mem%28grid,%20mem,%20n%20-%201,%20m%20-%201%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 14-15 のように、メモ化すると各部分問題の解を 1 回だけ計算すれば済みます。そのため、時間計算量は状態の総数、すなわちグリッドの大きさ $O(nm)$ になります。

![メモ化探索の再帰木](dp_solution_pipeline.assets/min_path_sum_dfs_mem.png){ class="animation-figure" }

<p align="center"> 図 14-15 &nbsp; メモ化探索の再帰木 </p>

### 3. &nbsp; 方法 3：動的計画法

反復による動的計画法の実装を次に示します。

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

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20dp%5B0%5D%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%0A%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Bj%5D%20%3D%20dp%5B0%5D%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%20dp%5Bi%20-%201%5D%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%E3%81%A8%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20min%28dp%5Bi%5D%5Bj%20-%201%5D,%20dp%5Bi%20-%201%5D%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bn%20-%201%5D%5Bm%20-%201%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp%28grid%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20dp%5B0%5D%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%0A%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Bj%5D%20%3D%20dp%5B0%5D%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%20dp%5Bi%20-%201%5D%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%E3%81%A8%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20min%28dp%5Bi%5D%5Bj%20-%201%5D,%20dp%5Bi%20-%201%5D%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bn%20-%201%5D%5Bm%20-%201%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp%28grid%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 14-16 に、経路和の最小化の状態遷移を示します。グリッド全体を走査するため、**時間計算量は $O(nm)$ です**。

配列 `dp` の大きさは $n \times m$ なので、**空間計算量は $O(nm)$ です**。

=== "<1>"
    ![経路和の最小化を動的計画法で解く流れ](dp_solution_pipeline.assets/min_path_sum_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![経路和の最小化を動的計画法で解く流れ：手順 2](dp_solution_pipeline.assets/min_path_sum_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![経路和の最小化を動的計画法で解く流れ：手順 3](dp_solution_pipeline.assets/min_path_sum_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![経路和の最小化を動的計画法で解く流れ：手順 4](dp_solution_pipeline.assets/min_path_sum_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![経路和の最小化を動的計画法で解く流れ：手順 5](dp_solution_pipeline.assets/min_path_sum_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![経路和の最小化を動的計画法で解く流れ：手順 6](dp_solution_pipeline.assets/min_path_sum_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![経路和の最小化を動的計画法で解く流れ：手順 7](dp_solution_pipeline.assets/min_path_sum_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![経路和の最小化を動的計画法で解く流れ：手順 8](dp_solution_pipeline.assets/min_path_sum_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![経路和の最小化を動的計画法で解く流れ：手順 9](dp_solution_pipeline.assets/min_path_sum_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![経路和の最小化を動的計画法で解く流れ：手順 10](dp_solution_pipeline.assets/min_path_sum_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![経路和の最小化を動的計画法で解く流れ：手順 11](dp_solution_pipeline.assets/min_path_sum_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![経路和の最小化を動的計画法で解く流れ：手順 12](dp_solution_pipeline.assets/min_path_sum_dp_step12.png){ class="animation-figure" }

<p align="center"> 図 14-16 &nbsp; 経路和の最小化を動的計画法で解く流れ </p>

### 4. &nbsp; 空間の最適化

各マスが依存するのは左と上のマスだけなので、1 行分の配列だけで $dp$ テーブルを実装できます。

配列 `dp` は 1 行分の状態しか表せないため、先頭列をあらかじめ初期化することはできません。各行を走査するときに、その先頭の状態を更新することに注意してください。

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dp_comp(grid: list[list[int]]) -> int:
        """最小経路和：空間を最適化した動的計画法"""
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
    /* 最小経路和：空間を最適化した動的計画法 */
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
    /* 最小経路和：空間を最適化した動的計画法 */
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
    /* 最小経路和：空間を最適化した動的計画法 */
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
    /* 最小経路和：空間を最適化した動的計画法 */
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
    /* 最小経路和：空間を最適化した動的計画法 */
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
    /* 最小経路和：空間を最適化した動的計画法 */
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
    /* 最小経路和：空間を最適化した動的計画法 */
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
    /* 最小経路和：空間を最適化した動的計画法 */
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
    /* 最小経路和：空間を最適化した動的計画法 */
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
    /* 最小経路和：空間を最適化した動的計画法 */
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
    /* 最小経路和：空間を最適化した動的計画法 */
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
    ### 最小経路和：空間を最適化した動的計画法 ###
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

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp_comp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20m%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%0A%20%20%20%20dp%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20dp%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20%20%20%20%20dp%5B0%5D%20%3D%20dp%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E5%88%97%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20min%28dp%5Bj%20-%201%5D,%20dp%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bm%20-%201%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp_comp%28grid%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp_comp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20m%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%0A%20%20%20%20dp%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20dp%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%0A%20%20%20%20for%20i%20in%20range%281,%20n%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20%20%20%20%20dp%5B0%5D%20%3D%20dp%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E5%88%97%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281,%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20min%28dp%5Bj%20-%201%5D,%20dp%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bm%20-%201%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1,%203,%201,%205%5D,%20%5B2,%202,%204,%202%5D,%20%5B5,%203,%202,%201%5D,%20%5B4,%203,%205,%202%5D%5D%0A%20%20%20%20n,%20m%20%3D%20len%28grid%29,%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp_comp%28grid%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>
