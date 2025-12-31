---
comments: true
---

# 14.3 &nbsp; 動的プログラミング問題解決アプローチ

前の2つのセクションでは、動的プログラミング問題の主要な特徴を紹介しました。次に、より実用的な2つの問題を一緒に探索しましょう。

1. 問題が動的プログラミング問題かどうかをどのように判断するか？
2. 動的プログラミング問題を解決する完全なステップは何か？

## 14.3.1 &nbsp; 問題の判定

一般的に言えば、問題が重複する部分問題、最適部分構造を含み、無記憶性を示す場合、通常動的プログラミング解法に適しています。しかし、問題の説明から直接これらの特徴を抽出することはしばしば困難です。したがって、通常は条件を緩和し、**まず問題がバックトラッキング（全探索）を使用した解決に適しているかどうかを観察**します。

**バックトラッキングに適した問題は通常「決定木モデル」に適合**し、これは木構造を使用して記述でき、各ノードは決定を表し、各パスは決定のシーケンスを表します。

言い換えると、問題が明示的な決定概念を含み、解が一連の決定を通じて生成される場合、それは決定木モデルに適合し、通常バックトラッキングを使用して解決できます。

この基礎の上で、動的プログラミング問題を判定するための「ボーナスポイント」があります。

- 問題に最大化（最小化）または最も（最も少ない）最適な解を見つけるという記述が含まれている。
- 問題の状態がリスト、多次元行列、または木を使用して表現でき、状態がその周囲の状態と再帰関係を持っている。

対応して、「ペナルティポイント」もあります。

- 問題の目標は最適解だけでなく、すべての可能な解を見つけることである。
- 問題の説明に順列と組み合わせの明らかな特徴があり、特定の複数の解を返す必要がある。

問題が決定木モデルに適合し、比較的明らかな「ボーナスポイント」を持つ場合、それが動的プログラミング問題であると仮定し、解決プロセス中に検証できます。

## 14.3.2 &nbsp; 問題解決ステップ

動的プログラミング問題解決プロセスは問題の性質と難易度によって異なりますが、一般的に次のステップに従います：決定の記述、状態の定義、$dp$ テーブルの確立、状態遷移方程式の導出、境界条件の決定など。

問題解決ステップをより具体的に説明するために、古典的な問題「最小経路和」を例として使用します。

!!! question

    $n \times m$ の二次元グリッド `grid` が与えられ、グリッドの各セルには負でない整数が含まれ、そのセルのコストを表します。ロボットは左上のセルから始まり、各ステップで下または右にのみ移動でき、右下のセルに到達するまで続けます。左上から右下への最小経路和を返してください。

下の図は例を示しており、与えられたグリッドの最小経路和は $13$ です。

![最小経路和の例データ](dp_solution_pipeline.assets/min_path_sum_example.png){ class="animation-figure" }

<p align="center"> 図 14-10 &nbsp; 最小経路和の例データ </p>

**第1ステップ：各ラウンドの決定を考え、状態を定義し、それにより $dp$ テーブルを得る**

この問題の各ラウンドの決定は、現在のセルから下または右に1ステップ移動することです。現在のセルの行と列のインデックスが $[i, j]$ であると仮定すると、下または右に移動した後、インデックスは $[i+1, j]$ または $[i, j+1]$ になります。したがって、状態には2つの変数が含まれるべきです：行インデックスと列インデックス、$[i, j]$ と表記されます。

状態 $[i, j]$ は部分問題に対応します：開始点 $[0, 0]$ から $[i, j]$ への最小経路和、$dp[i, j]$ と表記されます。

このようにして、下の図に示す二次元 $dp$ 行列を得ます。そのサイズは入力グリッド $grid$ と同じです。

![状態定義とDPテーブル](dp_solution_pipeline.assets/min_path_sum_solution_state_definition.png){ class="animation-figure" }

<p align="center"> 図 14-11 &nbsp; 状態定義とDPテーブル </p>

!!! note

    動的プログラミングとバックトラッキングは決定のシーケンスとして記述でき、状態はすべての決定変数から構成されます。問題解決の進行を記述するすべての変数を含むべきで、次の状態を導出するのに十分な情報を含んでいる必要があります。

    各状態は部分問題に対応し、すべての部分問題の解を保存するための $dp$ テーブルを定義します。状態の各独立変数は $dp$ テーブルの次元です。本質的に、$dp$ テーブルは状態と部分問題の解の間のマッピングです。

**第2ステップ：最適部分構造を特定し、状態遷移方程式を導出する**

状態 $[i, j]$ について、それは上のセル $[i-1, j]$ または左のセル $[i, j-1]$ からのみ導出できます。したがって、最適部分構造は：$[i, j]$ に到達する最小経路和は、$[i, j-1]$ と $[i-1, j]$ の最小経路和の小さい方によって決定されます。

上記の分析に基づいて、下の図に示す状態遷移方程式を導出できます：

$$
dp[i, j] = \min(dp[i-1, j], dp[i, j-1]) + grid[i, j]
$$

![最適部分構造と状態遷移方程式](dp_solution_pipeline.assets/min_path_sum_solution_state_transition.png){ class="animation-figure" }

<p align="center"> 図 14-12 &nbsp; 最適部分構造と状態遷移方程式 </p>

!!! note

    定義された $dp$ テーブルに基づいて、元の問題と部分問題の関係を考え、部分問題の最適解から元の問題の最適解をどのように構築するか、つまり最適部分構造を見つけます。

    最適部分構造を特定したら、それを使用して状態遷移方程式を構築できます。

**第3ステップ：境界条件と状態遷移順序を決定する**

この問題では、最初の行の状態は左の状態からのみ来ることができ、最初の列の状態は上の状態からのみ来ることができるため、最初の行 $i = 0$ と最初の列 $j = 0$ が境界条件です。

下の図に示すように、各セルは左のセルと上のセルから導出されるため、ループを使用して行列を走査し、外側のループは行を反復し、内側のループは列を反復します。

![境界条件と状態遷移順序](dp_solution_pipeline.assets/min_path_sum_solution_initial_state.png){ class="animation-figure" }

<p align="center"> 図 14-13 &nbsp; 境界条件と状態遷移順序 </p>

!!! note

    境界条件は動的プログラミングで $dp$ テーブルを初期化するために使用され、探索では枝刈りに使用されます。

    状態遷移順序の核心は、現在の問題の解を計算するとき、それが依存するすべての小さな部分問題が既に正しく計算されていることを確保することです。

上記の分析に基づいて、動的プログラミングコードを直接書くことができます。しかし、部分問題の分解はトップダウンアプローチであるため、「力任せ探索 → メモ化探索 → 動的プログラミング」の順序で実装することが習慣的な思考により適合します。

### 1. &nbsp; 方法1：力任せ探索

状態 $[i, j]$ から探索を開始し、それを常により小さな状態 $[i-1, j]$ と $[i, j-1]$ に分解します。再帰関数には以下の要素が含まれます。

- **再帰パラメータ**：状態 $[i, j]$。
- **戻り値**：$[0, 0]$ から $[i, j]$ への最小経路和 $dp[i, j]$。
- **終了条件**：$i = 0$ かつ $j = 0$ のとき、コスト $grid[0, 0]$ を返す。
- **枝刈り**：$i < 0$ または $j < 0$ でインデックスが範囲外のとき、コスト $+\infty$ を返し、実行不可能性を表す。

実装コードは以下の通りです：

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dfs(grid: list[list[int]], i: int, j: int) -> int:
        """最小パス和：ブルートフォース探索"""
        # 左上のセルの場合、探索を終了
        if i == 0 and j == 0:
            return grid[0][0]
        # 行または列のインデックスが範囲外の場合、+∞ コストを返す
        if i < 0 or j < 0:
            return inf
        # 左上から (i-1, j) と (i, j-1) への最小パスコストを計算
        up = min_path_sum_dfs(grid, i - 1, j)
        left = min_path_sum_dfs(grid, i, j - 1)
        # 左上から (i, j) への最小パスコストを返す
        return min(left, up) + grid[i][j]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    /* 最小パス和：ブルートフォース探索 */
    int minPathSumDFS(vector<vector<int>> &grid, int i, int j) {
        // 左上のセルの場合、探索を終了
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、+∞ のコストを返す
        if (i < 0 || j < 0) {
            return INT_MAX;
        }
        // 左上から (i-1, j) と (i, j-1) への最小パスコストを計算
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 左上から (i, j) への最小パスコストを返す
        return min(left, up) + grid[i][j];
    }
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* 最小パス和：ブルートフォース探索 */
    int minPathSumDFS(int[][] grid, int i, int j) {
        // 左上のセルの場合、探索を終了
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、+∞ のコストを返す
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 左上から (i-1, j) と (i, j-1) への最小パスコストを計算
        int up = minPathSumDFS(grid, i - 1, j);
        int left = minPathSumDFS(grid, i, j - 1);
        // 左上から (i, j) への最小パスコストを返す
        return Math.min(left, up) + grid[i][j];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    [class]{min_path_sum}-[func]{MinPathSumDFS}
    ```

=== "Go"

    ```go title="min_path_sum.go"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    [class]{}-[func]{min_path_sum_dfs}
    ```

=== "C"

    ```c title="min_path_sum.c"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    [class]{}-[func]{minPathSumDFS}
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    [class]{}-[func]{min_path_sum_dfs}
    ```

下の図は $dp[2, 1]$ を根とする再帰木を示しており、いくつかの重複する部分問題を含み、その数はグリッド `grid` のサイズが増加すると急激に増加します。

本質的に、重複する部分問題の理由は：**左上隅から特定のセルに到達する複数のパスが存在する**ことです。

![力任せ探索の再帰木](dp_solution_pipeline.assets/min_path_sum_dfs.png){ class="animation-figure" }

<p align="center"> 図 14-14 &nbsp; 力任せ探索の再帰木 </p>

各状態には下と右の2つの選択があるため、左上隅から右下隅までの総ステップ数は $m + n - 2$ で、最悪時間計算量は $O(2^{m + n})$ です。この計算方法はグリッドエッジ近くの状況を考慮していないことに注意してください。ネットワークエッジに到達したとき、選択肢が1つしか残らないため、実際のパス数はより少なくなります。

### 2. &nbsp; 方法2：メモ化探索

グリッド `grid` と同じサイズのメモリスト `mem` を導入し、様々な部分問題の解を記録し、重複する部分問題を枝刈りします：

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dfs_mem(
        grid: list[list[int]], mem: list[list[int]], i: int, j: int
    ) -> int:
        """最小パス和：記憶化探索"""
        # 左上のセルの場合、探索を終了
        if i == 0 and j == 0:
            return grid[0][0]
        # 行または列のインデックスが範囲外の場合、+∞ コストを返す
        if i < 0 or j < 0:
            return inf
        # 記録がある場合、それを返す
        if mem[i][j] != -1:
            return mem[i][j]
        # 左と上のセルからの最小パスコスト
        up = min_path_sum_dfs_mem(grid, mem, i - 1, j)
        left = min_path_sum_dfs_mem(grid, mem, i, j - 1)
        # 左上から (i, j) への最小パスコストを記録して返す
        mem[i][j] = min(left, up) + grid[i][j]
        return mem[i][j]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* 最小パス和：メモ化探索 */
    int minPathSumDFSMem(int[][] grid, int[][] mem, int i, int j) {
        // 左上のセルの場合、探索を終了
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // 行または列のインデックスが範囲外の場合、+∞ のコストを返す
        if (i < 0 || j < 0) {
            return Integer.MAX_VALUE;
        }
        // 記録がある場合、それを返す
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        // 左と上のセルからの最小パスコスト
        int up = minPathSumDFSMem(grid, mem, i - 1, j);
        int left = minPathSumDFSMem(grid, mem, i, j - 1);
        // 左上から (i, j) への最小パスコストを記録して返す
        mem[i][j] = Math.min(left, up) + grid[i][j];
        return mem[i][j];
    }
    ```

=== "C#"

    ```csharp title="min_path_sum.cs"
    [class]{min_path_sum}-[func]{MinPathSumDFSMem}
    ```

=== "Go"

    ```go title="min_path_sum.go"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    [class]{}-[func]{min_path_sum_dfs_mem}
    ```

=== "C"

    ```c title="min_path_sum.c"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    [class]{}-[func]{minPathSumDFSMem}
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    [class]{}-[func]{min_path_sum_dfs_mem}
    ```

下の図に示すように、メモ化を導入した後、すべての部分問題の解は一度だけ計算される必要があるため、時間計算量は状態の総数、つまりグリッドサイズ $O(nm)$ に依存します。

![メモ化探索の再帰木](dp_solution_pipeline.assets/min_path_sum_dfs_mem.png){ class="animation-figure" }

<p align="center"> 図 14-15 &nbsp; メモ化探索の再帰木 </p>

### 3. &nbsp; 方法3：動的プログラミング

動的プログラミング解法を反復的に実装します。コードは以下の通りです：

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dp(grid: list[list[int]]) -> int:
        """最小パス和：動的プログラミング"""
        n, m = len(grid), len(grid[0])
        # dp テーブルを初期化
        dp = [[0] * m for _ in range(n)]
        dp[0][0] = grid[0][0]
        # 状態遷移：最初の行
        for j in range(1, m):
            dp[0][j] = dp[0][j - 1] + grid[0][j]
        # 状態遷移：最初の列
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
    /* 最小パス和：動的プログラミング */
    int minPathSumDP(vector<vector<int>> &grid) {
        int n = grid.size(), m = grid[0].size();
        // DPテーブルを初期化
        vector<vector<int>> dp(n, vector<int>(m));
        dp[0][0] = grid[0][0];
        // 状態遷移：最初の行
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 状態遷移：最初の列
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
    /* 最小パス和：動的プログラミング */
    int minPathSumDP(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // DPテーブルを初期化
        int[][] dp = new int[n][m];
        dp[0][0] = grid[0][0];
        // 状態遷移：最初の行
        for (int j = 1; j < m; j++) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // 状態遷移：最初の列
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
    [class]{min_path_sum}-[func]{MinPathSumDP}
    ```

=== "Go"

    ```go title="min_path_sum.go"
    [class]{}-[func]{minPathSumDP}
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    [class]{}-[func]{minPathSumDP}
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    [class]{}-[func]{minPathSumDP}
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    [class]{}-[func]{minPathSumDP}
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    [class]{}-[func]{minPathSumDP}
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    [class]{}-[func]{min_path_sum_dp}
    ```

=== "C"

    ```c title="min_path_sum.c"
    [class]{}-[func]{minPathSumDP}
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    [class]{}-[func]{minPathSumDP}
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    [class]{}-[func]{min_path_sum_dp}
    ```

下の図は最小経路和の状態遷移プロセスを示し、グリッド全体を走査するため、**時間計算量は $O(nm)$** です。

配列 `dp` のサイズは $n \times m$ であるため、**空間計算量は $O(nm)$** です。

=== "<1>"
    ![最小経路和の動的プログラミングプロセス](dp_solution_pipeline.assets/min_path_sum_dp_step1.png){ class="animation-figure" }

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

<p align="center"> 図 14-16 &nbsp; 最小経路和の動的プログラミングプロセス </p>

### 4. &nbsp; 空間最適化

各セルは左と上のセルのみに関連するため、単一行配列を使用して $dp$ テーブルを実装できます。

配列 `dp` は1行の状態のみを表現できるため、最初の列の状態を事前に初期化できず、各行を走査するときに更新することに注意してください：

=== "Python"

    ```python title="min_path_sum.py"
    def min_path_sum_dp_comp(grid: list[list[int]]) -> int:
        """最小パス和：空間最適化動的プログラミング"""
        n, m = len(grid), len(grid[0])
        # dp テーブルを初期化
        dp = [0] * m
        # 状態遷移：最初の行
        dp[0] = grid[0][0]
        for j in range(1, m):
            dp[j] = dp[j - 1] + grid[0][j]
        # 状態遷移：残りの行
        for i in range(1, n):
            # 状態遷移：最初の列
            dp[0] = dp[0] + grid[i][0]
            # 状態遷移：残りの列
            for j in range(1, m):
                dp[j] = min(dp[j - 1], dp[j]) + grid[i][j]
        return dp[m - 1]
    ```

=== "C++"

    ```cpp title="min_path_sum.cpp"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "Java"

    ```java title="min_path_sum.java"
    /* 最小パス和：空間最適化動的プログラミング */
    int minPathSumDPComp(int[][] grid) {
        int n = grid.length, m = grid[0].length;
        // DPテーブルを初期化
        int[] dp = new int[m];
        // 状態遷移：最初の行
        dp[0] = grid[0][0];
        for (int j = 1; j < m; j++) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // 状態遷移：残りの行
        for (int i = 1; i < n; i++) {
            // 状態遷移：最初の列
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
    [class]{min_path_sum}-[func]{MinPathSumDPComp}
    ```

=== "Go"

    ```go title="min_path_sum.go"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "Swift"

    ```swift title="min_path_sum.swift"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "JS"

    ```javascript title="min_path_sum.js"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "TS"

    ```typescript title="min_path_sum.ts"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "Dart"

    ```dart title="min_path_sum.dart"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "Rust"

    ```rust title="min_path_sum.rs"
    [class]{}-[func]{min_path_sum_dp_comp}
    ```

=== "C"

    ```c title="min_path_sum.c"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "Kotlin"

    ```kotlin title="min_path_sum.kt"
    [class]{}-[func]{minPathSumDPComp}
    ```

=== "Ruby"

    ```ruby title="min_path_sum.rb"
    [class]{}-[func]{min_path_sum_dp_comp}
    ```
