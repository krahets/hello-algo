---
comments: true
---

# 14.1 &nbsp; 動的プログラミングの紹介

<u>動的プログラミング</u>は重要なアルゴリズムパラダイムであり、問題を一連の小さな部分問題に分解し、これらの部分問題の解を保存することで冗長な計算を避け、時間効率を大幅に向上させます。

このセクションでは、古典的な問題から始めて、まず力任せの探索法による解法を提示し、重複する部分問題を特定してから、より効率的な動的プログラミング解法を段階的に導出します。

!!! question "階段登り"

    $n$ 段の階段があり、一度に $1$ 段または $2$ 段上ることができます。頂上に到達する方法は何通りありますか？

下の図に示すように、$3$ 段の階段の頂上に到達する方法は $3$ 通りあります。

![3段目に到達する方法の数](intro_to_dynamic_programming.assets/climbing_stairs_example.png){ class="animation-figure" }

<p align="center"> 図 14-1 &nbsp; 3段目に到達する方法の数 </p>

この問題は**バックトラッキングを用いてすべての可能性を網羅**することで方法の数を計算することを目的としています。具体的には、階段登りの問題を多段階選択プロセスとして考えます：地面から始めて、毎回 $1$ 段または $2$ 段上るかを選択し、階段の頂上に到達したら方法の数をカウントし、頂上を超えた場合はプルーニング（枝刈り）を行います。コードは以下の通りです：

=== "Python"

    ```python title="climbing_stairs_backtrack.py"
    def backtrack(choices: list[int], state: int, n: int, res: list[int]) -> int:
        """バックトラッキング"""
        # n 段目に登ったとき、解の数に 1 を加える
        if state == n:
            res[0] += 1
        # すべての選択肢を走査
        for choice in choices:
            # 枝刈り：n 段を超えて登ることを許可しない
            if state + choice > n:
                continue
            # 試行：選択を行い、状態を更新
            backtrack(choices, state + choice, n, res)
            # 撤回

    def climbing_stairs_backtrack(n: int) -> int:
        """階段登り：バックトラッキング"""
        choices = [1, 2]  # 1 段または 2 段登ることを選択可能
        state = 0  # 0 段目から登り始める
        res = [0]  # res[0] を使用して解の数を記録
        backtrack(choices, state, n, res)
        return res[0]
    ```

=== "C++"

    ```cpp title="climbing_stairs_backtrack.cpp"
    /* バックトラッキング */
    void backtrack(vector<int> &choices, int state, int n, vector<int> &res) {
        // n段目に到達したとき、解の数に1を加える
        if (state == n)
            res[0]++;
        // すべての選択肢を走査
        for (auto &choice : choices) {
            // 剪定：n段を超えて登ることを許可しない
            if (state + choice > n)
                continue;
            // 試行：選択を行い、状態を更新
            backtrack(choices, state + choice, n, res);
            // 撤回
        }
    }

    /* 階段登り：バックトラッキング */
    int climbingStairsBacktrack(int n) {
        vector<int> choices = {1, 2}; // 1段または2段登ることを選択可能
        int state = 0;                // 0段目から登り始める
        vector<int> res = {0};        // res[0] を使用して解の数を記録
        backtrack(choices, state, n, res);
        return res[0];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_backtrack.java"
    /* バックトラッキング */
    void backtrack(List<Integer> choices, int state, int n, List<Integer> res) {
        // n段目に到達したとき、解の数に1を加える
        if (state == n)
            res.set(0, res.get(0) + 1);
        // すべての選択肢を走査
        for (Integer choice : choices) {
            // 剪定：n段を超えて登ることを許可しない
            if (state + choice > n)
                continue;
            // 試行：選択を行い、状態を更新
            backtrack(choices, state + choice, n, res);
            // 撤回
        }
    }

    /* 階段登り：バックトラッキング */
    int climbingStairsBacktrack(int n) {
        List<Integer> choices = Arrays.asList(1, 2); // 1段または2段登ることを選択可能
        int state = 0; // 0段目から登り始める
        List<Integer> res = new ArrayList<>();
        res.add(0); // res[0] を使用して解の数を記録
        backtrack(choices, state, n, res);
        return res.get(0);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_backtrack.cs"
    [class]{climbing_stairs_backtrack}-[func]{Backtrack}

    [class]{climbing_stairs_backtrack}-[func]{ClimbingStairsBacktrack}
    ```

=== "Go"

    ```go title="climbing_stairs_backtrack.go"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "Swift"

    ```swift title="climbing_stairs_backtrack.swift"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "JS"

    ```javascript title="climbing_stairs_backtrack.js"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "TS"

    ```typescript title="climbing_stairs_backtrack.ts"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "Dart"

    ```dart title="climbing_stairs_backtrack.dart"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "Rust"

    ```rust title="climbing_stairs_backtrack.rs"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbing_stairs_backtrack}
    ```

=== "C"

    ```c title="climbing_stairs_backtrack.c"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_backtrack.kt"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_backtrack.rb"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbing_stairs_backtrack}
    ```

=== "Zig"

    ```zig title="climbing_stairs_backtrack.zig"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{climbingStairsBacktrack}
    ```

## 14.1.1 &nbsp; 方法1：力任せ探索

バックトラッキングアルゴリズムは問題を明示的に部分問題に分解しません。代わりに、問題を一連の決定ステップとして扱い、試行と枝刈りを通じてすべての可能性を探索します。

この問題を分解アプローチを使って分析できます。$dp[i]$ を $i$ 段目に到達する方法の数とします。この場合、$dp[i]$ が元の問題であり、その部分問題は次のようになります：

$$
dp[i-1], dp[i-2], \dots, dp[2], dp[1]
$$

各移動は $1$ 段または $2$ 段しか進めないため、$i$ 段目に立っているとき、前のステップは $i-1$ 段目または $i-2$ 段目のいずれかにいたはずです。つまり、$i$ 段目には $i-1$ 段目または $i-2$ 段目からしか到達できません。

これにより重要な結論が得られます：**$i-1$ 段目に到達する方法の数に $i-2$ 段目に到達する方法の数を加えたものが、$i$ 段目に到達する方法の数に等しい**。式は以下の通りです：

$$
dp[i] = dp[i-1] + dp[i-2]
$$

これは、階段登り問題において部分問題間に再帰関係があることを意味し、**元の問題の解は部分問題の解から構築できます**。下の図はこの再帰関係を示しています。

![解の数の再帰関係](intro_to_dynamic_programming.assets/climbing_stairs_state_transfer.png){ class="animation-figure" }

<p align="center"> 図 14-2 &nbsp; 解の数の再帰関係 </p>

再帰式に従って力任せ探索解法を得ることができます。$dp[n]$ から始めて、**より大きな問題を再帰的に2つの小さな部分問題の和に分解**し、解が既知の最小の部分問題 $dp[1]$ と $dp[2]$ に到達するまで続けます。$dp[1] = 1$ と $dp[2] = 2$ で、それぞれ1段目と2段目に登る方法が $1$ 通りと $2$ 通りあることを表します。

以下のコードを観察すると、標準的なバックトラッキングコードと同様に深さ優先探索に属しますが、より簡潔です：

=== "Python"

    ```python title="climbing_stairs_dfs.py"
    def dfs(i: int) -> int:
        """探索"""
        # 既知の dp[1] と dp[2] は、それらを返す
        if i == 1 or i == 2:
            return i
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1) + dfs(i - 2)
        return count

    def climbing_stairs_dfs(n: int) -> int:
        """階段登り：探索"""
        return dfs(n)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs.cpp"
    /* 探索 */
    int dfs(int i) {
        // 既知の dp[1] と dp[2] を返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 階段登り：探索 */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dfs.java"
    /* 探索 */
    int dfs(int i) {
        // 既知の dp[1] と dp[2] を返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1) + dfs(i - 2);
        return count;
    }

    /* 階段登り：探索 */
    int climbingStairsDFS(int n) {
        return dfs(n);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs.cs"
    [class]{climbing_stairs_dfs}-[func]{DFS}

    [class]{climbing_stairs_dfs}-[func]{ClimbingStairsDFS}
    ```

=== "Go"

    ```go title="climbing_stairs_dfs.go"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs.swift"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs.js"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs.ts"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs.dart"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs.rs"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbing_stairs_dfs}
    ```

=== "C"

    ```c title="climbing_stairs_dfs.c"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs.kt"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs.rb"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbing_stairs_dfs}
    ```

=== "Zig"

    ```zig title="climbing_stairs_dfs.zig"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFS}
    ```

下の図は力任せ探索によって形成される再帰木を示しています。問題 $dp[n]$ について、その再帰木の深さは $n$ で、時間計算量は $O(2^n)$ です。この指数的増加により、$n$ が大きいとプログラムの実行がはるかに遅くなり、長い待機時間が生じます。

![階段登りの再帰木](intro_to_dynamic_programming.assets/climbing_stairs_dfs_tree.png){ class="animation-figure" }

<p align="center"> 図 14-3 &nbsp; 階段登りの再帰木 </p>

上の図を観察すると、**指数時間計算量は「重複する部分問題」によって引き起こされる**ことがわかります。例えば、$dp[9]$ は $dp[8]$ と $dp[7]$ に分解され、$dp[8]$ はさらに $dp[7]$ と $dp[6]$ に分解され、両方とも部分問題 $dp[7]$ を含んでいます。

このように、部分問題にはさらに小さな重複する部分問題が含まれ、これは無限に続きます。計算リソースの大部分がこれらの重複する部分問題に浪費されています。

## 14.1.2 &nbsp; 方法2：メモ化探索

アルゴリズムの効率を向上させるため、**すべての重複する部分問題を一度だけ計算したい**と考えます。この目的のため、各部分問題の解を記録する配列 `mem` を宣言し、探索プロセス中に重複する部分問題を枝刈りします。

1. $dp[i]$ が初めて計算されるとき、後で使用するために `mem[i]` に記録します。
2. $dp[i]$ を再度計算する必要があるとき、`mem[i]` から直接結果を取得でき、その部分問題の冗長な計算を避けられます。

コードは以下の通りです：

=== "Python"

    ```python title="climbing_stairs_dfs_mem.py"
    def dfs(i: int, mem: list[int]) -> int:
        """記憶化探索"""
        # 既知の dp[1] と dp[2] は、それらを返す
        if i == 1 or i == 2:
            return i
        # dp[i] の記録がある場合、それを返す
        if mem[i] != -1:
            return mem[i]
        # dp[i] = dp[i-1] + dp[i-2]
        count = dfs(i - 1, mem) + dfs(i - 2, mem)
        # dp[i] を記録
        mem[i] = count
        return count

    def climbing_stairs_dfs_mem(n: int) -> int:
        """階段登り：記憶化探索"""
        # mem[i] は i 段目に登る解の総数を記録、-1 は記録なしを意味する
        mem = [-1] * (n + 1)
        return dfs(n, mem)
    ```

=== "C++"

    ```cpp title="climbing_stairs_dfs_mem.cpp"
    /* メモ化探索 */
    int dfs(int i, vector<int> &mem) {
        // 既知の dp[1] と dp[2] を返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] の記録がある場合、それを返す
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // dp[i] を記録
        mem[i] = count;
        return count;
    }

    /* 階段登り：メモ化探索 */
    int climbingStairsDFSMem(int n) {
        // mem[i] は i 段目に登る総解数を記録、-1 は記録なしを意味する
        vector<int> mem(n + 1, -1);
        return dfs(n, mem);
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dfs_mem.java"
    /* メモ化探索 */
    int dfs(int i, int[] mem) {
        // 既知の dp[1] と dp[2] を返す
        if (i == 1 || i == 2)
            return i;
        // dp[i] の記録がある場合、それを返す
        if (mem[i] != -1)
            return mem[i];
        // dp[i] = dp[i-1] + dp[i-2]
        int count = dfs(i - 1, mem) + dfs(i - 2, mem);
        // dp[i] を記録
        mem[i] = count;
        return count;
    }

    /* 階段登り：メモ化探索 */
    int climbingStairsDFSMem(int n) {
        // mem[i] は i 段目に登る総解数を記録、-1 は記録なしを意味する
        int[] mem = new int[n + 1];
        Arrays.fill(mem, -1);
        return dfs(n, mem);
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dfs_mem.cs"
    [class]{climbing_stairs_dfs_mem}-[func]{DFS}

    [class]{climbing_stairs_dfs_mem}-[func]{ClimbingStairsDFSMem}
    ```

=== "Go"

    ```go title="climbing_stairs_dfs_mem.go"
    [class]{}-[func]{dfsMem}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "Swift"

    ```swift title="climbing_stairs_dfs_mem.swift"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "JS"

    ```javascript title="climbing_stairs_dfs_mem.js"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "TS"

    ```typescript title="climbing_stairs_dfs_mem.ts"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "Dart"

    ```dart title="climbing_stairs_dfs_mem.dart"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "Rust"

    ```rust title="climbing_stairs_dfs_mem.rs"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbing_stairs_dfs_mem}
    ```

=== "C"

    ```c title="climbing_stairs_dfs_mem.c"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dfs_mem.kt"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dfs_mem.rb"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbing_stairs_dfs_mem}
    ```

=== "Zig"

    ```zig title="climbing_stairs_dfs_mem.zig"
    [class]{}-[func]{dfs}

    [class]{}-[func]{climbingStairsDFSMem}
    ```

下の図を観察すると、**メモ化後、すべての重複する部分問題は一度だけ計算される必要があり、時間計算量を $O(n)$ に最適化**します。これは大幅な改善です。

![メモ化探索による再帰木](intro_to_dynamic_programming.assets/climbing_stairs_dfs_memo_tree.png){ class="animation-figure" }

<p align="center"> 図 14-4 &nbsp; メモ化探索による再帰木 </p>

## 14.1.3 &nbsp; 方法3：動的プログラミング

**メモ化探索は「トップダウン」方式**です：元の問題（根ノード）から始めて、より大きな部分問題をより小さなものに再帰的に分解し、最小の既知の部分問題（葉ノード）の解に到達するまで続けます。その後、バックトラッキングにより部分問題の解を収集し、元の問題の解を構築します。

一方、**動的プログラミングは「ボトムアップ」方式**です：最小の部分問題の解から始めて、元の問題が解決されるまで、より大きな部分問題の解を反復的に構築します。

動的プログラミングはバックトラッキングを必要としないため、ループを使った反復のみが必要で、再帰は不要です。以下のコードでは、配列 `dp` を初期化して部分問題の解を保存し、メモ化探索の配列 `mem` と同じ記録機能を果たします：

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp(n: int) -> int:
        """階段登り：動的プログラミング"""
        if n == 1 or n == 2:
            return n
        # dp テーブルを初期化、部分問題の解を格納するため使用
        dp = [0] * (n + 1)
        # 初期状態：最小の部分問題の解を事前設定
        dp[1], dp[2] = 1, 2
        # 状態遷移：小さい部分問題から大きい部分問題を段階的に解く
        for i in range(3, n + 1):
            dp[i] = dp[i - 1] + dp[i - 2]
        return dp[n]
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    /* 階段登り：動的プログラミング */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // DPテーブルを初期化し、部分問題の解を格納するために使用
        vector<int> dp(n + 1);
        // 初期状態：最小の部分問題の解を事前設定
        dp[1] = 1;
        dp[2] = 2;
        // 状態遷移：小さな問題から大きな部分問題を段階的に解く
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dp.java"
    /* 階段登り：動的プログラミング */
    int climbingStairsDP(int n) {
        if (n == 1 || n == 2)
            return n;
        // DPテーブルを初期化し、部分問題の解を格納するために使用
        int[] dp = new int[n + 1];
        // 初期状態：最小の部分問題の解を事前設定
        dp[1] = 1;
        dp[2] = 2;
        // 状態遷移：小さな問題から大きな部分問題を段階的に解く
        for (int i = 3; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dp.cs"
    [class]{climbing_stairs_dp}-[func]{ClimbingStairsDP}
    ```

=== "Go"

    ```go title="climbing_stairs_dp.go"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    [class]{}-[func]{climbing_stairs_dp}
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dp.kt"
    [class]{}-[func]{climbingStairsDP}
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    [class]{}-[func]{climbing_stairs_dp}
    ```

=== "Zig"

    ```zig title="climbing_stairs_dp.zig"
    [class]{}-[func]{climbingStairsDP}
    ```

下の図は上記コードの実行プロセスをシミュレートしています。

![階段登りの動的プログラミングプロセス](intro_to_dynamic_programming.assets/climbing_stairs_dp.png){ class="animation-figure" }

<p align="center"> 図 14-5 &nbsp; 階段登りの動的プログラミングプロセス </p>

バックトラッキングアルゴリズムと同様に、動的プログラミングも「状態」の概念を使用して問題解決の特定の段階を表現し、各状態は部分問題とその局所最適解に対応します。例えば、階段登り問題の状態は現在のステップ番号 $i$ として定義されます。

上記の内容に基づいて、動的プログラミングでよく使用される用語をまとめることができます。

- 配列 `dp` は<u>DPテーブル</u>と呼ばれ、$dp[i]$ は状態 $i$ に対応する部分問題の解を表します。
- 最小の部分問題（ステップ $1$ と $2$）に対応する状態は<u>初期状態</u>と呼ばれます。
- 再帰式 $dp[i] = dp[i-1] + dp[i-2]$ は<u>状態遷移方程式</u>と呼ばれます。

## 14.1.4 &nbsp; 空間最適化

注意深い読者は**$dp[i]$ は $dp[i-1]$ と $dp[i-2]$ のみに関連するため、すべての部分問題の解を保存するために配列 `dp` を使用する必要がない**ことに気づくでしょう。単に2つの変数を使って反復的に進めることができます。コードは以下の通りです：

=== "Python"

    ```python title="climbing_stairs_dp.py"
    def climbing_stairs_dp_comp(n: int) -> int:
        """階段登り：空間最適化動的プログラミング"""
        if n == 1 or n == 2:
            return n
        a, b = 1, 2
        for _ in range(3, n + 1):
            a, b = b, a + b
        return b
    ```

=== "C++"

    ```cpp title="climbing_stairs_dp.cpp"
    /* 階段登り：空間最適化動的プログラミング */
    int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "Java"

    ```java title="climbing_stairs_dp.java"
    /* 階段登り：空間最適化動的プログラミング */
    int climbingStairsDPComp(int n) {
        if (n == 1 || n == 2)
            return n;
        int a = 1, b = 2;
        for (int i = 3; i <= n; i++) {
            int tmp = b;
            b = a + b;
            a = tmp;
        }
        return b;
    }
    ```

=== "C#"

    ```csharp title="climbing_stairs_dp.cs"
    [class]{climbing_stairs_dp}-[func]{ClimbingStairsDPComp}
    ```

=== "Go"

    ```go title="climbing_stairs_dp.go"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "Swift"

    ```swift title="climbing_stairs_dp.swift"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "JS"

    ```javascript title="climbing_stairs_dp.js"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "TS"

    ```typescript title="climbing_stairs_dp.ts"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "Dart"

    ```dart title="climbing_stairs_dp.dart"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "Rust"

    ```rust title="climbing_stairs_dp.rs"
    [class]{}-[func]{climbing_stairs_dp_comp}
    ```

=== "C"

    ```c title="climbing_stairs_dp.c"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "Kotlin"

    ```kotlin title="climbing_stairs_dp.kt"
    [class]{}-[func]{climbingStairsDPComp}
    ```

=== "Ruby"

    ```ruby title="climbing_stairs_dp.rb"
    [class]{}-[func]{climbing_stairs_dp_comp}
    ```

=== "Zig"

    ```zig title="climbing_stairs_dp.zig"
    [class]{}-[func]{climbingStairsDPComp}
    ```

上記のコードを観察すると、配列 `dp` が占有していた空間が削除されるため、空間計算量は $O(n)$ から $O(1)$ に削減されます。

多くの動的プログラミング問題では、現在の状態は限られた数の前の状態のみに依存するため、必要な状態のみを保持し、「次元削減」によってメモリ空間を節約できます。**この空間最適化技術は「ローリング変数」または「ローリング配列」として知られています**。
