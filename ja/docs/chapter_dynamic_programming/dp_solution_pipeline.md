---
comments: true
---

# 14.3 &nbsp; 動的計画法の問題解決の考え方

前の 2 節では動的計画法の問題の主要な特徴を紹介しました。ここからは、さらに実用的な 2 つの問題を一緒に考えていきます。

1. ある問題が動的計画法の問題かどうかを、どのように判断すればよいでしょうか？
2. 動的計画法の問題を解くには、どこから着手し、完全な手順はどのようなものでしょうか？

## 14.3.1 &nbsp; 問題の判定

一般に、ある問題が重複部分問題と最適部分構造を含み、さらに無後效性を満たしているなら、通常は動的計画法で解くのに適しています。しかし、問題文からこれらの性質を直接読み取るのは簡単ではありません。そのため通常は条件を少し緩めて、**まずその問題がバックトラッキング（全探索）で解くのに適しているか**を観察します。

**バックトラッキングで解くのに適した問題は、通常「決定木モデル」を満たします**。この種の問題は木構造で表現でき、各ノードは 1 つの決定を表し、各経路は 1 つの決定列を表します。

言い換えると、問題に明確な決定の概念が含まれており、解が一連の決定によって生成されるなら、その問題は決定木モデルを満たし、通常はバックトラッキングで解くことができます。

これに加えて、動的計画法の問題には判定のための「加点要素」もあります。

- 問題文に最大（最小）や最多（最少）などの最適化に関する記述がある。
- 問題の状態が配列、多次元行列、または木で表現でき、ある状態とその周辺の状態の間に漸化的な関係がある。

反対に、「減点要素」もあります。

- 問題の目的が最適解を求めることではなく、あり得るすべての解を列挙することである。
- 問題文に明確な順列・組合せの特徴があり、具体的な複数の解を返す必要がある。

ある問題が決定木モデルを満たし、さらに比較的明確な「加点要素」を備えているなら、その問題は動的計画法の問題であると仮定し、解く過程でそれを検証できます。

## 14.3.2 &nbsp; 問題を解く手順

動的計画法の解法の流れは問題の性質や難易度によって異なりますが、通常は次の手順に従います。すなわち、決定を記述し、状態を定義し、$dp$ テーブルを構築し、状態遷移方程式を導出し、境界条件を定めます。

解法の手順をより具体的に示すために、ここでは古典的な問題である「最小経路和」を例にします。

!!! question

    $n \times m$ の 2 次元グリッド `grid` が与えられます。グリッドの各セルには非負整数が格納されており、そのセルのコストを表します。ロボットは左上のセルを始点とし、毎回下または右に 1 マスだけ移動して、右下のセルまで進みます。左上から右下までの最小経路和を返してください。

次の図は 1 つの例を示しており、このグリッドの最小経路和は $13$ です。

![最小経路和のサンプルデータ](dp_solution_pipeline.assets/min_path_sum_example.png){ class="animation-figure" }

<p align="center"> 図 14-10 &nbsp; 最小経路和のサンプルデータ </p>

**ステップ 1：各ラウンドの決定を考え、状態を定義して、$dp$ テーブルを得る**

この問題における各ラウンドの決定は、現在のマスから下または右へ 1 マス進むことです。現在のマスの行・列インデックスを $[i, j]$ とすると、下または右へ 1 マス進んだ後のインデックスは $[i+1, j]$ または $[i, j+1]$ になります。したがって、状態には行インデックスと列インデックスの 2 つの変数を含め、$[i, j]$ と表します。

状態 $[i, j]$ に対応する部分問題は、始点 $[0, 0]$ から $[i, j]$ まで進む最小経路和であり、その解を $dp[i, j]$ と記します。

これで、次の図に示す 2 次元の $dp$ 行列が得られます。そのサイズは入力グリッド $grid$ と同じです。

![状態の定義と dp テーブル](dp_solution_pipeline.assets/min_path_sum_solution_state_definition.png){ class="animation-figure" }

<p align="center"> 図 14-11 &nbsp; 状態の定義と dp テーブル </p>

!!! note

    動的計画法とバックトラッキングの過程は、いずれも 1 つの決定列として記述できます。そして状態は、すべての決定変数から構成されます。状態には解法の進行状況を表すすべての変数が含まれているべきであり、次の状態を導くのに十分な情報を持っている必要があります。
    
    各状態は 1 つの部分問題に対応しており、すべての部分問題の解を保存するために $dp$ テーブルを定義します。状態の各独立変数は、$dp$ テーブルの 1 つの次元に対応します。本質的に、$dp$ テーブルは状態と部分問題の解との対応関係です。

**ステップ 2：最適部分構造を見つけ、状態遷移方程式を導出する**

状態 $[i, j]$ は、上のマス $[i-1, j]$ または左のマス $[i, j-1]$ からしか遷移してきません。したがって最適部分構造は、$[i, j]$ に到達する最小経路和が、$[i, j-1]$ の最小経路和と $[i-1, j]$ の最小経路和のうち小さい方によって決まる、ということです。

以上の分析から、次の図に示す状態遷移方程式を導くことができます。

$$
dp[i, j] = \min(dp[i-1, j], dp[i, j-1]) + grid[i, j]
$$

![最適部分構造と状態遷移方程式](dp_solution_pipeline.assets/min_path_sum_solution_state_transition.png){ class="animation-figure" }

<p align="center"> 図 14-12 &nbsp; 最適部分構造と状態遷移方程式 </p>

!!! note

    定義済みの $dp$ テーブルに基づいて、元の問題と部分問題の関係を考え、部分問題の最適解から元の問題の最適解を構成する方法、すなわち最適部分構造を見つけます。

    ひとたび最適部分構造が見つかれば、それを使って状態遷移方程式を構築できます。

**ステップ 3：境界条件と状態遷移の順序を決める**

この問題では、先頭行にある状態は左の状態からしか得られず、先頭列にある状態は上の状態からしか得られません。したがって、先頭行 $i = 0$ と先頭列 $j = 0$ が境界条件になります。

次の図に示すように、各マスは左のマスと上のマスから遷移してくるため、ループを用いて行列を走査します。外側のループで各行を、内側のループで各列を走査します。

![境界条件と状態遷移の順序](dp_solution_pipeline.assets/min_path_sum_solution_initial_state.png){ class="animation-figure" }

<p align="center"> 図 14-13 &nbsp; 境界条件と状態遷移の順序 </p>

!!! note

    境界条件は、動的計画法では $dp$ テーブルの初期化に使われ、探索では枝刈りに使われます。
    
    状態遷移の順序で重要なのは、現在の問題の解を計算するときに、それが依存するより小さな部分問題の解がすべてすでに正しく計算済みであることを保証する点です。

以上の分析により、すでに動的計画法のコードを直接書くことができます。しかし、部分問題への分解はトップダウンの考え方であるため、「力任せ探索 $\rightarrow$ メモ化探索 $\rightarrow$ 動的計画法」の順に実装するほうが、思考の流れにはより自然です。

### 1. &nbsp; 方法 1：力任せ探索

状態 $[i, j]$ から探索を開始し、より小さな状態 $[i-1, j]$ と $[i, j-1]$ へと分解していきます。再帰関数には次の要素が含まれます。

- **再帰引数**：状態 $[i, j]$ 。
- **戻り値**：$[0, 0]$ から $[i, j]$ までの最小経路和 $dp[i, j]$ 。
- **終了条件**：$i = 0$ かつ $j = 0$ のとき、コスト $grid[0, 0]$ を返す。
- **枝刈り**：$i < 0$ または $j < 0$ でインデックスが範囲外になった場合、コスト $+\infty$ を返し、実行不可能であることを表す。

実装コードは次のとおりです。

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dfs(grid: list[list[int]], i: int, j: int) -> int:
        """最小経路和：全探索"""
        # 左上のセルなら探索を終了する
        if i == 0 and j == 0:
            return grid[0][0]
        # 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if i < 0 or j < 0:
            return inf
        # 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        up = min_path_sum_dfs(grid, i - 1, j)
        left = min_path_sum_dfs(grid, i, j - 1)
        # 左上隅から (i, j) までの最小経路コストを返す
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 左上隅から (i, j) までの最小経路コストを返す
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 左上隅から (i, j) までの最小経路コストを返す
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        int up = MinPathSumDFS(grid, i - 1, j);
        int left = MinPathSumDFS(grid, i, j - 1);
        // 左上隅から (i, j) までの最小経路コストを返す
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if i < 0 || j < 0 {
            return math.MaxInt
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        up := minPathSumDFS(grid, i-1, j)
        left := minPathSumDFS(grid, i, j-1)
        // 左上隅から (i, j) までの最小経路コストを返す
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if i < 0 || j < 0 {
            return .max
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        let up = minPathSumDFS(grid: grid, i: i - 1, j: j)
        let left = minPathSumDFS(grid: grid, i: i, j: j - 1)
        // 左上隅から (i, j) までの最小経路コストを返す
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        const up = minPathSumDFS(grid, i - 1, j);
        const left = minPathSumDFS(grid, i, j - 1);
        // 左上隅から (i, j) までの最小経路コストを返す
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        const up = minPathSumDFS(grid, i - 1, j);
        const left = minPathSumDFS(grid, i, j - 1);
        // 左上隅から (i, j) までの最小経路コストを返す
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
      // 行または列のインデックスが範囲外なら、コスト +∞ を返す
      if (i < 0 || j < 0) {
        // Dart では、int 型は固定範囲の整数であり、「無限大」を表す値は存在しない
        return BigInt.from(2).pow(31).toInt();
      }
      // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
      int up = minPathSumDFS(grid, i - 1, j);
      int left = minPathSumDFS(grid, i, j - 1);
      // 左上隅から (i, j) までの最小経路コストを返す
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if i < 0 || j < 0 {
            return i32::MAX;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        let up = min_path_sum_dfs(grid, i - 1, j);
        let left = min_path_sum_dfs(grid, i, j - 1);
        // 左上隅から (i, j) までの最小経路コストを返す
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 左上隅から (i, j) までの最小経路コストを返す
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Int.MAX_VALUE
        }
        // 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
        val up = minPathSumDFS(grid, i - 1, j)
        val left = minPathSumDFS(grid, i, j - 1)
        // 左上隅から (i, j) までの最小経路コストを返す
        return min(left, up) + grid[i][j]
    }
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    ### 最小経路和：全探索 ###
    def min_path_sum_dfs(grid, i, j)
      # 左上のセルなら探索を終了する
      return grid[i][j] if i == 0 && j == 0
      # 行または列のインデックスが範囲外なら、コスト +∞ を返す
      return Float::INFINITY if i < 0 || j < 0
      # 左上から (i-1, j) および (i, j-1) までの最小経路コストを計算する
      up = min_path_sum_dfs(grid, i - 1, j)
      left = min_path_sum_dfs(grid, i, j - 1)
      # 左上隅から (i, j) までの最小経路コストを返す
      [left, up].min + grid[i][j]
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs%28grid%3A%20list%5Blist%5Bint%5D%5D%2C%20i%3A%20int%2C%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E5%85%A8%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%AA%E3%82%89%E6%8E%A2%E7%B4%A2%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%BE%E3%81%9F%E3%81%AF%E5%88%97%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%80%81%E3%82%B3%E3%82%B9%E3%83%88%20%2B%E2%88%9E%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i-1%2C%20j%29%20%E3%81%8A%E3%82%88%E3%81%B3%20%28i%2C%20j-1%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20up%20%3D%20min_path_sum_dfs%28grid%2C%20i%20-%201%2C%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs%28grid%2C%20i%2C%20j%20-%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E9%9A%85%E3%81%8B%E3%82%89%20%28i%2C%20j%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20min%28left%2C%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1%2C%203%2C%201%2C%205%5D%2C%20%5B2%2C%202%2C%204%2C%202%5D%2C%20%5B5%2C%203%2C%202%2C%201%5D%2C%20%5B4%2C%203%2C%205%2C%202%5D%5D%0A%20%20%20%20n%2C%20m%20%3D%20len%28grid%29%2C%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E5%85%A8%E6%8E%A2%E7%B4%A2%0A%20%20%20%20res%20%3D%20min_path_sum_dfs%28grid%2C%20n%20-%201%2C%20m%20-%201%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs%28grid%3A%20list%5Blist%5Bint%5D%5D%2C%20i%3A%20int%2C%20j%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E5%85%A8%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%AA%E3%82%89%E6%8E%A2%E7%B4%A2%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%BE%E3%81%9F%E3%81%AF%E5%88%97%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%80%81%E3%82%B3%E3%82%B9%E3%83%88%20%2B%E2%88%9E%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i-1%2C%20j%29%20%E3%81%8A%E3%82%88%E3%81%B3%20%28i%2C%20j-1%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%A8%88%E7%AE%97%E3%81%99%E3%82%8B%0A%20%20%20%20up%20%3D%20min_path_sum_dfs%28grid%2C%20i%20-%201%2C%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs%28grid%2C%20i%2C%20j%20-%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E9%9A%85%E3%81%8B%E3%82%89%20%28i%2C%20j%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20return%20min%28left%2C%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1%2C%203%2C%201%2C%205%5D%2C%20%5B2%2C%202%2C%204%2C%202%5D%2C%20%5B5%2C%203%2C%202%2C%201%5D%2C%20%5B4%2C%203%2C%205%2C%202%5D%5D%0A%20%20%20%20n%2C%20m%20%3D%20len%28grid%29%2C%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E5%85%A8%E6%8E%A2%E7%B4%A2%0A%20%20%20%20res%20%3D%20min_path_sum_dfs%28grid%2C%20n%20-%201%2C%20m%20-%201%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

次の図は、$dp[2, 1]$ を根ノードとする再帰木を示しています。この中にはいくつかの重複部分問題が含まれており、その数はグリッド `grid` のサイズが大きくなるにつれて急激に増加します。

本質的に、重複部分問題が生じる理由は、**左上からあるセルへ到達する経路が複数存在すること**にあります。

![力任せ探索の再帰木](dp_solution_pipeline.assets/min_path_sum_dfs.png){ class="animation-figure" }

<p align="center"> 図 14-14 &nbsp; 力任せ探索の再帰木 </p>

各状態には下と右の 2 通りの選択肢があり、左上から右下まで進むには合計で $m + n - 2$ 歩必要です。したがって最悪時間計算量は $O(2^{m + n})$ です。ここで、$n$ と $m$ はそれぞれグリッドの行数と列数を表します。なお、この見積もりではグリッド境界付近の状況を考慮していません。境界に達すると選択肢は 1 つだけになるため、実際の経路数はこれより少なくなります。

### 2. &nbsp; 方法 2：メモ化探索

グリッド `grid` と同じサイズのメモ配列 `mem` を導入し、各部分問題の解を記録して、重複部分問題を枝刈りします。

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dfs_mem(
        grid: list[list[int]], mem: list[list[int]], i: int, j: int
    ) -> int:
        """最小経路和：メモ化探索"""
        # 左上のセルなら探索を終了する
        if i == 0 and j == 0:
            return grid[0][0]
        # 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if i < 0 or j < 0:
            return inf
        # 既に記録があればそのまま返す
        if mem[i][j] != -1:
            return mem[i][j]
        # 左と上のセルからの最小経路コスト
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 既に記録があればそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のセルからの最小経路コスト
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 既に記録があればそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のセルからの最小経路コスト
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return int.MaxValue;
        }
        // 既に記録があればそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のセルからの最小経路コスト
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if i < 0 || j < 0 {
            return math.MaxInt
        }
        // 既に記録があればそのまま返す
        if mem[i][j] != -1 {
            return mem[i][j]
        }
        // 左と上のセルからの最小経路コスト
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if i < 0 || j < 0 {
            return .max
        }
        // 既に記録があればそのまま返す
        if mem[i][j] != -1 {
            return mem[i][j]
        }
        // 左と上のセルからの最小経路コスト
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 既に記録があればそのまま返す
        if (mem[i][j] !== -1) {
            return mem[i][j];
        }
        // 左と上のセルからの最小経路コスト
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Infinity;
        }
        // 既に記録があればそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のセルからの最小経路コスト
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
      // 行または列のインデックスが範囲外なら、コスト +∞ を返す
      if (i < 0 || j < 0) {
        // Dart では、int 型は固定範囲の整数であり、「無限大」を表す値は存在しない
        return BigInt.from(2).pow(31).toInt();
      }
      // 既に記録があればそのまま返す
      if (mem[i][j] != -1) {
        return mem[i][j];
      }
      // 左と上のセルからの最小経路コスト
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if i < 0 || j < 0 {
            return i32::MAX;
        }
        // 既に記録があればそのまま返す
        if mem[i as usize][j as usize] != -1 {
            return mem[i as usize][j as usize];
        }
        // 左と上のセルからの最小経路コスト
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 既に記録があればそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のセルからの最小経路コスト
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
        // 行または列のインデックスが範囲外なら、コスト +∞ を返す
        if (i < 0 || j < 0) {
            return Int.MAX_VALUE
        }
        // 既に記録があればそのまま返す
        if (mem[i][j] != -1) {
            return mem[i][j]
        }
        // 左と上のセルからの最小経路コスト
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
      # 行または列のインデックスが範囲外なら、コスト +∞ を返す
      return Float::INFINITY if i < 0 || j < 0
      # 既に記録があればそのまま返す
      return mem[i][j] if mem[i][j] != -1
      # 左と上のセルからの最小経路コスト
      up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
      left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
      # 左上から (i, j) までの最小経路コストを記録して返す
      mem[i][j] = [left, up].min + grid[i][j]
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs_mem%28%0A%20%20%20%20grid%3A%20list%5Blist%5Bint%5D%5D%2C%20mem%3A%20list%5Blist%5Bint%5D%5D%2C%20i%3A%20int%2C%20j%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%AA%E3%82%89%E6%8E%A2%E7%B4%A2%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%BE%E3%81%9F%E3%81%AF%E5%88%97%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%80%81%E3%82%B3%E3%82%B9%E3%83%88%20%2B%E2%88%9E%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%E6%97%A2%E3%81%AB%E8%A8%98%E9%8C%B2%E3%81%8C%E3%81%82%E3%82%8C%E3%81%B0%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E8%BF%94%E3%81%99%0A%20%20%20%20if%20mem%5Bi%5D%5Bj%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%20%20%20%20%23%20%E5%B7%A6%E3%81%A8%E4%B8%8A%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%8B%E3%82%89%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%0A%20%20%20%20up%20%3D%20min_path_sum_dfs_mem%28grid%2C%20mem%2C%20i%20-%201%2C%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs_mem%28grid%2C%20mem%2C%20i%2C%20j%20-%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i%2C%20j%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%97%E3%81%A6%E8%BF%94%E3%81%99%0A%20%20%20%20mem%5Bi%5D%5Bj%5D%20%3D%20min%28left%2C%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1%2C%203%2C%201%2C%205%5D%2C%20%5B2%2C%202%2C%204%2C%202%5D%2C%20%5B5%2C%203%2C%202%2C%201%5D%2C%20%5B4%2C%203%2C%205%2C%202%5D%5D%0A%20%20%20%20n%2C%20m%20%3D%20len%28grid%29%2C%20len%28grid%5B0%5D%29%0A%0A%20%20%20%23%20%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20res%20%3D%20min_path_sum_dfs_mem%28grid%2C%20mem%2C%20n%20-%201%2C%20m%20-%201%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dfs_mem%28%0A%20%20%20%20grid%3A%20list%5Blist%5Bint%5D%5D%2C%20mem%3A%20list%5Blist%5Bint%5D%5D%2C%20i%3A%20int%2C%20j%3A%20int%0A%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%22%22%22%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%AA%E3%82%89%E6%8E%A2%E7%B4%A2%E3%82%92%E7%B5%82%E4%BA%86%E3%81%99%E3%82%8B%0A%20%20%20%20if%20i%20%3D%3D%200%20and%20j%20%3D%3D%200%3A%0A%20%20%20%20%20%20%20%20return%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E8%A1%8C%E3%81%BE%E3%81%9F%E3%81%AF%E5%88%97%E3%81%AE%E3%82%A4%E3%83%B3%E3%83%87%E3%83%83%E3%82%AF%E3%82%B9%E3%81%8C%E7%AF%84%E5%9B%B2%E5%A4%96%E3%81%AA%E3%82%89%E3%80%81%E3%82%B3%E3%82%B9%E3%83%88%20%2B%E2%88%9E%20%E3%82%92%E8%BF%94%E3%81%99%0A%20%20%20%20if%20i%20%3C%200%20or%20j%20%3C%200%3A%0A%20%20%20%20%20%20%20%20return%20inf%0A%20%20%20%20%23%20%E6%97%A2%E3%81%AB%E8%A8%98%E9%8C%B2%E3%81%8C%E3%81%82%E3%82%8C%E3%81%B0%E3%81%9D%E3%81%AE%E3%81%BE%E3%81%BE%E8%BF%94%E3%81%99%0A%20%20%20%20if%20mem%5Bi%5D%5Bj%5D%20%21%3D%20-1%3A%0A%20%20%20%20%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%20%20%20%20%23%20%E5%B7%A6%E3%81%A8%E4%B8%8A%E3%81%AE%E3%82%BB%E3%83%AB%E3%81%8B%E3%82%89%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%0A%20%20%20%20up%20%3D%20min_path_sum_dfs_mem%28grid%2C%20mem%2C%20i%20-%201%2C%20j%29%0A%20%20%20%20left%20%3D%20min_path_sum_dfs_mem%28grid%2C%20mem%2C%20i%2C%20j%20-%201%29%0A%20%20%20%20%23%20%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%20%28i%2C%20j%29%20%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E3%82%B3%E3%82%B9%E3%83%88%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%97%E3%81%A6%E8%BF%94%E3%81%99%0A%20%20%20%20mem%5Bi%5D%5Bj%5D%20%3D%20min%28left%2C%20up%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20mem%5Bi%5D%5Bj%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1%2C%203%2C%201%2C%205%5D%2C%20%5B2%2C%202%2C%204%2C%202%5D%2C%20%5B5%2C%203%2C%202%2C%201%5D%2C%20%5B4%2C%203%2C%205%2C%202%5D%5D%0A%20%20%20%20n%2C%20m%20%3D%20len%28grid%29%2C%20len%28grid%5B0%5D%29%0A%0A%20%20%20%23%20%E3%83%A1%E3%83%A2%E5%8C%96%E6%8E%A2%E7%B4%A2%0A%20%20%20%20mem%20%3D%20%5B%5B-1%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20res%20%3D%20min_path_sum_dfs_mem%28grid%2C%20mem%2C%20n%20-%201%2C%20m%20-%201%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=16&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

次の図に示すように、メモ化を導入すると、すべての部分問題の解は 1 回だけ計算すればよくなります。したがって時間計算量は状態総数、すなわちグリッドサイズの $O(nm)$ に依存します。

![メモ化探索の再帰木](dp_solution_pipeline.assets/min_path_sum_dfs_mem.png){ class="animation-figure" }

<p align="center"> 図 14-15 &nbsp; メモ化探索の再帰木 </p>

### 3. &nbsp; 方法 3：動的計画法

反復に基づいて動的計画法の解法を実装すると、コードは次のようになります。

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dp(grid: list[list[int]]) -> int:
        """最小経路和：動的計画法"""
        n, m = len(grid), len(grid[0])
        # dp テーブルを初期化
        dp = [[0] * m for _ in range(n)]
        dp[0][0] = grid[0][0]
        # 状態遷移：先頭行
        for j in range(1, m):
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        # 状態遷移：先頭列
        for i in range(1, n):
            dp[i][0] = dp[i - 1][0] + grid[i][0]
        # 状態遷移: 残りの行と列
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
        // dp テーブルを初期化
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
        // 状態遷移: 残りの行と列
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
        // dp テーブルを初期化
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
        // 状態遷移: 残りの行と列
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
        // dp テーブルを初期化
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
        // 状態遷移: 残りの行と列
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
        // dp テーブルを初期化
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
        // 状態遷移: 残りの行と列
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
        // dp テーブルを初期化
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
        // 状態遷移: 残りの行と列
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
        // dp テーブルを初期化
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
        // 状態遷移: 残りの行と列
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
        // dp テーブルを初期化
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
        // 状態遷移: 残りの行と列
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
      // dp テーブルを初期化
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
      // 状態遷移: 残りの行と列
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
        // dp テーブルを初期化
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
        // 状態遷移: 残りの行と列
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
        // dp テーブルを初期化
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
        // 状態遷移: 残りの行と列
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
        // dp テーブルを初期化
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
        // 状態遷移: 残りの行と列
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
      # dp テーブルを初期化
      dp = Array.new(n) { Array.new(m, 0) }
      dp[0][0] = grid[0][0]
      # 状態遷移：先頭行
      (1...m).each { |j| dp[0][j] = dp[0][j - 1] + grid[0][j] }
      # 状態遷移：先頭列
      (1...n).each { |i| dp[i][0] = dp[i - 1][0] + grid[i][0] }
      # 状態遷移: 残りの行と列
      for i in 1...n
        for j in 1...m
          dp[i][j] = [dp[i][j - 1], dp[i - 1][j]].min + grid[i][j]
        end
      end
      dp[n -1][m -1]
    end
    ```

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%2C%20m%20%3D%20len%28grid%29%2C%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20dp%5B0%5D%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%0A%20%20%20%20for%20j%20in%20range%281%2C%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Bj%5D%20%3D%20dp%5B0%5D%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%20dp%5Bi%20-%201%5D%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%3A%20%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%E3%81%A8%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281%2C%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20min%28dp%5Bi%5D%5Bj%20-%201%5D%2C%20dp%5Bi%20-%201%5D%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bn%20-%201%5D%5Bm%20-%201%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1%2C%203%2C%201%2C%205%5D%2C%20%5B2%2C%202%2C%204%2C%202%5D%2C%20%5B5%2C%203%2C%202%2C%201%5D%2C%20%5B4%2C%203%2C%205%2C%202%5D%5D%0A%20%20%20%20n%2C%20m%20%3D%20len%28grid%29%2C%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp%28grid%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%2C%20m%20%3D%20len%28grid%29%2C%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%20m%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20dp%5B0%5D%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%0A%20%20%20%20for%20j%20in%20range%281%2C%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5B0%5D%5Bj%5D%20%3D%20dp%5B0%5D%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B0%5D%20%3D%20dp%5Bi%20-%201%5D%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%3A%20%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%E3%81%A8%E5%88%97%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%29%3A%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281%2C%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bi%5D%5Bj%5D%20%3D%20min%28dp%5Bi%5D%5Bj%20-%201%5D%2C%20dp%5Bi%20-%201%5D%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bn%20-%201%5D%5Bm%20-%201%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1%2C%203%2C%201%2C%205%5D%2C%20%5B2%2C%202%2C%204%2C%202%5D%2C%20%5B5%2C%203%2C%202%2C%201%5D%2C%20%5B4%2C%203%2C%205%2C%202%5D%5D%0A%20%20%20%20n%2C%20m%20%3D%20len%28grid%29%2C%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp%28grid%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>

次の図は最小経路和の状態遷移の過程を示しています。グリッド全体を走査するため、**時間計算量は $O(nm)$** です。

配列 `dp` のサイズは $n \times m$ であるため、**空間計算量は $O(nm)$** です。

=== "<1>"
    ![最小経路和の動的計画法の過程](dp_solution_pipeline.assets/min_path_sum_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![min_path_sum_dp_step2](dp_solution_pipeline.assets/min_path_sum_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![min_path_sum_dp_step3](dp_solution_pipeline.assets/min_path_sum_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![min_path_sum_dp_step4](dp_solution_pipeline.assets/min_path_sum_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![min_path_sum_dp_step5](dp_solution_pipeline.assets/min_path_sum_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![min_path_sum_dp_step6](dp_solution_pipeline.assets/min_path_sum_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![min_path_sum_dp_step7](dp_solution_pipeline.assets/min_path_sum_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![min_path_sum_dp_step8](dp_solution_pipeline.assets/min_path_sum_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![min_path_sum_dp_step9](dp_solution_pipeline.assets/min_path_sum_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![min_path_sum_dp_step10](dp_solution_pipeline.assets/min_path_sum_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![min_path_sum_dp_step11](dp_solution_pipeline.assets/min_path_sum_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![min_path_sum_dp_step12](dp_solution_pipeline.assets/min_path_sum_dp_step12.png){ class="animation-figure" }

<p align="center"> 図 14-16 &nbsp; 最小経路和の動的計画法の過程 </p>

### 4. &nbsp; 空間最適化

各マスは左のマスと上のマスにのみ関係するため、1 行の配列だけを使って $dp$ テーブルを実装できます。

ただし、配列 `dp` は 1 行分の状態しか表せないため、先頭列の状態を事前に初期化することはできず、各行を走査するときに更新する必要があります。

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dp_comp(grid: list[list[int]]) -> int:
        """最小経路和：空間最適化後の動的計画法"""
        n, m = len(grid), len(grid[0])
        # dp テーブルを初期化
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
    /* 最小経路和：空間最適化後の動的計画法 */
    int minPathSumDPComp(vector<vector<int>> &grid) {
        int n = grid.size(), m = grid[0].size();
        // dp テーブルを初期化
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
    /* 最小経路和：空間最適化後の動的計画法 */
    int minPathSumDPComp(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // dp テーブルを初期化
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
    /* 最小経路和：空間最適化後の動的計画法 */
    int MinPathSumDPComp(int[][] grid) {
        int n = grid.Length, m = grid[0].Length;
        // dp テーブルを初期化
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
    /* 最小経路和：空間最適化後の動的計画法 */
    func minPathSumDPComp(grid [][]int) int {
        n, m := len(grid), len(grid[0])
        // dp テーブルを初期化
        dp := make([]int, m)
        // 状態遷移：先頭行
        dp[0] = grid[0][0]
        for j := 1; j < m; j++ {
            dp[j] = dp[j-1] + grid[0][j]
        }
        // 状態遷移: 残りの行と列
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
    /* 最小経路和：空間最適化後の動的計画法 */
    func minPathSumDPComp(grid: [[Int]]) -> Int {
        let n = grid.count
        let m = grid[0].count
        // dp テーブルを初期化
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
    /* 最小経路和：空間最適化後の動的計画法 */
    function minPathSumDPComp(grid) {
        const n = grid.length,
            m = grid[0].length;
        // dp テーブルを初期化
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
    /* 最小経路和：空間最適化後の動的計画法 */
    function minPathSumDPComp(grid: Array<Array<number>>): number {
        const n = grid.length,
            m = grid[0].length;
        // dp テーブルを初期化
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
    /* 最小経路和：空間最適化後の動的計画法 */
    int minPathSumDPComp(List<List<int>> grid) {
      int n = grid.length, m = grid[0].length;
      // dp テーブルを初期化
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
    /* 最小経路和：空間最適化後の動的計画法 */
    fn min_path_sum_dp_comp(grid: &Vec<Vec<i32>>) -> i32 {
        let (n, m) = (grid.len(), grid[0].len());
        // dp テーブルを初期化
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
    /* 最小経路和：空間最適化後の動的計画法 */
    int minPathSumDPComp(int grid[MAX_SIZE][MAX_SIZE], int n, int m) {
        // dp テーブルを初期化
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
    /* 最小経路和：空間最適化後の動的計画法 */
    fun minPathSumDPComp(grid: Array<IntArray>): Int {
        val n = grid.size
        val m = grid[0].size
        // dp テーブルを初期化
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
    ### 最小経路和：空間最適化後の動的計画法 ###
    def min_path_sum_dp_comp(grid)
      n, m = grid.length, grid.first.length
      # dp テーブルを初期化
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

??? pythontutor "コードの可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp_comp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E7%A9%BA%E9%96%93%E6%9C%80%E9%81%A9%E5%8C%96%E5%BE%8C%E3%81%AE%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%2C%20m%20%3D%20len%28grid%29%2C%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20m%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%0A%20%20%20%20dp%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20for%20j%20in%20range%281%2C%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20dp%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20%20%20%20%20dp%5B0%5D%20%3D%20dp%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E5%88%97%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281%2C%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20min%28dp%5Bj%20-%201%5D%2C%20dp%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bm%20-%201%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1%2C%203%2C%201%2C%205%5D%2C%20%5B2%2C%202%2C%204%2C%202%5D%2C%20%5B5%2C%203%2C%202%2C%201%5D%2C%20%5B4%2C%203%2C%205%2C%202%5D%5D%0A%20%20%20%20n%2C%20m%20%3D%20len%28grid%29%2C%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E6%9C%80%E9%81%A9%E5%8C%96%E5%BE%8C%E3%81%AE%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp_comp%28grid%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=from%20math%20import%20inf%0A%0Adef%20min_path_sum_dp_comp%28grid%3A%20list%5Blist%5Bint%5D%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%EF%BC%9A%E7%A9%BA%E9%96%93%E6%9C%80%E9%81%A9%E5%8C%96%E5%BE%8C%E3%81%AE%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%2C%20m%20%3D%20len%28grid%29%2C%20len%28grid%5B0%5D%29%0A%20%20%20%20%23%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20m%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E8%A1%8C%0A%20%20%20%20dp%5B0%5D%20%3D%20grid%5B0%5D%5B0%5D%0A%20%20%20%20for%20j%20in%20range%281%2C%20m%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20dp%5Bj%20-%201%5D%20%2B%20grid%5B0%5D%5Bj%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E8%A1%8C%0A%20%20%20%20for%20i%20in%20range%281%2C%20n%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%85%88%E9%A0%AD%E5%88%97%0A%20%20%20%20%20%20%20%20dp%5B0%5D%20%3D%20dp%5B0%5D%20%2B%20grid%5Bi%5D%5B0%5D%0A%20%20%20%20%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E6%AE%8B%E3%82%8A%E3%81%AE%E5%88%97%0A%20%20%20%20%20%20%20%20for%20j%20in%20range%281%2C%20m%29%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20dp%5Bj%5D%20%3D%20min%28dp%5Bj%20-%201%5D%2C%20dp%5Bj%5D%29%20%2B%20grid%5Bi%5D%5Bj%5D%0A%20%20%20%20return%20dp%5Bm%20-%201%5D%0A%0A%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20grid%20%3D%20%5B%5B1%2C%203%2C%201%2C%205%5D%2C%20%5B2%2C%202%2C%204%2C%202%5D%2C%20%5B5%2C%203%2C%202%2C%201%5D%2C%20%5B4%2C%203%2C%205%2C%202%5D%5D%0A%20%20%20%20n%2C%20m%20%3D%20len%28grid%29%2C%20len%28grid%5B0%5D%29%0A%0A%20%20%20%20%23%20%E7%A9%BA%E9%96%93%E6%9C%80%E9%81%A9%E5%8C%96%E5%BE%8C%E3%81%AE%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%0A%20%20%20%20res%20%3D%20min_path_sum_dp_comp%28grid%29%0A%20%20%20%20print%28f%22%E5%B7%A6%E4%B8%8A%E3%81%8B%E3%82%89%E5%8F%B3%E4%B8%8B%E3%81%BE%E3%81%A7%E3%81%AE%E6%9C%80%E5%B0%8F%E7%B5%8C%E8%B7%AF%E5%92%8C%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=6&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で見る ></a></div>
