---
comments: true
---

# 14.5 &nbsp; 無制限ナップサック問題

このセクションでは、まず別の一般的なナップサック問題である無制限ナップサックを解決し、次にその特殊ケースであるコイン交換問題を探索します。

## 14.5.1 &nbsp; 無制限ナップサック問題

!!! question

    $n$ 個のアイテムが与えられ、$i$ 番目のアイテムの重量は $wgt[i-1]$ で値は $val[i-1]$ です。容量が $cap$ のバックパックがあります。**各アイテムは複数回選択できます**。容量を超えることなくバックパックに入れることができるアイテムの最大値は何ですか？以下の例を参照してください。

![無制限ナップサック問題の例データ](unbounded_knapsack_problem.assets/unbounded_knapsack_example.png){ class="animation-figure" }

<p align="center"> 図 14-22 &nbsp; 無制限ナップサック問題の例データ </p>

### 1. &nbsp; 動的プログラミングアプローチ

無制限ナップサック問題は0-1ナップサック問題と非常に似ており、**唯一の違いはアイテムを選択できる回数に制限がないことです**。

- 0-1ナップサック問題では、各アイテムは1つしかないため、アイテム $i$ をバックパックに入れた後は、前の $i-1$ 個のアイテムからのみ選択できます。
- 無制限ナップサック問題では、各アイテムの数量は無制限であるため、アイテム $i$ をバックパックに入れた後も、**前の $i$ 個のアイテムから引き続き選択できます**。

無制限ナップサック問題のルールの下で、状態 $[i, c]$ は2つの方法で変化できます。

- **アイテム $i$ を入れない**：0-1ナップサック問題と同様に、$[i-1, c]$ に遷移します。
- **アイテム $i$ を入れる**：0-1ナップサック問題とは異なり、$[i, c-wgt[i-1]]$ に遷移します。

したがって、状態遷移方程式は次のようになります：

$$
dp[i, c] = \max(dp[i-1, c], dp[i, c - wgt[i-1]] + val[i-1])
$$

### 2. &nbsp; コード実装

2つの問題のコードを比較すると、状態遷移が $i-1$ から $i$ に変わり、残りは完全に同一です：

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp(wgt: list[int], val: list[int], cap: int) -> int:
        """完全ナップサック：動的プログラミング"""
        n = len(wgt)
        # dp テーブルを初期化
        dp = [[0] * (cap + 1) for _ in range(n + 1)]
        # 状態遷移
        for i in range(1, n + 1):
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # ナップサック容量を超える場合、アイテム i を選択しない
                    dp[i][c] = dp[i - 1][c]
                else:
                    # アイテム i を選択しないのと選択するのとで大きい値
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1])
        return dp[n][cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* 完全ナップサック：動的プログラミング */
    int unboundedKnapsackDP(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // DPテーブルを初期化
        vector<vector<int>> dp(n + 1, vector<int>(cap + 1, 0));
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、アイテム i を選択しない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 選択しない場合とアイテム i を選択する場合のより大きい値
                    dp[i][c] = max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* 完全ナップサック：動的プログラミング */
    int unboundedKnapsackDP(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // DPテーブルを初期化
        int[][] dp = new int[n + 1][cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、アイテム i を選択しない
                    dp[i][c] = dp[i - 1][c];
                } else {
                    // 選択しない場合とアイテム i を選択する場合のより大きい値
                    dp[i][c] = Math.max(dp[i - 1][c], dp[i][c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[n][cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    [class]{unbounded_knapsack}-[func]{UnboundedKnapsackDP}
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "TS"

    ```typescript title="unbounded_knapsack.ts"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "Dart"

    ```dart title="unbounded_knapsack.dart"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    [class]{}-[func]{unbounded_knapsack_dp}
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "Kotlin"

    ```kotlin title="unbounded_knapsack.kt"
    [class]{}-[func]{unboundedKnapsackDP}
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    [class]{}-[func]{unbounded_knapsack_dp}
    ```

### 3. &nbsp; 空間最適化

現在の状態は左と上の状態から来るため、**空間最適化解法は $dp$ テーブルの各行に対して前方走査を実行する必要があります**。

この走査順序は0-1ナップサックの場合とは逆です。違いを理解するために下の図を参照してください。

=== "<1>"
    ![空間最適化後の無制限ナップサック問題の動的プログラミングプロセス](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step1.png){ class="animation-figure" }

=== "<2>"
    ![unbounded_knapsack_dp_comp_step2](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step2.png){ class="animation-figure" }

=== "<3>"
    ![unbounded_knapsack_dp_comp_step3](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step3.png){ class="animation-figure" }

=== "<4>"
    ![unbounded_knapsack_dp_comp_step4](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step4.png){ class="animation-figure" }

=== "<5>"
    ![unbounded_knapsack_dp_comp_step5](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step5.png){ class="animation-figure" }

=== "<6>"
    ![unbounded_knapsack_dp_comp_step6](unbounded_knapsack_problem.assets/unbounded_knapsack_dp_comp_step6.png){ class="animation-figure" }

<p align="center"> 図 14-23 &nbsp; 空間最適化後の無制限ナップサック問題の動的プログラミングプロセス </p>

コード実装は非常に簡単で、配列 `dp` の最初の次元を削除するだけです：

=== "Python"

    ```python title="unbounded_knapsack.py"
    def unbounded_knapsack_dp_comp(wgt: list[int], val: list[int], cap: int) -> int:
        """完全ナップサック：空間最適化動的プログラミング"""
        n = len(wgt)
        # dp テーブルを初期化
        dp = [0] * (cap + 1)
        # 状態遷移
        for i in range(1, n + 1):
            # 順序で走査
            for c in range(1, cap + 1):
                if wgt[i - 1] > c:
                    # ナップサック容量を超える場合、アイテム i を選択しない
                    dp[c] = dp[c]
                else:
                    # アイテム i を選択しないのと選択するのとで大きい値
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1])
        return dp[cap]
    ```

=== "C++"

    ```cpp title="unbounded_knapsack.cpp"
    /* 完全ナップサック：空間最適化動的プログラミング */
    int unboundedKnapsackDPComp(vector<int> &wgt, vector<int> &val, int cap) {
        int n = wgt.size();
        // DPテーブルを初期化
        vector<int> dp(cap + 1, 0);
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、アイテム i を選択しない
                    dp[c] = dp[c];
                } else {
                    // 選択しない場合とアイテム i を選択する場合のより大きい値
                    dp[c] = max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "Java"

    ```java title="unbounded_knapsack.java"
    /* 完全ナップサック：空間最適化動的プログラミング */
    int unboundedKnapsackDPComp(int[] wgt, int[] val, int cap) {
        int n = wgt.length;
        // DPテーブルを初期化
        int[] dp = new int[cap + 1];
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int c = 1; c <= cap; c++) {
                if (wgt[i - 1] > c) {
                    // ナップサックの容量を超える場合、アイテム i を選択しない
                    dp[c] = dp[c];
                } else {
                    // 選択しない場合とアイテム i を選択する場合のより大きい値
                    dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
                }
            }
        }
        return dp[cap];
    }
    ```

=== "C#"

    ```csharp title="unbounded_knapsack.cs"
    [class]{unbounded_knapsack}-[func]{UnboundedKnapsackDPComp}
    ```

=== "Go"

    ```go title="unbounded_knapsack.go"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "Swift"

    ```swift title="unbounded_knapsack.swift"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "JS"

    ```javascript title="unbounded_knapsack.js"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "TS"

    ```typescript title="unbounded_knapsack.ts"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "Dart"

    ```dart title="unbounded_knapsack.dart"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "Rust"

    ```rust title="unbounded_knapsack.rs"
    [class]{}-[func]{unbounded_knapsack_dp_comp}
    ```

=== "C"

    ```c title="unbounded_knapsack.c"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "Kotlin"

    ```kotlin title="unbounded_knapsack.kt"
    [class]{}-[func]{unboundedKnapsackDPComp}
    ```

=== "Ruby"

    ```ruby title="unbounded_knapsack.rb"
    [class]{}-[func]{unbounded_knapsack_dp_comp}
    ```

## 14.5.2 &nbsp; コイン交換問題

ナップサック問題は動的プログラミング問題の大きなクラスの代表であり、コイン交換問題など多くの変種があります。

!!! question

    $n$ 種類のコインが与えられ、$i$ 番目の種類のコインの額面は $coins[i - 1]$ で、目標金額は $amt$ です。**各種類のコインは複数回選択できます**。目標金額を構成するのに必要な最小コイン数は何ですか？目標金額を構成できない場合は $-1$ を返してください。以下の例を参照してください。

![コイン交換問題の例データ](unbounded_knapsack_problem.assets/coin_change_example.png){ class="animation-figure" }

<p align="center"> 図 14-24 &nbsp; コイン交換問題の例データ </p>

### 1. &nbsp; 動的プログラミングアプローチ

**コイン交換は無制限ナップサック問題の特殊ケースと見なすことができ**、以下の類似点と相違点を共有しています。

- 2つの問題は互いに変換できます：「アイテム」は「コイン」に対応し、「アイテムの重量」は「コインの額面」に対応し、「バックパックの容量」は「目標金額」に対応します。
- 最適化目標は逆です：無制限ナップサック問題はアイテムの値を最大化することを目的とし、コイン交換問題はコインの数を最小化することを目的とします。
- 無制限ナップサック問題はバックパック容量を「超えない」解を求め、コイン交換は目標金額を「正確に」構成する解を求めます。

**第1ステップ：各ラウンドの意思決定を考え、状態を定義し、それにより $dp$ テーブルを導出する**

状態 $[i, a]$ は部分問題に対応します：**最初の $i$ 種類のコインを使用して金額 $a$ を構成できる最小コイン数**、$dp[i, a]$ と表記されます。

二次元 $dp$ テーブルのサイズは $(n+1) \times (amt+1)$ です。

**第2ステップ：最適部分構造を特定し、状態遷移方程式を導出する**

この問題は状態遷移方程式の2つの側面で無制限ナップサック問題と異なります。

- この問題は最小値を求めるため、演算子 $\max()$ を $\min()$ に変更する必要があります。
- 最適化はコインの数に焦点を当てているため、コインが選択されたときに単純に $+1$ を追加します。

$$
dp[i, a] = \min(dp[i-1, a], dp[i, a - coins[i-1]] + 1)
$$

**第3ステップ：境界条件と状態遷移順序を定義する**

目標金額が $0$ の場合、それを構成するのに必要な最小コイン数は $0$ であるため、最初の列のすべての $dp[i, 0]$ は $0$ です。

コインがない場合、**任意の金額 >0 を構成することは不可能**であり、これは無効な解です。状態遷移方程式の $\min()$ 関数が無効な解を認識してフィルタリングできるように、$+\infty$ を使用してそれらを表現することを検討し、つまり最初の行のすべての $dp[0, a]$ を $+\infty$ に設定します。

### 2. &nbsp; コード実装

ほとんどのプログラミング言語は $+\infty$ 変数を提供しておらず、整数 `int` の最大値のみを代替として使用できます。これによりオーバーフローが発生する可能性があります：状態遷移方程式の $+1$ 演算がオーバーフローする可能性があります。

この理由で、数値 $amt + 1$ を使用して無効な解を表します。なぜなら、$amt$ を構成するのに必要な最大コイン数は最大でも $amt$ だからです。結果を返す前に、$dp[n, amt]$ が $amt + 1$ に等しいかどうかを確認し、そうであれば $-1$ を返し、目標金額を構成できないことを示します。コードは以下の通りです：

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp(coins: list[int], amt: int) -> int:
        """硬貨交換：動的プログラミング"""
        n = len(coins)
        MAX = amt + 1
        # dp テーブルを初期化
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # 状態遷移：最初の行と最初の列
        for a in range(1, amt + 1):
            dp[0][a] = MAX
        # 状態遷移：残りの行と列
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 目標金額を超える場合、硬貨 i を選択しない
                    dp[i][a] = dp[i - 1][a]
                else:
                    # 硬貨 i を選択しないのと選択するのとで小さい値
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1)
        return dp[n][amt] if dp[n][amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* 硬貨両替：動的プログラミング */
    int coinChangeDP(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // DPテーブルを初期化
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // 状態遷移：最初の行と最初の列
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選択しない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 選択しない場合と硬貨 i を選択する場合のより小さい値
                    dp[i][a] = min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* 硬貨両替：動的プログラミング */
    int coinChangeDP(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // DPテーブルを初期化
        int[][] dp = new int[n + 1][amt + 1];
        // 状態遷移：最初の行と最初の列
        for (int a = 1; a <= amt; a++) {
            dp[0][a] = MAX;
        }
        // 状態遷移：残りの行と列
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選択しない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 選択しない場合と硬貨 i を選択する場合のより小さい値
                    dp[i][a] = Math.min(dp[i - 1][a], dp[i][a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[n][amt] != MAX ? dp[n][amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    [class]{coin_change}-[func]{CoinChangeDP}
    ```

=== "Go"

    ```go title="coin_change.go"
    [class]{}-[func]{coinChangeDP}
    ```

=== "Swift"

    ```swift title="coin_change.swift"
    [class]{}-[func]{coinChangeDP}
    ```

=== "JS"

    ```javascript title="coin_change.js"
    [class]{}-[func]{coinChangeDP}
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    [class]{}-[func]{coinChangeDP}
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    [class]{}-[func]{coinChangeDP}
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    [class]{}-[func]{coin_change_dp}
    ```

=== "C"

    ```c title="coin_change.c"
    [class]{}-[func]{coinChangeDP}
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    [class]{}-[func]{coinChangeDP}
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    [class]{}-[func]{coin_change_dp}
    ```

下の図はコイン交換問題の動的プログラミングプロセスを示しており、無制限ナップサック問題と非常に似ています。

=== "<1>"
    ![コイン交換問題の動的プログラミングプロセス](unbounded_knapsack_problem.assets/coin_change_dp_step1.png){ class="animation-figure" }

=== "<2>"
    ![coin_change_dp_step2](unbounded_knapsack_problem.assets/coin_change_dp_step2.png){ class="animation-figure" }

=== "<3>"
    ![coin_change_dp_step3](unbounded_knapsack_problem.assets/coin_change_dp_step3.png){ class="animation-figure" }

=== "<4>"
    ![coin_change_dp_step4](unbounded_knapsack_problem.assets/coin_change_dp_step4.png){ class="animation-figure" }

=== "<5>"
    ![coin_change_dp_step5](unbounded_knapsack_problem.assets/coin_change_dp_step5.png){ class="animation-figure" }

=== "<6>"
    ![coin_change_dp_step6](unbounded_knapsack_problem.assets/coin_change_dp_step6.png){ class="animation-figure" }

=== "<7>"
    ![coin_change_dp_step7](unbounded_knapsack_problem.assets/coin_change_dp_step7.png){ class="animation-figure" }

=== "<8>"
    ![coin_change_dp_step8](unbounded_knapsack_problem.assets/coin_change_dp_step8.png){ class="animation-figure" }

=== "<9>"
    ![coin_change_dp_step9](unbounded_knapsack_problem.assets/coin_change_dp_step9.png){ class="animation-figure" }

=== "<10>"
    ![coin_change_dp_step10](unbounded_knapsack_problem.assets/coin_change_dp_step10.png){ class="animation-figure" }

=== "<11>"
    ![coin_change_dp_step11](unbounded_knapsack_problem.assets/coin_change_dp_step11.png){ class="animation-figure" }

=== "<12>"
    ![coin_change_dp_step12](unbounded_knapsack_problem.assets/coin_change_dp_step12.png){ class="animation-figure" }

=== "<13>"
    ![coin_change_dp_step13](unbounded_knapsack_problem.assets/coin_change_dp_step13.png){ class="animation-figure" }

=== "<14>"
    ![coin_change_dp_step14](unbounded_knapsack_problem.assets/coin_change_dp_step14.png){ class="animation-figure" }

=== "<15>"
    ![coin_change_dp_step15](unbounded_knapsack_problem.assets/coin_change_dp_step15.png){ class="animation-figure" }

<p align="center"> 図 14-25 &nbsp; コイン交換問題の動的プログラミングプロセス </p>

### 3. &nbsp; 空間最適化

コイン交換問題の空間最適化は無制限ナップサック問題と同じ方法で処理されます：

=== "Python"

    ```python title="coin_change.py"
    def coin_change_dp_comp(coins: list[int], amt: int) -> int:
        """硬貨交換：空間最適化動的プログラミング"""
        n = len(coins)
        MAX = amt + 1
        # dp テーブルを初期化
        dp = [MAX] * (amt + 1)
        dp[0] = 0
        # 状態遷移
        for i in range(1, n + 1):
            # 順序で走査
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 目標金額を超える場合、硬貨 i を選択しない
                    dp[a] = dp[a]
                else:
                    # 硬貨 i を選択しないのと選択するのとで小さい値
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1)
        return dp[amt] if dp[amt] != MAX else -1
    ```

=== "C++"

    ```cpp title="coin_change.cpp"
    /* 硬貨両替：空間最適化動的プログラミング */
    int coinChangeDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        int MAX = amt + 1;
        // DPテーブルを初期化
        vector<int> dp(amt + 1, MAX);
        dp[0] = 0;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選択しない
                    dp[a] = dp[a];
                } else {
                    // 選択しない場合と硬貨 i を選択する場合のより小さい値
                    dp[a] = min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "Java"

    ```java title="coin_change.java"
    /* 硬貨両替：空間最適化動的プログラミング */
    int coinChangeDPComp(int[] coins, int amt) {
        int n = coins.length;
        int MAX = amt + 1;
        // DPテーブルを初期化
        int[] dp = new int[amt + 1];
        Arrays.fill(dp, MAX);
        dp[0] = 0;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選択しない
                    dp[a] = dp[a];
                } else {
                    // 選択しない場合と硬貨 i を選択する場合のより小さい値
                    dp[a] = Math.min(dp[a], dp[a - coins[i - 1]] + 1);
                }
            }
        }
        return dp[amt] != MAX ? dp[amt] : -1;
    }
    ```

=== "C#"

    ```csharp title="coin_change.cs"
    [class]{coin_change}-[func]{CoinChangeDPComp}
    ```

=== "Go"

    ```go title="coin_change.go"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "Swift"

    ```swift title="coin_change.swift"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "JS"

    ```javascript title="coin_change.js"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "TS"

    ```typescript title="coin_change.ts"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "Dart"

    ```dart title="coin_change.dart"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "Rust"

    ```rust title="coin_change.rs"
    [class]{}-[func]{coin_change_dp_comp}
    ```

=== "C"

    ```c title="coin_change.c"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "Kotlin"

    ```kotlin title="coin_change.kt"
    [class]{}-[func]{coinChangeDPComp}
    ```

=== "Ruby"

    ```ruby title="coin_change.rb"
    [class]{}-[func]{coin_change_dp_comp}
    ```

## 14.5.3 &nbsp; コイン交換問題II

!!! question

    $n$ 種類のコインが与えられ、$i$ 番目の種類のコインの額面は $coins[i - 1]$ で、目標金額は $amt$ です。各種類のコインは複数回選択でき、**目標金額を構成できるコインの組み合わせは何通りありますか**。以下の例を参照してください。

![コイン交換問題IIの例データ](unbounded_knapsack_problem.assets/coin_change_ii_example.png){ class="animation-figure" }

<p align="center"> 図 14-26 &nbsp; コイン交換問題IIの例データ </p>

### 1. &nbsp; 動的プログラミングアプローチ

前の問題と比較して、この問題の目標は組み合わせの数を決定することであるため、部分問題は次のようになります：**最初の $i$ 種類のコインを使用して金額 $a$ を構成できる組み合わせの数**。$dp$ テーブルはサイズ $(n+1) \times (amt + 1)$ の二次元行列のまま残ります。

現在の状態の組み合わせ数は、現在のコインを選択しない組み合わせと現在のコインを選択する組み合わせの合計です。状態遷移方程式は：

$$
dp[i, a] = dp[i-1, a] + dp[i, a - coins[i-1]]
$$

目標金額が $0$ の場合、目標金額を構成するのにコインは必要ないため、最初の列のすべての $dp[i, 0]$ は $1$ に初期化されるべきです。コインがない場合、任意の金額 >0 を構成することは不可能であるため、最初の行のすべての $dp[0, a]$ は $0$ に設定されるべきです。

### 2. &nbsp; コード実装

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp(coins: list[int], amt: int) -> int:
        """硬貨交換 II：動的プログラミング"""
        n = len(coins)
        # dp テーブルを初期化
        dp = [[0] * (amt + 1) for _ in range(n + 1)]
        # 最初の列を初期化
        for i in range(n + 1):
            dp[i][0] = 1
        # 状態遷移
        for i in range(1, n + 1):
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 目標金額を超える場合、硬貨 i を選択しない
                    dp[i][a] = dp[i - 1][a]
                else:
                    # 硬貨 i を選択しないのと選択するのとの両方の選択肢の和
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]]
        return dp[n][amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* 硬貨両替 II：動的プログラミング */
    int coinChangeIIDP(vector<int> &coins, int amt) {
        int n = coins.size();
        // DPテーブルを初期化
        vector<vector<int>> dp(n + 1, vector<int>(amt + 1, 0));
        // 最初の列を初期化
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選択しない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 選択しない場合と硬貨 i を選択する場合の2つの選択肢の合計
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* 硬貨両替 II：動的プログラミング */
    int coinChangeIIDP(int[] coins, int amt) {
        int n = coins.length;
        // DPテーブルを初期化
        int[][] dp = new int[n + 1][amt + 1];
        // 最初の列を初期化
        for (int i = 0; i <= n; i++) {
            dp[i][0] = 1;
        }
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選択しない
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // 選択しない場合と硬貨 i を選択する場合の2つの選択肢の合計
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }
        return dp[n][amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    [class]{coin_change_ii}-[func]{CoinChangeIIDP}
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    [class]{}-[func]{coin_change_ii_dp}
    ```

=== "C"

    ```c title="coin_change_ii.c"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    [class]{}-[func]{coinChangeIIDP}
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    [class]{}-[func]{coin_change_ii_dp}
    ```

### 3. &nbsp; 空間最適化

空間最適化アプローチは同じで、コインの次元を削除するだけです：

=== "Python"

    ```python title="coin_change_ii.py"
    def coin_change_ii_dp_comp(coins: list[int], amt: int) -> int:
        """硬貨交換 II：空間最適化動的プログラミング"""
        n = len(coins)
        # dp テーブルを初期化
        dp = [0] * (amt + 1)
        dp[0] = 1
        # 状態遷移
        for i in range(1, n + 1):
            # 順序で走査
            for a in range(1, amt + 1):
                if coins[i - 1] > a:
                    # 目標金額を超える場合、硬貨 i を選択しない
                    dp[a] = dp[a]
                else:
                    # 硬貨 i を選択しないのと選択するのとの両方の選択肢の和
                    dp[a] = dp[a] + dp[a - coins[i - 1]]
        return dp[amt]
    ```

=== "C++"

    ```cpp title="coin_change_ii.cpp"
    /* 硬貨両替 II：空間最適化動的プログラミング */
    int coinChangeIIDPComp(vector<int> &coins, int amt) {
        int n = coins.size();
        // DPテーブルを初期化
        vector<int> dp(amt + 1, 0);
        dp[0] = 1;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選択しない
                    dp[a] = dp[a];
                } else {
                    // 選択しない場合と硬貨 i を選択する場合の2つの選択肢の合計
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "Java"

    ```java title="coin_change_ii.java"
    /* 硬貨両替 II：空間最適化動的プログラミング */
    int coinChangeIIDPComp(int[] coins, int amt) {
        int n = coins.length;
        // DPテーブルを初期化
        int[] dp = new int[amt + 1];
        dp[0] = 1;
        // 状態遷移
        for (int i = 1; i <= n; i++) {
            for (int a = 1; a <= amt; a++) {
                if (coins[i - 1] > a) {
                    // 目標金額を超える場合、硬貨 i を選択しない
                    dp[a] = dp[a];
                } else {
                    // 選択しない場合と硬貨 i を選択する場合の2つの選択肢の合計
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }
        return dp[amt];
    }
    ```

=== "C#"

    ```csharp title="coin_change_ii.cs"
    [class]{coin_change_ii}-[func]{CoinChangeIIDPComp}
    ```

=== "Go"

    ```go title="coin_change_ii.go"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "Swift"

    ```swift title="coin_change_ii.swift"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "JS"

    ```javascript title="coin_change_ii.js"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "TS"

    ```typescript title="coin_change_ii.ts"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "Dart"

    ```dart title="coin_change_ii.dart"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "Rust"

    ```rust title="coin_change_ii.rs"
    [class]{}-[func]{coin_change_ii_dp_comp}
    ```

=== "C"

    ```c title="coin_change_ii.c"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "Kotlin"

    ```kotlin title="coin_change_ii.kt"
    [class]{}-[func]{coinChangeIIDPComp}
    ```

=== "Ruby"

    ```ruby title="coin_change_ii.rb"
    [class]{}-[func]{coin_change_ii_dp_comp}
    ```
