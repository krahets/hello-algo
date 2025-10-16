---
comments: true
---

# 13.4 &nbsp; Nクイーン問題

!!! question

    チェスのルールによると、クイーンは同じ行、列、または対角線上の駒を攻撃できます。$n$ 個のクイーンと $n \times n$ のチェスボードが与えられた場合、2つのクイーンが互いに攻撃できない配置を見つけてください。

以下の図に示すように、$n = 4$ の場合、2つの解があります。バックトラッキングアルゴリズムの観点から、$n \times n$ のチェスボードには $n^2$ 個のマスがあり、すべての可能な選択肢 `choices` を示しています。チェスボードの状態 `state` は、各クイーンが配置されるにつれて継続的に変化します。

![4クイーン問題の解](n_queens_problem.assets/solution_4_queens.png){ class="animation-figure" }

<p align="center"> 図 13-15 &nbsp; 4クイーン問題の解 </p>

以下の図は、この問題の3つの制約を示しています：**複数のクイーンは同じ行、列、または対角線を占有できません**。対角線は主対角線 `\` と副対角線 `/` に分かれることに注意することが重要です。

![Nクイーン問題の制約](n_queens_problem.assets/n_queens_constraints.png){ class="animation-figure" }

<p align="center"> 図 13-16 &nbsp; Nクイーン問題の制約 </p>

### 1. &nbsp; 行ごとの配置戦略

クイーンの数がチェスボードの行数と等しく、どちらも $n$ であるため、**チェスボードの各行には1つのクイーンのみが配置できることが**容易に結論付けられます。

これは、行ごとの配置戦略を採用できることを意味します：最初の行から開始して、最後の行に到達するまで行ごとに1つのクイーンを配置します。

以下の図は、4クイーン問題の行ごとの配置プロセスを示しています。スペースの制限により、図は最初の行の1つの検索分岐のみを展開し、列と対角線の制約を満たさない配置を剪定します。

![行ごとの配置戦略](n_queens_problem.assets/n_queens_placing.png){ class="animation-figure" }

<p align="center"> 図 13-17 &nbsp; 行ごとの配置戦略 </p>

本質的に、**行ごとの配置戦略は剪定関数として機能し**、同じ行に複数のクイーンを配置するすべての検索分岐を除去します。

### 2. &nbsp; 列と対角線の剪定

列の制約を満たすために、長さ $n$ のブール配列 `cols` を使用して、各列にクイーンが占有されているかどうかを追跡できます。各配置決定の前に、`cols` を使用してすでにクイーンがある列を剪定し、バックトラッキング中に動的に更新されます。

!!! tip

    行列の原点は左上隅にあり、行インデックスは上から下に増加し、列インデックスは左から右に増加することに注意してください。

対角線の制約はどうでしょうか？チェスボード上の特定のセルの行と列のインデックスを $(row, col)$ とします。特定の主対角線を選択することで、その対角線上のすべてのセルで差 $row - col$ が同じであることに気付きます。**つまり、$row - col$ は主対角線上で定数値です**。

言い換えると、2つのセルが $row_1 - col_1 = row_2 - col_2$ を満たす場合、それらは確実に同じ主対角線上にあります。このパターンを使用して、以下の図に示す配列 `diags1` を利用して、クイーンが主対角線上にあるかどうかを追跡できます。

同様に、**$row + col$ の和は副対角線上のすべてのセルで定数値です**。配列 `diags2` を使用して副対角線の制約も処理できます。

![列と対角線の制約の処理](n_queens_problem.assets/n_queens_cols_diagonals.png){ class="animation-figure" }

<p align="center"> 図 13-18 &nbsp; 列と対角線の制約の処理 </p>

### 3. &nbsp; コード実装

$n$ 次元の正方行列では、$row - col$ の範囲は $[-n + 1, n - 1]$ で、$row + col$ の範囲は $[0, 2n - 2]$ であることに注意してください。したがって、主対角線と副対角線の数はどちらも $2n - 1$ で、配列 `diags1` と `diags2` の長さは $2n - 1$ です。

=== "Python"

    ```python title="n_queens.py"
    def backtrack(
        row: int,
        n: int,
        state: list[list[str]],
        res: list[list[list[str]]],
        cols: list[bool],
        diags1: list[bool],
        diags2: list[bool],
    ):
        """バックトラッキングアルゴリズム：n クイーン"""
        # すべての行が配置されたら、解を記録
        if row == n:
            res.append([list(row) for row in state])
            return
        # すべての列を走査
        for col in range(n):
            # セルに対応する主対角線と副対角線を計算
            diag1 = row - col + n - 1
            diag2 = row + col
            # 枝刈り：セルの列、主対角線、副対角線にクイーンを配置しない
            if not cols[col] and not diags1[diag1] and not diags2[diag2]:
                # 試行：セルにクイーンを配置
                state[row][col] = "Q"
                cols[col] = diags1[diag1] = diags2[diag2] = True
                # 次の行を配置
                backtrack(row + 1, n, state, res, cols, diags1, diags2)
                # 撤回：セルを空のスポットに復元
                state[row][col] = "#"
                cols[col] = diags1[diag1] = diags2[diag2] = False

    def n_queens(n: int) -> list[list[list[str]]]:
        """n クイーンを解く"""
        # n*n サイズのチェスボードを初期化、'Q' はクイーンを表し、'#' は空のスポットを表す
        state = [["#" for _ in range(n)] for _ in range(n)]
        cols = [False] * n  # クイーンがある列を記録
        diags1 = [False] * (2 * n - 1)  # クイーンがある主対角線を記録
        diags2 = [False] * (2 * n - 1)  # クイーンがある副対角線を記録
        res = []
        backtrack(0, n, state, res, cols, diags1, diags2)

        return res
    ```

=== "C++"

    ```cpp title="n_queens.cpp"
    /* バックトラッキングアルゴリズム：n クイーン */
    void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
                   vector<bool> &diags1, vector<bool> &diags2) {
        // すべての行が配置されたら、解を記録
        if (row == n) {
            res.push_back(state);
            return;
        }
        // すべての列を走査
        for (int col = 0; col < n; col++) {
            // セルに対応する主対角線と副対角線を計算
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪定：セルの列、主対角線、副対角線にクイーンを配置することを許可しない
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 試行：セルにクイーンを配置
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 次の行を配置
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回退：セルを空のスポットに復元
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* n クイーンを解く */
    vector<vector<vector<string>>> nQueens(int n) {
        // n*n サイズのチェスボードを初期化、'Q' はクイーンを表し、'#' は空のスポットを表す
        vector<vector<string>> state(n, vector<string>(n, "#"));
        vector<bool> cols(n, false);           // クイーンのある列を記録
        vector<bool> diags1(2 * n - 1, false); // クイーンのある主対角線を記録
        vector<bool> diags2(2 * n - 1, false); // クイーンのある副対角線を記録
        vector<vector<vector<string>>> res;

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "Java"

    ```java title="n_queens.java"
    /* バックトラッキングアルゴリズム：n クイーン */
    void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // すべての行が配置されたら、解を記録
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
            return;
        }
        // すべての列を走査
        for (int col = 0; col < n; col++) {
            // セルに対応する主対角線と副対角線を計算
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪定：セルの列、主対角線、副対角線にクイーンを配置することを許可しない
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 試行：セルにクイーンを配置
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 次の行を配置
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回退：セルを空のスポットに復元
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* n クイーンを解く */
    List<List<List<String>>> nQueens(int n) {
        // n*n サイズのチェスボードを初期化、'Q' はクイーンを表し、'#' は空のスポットを表す
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // クイーンのある列を記録
        boolean[] diags1 = new boolean[2 * n - 1]; // クイーンのある主対角線を記録
        boolean[] diags2 = new boolean[2 * n - 1]; // クイーンのある副対角線を記録
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "C#"

    ```csharp title="n_queens.cs"
    [class]{n_queens}-[func]{Backtrack}

    [class]{n_queens}-[func]{NQueens}
    ```

=== "Go"

    ```go title="n_queens.go"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{nQueens}
    ```

=== "Swift"

    ```swift title="n_queens.swift"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{nQueens}
    ```

=== "JS"

    ```javascript title="n_queens.js"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{nQueens}
    ```

=== "TS"

    ```typescript title="n_queens.ts"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{nQueens}
    ```

=== "Dart"

    ```dart title="n_queens.dart"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{nQueens}
    ```

=== "Rust"

    ```rust title="n_queens.rs"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{n_queens}
    ```

=== "C"

    ```c title="n_queens.c"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{nQueens}
    ```

=== "Kotlin"

    ```kotlin title="n_queens.kt"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{nQueens}
    ```

=== "Ruby"

    ```ruby title="n_queens.rb"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{n_queens}
    ```

=== "Zig"

    ```zig title="n_queens.zig"
    [class]{}-[func]{backtrack}

    [class]{}-[func]{nQueens}
    ```

$n$ 個のクイーンを行ごとに配置し、列の制約を考慮して、最初の行から最後の行まで、$n$、$n-1$、$\dots$、$2$、$1$ の選択肢があり、$O(n!)$ 時間を使用します。解を記録する際、行列 `state` をコピーして `res` に追加する必要があり、コピー操作は $O(n^2)$ 時間を使用します。したがって、**全体の時間計算量は $O(n! \cdot n^2)$ です**。実際には、対角線制約に基づく剪定により検索空間を大幅に削減できるため、多くの場合、検索効率は上記の時間計算量よりも優れています。

配列 `state` は $O(n^2)$ 空間を使用し、配列 `cols`、`diags1`、`diags2` はそれぞれ $O(n)$ 空間を使用します。最大再帰深度は $n$ で、$O(n)$ のスタックフレーム空間を使用します。したがって、**空間計算量は $O(n^2)$ です**。
