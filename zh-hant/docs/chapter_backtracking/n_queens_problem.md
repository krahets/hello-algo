---
comments: true
---

# 13.4 &nbsp; n 皇后問題

!!! question

    依照西洋棋規則，皇后可以攻擊與它同列、同欄或位於同一條對角線上的棋子。給定 $n$ 個皇后和一個 $n \times n$ 的棋盤，找出所有皇后都無法互相攻擊的擺法。

如圖 13-15 所示，當 $n = 4$ 時，共有兩個解。從回溯演算法的角度來看，$n \times n$ 的棋盤共有 $n^2$ 格，這些格子構成所有選項 `choices`。隨著皇后逐一放上棋盤，盤面也會改變，每一刻的盤面就是當時的狀態 `state`。

![4 皇后問題的解](n_queens_problem.assets/solution_4_queens.svg){ class="animation-figure" }

<p align="center"> 圖 13-15 &nbsp; 4 皇后問題的解 </p>

圖 13-16 呈現本題的三項限制：**任兩個皇后都不可同列、同欄或位於同一條對角線上**。對角線又分為主對角線 `\` 和副對角線 `/`。

![n 皇后問題的限制條件](n_queens_problem.assets/n_queens_constraints.svg){ class="animation-figure" }

<p align="center"> 圖 13-16 &nbsp; n 皇后問題的限制條件 </p>

### 1. &nbsp; 逐列放置的策略

皇后個數與棋盤列數都是 $n$，因此可推得：**棋盤的每一列都必須剛好放一個皇后**。

因此，我們可以逐列放置皇后。從第一列開始，每一列放一個，直到最後一列放完為止。

圖 13-17 呈現 4 皇后問題中逐列放置皇后的過程。限於篇幅，第一列只展開其中一個搜尋分支，違反欄或對角線限制的擺法則已剪去。

![逐列放置的策略](n_queens_problem.assets/n_queens_placing.svg){ class="animation-figure" }

<p align="center"> 圖 13-17 &nbsp; 逐列放置的策略 </p>

實際上，**逐列放置本身就有剪枝的效果**，因為它避開了同一列出現多個皇后的所有搜尋分支。

### 2. &nbsp; 依欄與對角線剪枝

為了符合欄的限制，可以用長度為 $n$ 的布林陣列 `cols`，記錄每一欄是否已有皇后。每次放置前，利用 `cols` 剪去已有皇后的欄，並在回溯搜尋過程中隨時更新 `cols` 的狀態。

!!! tip

    矩陣的起點位於左上角。列索引由上往下遞增，欄索引則由左往右遞增。

該如何處理對角線的限制呢？設棋盤上某格的列、欄索引為 $(row, col)$。任選一條主對角線觀察，會發現這條線上每一格的列索引減去欄索引都相同，**也就是同一條主對角線上每一格的 $row - col$ 都是定值**。

換句話說，若兩格滿足 $row_1 - col_1 = row_2 - col_2$，就一定位於同一條主對角線上。利用這項規律，我們可以用圖 13-18 的陣列 `diags1` 記錄每條主對角線上是否已有皇后。

同理，**同一條副對角線上每一格的 $row + col$ 都是定值**。因此，也能用陣列 `diags2` 處理副對角線的限制。

![處理欄與對角線的限制](n_queens_problem.assets/n_queens_cols_diagonals.svg){ class="animation-figure" }

<p align="center"> 圖 13-18 &nbsp; 處理欄與對角線的限制 </p>

### 3. &nbsp; 程式實作

在 $n$ 階方陣中，$row - col$ 的範圍為 $[-n + 1, n - 1]$，$row + col$ 的範圍為 $[0, 2n - 2]$。因此，主對角線與副對角線各有 $2n - 1$ 條，陣列 `diags1` 與 `diags2` 的長度也都是 $2n - 1$。

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
        """回溯演算法：n 皇后"""
        # 每一列都放好皇后後，記錄此解
        if row == n:
            res.append([list(row) for row in state])
            return
        # 逐一檢查各欄
        for col in range(n):
            # 計算這一格對應的主對角線與副對角線索引
            diag1 = row - col + n - 1
            diag2 = row + col
            # 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
            if not cols[col] and not diags1[diag1] and not diags2[diag2]:
                # 嘗試：將皇后放在這一格
                state[row][col] = "Q"
                cols[col] = diags1[diag1] = diags2[diag2] = True
                # 在下一列放置皇后
                backtrack(row + 1, n, state, res, cols, diags1, diags2)
                # 回溯：將這一格還原為空位
                state[row][col] = "#"
                cols[col] = diags1[diag1] = diags2[diag2] = False

    def n_queens(n: int) -> list[list[list[str]]]:
        """求解 n 皇后問題"""
        # 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        state = [["#" for _ in range(n)] for _ in range(n)]
        cols = [False] * n  # 記錄各欄是否已有皇后
        diags1 = [False] * (2 * n - 1)  # 記錄各主對角線上是否已有皇后
        diags2 = [False] * (2 * n - 1)  # 記錄各副對角線上是否已有皇后
        res = []
        backtrack(0, n, state, res, cols, diags1, diags2)

        return res
    ```

=== "C++"

    ```cpp title="n_queens.cpp"
    /* 回溯演算法：n 皇后 */
    void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
                   vector<bool> &diags1, vector<bool> &diags2) {
        // 每一列都放好皇后後，記錄此解
        if (row == n) {
            res.push_back(state);
            return;
        }
        // 逐一檢查各欄
        for (int col = 0; col < n; col++) {
            // 計算這一格對應的主對角線與副對角線索引
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 嘗試：將皇后放在這一格
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 在下一列放置皇后
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回溯：將這一格還原為空位
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后問題 */
    vector<vector<vector<string>>> nQueens(int n) {
        // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        vector<vector<string>> state(n, vector<string>(n, "#"));
        vector<bool> cols(n, false);           // 記錄各欄是否已有皇后
        vector<bool> diags1(2 * n - 1, false); // 記錄各主對角線上是否已有皇后
        vector<bool> diags2(2 * n - 1, false); // 記錄各副對角線上是否已有皇后
        vector<vector<vector<string>>> res;

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "Java"

    ```java title="n_queens.java"
    /* 回溯演算法：n 皇后 */
    void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // 每一列都放好皇后後，記錄此解
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
            return;
        }
        // 逐一檢查各欄
        for (int col = 0; col < n; col++) {
            // 計算這一格對應的主對角線與副對角線索引
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 嘗試：將皇后放在這一格
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 在下一列放置皇后
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回溯：將這一格還原為空位
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后問題 */
    List<List<List<String>>> nQueens(int n) {
        // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // 記錄各欄是否已有皇后
        boolean[] diags1 = new boolean[2 * n - 1]; // 記錄各主對角線上是否已有皇后
        boolean[] diags2 = new boolean[2 * n - 1]; // 記錄各副對角線上是否已有皇后
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "C#"

    ```csharp title="n_queens.cs"
    /* 回溯演算法：n 皇后 */
    void Backtrack(int row, int n, List<List<string>> state, List<List<List<string>>> res,
            bool[] cols, bool[] diags1, bool[] diags2) {
        // 每一列都放好皇后後，記錄此解
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
            return;
        }
        // 逐一檢查各欄
        for (int col = 0; col < n; col++) {
            // 計算這一格對應的主對角線與副對角線索引
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 嘗試：將皇后放在這一格
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 在下一列放置皇后
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回溯：將這一格還原為空位
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后問題 */
    List<List<List<string>>> NQueens(int n) {
        // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // 記錄各欄是否已有皇后
        bool[] diags1 = new bool[2 * n - 1]; // 記錄各主對角線上是否已有皇后
        bool[] diags2 = new bool[2 * n - 1]; // 記錄各副對角線上是否已有皇后
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "Go"

    ```go title="n_queens.go"
    /* 回溯演算法：n 皇后 */
    func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
        // 每一列都放好皇后後，記錄此解
        if row == n {
            newState := make([][]string, len(*state))
            for i, _ := range newState {
                newState[i] = make([]string, len((*state)[0]))
                copy(newState[i], (*state)[i])

            }
            *res = append(*res, newState)
            return
        }
        // 逐一檢查各欄
        for col := 0; col < n; col++ {
            // 計算這一格對應的主對角線與副對角線索引
            diag1 := row - col + n - 1
            diag2 := row + col
            // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
            if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
                // 嘗試：將皇后放在這一格
                (*state)[row][col] = "Q"
                (*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
                // 在下一列放置皇后
                backtrack(row+1, n, state, res, cols, diags1, diags2)
                // 回溯：將這一格還原為空位
                (*state)[row][col] = "#"
                (*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
            }
        }
    }

    /* 求解 n 皇后問題 */
    func nQueens(n int) [][][]string {
        // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        state := make([][]string, n)
        for i := 0; i < n; i++ {
            row := make([]string, n)
            for i := 0; i < n; i++ {
                row[i] = "#"
            }
            state[i] = row
        }
        // 記錄各欄是否已有皇后
        cols := make([]bool, n)
        diags1 := make([]bool, 2*n-1)
        diags2 := make([]bool, 2*n-1)
        res := make([][][]string, 0)
        backtrack(0, n, &state, &res, &cols, &diags1, &diags2)
        return res
    }
    ```

=== "Swift"

    ```swift title="n_queens.swift"
    /* 回溯演算法：n 皇后 */
    func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
        // 每一列都放好皇后後，記錄此解
        if row == n {
            res.append(state)
            return
        }
        // 逐一檢查各欄
        for col in 0 ..< n {
            // 計算這一格對應的主對角線與副對角線索引
            let diag1 = row - col + n - 1
            let diag2 = row + col
            // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
            if !cols[col] && !diags1[diag1] && !diags2[diag2] {
                // 嘗試：將皇后放在這一格
                state[row][col] = "Q"
                cols[col] = true
                diags1[diag1] = true
                diags2[diag2] = true
                // 在下一列放置皇后
                backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
                // 回溯：將這一格還原為空位
                state[row][col] = "#"
                cols[col] = false
                diags1[diag1] = false
                diags2[diag2] = false
            }
        }
    }

    /* 求解 n 皇后問題 */
    func nQueens(n: Int) -> [[[String]]] {
        // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        var state = Array(repeating: Array(repeating: "#", count: n), count: n)
        var cols = Array(repeating: false, count: n) // 記錄各欄是否已有皇后
        var diags1 = Array(repeating: false, count: 2 * n - 1) // 記錄各主對角線上是否已有皇后
        var diags2 = Array(repeating: false, count: 2 * n - 1) // 記錄各副對角線上是否已有皇后
        var res: [[[String]]] = []

        backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

        return res
    }
    ```

=== "JS"

    ```javascript title="n_queens.js"
    /* 回溯演算法：n 皇后 */
    function backtrack(row, n, state, res, cols, diags1, diags2) {
        // 每一列都放好皇后後，記錄此解
        if (row === n) {
            res.push(state.map((row) => row.slice()));
            return;
        }
        // 逐一檢查各欄
        for (let col = 0; col < n; col++) {
            // 計算這一格對應的主對角線與副對角線索引
            const diag1 = row - col + n - 1;
            const diag2 = row + col;
            // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 嘗試：將皇后放在這一格
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 在下一列放置皇后
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回溯：將這一格還原為空位
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后問題 */
    function nQueens(n) {
        // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        const state = Array.from({ length: n }, () => Array(n).fill('#'));
        const cols = Array(n).fill(false); // 記錄各欄是否已有皇后
        const diags1 = Array(2 * n - 1).fill(false); // 記錄各主對角線上是否已有皇后
        const diags2 = Array(2 * n - 1).fill(false); // 記錄各副對角線上是否已有皇后
        const res = [];

        backtrack(0, n, state, res, cols, diags1, diags2);
        return res;
    }
    ```

=== "TS"

    ```typescript title="n_queens.ts"
    /* 回溯演算法：n 皇后 */
    function backtrack(
        row: number,
        n: number,
        state: string[][],
        res: string[][][],
        cols: boolean[],
        diags1: boolean[],
        diags2: boolean[]
    ): void {
        // 每一列都放好皇后後，記錄此解
        if (row === n) {
            res.push(state.map((row) => row.slice()));
            return;
        }
        // 逐一檢查各欄
        for (let col = 0; col < n; col++) {
            // 計算這一格對應的主對角線與副對角線索引
            const diag1 = row - col + n - 1;
            const diag2 = row + col;
            // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 嘗試：將皇后放在這一格
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 在下一列放置皇后
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回溯：將這一格還原為空位
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后問題 */
    function nQueens(n: number): string[][][] {
        // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        const state = Array.from({ length: n }, () => Array(n).fill('#'));
        const cols = Array(n).fill(false); // 記錄各欄是否已有皇后
        const diags1 = Array(2 * n - 1).fill(false); // 記錄各主對角線上是否已有皇后
        const diags2 = Array(2 * n - 1).fill(false); // 記錄各副對角線上是否已有皇后
        const res: string[][][] = [];

        backtrack(0, n, state, res, cols, diags1, diags2);
        return res;
    }
    ```

=== "Dart"

    ```dart title="n_queens.dart"
    /* 回溯演算法：n 皇后 */
    void backtrack(
      int row,
      int n,
      List<List<String>> state,
      List<List<List<String>>> res,
      List<bool> cols,
      List<bool> diags1,
      List<bool> diags2,
    ) {
      // 每一列都放好皇后後，記錄此解
      if (row == n) {
        List<List<String>> copyState = [];
        for (List<String> sRow in state) {
          copyState.add(List.from(sRow));
        }
        res.add(copyState);
        return;
      }
      // 逐一檢查各欄
      for (int col = 0; col < n; col++) {
        // 計算這一格對應的主對角線與副對角線索引
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
          // 嘗試：將皇后放在這一格
          state[row][col] = "Q";
          cols[col] = true;
          diags1[diag1] = true;
          diags2[diag2] = true;
          // 在下一列放置皇后
          backtrack(row + 1, n, state, res, cols, diags1, diags2);
          // 回溯：將這一格還原為空位
          state[row][col] = "#";
          cols[col] = false;
          diags1[diag1] = false;
          diags2[diag2] = false;
        }
      }
    }

    /* 求解 n 皇后問題 */
    List<List<List<String>>> nQueens(int n) {
      // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
      List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
      List<bool> cols = List.filled(n, false); // 記錄各欄是否已有皇后
      List<bool> diags1 = List.filled(2 * n - 1, false); // 記錄各主對角線上是否已有皇后
      List<bool> diags2 = List.filled(2 * n - 1, false); // 記錄各副對角線上是否已有皇后
      List<List<List<String>>> res = [];

      backtrack(0, n, state, res, cols, diags1, diags2);

      return res;
    }
    ```

=== "Rust"

    ```rust title="n_queens.rs"
    /* 回溯演算法：n 皇后 */
    fn backtrack(
        row: usize,
        n: usize,
        state: &mut Vec<Vec<String>>,
        res: &mut Vec<Vec<Vec<String>>>,
        cols: &mut [bool],
        diags1: &mut [bool],
        diags2: &mut [bool],
    ) {
        // 每一列都放好皇后後，記錄此解
        if row == n {
            res.push(state.clone());
            return;
        }
        // 逐一檢查各欄
        for col in 0..n {
            // 計算這一格對應的主對角線與副對角線索引
            let diag1 = row + n - 1 - col;
            let diag2 = row + col;
            // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
            if !cols[col] && !diags1[diag1] && !diags2[diag2] {
                // 嘗試：將皇后放在這一格
                state[row][col] = "Q".into();
                (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
                // 在下一列放置皇后
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回溯：將這一格還原為空位
                state[row][col] = "#".into();
                (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
            }
        }
    }

    /* 求解 n 皇后問題 */
    fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
        // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
        let mut cols = vec![false; n]; // 記錄各欄是否已有皇后
        let mut diags1 = vec![false; 2 * n - 1]; // 記錄各主對角線上是否已有皇后
        let mut diags2 = vec![false; 2 * n - 1]; // 記錄各副對角線上是否已有皇后
        let mut res: Vec<Vec<Vec<String>>> = Vec::new();

        backtrack(
            0,
            n,
            &mut state,
            &mut res,
            &mut cols,
            &mut diags1,
            &mut diags2,
        );

        res
    }
    ```

=== "C"

    ```c title="n_queens.c"
    /* 回溯演算法：n 皇后 */
    void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
                   bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
        // 每一列都放好皇后後，記錄此解
        if (row == n) {
            res[*resSize] = (char **)malloc(sizeof(char *) * n);
            for (int i = 0; i < n; ++i) {
                res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
                strcpy(res[*resSize][i], state[i]);
            }
            (*resSize)++;
            return;
        }
        // 逐一檢查各欄
        for (int col = 0; col < n; col++) {
            // 計算這一格對應的主對角線與副對角線索引
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 嘗試：將皇后放在這一格
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 在下一列放置皇后
                backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
                // 回溯：將這一格還原為空位
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后問題 */
    char ***nQueens(int n, int *returnSize) {
        char state[MAX_SIZE][MAX_SIZE];
        // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                state[i][j] = '#';
            }
            state[i][n] = '\0';
        }
        bool cols[MAX_SIZE] = {false};           // 記錄各欄是否已有皇后
        bool diags1[2 * MAX_SIZE - 1] = {false}; // 記錄各主對角線上是否已有皇后
        bool diags2[2 * MAX_SIZE - 1] = {false}; // 記錄各副對角線上是否已有皇后

        char ***res = (char ***)malloc(sizeof(char **) * MAX_SIZE);
        *returnSize = 0;
        backtrack(0, n, state, res, returnSize, cols, diags1, diags2);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="n_queens.kt"
    /* 回溯演算法：n 皇后 */
    fun backtrack(
        row: Int,
        n: Int,
        state: MutableList<MutableList<String>>,
        res: MutableList<MutableList<MutableList<String>>?>,
        cols: BooleanArray,
        diags1: BooleanArray,
        diags2: BooleanArray
    ) {
        // 每一列都放好皇后後，記錄此解
        if (row == n) {
            val copyState = mutableListOf<MutableList<String>>()
            for (sRow in state) {
                copyState.add(sRow.toMutableList())
            }
            res.add(copyState)
            return
        }
        // 逐一檢查各欄
        for (col in 0..<n) {
            // 計算這一格對應的主對角線與副對角線索引
            val diag1 = row - col + n - 1
            val diag2 = row + col
            // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 嘗試：將皇后放在這一格
                state[row][col] = "Q"
                diags2[diag2] = true
                diags1[diag1] = diags2[diag2]
                cols[col] = diags1[diag1]
                // 在下一列放置皇后
                backtrack(row + 1, n, state, res, cols, diags1, diags2)
                // 回溯：將這一格還原為空位
                state[row][col] = "#"
                diags2[diag2] = false
                diags1[diag1] = diags2[diag2]
                cols[col] = diags1[diag1]
            }
        }
    }

    /* 求解 n 皇后問題 */
    fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
        // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
        val state = mutableListOf<MutableList<String>>()
        for (i in 0..<n) {
            val row = mutableListOf<String>()
            for (j in 0..<n) {
                row.add("#")
            }
            state.add(row)
        }
        val cols = BooleanArray(n) // 記錄各欄是否已有皇后
        val diags1 = BooleanArray(2 * n - 1) // 記錄各主對角線上是否已有皇后
        val diags2 = BooleanArray(2 * n - 1) // 記錄各副對角線上是否已有皇后
        val res = mutableListOf<MutableList<MutableList<String>>?>()

        backtrack(0, n, state, res, cols, diags1, diags2)

        return res
    }
    ```

=== "Ruby"

    ```ruby title="n_queens.rb"
    ### 回溯演算法：n 皇后 ###
    def backtrack(row, n, state, res, cols, diags1, diags2)
      # 每一列都放好皇后後，記錄此解
      if row == n
        res << state.map { |row| row.dup }
        return
      end

      # 逐一檢查各欄
      for col in 0...n
        # 計算這一格對應的主對角線與副對角線索引
        diag1 = row - col + n - 1
        diag2 = row + col
        # 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
        if !cols[col] && !diags1[diag1] && !diags2[diag2]
          # 嘗試：將皇后放在這一格
          state[row][col] = "Q"
          cols[col] = diags1[diag1] = diags2[diag2] = true
          # 在下一列放置皇后
          backtrack(row + 1, n, state, res, cols, diags1, diags2)
          # 回溯：將這一格還原為空位
          state[row][col] = "#"
          cols[col] = diags1[diag1] = diags2[diag2] = false
        end
      end
    end

    ### 求解 n 皇后問題 ###
    def n_queens(n)
      # 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
      state = Array.new(n) { Array.new(n, "#") }
      cols = Array.new(n, false) # 記錄各欄是否已有皇后
      diags1 = Array.new(2 * n - 1, false) # 記錄各主對角線上是否已有皇后
      diags2 = Array.new(2 * n - 1, false) # 記錄各副對角線上是否已有皇后
      res = []
      backtrack(0, n, state, res, cols, diags1, diags2)

      res
    end
    ```

??? pythontutor "執行視覺化示範"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="執行視覺化示範" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20row%3A%20int,%0A%20%20%20%20n%3A%20int,%0A%20%20%20%20state%3A%20list%5Blist%5Bstr%5D%5D,%0A%20%20%20%20res%3A%20list%5Blist%5Blist%5Bstr%5D%5D%5D,%0A%20%20%20%20cols%3A%20list%5Bbool%5D,%0A%20%20%20%20diags1%3A%20list%5Bbool%5D,%0A%20%20%20%20diags2%3A%20list%5Bbool%5D,%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E6%BC%94%E7%AE%97%E6%B3%95%EF%BC%9AN%20%E7%9A%87%E5%90%8E%22%22%22%0A%20%20%20%20%23%20%E6%AF%8F%E4%B8%80%E5%88%97%E9%83%BD%E6%94%BE%E5%A5%BD%E7%9A%87%E5%90%8E%E5%BE%8C%EF%BC%8C%E8%A8%98%E9%8C%84%E6%AD%A4%E8%A7%A3%0A%20%20%20%20if%20row%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res.append%28%5Blist%28row%29%20for%20row%20in%20state%5D%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%80%90%E4%B8%80%E6%AA%A2%E6%9F%A5%E5%90%84%E6%AC%84%0A%20%20%20%20for%20col%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%A8%88%E7%AE%97%E9%80%99%E4%B8%80%E6%A0%BC%E5%B0%8D%E6%87%89%E7%9A%84%E4%B8%BB%E5%B0%8D%E8%A7%92%E7%B7%9A%E8%88%87%E5%89%AF%E5%B0%8D%E8%A7%92%E7%B7%9A%E7%B4%A2%E5%BC%95%0A%20%20%20%20%20%20%20%20diag1%20%3D%20row%20-%20col%20%2B%20n%20-%201%0A%20%20%20%20%20%20%20%20diag2%20%3D%20row%20%2B%20col%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E9%80%99%E4%B8%80%E6%A0%BC%E6%89%80%E5%9C%A8%E7%9A%84%E6%AC%84%E3%80%81%E4%B8%BB%E5%B0%8D%E8%A7%92%E7%B7%9A%E5%8F%8A%E5%89%AF%E5%B0%8D%E8%A7%92%E7%B7%9A%E9%83%BD%E4%B8%8D%E8%83%BD%E5%B7%B2%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20%20%20%20%20if%20not%20cols%5Bcol%5D%20and%20not%20diags1%5Bdiag1%5D%20and%20not%20diags2%5Bdiag2%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%98%97%E8%A9%A6%EF%BC%9A%E5%B0%87%E7%9A%87%E5%90%8E%E6%94%BE%E5%9C%A8%E9%80%99%E4%B8%80%E6%A0%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%22Q%22%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E4%B8%8B%E4%B8%80%E5%88%97%E6%94%BE%E7%BD%AE%E7%9A%87%E5%90%8E%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28row%20%2B%201,%20n,%20state,%20res,%20cols,%20diags1,%20diags2%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E6%BA%AF%EF%BC%9A%E5%B0%87%E9%80%99%E4%B8%80%E6%A0%BC%E9%82%84%E5%8E%9F%E7%82%BA%E7%A9%BA%E4%BD%8D%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%22%23%22%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20False%0A%0A%0Adef%20n_queens%28n%3A%20int%29%20-%3E%20list%5Blist%5Blist%5Bstr%5D%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%20N%20%E7%9A%87%E5%90%8E%E5%95%8F%E9%A1%8C%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20n%2An%20%E6%A3%8B%E7%9B%A4%EF%BC%8C%27Q%27%20%E4%BB%A3%E8%A1%A8%E7%9A%87%E5%90%8E%EF%BC%8C%27%23%27%20%E4%BB%A3%E8%A1%A8%E7%A9%BA%E4%BD%8D%0A%20%20%20%20state%20%3D%20%5B%5B%22%23%22%20for%20_%20in%20range%28n%29%5D%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20cols%20%3D%20%5BFalse%5D%20%2A%20n%20%20%23%20%E8%A8%98%E9%8C%84%E5%90%84%E6%AC%84%E6%98%AF%E5%90%A6%E5%B7%B2%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20diags1%20%3D%20%5BFalse%5D%20%2A%20%282%20%2A%20n%20-%201%29%20%20%23%20%E8%A8%98%E9%8C%84%E5%90%84%E4%B8%BB%E5%B0%8D%E8%A7%92%E7%B7%9A%E4%B8%8A%E6%98%AF%E5%90%A6%E5%B7%B2%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20diags2%20%3D%20%5BFalse%5D%20%2A%20%282%20%2A%20n%20-%201%29%20%20%23%20%E8%A8%98%E9%8C%84%E5%90%84%E5%89%AF%E5%B0%8D%E8%A7%92%E7%B7%9A%E4%B8%8A%E6%98%AF%E5%90%A6%E5%B7%B2%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%280,%20n,%20state,%20res,%20cols,%20diags1,%20diags2%29%0A%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20res%20%3D%20n_queens%28n%29%0A%0A%20%20%20%20print%28f%22%E8%BC%B8%E5%85%A5%E6%A3%8B%E7%9B%A4%E7%9A%84%E9%82%8A%E9%95%B7%E7%82%BA%20%7Bn%7D%22%29%0A%20%20%20%20print%28f%22%E7%9A%87%E5%90%8E%E5%85%B1%E6%9C%89%20%7Blen%28res%29%7D%20%E7%A8%AE%E6%93%BA%E6%B3%95%22%29%0A%20%20%20%20for%20state%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%22--------------------%22%29%0A%20%20%20%20%20%20%20%20for%20row%20in%20state%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28row%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=61&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20row%3A%20int,%0A%20%20%20%20n%3A%20int,%0A%20%20%20%20state%3A%20list%5Blist%5Bstr%5D%5D,%0A%20%20%20%20res%3A%20list%5Blist%5Blist%5Bstr%5D%5D%5D,%0A%20%20%20%20cols%3A%20list%5Bbool%5D,%0A%20%20%20%20diags1%3A%20list%5Bbool%5D,%0A%20%20%20%20diags2%3A%20list%5Bbool%5D,%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E6%BC%94%E7%AE%97%E6%B3%95%EF%BC%9AN%20%E7%9A%87%E5%90%8E%22%22%22%0A%20%20%20%20%23%20%E6%AF%8F%E4%B8%80%E5%88%97%E9%83%BD%E6%94%BE%E5%A5%BD%E7%9A%87%E5%90%8E%E5%BE%8C%EF%BC%8C%E8%A8%98%E9%8C%84%E6%AD%A4%E8%A7%A3%0A%20%20%20%20if%20row%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res.append%28%5Blist%28row%29%20for%20row%20in%20state%5D%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%80%90%E4%B8%80%E6%AA%A2%E6%9F%A5%E5%90%84%E6%AC%84%0A%20%20%20%20for%20col%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%A8%88%E7%AE%97%E9%80%99%E4%B8%80%E6%A0%BC%E5%B0%8D%E6%87%89%E7%9A%84%E4%B8%BB%E5%B0%8D%E8%A7%92%E7%B7%9A%E8%88%87%E5%89%AF%E5%B0%8D%E8%A7%92%E7%B7%9A%E7%B4%A2%E5%BC%95%0A%20%20%20%20%20%20%20%20diag1%20%3D%20row%20-%20col%20%2B%20n%20-%201%0A%20%20%20%20%20%20%20%20diag2%20%3D%20row%20%2B%20col%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E9%80%99%E4%B8%80%E6%A0%BC%E6%89%80%E5%9C%A8%E7%9A%84%E6%AC%84%E3%80%81%E4%B8%BB%E5%B0%8D%E8%A7%92%E7%B7%9A%E5%8F%8A%E5%89%AF%E5%B0%8D%E8%A7%92%E7%B7%9A%E9%83%BD%E4%B8%8D%E8%83%BD%E5%B7%B2%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20%20%20%20%20if%20not%20cols%5Bcol%5D%20and%20not%20diags1%5Bdiag1%5D%20and%20not%20diags2%5Bdiag2%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%98%97%E8%A9%A6%EF%BC%9A%E5%B0%87%E7%9A%87%E5%90%8E%E6%94%BE%E5%9C%A8%E9%80%99%E4%B8%80%E6%A0%BC%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%22Q%22%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%9C%A8%E4%B8%8B%E4%B8%80%E5%88%97%E6%94%BE%E7%BD%AE%E7%9A%87%E5%90%8E%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28row%20%2B%201,%20n,%20state,%20res,%20cols,%20diags1,%20diags2%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E6%BA%AF%EF%BC%9A%E5%B0%87%E9%80%99%E4%B8%80%E6%A0%BC%E9%82%84%E5%8E%9F%E7%82%BA%E7%A9%BA%E4%BD%8D%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%22%23%22%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20False%0A%0A%0Adef%20n_queens%28n%3A%20int%29%20-%3E%20list%5Blist%5Blist%5Bstr%5D%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%20N%20%E7%9A%87%E5%90%8E%E5%95%8F%E9%A1%8C%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20n%2An%20%E6%A3%8B%E7%9B%A4%EF%BC%8C%27Q%27%20%E4%BB%A3%E8%A1%A8%E7%9A%87%E5%90%8E%EF%BC%8C%27%23%27%20%E4%BB%A3%E8%A1%A8%E7%A9%BA%E4%BD%8D%0A%20%20%20%20state%20%3D%20%5B%5B%22%23%22%20for%20_%20in%20range%28n%29%5D%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20cols%20%3D%20%5BFalse%5D%20%2A%20n%20%20%23%20%E8%A8%98%E9%8C%84%E5%90%84%E6%AC%84%E6%98%AF%E5%90%A6%E5%B7%B2%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20diags1%20%3D%20%5BFalse%5D%20%2A%20%282%20%2A%20n%20-%201%29%20%20%23%20%E8%A8%98%E9%8C%84%E5%90%84%E4%B8%BB%E5%B0%8D%E8%A7%92%E7%B7%9A%E4%B8%8A%E6%98%AF%E5%90%A6%E5%B7%B2%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20diags2%20%3D%20%5BFalse%5D%20%2A%20%282%20%2A%20n%20-%201%29%20%20%23%20%E8%A8%98%E9%8C%84%E5%90%84%E5%89%AF%E5%B0%8D%E8%A7%92%E7%B7%9A%E4%B8%8A%E6%98%AF%E5%90%A6%E5%B7%B2%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%280,%20n,%20state,%20res,%20cols,%20diags1,%20diags2%29%0A%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20res%20%3D%20n_queens%28n%29%0A%0A%20%20%20%20print%28f%22%E8%BC%B8%E5%85%A5%E6%A3%8B%E7%9B%A4%E7%9A%84%E9%82%8A%E9%95%B7%E7%82%BA%20%7Bn%7D%22%29%0A%20%20%20%20print%28f%22%E7%9A%87%E5%90%8E%E5%85%B1%E6%9C%89%20%7Blen%28res%29%7D%20%E7%A8%AE%E6%93%BA%E6%B3%95%22%29%0A%20%20%20%20for%20state%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%22--------------------%22%29%0A%20%20%20%20%20%20%20%20for%20row%20in%20state%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28row%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=61&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">全螢幕觀看 ></a></div>

逐列放置皇后，共放 $n$ 次。考慮欄的限制，從第一列到最後一列依序有 $n$、$n-1$、$\dots$、$2$、$1$ 種選擇，耗時 $O(n!)$。記錄解時，須複製矩陣 `state` 並將副本加入 `res`，複製一次耗時 $O(n^2)$。因此，**整體時間複雜度為 $O(n! \cdot n^2)$**。實際上，依對角線限制剪枝還能大幅縮小搜尋空間，因此實際搜尋效率通常比上述估計更好。

陣列 `state` 使用 $O(n^2)$ 空間，陣列 `cols`、`diags1` 與 `diags2` 各使用 $O(n)$ 空間。最大遞迴深度為 $n$，呼叫堆疊使用 $O(n)$ 空間。因此，**空間複雜度為 $O(n^2)$**。
