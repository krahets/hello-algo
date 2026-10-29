---
comments: true
---

# 14.2 &nbsp; 動的計画法の問題の特徴

前の節では、動的計画法が部分問題への分解によって元の問題を解く仕組みを学びました。部分問題への分解は汎用的な考え方ですが、分割統治、動的計画法、バックトラッキングでは重点が異なります。

- 分割統治は、元の問題を互いに独立した複数の部分問題へ再帰的に分割し、最小の部分問題まで進みます。その後、戻りながら解を統合し、元の問題の解を得ます。
- 動的計画法も問題を再帰的に分解します。分割統治との主な違いは、部分問題が互いに依存し、分解の過程で多くの重複した部分問題が現れることです。
- バックトラッキングは試行と後戻りを繰り返してすべての可能な解を列挙し、枝刈りで不要な探索分岐を避けます。元の問題の解は一連の判断で構成され、各判断の直前までの部分列を一つの部分問題と捉えられます。

実際、動的計画法は最適化問題を解くためによく使われます。そうした問題は部分問題の重複に加え、最適部分構造と、後続の判断が過去の経路に依存しない性質という二つの重要な特徴を持ちます。

## 14.2.1 &nbsp; 最適部分構造

階段を上る問題を少し変えて、最適部分構造を説明しやすくしてみましょう。

!!! question "最小コストで階段を上る"

    階段があり、1 回で $1$ 段または $2$ 段上れます。各段には非負の整数が書かれており、その段で支払うコストを表します。非負整数の配列 $cost$ が与えられ、$cost[i]$ は $i$ 段目でのコスト、$cost[0]$ は地面（開始点）に対応します。一番上まで到達するための最小コストを求めてください。

図 14-6 のように、$1$、$2$、$3$ 段目のコストがそれぞれ $1$、$10$、$1$ なら、地面から $3$ 段目まで上る最小コストは $2$ です。

![3 段目まで上る最小コスト](dp_problem_features.assets/min_cost_cs_example.png){ class="animation-figure" }

<p align="center"> 図 14-6 &nbsp; 3 段目まで上る最小コスト </p>

$i$ 段目までの累積コストを $dp[i]$ とします。$i$ 段目には $i - 1$ 段目か $i - 2$ 段目からしか来られないため、$dp[i]$ は $dp[i - 1] + cost[i]$ または $dp[i - 2] + cost[i]$ です。コストをできるだけ小さくするには、二つのうち小さい方を選びます。

$$
dp[i] = \min(dp[i-1], dp[i-2]) + cost[i]
$$

ここから、最適部分構造の意味がわかります。**元の問題の最適解は、部分問題の最適解から組み立てられる**ということです。

この問題には明らかに最適部分構造があります。二つの部分問題の最適解 $dp[i-1]$ と $dp[i-2]$ からよい方を選び、それを使って元の問題 $dp[i]$ の最適解を組み立てるからです。

では、前の節の階段の問題にも最適部分構造はあるのでしょうか。目的は方法の数を求めることで、一見すると数え上げの問題です。しかし「方法の数の最大値を求める」と言い換えると、**問題自体は同じなのに、最適部分構造が見えてきます**。$n$ 段目までの方法の最大数は、$n-1$ 段目と $n-2$ 段目までの方法の最大数の和です。このように、最適部分構造は柔軟に解釈でき、問題によって意味合いが異なります。

状態遷移式と、初期状態 $dp[1] = cost[1]$、$dp[2] = cost[2]$ から、動的計画法のコードが得られます。

=== "Python"

    ```python title="min_cost_climbing_stairs_dp.py"
    def min_cost_climbing_stairs_dp(cost: list[int]) -> int:
        """階段を上る最小コスト：動的計画法"""
        n = len(cost) - 1
        if n == 1 or n == 2:
            return cost[n]
        # 部分問題の解を格納する dp テーブルを初期化する
        dp = [0] * (n + 1)
        # 初期状態：最小の部分問題の解を設定する
        dp[1], dp[2] = cost[1], cost[2]
        # 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for i in range(3, n + 1):
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        return dp[n]
    ```

=== "C++"

    ```cpp title="min_cost_climbing_stairs_dp.cpp"
    /* 階段を上る最小コスト：動的計画法 */
    int minCostClimbingStairsDP(vector<int> &cost) {
        int n = cost.size() - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 部分問題の解を格納する dp テーブルを初期化する
        vector<int> dp(n + 1);
        // 初期状態：最小の部分問題の解を設定する
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (int i = 3; i <= n; i++) {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "Java"

    ```java title="min_cost_climbing_stairs_dp.java"
    /* 階段を上る最小コスト：動的計画法 */
    int minCostClimbingStairsDP(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 部分問題の解を格納する dp テーブルを初期化する
        int[] dp = new int[n + 1];
        // 初期状態：最小の部分問題の解を設定する
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "C#"

    ```csharp title="min_cost_climbing_stairs_dp.cs"
    /* 階段を上る最小コスト：動的計画法 */
    int MinCostClimbingStairsDP(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 部分問題の解を格納する dp テーブルを初期化する
        int[] dp = new int[n + 1];
        // 初期状態：最小の部分問題の解を設定する
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (int i = 3; i <= n; i++) {
            dp[i] = Math.Min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "Go"

    ```go title="min_cost_climbing_stairs_dp.go"
    /* 階段を上る最小コスト：動的計画法 */
    func minCostClimbingStairsDP(cost []int) int {
        n := len(cost) - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        min := func(a, b int) int {
            if a < b {
                return a
            }
            return b
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        dp := make([]int, n+1)
        // 初期状態：最小の部分問題の解を設定する
        dp[1] = cost[1]
        dp[2] = cost[2]
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for i := 3; i <= n; i++ {
            dp[i] = min(dp[i-1], dp[i-2]) + cost[i]
        }
        return dp[n]
    }
    ```

=== "Swift"

    ```swift title="min_cost_climbing_stairs_dp.swift"
    /* 階段を上る最小コスト：動的計画法 */
    func minCostClimbingStairsDP(cost: [Int]) -> Int {
        let n = cost.count - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        var dp = Array(repeating: 0, count: n + 1)
        // 初期状態：最小の部分問題の解を設定する
        dp[1] = cost[1]
        dp[2] = cost[2]
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for i in 3 ... n {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        }
        return dp[n]
    }
    ```

=== "JS"

    ```javascript title="min_cost_climbing_stairs_dp.js"
    /* 階段を上る最小コスト：動的計画法 */
    function minCostClimbingStairsDP(cost) {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        const dp = new Array(n + 1);
        // 初期状態：最小の部分問題の解を設定する
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (let i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "TS"

    ```typescript title="min_cost_climbing_stairs_dp.ts"
    /* 階段を上る最小コスト：動的計画法 */
    function minCostClimbingStairsDP(cost: Array<number>): number {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        const dp = new Array(n + 1);
        // 初期状態：最小の部分問題の解を設定する
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (let i = 3; i <= n; i++) {
            dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        return dp[n];
    }
    ```

=== "Dart"

    ```dart title="min_cost_climbing_stairs_dp.dart"
    /* 階段を上る最小コスト：動的計画法 */
    int minCostClimbingStairsDP(List<int> cost) {
      int n = cost.length - 1;
      if (n == 1 || n == 2) return cost[n];
      // 部分問題の解を格納する dp テーブルを初期化する
      List<int> dp = List.filled(n + 1, 0);
      // 初期状態：最小の部分問題の解を設定する
      dp[1] = cost[1];
      dp[2] = cost[2];
      // 状態遷移：小さな部分問題から順に大きな部分問題を解く
      for (int i = 3; i <= n; i++) {
        dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i];
      }
      return dp[n];
    }
    ```

=== "Rust"

    ```rust title="min_cost_climbing_stairs_dp.rs"
    /* 階段を上る最小コスト：動的計画法 */
    fn min_cost_climbing_stairs_dp(cost: &[i32]) -> i32 {
        let n = cost.len() - 1;
        if n == 1 || n == 2 {
            return cost[n];
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        let mut dp = vec![-1; n + 1];
        // 初期状態：最小の部分問題の解を設定する
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for i in 3..=n {
            dp[i] = cmp::min(dp[i - 1], dp[i - 2]) + cost[i];
        }
        dp[n]
    }
    ```

=== "C"

    ```c title="min_cost_climbing_stairs_dp.c"
    /* 階段を上る最小コスト：動的計画法 */
    int minCostClimbingStairsDP(int cost[], int costSize) {
        int n = costSize - 1;
        if (n == 1 || n == 2)
            return cost[n];
        // 部分問題の解を格納する dp テーブルを初期化する
        int *dp = calloc(n + 1, sizeof(int));
        // 初期状態：最小の部分問題の解を設定する
        dp[1] = cost[1];
        dp[2] = cost[2];
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (int i = 3; i <= n; i++) {
            dp[i] = myMin(dp[i - 1], dp[i - 2]) + cost[i];
        }
        int res = dp[n];
        // メモリを解放する
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_cost_climbing_stairs_dp.kt"
    /* 階段を上る最小コスト：動的計画法 */
    fun minCostClimbingStairsDP(cost: IntArray): Int {
        val n = cost.size - 1
        if (n == 1 || n == 2) return cost[n]
        // 部分問題の解を格納する dp テーブルを初期化する
        val dp = IntArray(n + 1)
        // 初期状態：最小の部分問題の解を設定する
        dp[1] = cost[1]
        dp[2] = cost[2]
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (i in 3..n) {
            dp[i] = min(dp[i - 1], dp[i - 2]) + cost[i]
        }
        return dp[n]
    }
    ```

=== "Ruby"

    ```ruby title="min_cost_climbing_stairs_dp.rb"
    ### 階段を上る最小コスト：動的計画法 ###
    def min_cost_climbing_stairs_dp(cost)
      n = cost.length - 1
      return cost[n] if n == 1 || n == 2
      # 部分問題の解を格納する dp テーブルを初期化する
      dp = Array.new(n + 1, 0)
      # 初期状態：最小の部分問題の解を設定する
      dp[1], dp[2] = cost[1], cost[2]
      # 状態遷移：小さな部分問題から順に大きな部分問題を解く
      (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
      dp[n]
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%9C%80%E5%B0%8F%E3%82%B3%E3%82%B9%E3%83%88%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E3%82%92%E6%A0%BC%E7%B4%8D%E3%81%99%E3%82%8B%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E7%8A%B6%E6%85%8B%EF%BC%9A%E6%9C%80%E5%B0%8F%E3%81%AE%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E3%82%92%E8%A8%AD%E5%AE%9A%E3%81%99%E3%82%8B%0A%20%20%20%20dp%5B1%5D,%20dp%5B2%5D%20%3D%20cost%5B1%5D,%20cost%5B2%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%B0%8F%E3%81%95%E3%81%AA%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%8B%E3%82%89%E9%A0%86%E3%81%AB%E5%A4%A7%E3%81%8D%E3%81%AA%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%82%92%E8%A7%A3%E3%81%8F%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20min%28dp%5Bi%20-%201%5D,%20dp%5Bi%20-%202%5D%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0,%201,%2010,%201,%201,%201,%2010,%201,%201,%2010,%201%5D%0A%20%20%20%20print%28f%22%E5%85%A5%E5%8A%9B%E3%81%97%E3%81%9F%E9%9A%8E%E6%AE%B5%E3%81%AE%E3%82%B3%E3%82%B9%E3%83%88%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%20%7Bcost%7D%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp%28cost%29%0A%20%20%20%20print%28f%22%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8A%E7%B5%82%E3%81%88%E3%82%8B%E6%9C%80%E5%B0%8F%E3%82%B3%E3%82%B9%E3%83%88%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%9C%80%E5%B0%8F%E3%82%B3%E3%82%B9%E3%83%88%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E3%82%92%E6%A0%BC%E7%B4%8D%E3%81%99%E3%82%8B%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B0%5D%20%2A%20%28n%20%2B%201%29%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E7%8A%B6%E6%85%8B%EF%BC%9A%E6%9C%80%E5%B0%8F%E3%81%AE%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E3%82%92%E8%A8%AD%E5%AE%9A%E3%81%99%E3%82%8B%0A%20%20%20%20dp%5B1%5D,%20dp%5B2%5D%20%3D%20cost%5B1%5D,%20cost%5B2%5D%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%B0%8F%E3%81%95%E3%81%AA%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%8B%E3%82%89%E9%A0%86%E3%81%AB%E5%A4%A7%E3%81%8D%E3%81%AA%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%82%92%E8%A7%A3%E3%81%8F%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%20%3D%20min%28dp%5Bi%20-%201%5D,%20dp%5Bi%20-%202%5D%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20dp%5Bn%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0,%201,%2010,%201,%201,%201,%2010,%201,%201,%2010,%201%5D%0A%20%20%20%20print%28f%22%E5%85%A5%E5%8A%9B%E3%81%97%E3%81%9F%E9%9A%8E%E6%AE%B5%E3%81%AE%E3%82%B3%E3%82%B9%E3%83%88%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%20%7Bcost%7D%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp%28cost%29%0A%20%20%20%20print%28f%22%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8A%E7%B5%82%E3%81%88%E3%82%8B%E6%9C%80%E5%B0%8F%E3%82%B3%E3%82%B9%E3%83%88%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

図 14-7 に、上のコードによる動的計画法の流れを示します。

![最小コストで階段を上る動的計画法の流れ](dp_problem_features.assets/min_cost_cs_dp.png){ class="animation-figure" }

<p align="center"> 図 14-7 &nbsp; 最小コストで階段を上る動的計画法の流れ </p>

この問題も、一次元を零次元に圧縮する空間最適化により、空間計算量を $O(n)$ から $O(1)$ に下げられます。

=== "Python"

    ```python title="min_cost_climbing_stairs_dp.py"
    def min_cost_climbing_stairs_dp_comp(cost: list[int]) -> int:
        """階段を上る最小コスト：空間を最適化した動的計画法"""
        n = len(cost) - 1
        if n == 1 or n == 2:
            return cost[n]
        a, b = cost[1], cost[2]
        for i in range(3, n + 1):
            a, b = b, min(a, b) + cost[i]
        return b
    ```

=== "C++"

    ```cpp title="min_cost_climbing_stairs_dp.cpp"
    /* 階段を上る最小コスト：空間を最適化した動的計画法 */
    int minCostClimbingStairsDPComp(vector<int> &cost) {
        int n = cost.size() - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Java"

    ```java title="min_cost_climbing_stairs_dp.java"
    /* 階段を上る最小コスト：空間を最適化した動的計画法 */
    int minCostClimbingStairsDPComp(int[] cost) {
        int n = cost.length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "C#"

    ```csharp title="min_cost_climbing_stairs_dp.cs"
    /* 階段を上る最小コスト：空間を最適化した動的計画法 */
    int MinCostClimbingStairsDPComp(int[] cost) {
        int n = cost.Length - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = Math.Min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Go"

    ```go title="min_cost_climbing_stairs_dp.go"
    /* 階段を上る最小コスト：空間を最適化した動的計画法 */
    func minCostClimbingStairsDPComp(cost []int) int {
        n := len(cost) - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        min := func(a, b int) int {
            if a < b {
                return a
            }
            return b
        }
        // 初期状態：最小の部分問題の解を設定する
        a, b := cost[1], cost[2]
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for i := 3; i <= n; i++ {
            tmp := b
            b = min(a, tmp) + cost[i]
            a = tmp
        }
        return b
    }
    ```

=== "Swift"

    ```swift title="min_cost_climbing_stairs_dp.swift"
    /* 階段を上る最小コスト：空間を最適化した動的計画法 */
    func minCostClimbingStairsDPComp(cost: [Int]) -> Int {
        let n = cost.count - 1
        if n == 1 || n == 2 {
            return cost[n]
        }
        var (a, b) = (cost[1], cost[2])
        for i in 3 ... n {
            (a, b) = (b, min(a, b) + cost[i])
        }
        return b
    }
    ```

=== "JS"

    ```javascript title="min_cost_climbing_stairs_dp.js"
    /* 階段を上る最小コスト：空間を最適化した動的計画法 */
    function minCostClimbingStairsDPComp(cost) {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        let a = cost[1],
            b = cost[2];
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "TS"

    ```typescript title="min_cost_climbing_stairs_dp.ts"
    /* 階段を上る最小コスト：空間を最適化した動的計画法 */
    function minCostClimbingStairsDPComp(cost: Array<number>): number {
        const n = cost.length - 1;
        if (n === 1 || n === 2) {
            return cost[n];
        }
        let a = cost[1],
            b = cost[2];
        for (let i = 3; i <= n; i++) {
            const tmp = b;
            b = Math.min(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Dart"

    ```dart title="min_cost_climbing_stairs_dp.dart"
    /* 階段を上る最小コスト：空間を最適化した動的計画法 */
    int minCostClimbingStairsDPComp(List<int> cost) {
      int n = cost.length - 1;
      if (n == 1 || n == 2) return cost[n];
      int a = cost[1], b = cost[2];
      for (int i = 3; i <= n; i++) {
        int tmp = b;
        b = min(a, tmp) + cost[i];
        a = tmp;
      }
      return b;
    }
    ```

=== "Rust"

    ```rust title="min_cost_climbing_stairs_dp.rs"
    /* 階段を上る最小コスト：空間を最適化した動的計画法 */
    fn min_cost_climbing_stairs_dp_comp(cost: &[i32]) -> i32 {
        let n = cost.len() - 1;
        if n == 1 || n == 2 {
            return cost[n];
        };
        let (mut a, mut b) = (cost[1], cost[2]);
        for i in 3..=n {
            let tmp = b;
            b = cmp::min(a, tmp) + cost[i];
            a = tmp;
        }
        b
    }
    ```

=== "C"

    ```c title="min_cost_climbing_stairs_dp.c"
    /* 階段を上る最小コスト：空間を最適化した動的計画法 */
    int minCostClimbingStairsDPComp(int cost[], int costSize) {
        int n = costSize - 1;
        if (n == 1 || n == 2)
            return cost[n];
        int a = cost[1], b = cost[2];
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = myMin(a, tmp) + cost[i];
            a = tmp;
        }
        return b;
    }
    ```

=== "Kotlin"

    ```kotlin title="min_cost_climbing_stairs_dp.kt"
    /* 階段を上る最小コスト：空間を最適化した動的計画法 */
    fun minCostClimbingStairsDPComp(cost: IntArray): Int {
        val n = cost.size - 1
        if (n == 1 || n == 2) return cost[n]
        var a = cost[1]
        var b = cost[2]
        for (i in 3..n) {
            val tmp = b
            b = min(a, tmp) + cost[i]
            a = tmp
        }
        return b
    }
    ```

=== "Ruby"

    ```ruby title="min_cost_climbing_stairs_dp.rb"
    ### 階段を上る最小コスト：動的計画法 ###
    def min_cost_climbing_stairs_dp(cost)
      n = cost.length - 1
      return cost[n] if n == 1 || n == 2
      # 部分問題の解を格納する dp テーブルを初期化する
      dp = Array.new(n + 1, 0)
      # 初期状態：最小の部分問題の解を設定する
      dp[1], dp[2] = cost[1], cost[2]
      # 状態遷移：小さな部分問題から順に大きな部分問題を解く
      (3...(n + 1)).each { |i| dp[i] = [dp[i - 1], dp[i - 2]].min + cost[i] }
      dp[n]
    end

    # 階段を上る最小コスト：空間を最適化した動的計画法
    def min_cost_climbing_stairs_dp_comp(cost)
      n = cost.length - 1
      return cost[n] if n == 1 || n == 2
      a, b = cost[1], cost[2]
      (3...(n + 1)).each { |i| a, b = b, [a, b].min + cost[i] }
      b
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 513px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp_comp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%9C%80%E5%B0%8F%E3%82%B3%E3%82%B9%E3%83%88%EF%BC%9A%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20a,%20b%20%3D%20cost%5B1%5D,%20cost%5B2%5D%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a,%20b%20%3D%20b,%20min%28a,%20b%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0,%201,%2010,%201,%201,%201,%2010,%201,%201,%2010,%201%5D%0A%20%20%20%20print%28f%22%E5%85%A5%E5%8A%9B%E3%81%97%E3%81%9F%E9%9A%8E%E6%AE%B5%E3%81%AE%E3%82%B3%E3%82%B9%E3%83%88%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%20%7Bcost%7D%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp_comp%28cost%29%0A%20%20%20%20print%28f%22%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8A%E7%B5%82%E3%81%88%E3%82%8B%E6%9C%80%E5%B0%8F%E3%82%B3%E3%82%B9%E3%83%88%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20min_cost_climbing_stairs_dp_comp%28cost%3A%20list%5Bint%5D%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%9C%80%E5%B0%8F%E3%82%B3%E3%82%B9%E3%83%88%EF%BC%9A%E7%A9%BA%E9%96%93%E3%82%92%E6%9C%80%E9%81%A9%E5%8C%96%E3%81%97%E3%81%9F%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20n%20%3D%20len%28cost%29%20-%201%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%20cost%5Bn%5D%0A%20%20%20%20a,%20b%20%3D%20cost%5B1%5D,%20cost%5B2%5D%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20a,%20b%20%3D%20b,%20min%28a,%20b%29%20%2B%20cost%5Bi%5D%0A%20%20%20%20return%20b%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20cost%20%3D%20%5B0,%201,%2010,%201,%201,%201,%2010,%201,%201,%2010,%201%5D%0A%20%20%20%20print%28f%22%E5%85%A5%E5%8A%9B%E3%81%97%E3%81%9F%E9%9A%8E%E6%AE%B5%E3%81%AE%E3%82%B3%E3%82%B9%E3%83%88%E3%81%AE%E3%83%AA%E3%82%B9%E3%83%88%E3%81%AF%20%7Bcost%7D%22%29%0A%0A%20%20%20%20res%20%3D%20min_cost_climbing_stairs_dp_comp%28cost%29%0A%20%20%20%20print%28f%22%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8A%E7%B5%82%E3%81%88%E3%82%8B%E6%9C%80%E5%B0%8F%E3%82%B3%E3%82%B9%E3%83%88%E3%81%AF%20%7Bres%7D%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=5&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

## 14.2.2 &nbsp; 後続の判断が過去の経路に依存しない性質

動的計画法が問題を効率よく解くうえで重要なのが、後続の判断が過去の経路に依存しない性質です。これは、**ある状態が決まれば、その後の展開は現在の状態だけで決まり、そこまでに通ったすべての状態には依存しない**ことを意味します。

階段の問題では、状態 $i$ から状態 $i+1$ または $i+2$ に進めます。これは、それぞれ $1$ 段または $2$ 段上る選択です。どちらを選ぶときも、$i$ より前の状態を考慮する必要はなく、過去の状態は $i$ から先の展開に影響しません。

しかし、階段の問題に制約を一つ加えると、事情が変わります。

!!! question "制約付きの階段上り"

    $n$ 段の階段があります。1 回で $1$ 段または $2$ 段上れますが、**$1$ 段ずつ上ることを 2 回連続では行えません**。一番上まで上る方法は何通りありますか。

図 14-8 のように、$3$ 段目まで上る有効な方法は $2$ 通りだけになります。$1$ 段ずつ 3 回続けて上る方法は制約を満たさないため、除外されます。

![制約付きで 3 段目まで上る方法の数](dp_problem_features.assets/climbing_stairs_constraint_example.png){ class="animation-figure" }

<p align="center"> 図 14-8 &nbsp; 制約付きで 3 段目まで上る方法の数 </p>

この問題では、前回 $1$ 段上ったなら、次は必ず $2$ 段上る必要があります。つまり、**次の選択は現在の状態（現在の段数）だけでは決まらず、一つ前の状態（前回いた段数）にも依存します**。

この状態の定義では、過去の経路に依存しない性質が成り立たず、状態遷移式 $dp[i] = dp[i-1] + dp[i-2]$ も使えません。$dp[i-1]$ は今回 $1$ 段上る場合に対応しますが、その中には「前回も $1$ 段上った」方法が多数含まれます。制約を満たすためには、$dp[i-1]$ をそのまま $dp[i]$ に加えられません。

そこで状態の定義を拡張し、**状態 $[i, j]$ を、現在 $i$ 段目にいて、前回 $j$ 段上った状態**とします。ここで $j \in \{1, 2\}$ です。この定義なら、前回上ったのが $1$ 段か $2$ 段かを区別でき、現在の状態がどこから来たかを判断できます。

- 前回 $1$ 段上ったなら、その前は $2$ 段しか選べません。したがって、$dp[i, 1]$ には $dp[i-1, 2]$ からだけ遷移できます。
- 前回 $2$ 段上ったなら、その前は $1$ 段でも $2$ 段でもかまいません。したがって、$dp[i, 2]$ には $dp[i-2, 1]$ または $dp[i-2, 2]$ から遷移できます。

図 14-9 のように、$dp[i, j]$ を状態 $[i, j]$ に対応する方法の数とすると、状態遷移式は次のようになります。

$$
\begin{cases}
dp[i, 1] = dp[i-1, 2] \\
dp[i, 2] = dp[i-2, 1] + dp[i-2, 2]
\end{cases}
$$

![制約を考慮した漸化式](dp_problem_features.assets/climbing_stairs_constraint_state_transfer.png){ class="animation-figure" }

<p align="center"> 図 14-9 &nbsp; 制約を考慮した漸化式 </p>

最後に $dp[n, 1] + dp[n, 2]$ を返します。この和が、$n$ 段目まで上る方法の総数です。

=== "Python"

    ```python title="climbing_stairs_constraint_dp.py"
    def climbing_stairs_constraint_dp(n: int) -> int:
        """制約付きの階段の上り方：動的計画法"""
        if n == 1 or n == 2:
            return 1
        # 部分問題の解を格納する dp テーブルを初期化する
        dp = [[0] * 3 for _ in range(n + 1)]
        # 初期状態：最小の部分問題の解を設定する
        dp[1][1], dp[1][2] = 1, 0
        dp[2][1], dp[2][2] = 0, 1
        # 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for i in range(3, n + 1):
            dp[i][1] = dp[i - 1][2]
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        return dp[n][1] + dp[n][2]
    ```

=== "C++"

    ```cpp title="climbing_stairs_constraint_dp.cpp"
    /* 制約付きの階段の上り方：動的計画法 */
    int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        vector<vector<int>> dp(n + 1, vector<int>(3, 0));
        // 初期状態：最小の部分問題の解を設定する
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_constraint_dp.java"
    /* 制約付きの階段の上り方：動的計画法 */
    int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        int[][] dp = new int[n + 1][3];
        // 初期状態：最小の部分問題の解を設定する
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_constraint_dp.cs"
    /* 制約付きの階段の上り方：動的計画法 */
    int ClimbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        int[,] dp = new int[n + 1, 3];
        // 初期状態：最小の部分問題の解を設定する
        dp[1, 1] = 1;
        dp[1, 2] = 0;
        dp[2, 1] = 0;
        dp[2, 2] = 1;
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (int i = 3; i <= n; i++) {
            dp[i, 1] = dp[i - 1, 2];
            dp[i, 2] = dp[i - 2, 1] + dp[i - 2, 2];
        }
        return dp[n, 1] + dp[n, 2];
    }
    ```

=== "Go"

    ```go title="climbing_stairs_constraint_dp.go"
    /* 制約付きの階段の上り方：動的計画法 */
    func climbingStairsConstraintDP(n int) int {
        if n == 1 || n == 2 {
            return 1
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        dp := make([][3]int, n+1)
        // 初期状態：最小の部分問題の解を設定する
        dp[1][1] = 1
        dp[1][2] = 0
        dp[2][1] = 0
        dp[2][2] = 1
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for i := 3; i <= n; i++ {
            dp[i][1] = dp[i-1][2]
            dp[i][2] = dp[i-2][1] + dp[i-2][2]
        }
        return dp[n][1] + dp[n][2]
    }
    ```

=== "Swift"

    ```swift title="climbing_stairs_constraint_dp.swift"
    /* 制約付きの階段の上り方：動的計画法 */
    func climbingStairsConstraintDP(n: Int) -> Int {
        if n == 1 || n == 2 {
            return 1
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        var dp = Array(repeating: Array(repeating: 0, count: 3), count: n + 1)
        // 初期状態：最小の部分問題の解を設定する
        dp[1][1] = 1
        dp[1][2] = 0
        dp[2][1] = 0
        dp[2][2] = 1
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for i in 3 ... n {
            dp[i][1] = dp[i - 1][2]
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        }
        return dp[n][1] + dp[n][2]
    }
    ```

=== "JS"

    ```javascript title="climbing_stairs_constraint_dp.js"
    /* 制約付きの階段の上り方：動的計画法 */
    function climbingStairsConstraintDP(n) {
        if (n === 1 || n === 2) {
            return 1;
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        const dp = Array.from(new Array(n + 1), () => new Array(3));
        // 初期状態：最小の部分問題の解を設定する
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (let i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "TS"

    ```typescript title="climbing_stairs_constraint_dp.ts"
    /* 制約付きの階段の上り方：動的計画法 */
    function climbingStairsConstraintDP(n: number): number {
        if (n === 1 || n === 2) {
            return 1;
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        const dp = Array.from({ length: n + 1 }, () => new Array(3));
        // 初期状態：最小の部分問題の解を設定する
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (let i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        return dp[n][1] + dp[n][2];
    }
    ```

=== "Dart"

    ```dart title="climbing_stairs_constraint_dp.dart"
    /* 制約付きの階段の上り方：動的計画法 */
    int climbingStairsConstraintDP(int n) {
      if (n == 1 || n == 2) {
        return 1;
      }
      // 部分問題の解を格納する dp テーブルを初期化する
      List<List<int>> dp = List.generate(n + 1, (index) => List.filled(3, 0));
      // 初期状態：最小の部分問題の解を設定する
      dp[1][1] = 1;
      dp[1][2] = 0;
      dp[2][1] = 0;
      dp[2][2] = 1;
      // 状態遷移：小さな部分問題から順に大きな部分問題を解く
      for (int i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
      }
      return dp[n][1] + dp[n][2];
    }
    ```

=== "Rust"

    ```rust title="climbing_stairs_constraint_dp.rs"
    /* 制約付きの階段の上り方：動的計画法 */
    fn climbing_stairs_constraint_dp(n: usize) -> i32 {
        if n == 1 || n == 2 {
            return 1;
        };
        // 部分問題の解を格納する dp テーブルを初期化する
        let mut dp = vec![vec![-1; 3]; n + 1];
        // 初期状態：最小の部分問題の解を設定する
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for i in 3..=n {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        dp[n][1] + dp[n][2]
    }
    ```

=== "C"

    ```c title="climbing_stairs_constraint_dp.c"
    /* 制約付きの階段の上り方：動的計画法 */
    int climbingStairsConstraintDP(int n) {
        if (n == 1 || n == 2) {
            return 1;
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        int **dp = malloc((n + 1) * sizeof(int *));
        for (int i = 0; i <= n; i++) {
            dp[i] = calloc(3, sizeof(int));
        }
        // 初期状態：最小の部分問題の解を設定する
        dp[1][1] = 1;
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1;
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (int i = 3; i <= n; i++) {
            dp[i][1] = dp[i - 1][2];
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
        }
        int res = dp[n][1] + dp[n][2];
        // メモリを解放する
        for (int i = 0; i <= n; i++) {
            free(dp[i]);
        }
        free(dp);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_constraint_dp.kt"
    /* 制約付きの階段の上り方：動的計画法 */
    fun climbingStairsConstraintDP(n: Int): Int {
        if (n == 1 || n == 2) {
            return 1
        }
        // 部分問題の解を格納する dp テーブルを初期化する
        val dp = Array(n + 1) { IntArray(3) }
        // 初期状態：最小の部分問題の解を設定する
        dp[1][1] = 1
        dp[1][2] = 0
        dp[2][1] = 0
        dp[2][2] = 1
        // 状態遷移：小さな部分問題から順に大きな部分問題を解く
        for (i in 3..n) {
            dp[i][1] = dp[i - 1][2]
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
        }
        return dp[n][1] + dp[n][2]
    }
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_constraint_dp.rb"
    ### 制約付きの階段の上り方：動的計画法 ###
    def climbing_stairs_constraint_dp(n)
      return 1 if n == 1 || n == 2

      # 部分問題の解を格納する dp テーブルを初期化する
      dp = Array.new(n + 1) { Array.new(3, 0) }
      # 初期状態：最小の部分問題の解を設定する
      dp[1][1], dp[1][2] = 1, 0
      dp[2][1], dp[2][2] = 0, 1
      # 状態遷移：小さな部分問題から順に大きな部分問題を解く
      for i in 3...(n + 1)
        dp[i][1] = dp[i - 1][2]
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
      end

      dp[n][1] + dp[n][2]
    end
    ```

??? pythontutor "実行の可視化"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="実行の可視化" src="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_constraint_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%88%B6%E7%B4%84%E4%BB%98%E3%81%8D%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%81%AE%E4%B8%8A%E3%82%8A%E6%96%B9%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E3%82%92%E6%A0%BC%E7%B4%8D%E3%81%99%E3%82%8B%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%203%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E7%8A%B6%E6%85%8B%EF%BC%9A%E6%9C%80%E5%B0%8F%E3%81%AE%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E3%82%92%E8%A8%AD%E5%AE%9A%E3%81%99%E3%82%8B%0A%20%20%20%20dp%5B1%5D%5B1%5D,%20dp%5B1%5D%5B2%5D%20%3D%201,%200%0A%20%20%20%20dp%5B2%5D%5B1%5D,%20dp%5B2%5D%5B2%5D%20%3D%200,%201%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%B0%8F%E3%81%95%E3%81%AA%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%8B%E3%82%89%E9%A0%86%E3%81%AB%E5%A4%A7%E3%81%8D%E3%81%AA%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%82%92%E8%A7%A3%E3%81%8F%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B1%5D%20%3D%20dp%5Bi%20-%201%5D%5B2%5D%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B2%5D%20%3D%20dp%5Bi%20-%202%5D%5B1%5D%20%2B%20dp%5Bi%20-%202%5D%5B2%5D%0A%20%20%20%20return%20dp%5Bn%5D%5B1%5D%20%2B%20dp%5Bn%5D%5B2%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_constraint_dp%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%20%E6%AE%B5%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E5%85%A8%E9%83%A8%E3%81%A7%20%7Bres%7D%20%E9%80%9A%E3%82%8A%22%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20climbing_stairs_constraint_dp%28n%3A%20int%29%20-%3E%20int%3A%0A%20%20%20%20%22%22%22%E5%88%B6%E7%B4%84%E4%BB%98%E3%81%8D%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%81%AE%E4%B8%8A%E3%82%8A%E6%96%B9%EF%BC%9A%E5%8B%95%E7%9A%84%E8%A8%88%E7%94%BB%E6%B3%95%22%22%22%0A%20%20%20%20if%20n%20%3D%3D%201%20or%20n%20%3D%3D%202%3A%0A%20%20%20%20%20%20%20%20return%201%0A%20%20%20%20%23%20%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E3%82%92%E6%A0%BC%E7%B4%8D%E3%81%99%E3%82%8B%20dp%20%E3%83%86%E3%83%BC%E3%83%96%E3%83%AB%E3%82%92%E5%88%9D%E6%9C%9F%E5%8C%96%E3%81%99%E3%82%8B%0A%20%20%20%20dp%20%3D%20%5B%5B0%5D%20%2A%203%20for%20_%20in%20range%28n%20%2B%201%29%5D%0A%20%20%20%20%23%20%E5%88%9D%E6%9C%9F%E7%8A%B6%E6%85%8B%EF%BC%9A%E6%9C%80%E5%B0%8F%E3%81%AE%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%AE%E8%A7%A3%E3%82%92%E8%A8%AD%E5%AE%9A%E3%81%99%E3%82%8B%0A%20%20%20%20dp%5B1%5D%5B1%5D,%20dp%5B1%5D%5B2%5D%20%3D%201,%200%0A%20%20%20%20dp%5B2%5D%5B1%5D,%20dp%5B2%5D%5B2%5D%20%3D%200,%201%0A%20%20%20%20%23%20%E7%8A%B6%E6%85%8B%E9%81%B7%E7%A7%BB%EF%BC%9A%E5%B0%8F%E3%81%95%E3%81%AA%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%81%8B%E3%82%89%E9%A0%86%E3%81%AB%E5%A4%A7%E3%81%8D%E3%81%AA%E9%83%A8%E5%88%86%E5%95%8F%E9%A1%8C%E3%82%92%E8%A7%A3%E3%81%8F%0A%20%20%20%20for%20i%20in%20range%283,%20n%20%2B%201%29%3A%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B1%5D%20%3D%20dp%5Bi%20-%201%5D%5B2%5D%0A%20%20%20%20%20%20%20%20dp%5Bi%5D%5B2%5D%20%3D%20dp%5Bi%20-%202%5D%5B1%5D%20%2B%20dp%5Bi%20-%202%5D%5B2%5D%0A%20%20%20%20return%20dp%5Bn%5D%5B1%5D%20%2B%20dp%5Bn%5D%5B2%5D%0A%0A%0A%22%22%22%E5%AE%9F%E8%A1%8C%E7%94%A8%E3%82%B3%E3%83%BC%E3%83%89%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%209%0A%0A%20%20%20%20res%20%3D%20climbing_stairs_constraint_dp%28n%29%0A%20%20%20%20print%28f%22%7Bn%7D%20%E6%AE%B5%E3%81%AE%E9%9A%8E%E6%AE%B5%E3%82%92%E4%B8%8A%E3%82%8B%E6%96%B9%E6%B3%95%E3%81%AF%E5%85%A8%E9%83%A8%E3%81%A7%20%7Bres%7D%20%E9%80%9A%E3%82%8A%22%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=4&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全画面で表示 ></a></div>

この例では、一つ前の状態を追加で考慮するだけなので、状態を拡張すれば、再び過去の経路に依存しない形にできます。しかし、「過去の経路への依存」が非常に強い問題もあります。

!!! question "階段を上ると障害物ができる問題"

    $n$ 段の階段があり、1 回で $1$ 段または $2$ 段上れます。**$i$ 段目に到達すると、システムが自動的に $2i$ 段目に障害物を置き、それ以降は $2i$ 段目に上れなくなる**ものとします。たとえば、最初の 2 回で $2$ 段目、$3$ 段目に上ったら、その後は $4$ 段目、$6$ 段目には上れません。一番上まで上る方法は何通りありますか。

この問題では、毎回の移動が上の段に障害物を置き、その後の移動に影響するため、次の移動は過去のすべての状態に依存します。この種の問題は、動的計画法では解くのが難しいことが多いです。

実際、多くの複雑な組合せ最適化問題（巡回セールスマン問題など）は、過去の経路に依存しない性質を満たしません。そのような問題には、ヒューリスティック探索、遺伝的アルゴリズム、強化学習などの別の方法を選び、限られた時間で利用可能な局所最適解を得ることが一般的です。
