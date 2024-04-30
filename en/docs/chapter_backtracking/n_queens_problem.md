---
comments: true
---

# 13.4 &nbsp; n queens problem

!!! question

    According to the rules of chess, a queen can attack pieces in the same row, column, or on a diagonal line. Given $n$ queens and an $n \times n$ chessboard, find arrangements where no two queens can attack each other.

As shown in Figure 13-15, when $n = 4$, there are two solutions. From the perspective of the backtracking algorithm, an $n \times n$ chessboard has $n^2$ squares, presenting all possible choices `choices`. The state of the chessboard `state` changes continuously as each queen is placed.

![Solution to the 4 queens problem](n_queens_problem.assets/solution_4_queens.png){ class="animation-figure" }

<p align="center"> Figure 13-15 &nbsp; Solution to the 4 queens problem </p>

Figure 13-16 shows the three constraints of this problem: **multiple queens cannot be on the same row, column, or diagonal**. It is important to note that diagonals are divided into the main diagonal `\` and the secondary diagonal `/`.

![Constraints of the n queens problem](n_queens_problem.assets/n_queens_constraints.png){ class="animation-figure" }

<p align="center"> Figure 13-16 &nbsp; Constraints of the n queens problem </p>

### 1. &nbsp; Row-by-row placing strategy

As the number of queens equals the number of rows on the chessboard, both being $n$, it is easy to conclude: **each row on the chessboard allows and only allows one queen to be placed**.

This means that we can adopt a row-by-row placing strategy: starting from the first row, place one queen per row until the last row is reached.

Figure 13-17 shows the row-by-row placing process for the 4 queens problem. Due to space limitations, the figure only expands one search branch of the first row, and prunes any placements that do not meet the column and diagonal constraints.

![Row-by-row placing strategy](n_queens_problem.assets/n_queens_placing.png){ class="animation-figure" }

<p align="center"> Figure 13-17 &nbsp; Row-by-row placing strategy </p>

Essentially, **the row-by-row placing strategy serves as a pruning function**, avoiding all search branches that would place multiple queens in the same row.

### 2. &nbsp; Column and diagonal pruning

To satisfy column constraints, we can use a boolean array `cols` of length $n$ to track whether a queen occupies each column. Before each placement decision, `cols` is used to prune the columns that already have queens, and it is dynamically updated during backtracking.

How about the diagonal constraints? Let the row and column indices of a cell on the chessboard be $(row, col)$. By selecting a specific main diagonal, we notice that the difference $row - col$ is the same for all cells on that diagonal, **meaning that $row - col$ is a constant value on that diagonal**.

Thus, if two cells satisfy $row_1 - col_1 = row_2 - col_2$, they are definitely on the same main diagonal. Using this pattern, we can utilize the array `diags1` shown in Figure 13-18 to track whether a queen is on any main diagonal.

Similarly, **the sum $row + col$ is a constant value for all cells on a secondary diagonal**. We can also use the array `diags2` to handle secondary diagonal constraints.

![Handling column and diagonal constraints](n_queens_problem.assets/n_queens_cols_diagonals.png){ class="animation-figure" }

<p align="center"> Figure 13-18 &nbsp; Handling column and diagonal constraints </p>

### 3. &nbsp; Code implementation

Please note, in an $n$-dimensional matrix, the range of $row - col$ is $[-n + 1, n - 1]$, and the range of $row + col$ is $[0, 2n - 2]$, thus the number of both main and secondary diagonals is $2n - 1$, meaning the length of both arrays `diags1` and `diags2` is $2n - 1$.

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
        """回溯算法：n 皇后"""
        # 当放置完所有行时，记录解
        if row == n:
            res.append([list(row) for row in state])
            return
        # 遍历所有列
        for col in range(n):
            # 计算该格子对应的主对角线和次对角线
            diag1 = row - col + n - 1
            diag2 = row + col
            # 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
            if not cols[col] and not diags1[diag1] and not diags2[diag2]:
                # 尝试：将皇后放置在该格子
                state[row][col] = "Q"
                cols[col] = diags1[diag1] = diags2[diag2] = True
                # 放置下一行
                backtrack(row + 1, n, state, res, cols, diags1, diags2)
                # 回退：将该格子恢复为空位
                state[row][col] = "#"
                cols[col] = diags1[diag1] = diags2[diag2] = False

    def n_queens(n: int) -> list[list[list[str]]]:
        """求解 n 皇后"""
        # 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
        state = [["#" for _ in range(n)] for _ in range(n)]
        cols = [False] * n  # 记录列是否有皇后
        diags1 = [False] * (2 * n - 1)  # 记录主对角线上是否有皇后
        diags2 = [False] * (2 * n - 1)  # 记录次对角线上是否有皇后
        res = []
        backtrack(0, n, state, res, cols, diags1, diags2)

        return res
    ```

=== "C++"

    ```cpp title="n_queens.cpp"
    /* 回溯算法：n 皇后 */
    void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
                   vector<bool> &diags1, vector<bool> &diags2) {
        // 当放置完所有行时，记录解
        if (row == n) {
            res.push_back(state);
            return;
        }
        // 遍历所有列
        for (int col = 0; col < n; col++) {
            // 计算该格子对应的主对角线和次对角线
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 尝试：将皇后放置在该格子
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 放置下一行
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回退：将该格子恢复为空位
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后 */
    vector<vector<vector<string>>> nQueens(int n) {
        // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
        vector<vector<string>> state(n, vector<string>(n, "#"));
        vector<bool> cols(n, false);           // 记录列是否有皇后
        vector<bool> diags1(2 * n - 1, false); // 记录主对角线上是否有皇后
        vector<bool> diags2(2 * n - 1, false); // 记录次对角线上是否有皇后
        vector<vector<vector<string>>> res;

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "Java"

    ```java title="n_queens.java"
    /* 回溯算法：n 皇后 */
    void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // 当放置完所有行时，记录解
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
            return;
        }
        // 遍历所有列
        for (int col = 0; col < n; col++) {
            // 计算该格子对应的主对角线和次对角线
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 尝试：将皇后放置在该格子
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 放置下一行
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回退：将该格子恢复为空位
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后 */
    List<List<List<String>>> nQueens(int n) {
        // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // 记录列是否有皇后
        boolean[] diags1 = new boolean[2 * n - 1]; // 记录主对角线上是否有皇后
        boolean[] diags2 = new boolean[2 * n - 1]; // 记录次对角线上是否有皇后
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "C#"

    ```csharp title="n_queens.cs"
    /* 回溯算法：n 皇后 */
    void Backtrack(int row, int n, List<List<string>> state, List<List<List<string>>> res,
            bool[] cols, bool[] diags1, bool[] diags2) {
        // 当放置完所有行时，记录解
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
            return;
        }
        // 遍历所有列
        for (int col = 0; col < n; col++) {
            // 计算该格子对应的主对角线和次对角线
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 尝试：将皇后放置在该格子
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 放置下一行
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回退：将该格子恢复为空位
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后 */
    List<List<List<string>>> NQueens(int n) {
        // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // 记录列是否有皇后
        bool[] diags1 = new bool[2 * n - 1]; // 记录主对角线上是否有皇后
        bool[] diags2 = new bool[2 * n - 1]; // 记录次对角线上是否有皇后
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "Go"

    ```go title="n_queens.go"
    /* 回溯算法：n 皇后 */
    func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
        // 当放置完所有行时，记录解
        if row == n {
            newState := make([][]string, len(*state))
            for i, _ := range newState {
                newState[i] = make([]string, len((*state)[0]))
                copy(newState[i], (*state)[i])

            }
            *res = append(*res, newState)
        }
        // 遍历所有列
        for col := 0; col < n; col++ {
            // 计算该格子对应的主对角线和次对角线
            diag1 := row - col + n - 1
            diag2 := row + col
            // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
            if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
                // 尝试：将皇后放置在该格子
                (*state)[row][col] = "Q"
                (*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
                // 放置下一行
                backtrack(row+1, n, state, res, cols, diags1, diags2)
                // 回退：将该格子恢复为空位
                (*state)[row][col] = "#"
                (*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
            }
        }
    }

    /* 求解 n 皇后 */
    func nQueens(n int) [][][]string {
        // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
        state := make([][]string, n)
        for i := 0; i < n; i++ {
            row := make([]string, n)
            for i := 0; i < n; i++ {
                row[i] = "#"
            }
            state[i] = row
        }
        // 记录列是否有皇后
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
    /* 回溯算法：n 皇后 */
    func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
        // 当放置完所有行时，记录解
        if row == n {
            res.append(state)
            return
        }
        // 遍历所有列
        for col in 0 ..< n {
            // 计算该格子对应的主对角线和次对角线
            let diag1 = row - col + n - 1
            let diag2 = row + col
            // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
            if !cols[col] && !diags1[diag1] && !diags2[diag2] {
                // 尝试：将皇后放置在该格子
                state[row][col] = "Q"
                cols[col] = true
                diags1[diag1] = true
                diags2[diag2] = true
                // 放置下一行
                backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
                // 回退：将该格子恢复为空位
                state[row][col] = "#"
                cols[col] = false
                diags1[diag1] = false
                diags2[diag2] = false
            }
        }
    }

    /* 求解 n 皇后 */
    func nQueens(n: Int) -> [[[String]]] {
        // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
        var state = Array(repeating: Array(repeating: "#", count: n), count: n)
        var cols = Array(repeating: false, count: n) // 记录列是否有皇后
        var diags1 = Array(repeating: false, count: 2 * n - 1) // 记录主对角线上是否有皇后
        var diags2 = Array(repeating: false, count: 2 * n - 1) // 记录次对角线上是否有皇后
        var res: [[[String]]] = []

        backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

        return res
    }
    ```

=== "JS"

    ```javascript title="n_queens.js"
    /* 回溯算法：n 皇后 */
    function backtrack(row, n, state, res, cols, diags1, diags2) {
        // 当放置完所有行时，记录解
        if (row === n) {
            res.push(state.map((row) => row.slice()));
            return;
        }
        // 遍历所有列
        for (let col = 0; col < n; col++) {
            // 计算该格子对应的主对角线和次对角线
            const diag1 = row - col + n - 1;
            const diag2 = row + col;
            // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 尝试：将皇后放置在该格子
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 放置下一行
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回退：将该格子恢复为空位
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后 */
    function nQueens(n) {
        // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
        const state = Array.from({ length: n }, () => Array(n).fill('#'));
        const cols = Array(n).fill(false); // 记录列是否有皇后
        const diags1 = Array(2 * n - 1).fill(false); // 记录主对角线上是否有皇后
        const diags2 = Array(2 * n - 1).fill(false); // 记录次对角线上是否有皇后
        const res = [];

        backtrack(0, n, state, res, cols, diags1, diags2);
        return res;
    }
    ```

=== "TS"

    ```typescript title="n_queens.ts"
    /* 回溯算法：n 皇后 */
    function backtrack(
        row: number,
        n: number,
        state: string[][],
        res: string[][][],
        cols: boolean[],
        diags1: boolean[],
        diags2: boolean[]
    ): void {
        // 当放置完所有行时，记录解
        if (row === n) {
            res.push(state.map((row) => row.slice()));
            return;
        }
        // 遍历所有列
        for (let col = 0; col < n; col++) {
            // 计算该格子对应的主对角线和次对角线
            const diag1 = row - col + n - 1;
            const diag2 = row + col;
            // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 尝试：将皇后放置在该格子
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 放置下一行
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回退：将该格子恢复为空位
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后 */
    function nQueens(n: number): string[][][] {
        // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
        const state = Array.from({ length: n }, () => Array(n).fill('#'));
        const cols = Array(n).fill(false); // 记录列是否有皇后
        const diags1 = Array(2 * n - 1).fill(false); // 记录主对角线上是否有皇后
        const diags2 = Array(2 * n - 1).fill(false); // 记录次对角线上是否有皇后
        const res: string[][][] = [];

        backtrack(0, n, state, res, cols, diags1, diags2);
        return res;
    }
    ```

=== "Dart"

    ```dart title="n_queens.dart"
    /* 回溯算法：n 皇后 */
    void backtrack(
      int row,
      int n,
      List<List<String>> state,
      List<List<List<String>>> res,
      List<bool> cols,
      List<bool> diags1,
      List<bool> diags2,
    ) {
      // 当放置完所有行时，记录解
      if (row == n) {
        List<List<String>> copyState = [];
        for (List<String> sRow in state) {
          copyState.add(List.from(sRow));
        }
        res.add(copyState);
        return;
      }
      // 遍历所有列
      for (int col = 0; col < n; col++) {
        // 计算该格子对应的主对角线和次对角线
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
          // 尝试：将皇后放置在该格子
          state[row][col] = "Q";
          cols[col] = true;
          diags1[diag1] = true;
          diags2[diag2] = true;
          // 放置下一行
          backtrack(row + 1, n, state, res, cols, diags1, diags2);
          // 回退：将该格子恢复为空位
          state[row][col] = "#";
          cols[col] = false;
          diags1[diag1] = false;
          diags2[diag2] = false;
        }
      }
    }

    /* 求解 n 皇后 */
    List<List<List<String>>> nQueens(int n) {
      // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
      List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
      List<bool> cols = List.filled(n, false); // 记录列是否有皇后
      List<bool> diags1 = List.filled(2 * n - 1, false); // 记录主对角线上是否有皇后
      List<bool> diags2 = List.filled(2 * n - 1, false); // 记录次对角线上是否有皇后
      List<List<List<String>>> res = [];

      backtrack(0, n, state, res, cols, diags1, diags2);

      return res;
    }
    ```

=== "Rust"

    ```rust title="n_queens.rs"
    /* 回溯算法：n 皇后 */
    fn backtrack(
        row: usize,
        n: usize,
        state: &mut Vec<Vec<String>>,
        res: &mut Vec<Vec<Vec<String>>>,
        cols: &mut [bool],
        diags1: &mut [bool],
        diags2: &mut [bool],
    ) {
        // 当放置完所有行时，记录解
        if row == n {
            let mut copy_state: Vec<Vec<String>> = Vec::new();
            for s_row in state.clone() {
                copy_state.push(s_row);
            }
            res.push(copy_state);
            return;
        }
        // 遍历所有列
        for col in 0..n {
            // 计算该格子对应的主对角线和次对角线
            let diag1 = row + n - 1 - col;
            let diag2 = row + col;
            // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
            if !cols[col] && !diags1[diag1] && !diags2[diag2] {
                // 尝试：将皇后放置在该格子
                state.get_mut(row).unwrap()[col] = "Q".into();
                (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
                // 放置下一行
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // 回退：将该格子恢复为空位
                state.get_mut(row).unwrap()[col] = "#".into();
                (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
            }
        }
    }

    /* 求解 n 皇后 */
    fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
        // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
        let mut state: Vec<Vec<String>> = Vec::new();
        for _ in 0..n {
            let mut row: Vec<String> = Vec::new();
            for _ in 0..n {
                row.push("#".into());
            }
            state.push(row);
        }
        let mut cols = vec![false; n]; // 记录列是否有皇后
        let mut diags1 = vec![false; 2 * n - 1]; // 记录主对角线上是否有皇后
        let mut diags2 = vec![false; 2 * n - 1]; // 记录次对角线上是否有皇后
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
    /* 回溯算法：n 皇后 */
    void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
                   bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
        // 当放置完所有行时，记录解
        if (row == n) {
            res[*resSize] = (char **)malloc(sizeof(char *) * n);
            for (int i = 0; i < n; ++i) {
                res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
                strcpy(res[*resSize][i], state[i]);
            }
            (*resSize)++;
            return;
        }
        // 遍历所有列
        for (int col = 0; col < n; col++) {
            // 计算该格子对应的主对角线和次对角线
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 尝试：将皇后放置在该格子
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // 放置下一行
                backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
                // 回退：将该格子恢复为空位
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* 求解 n 皇后 */
    char ***nQueens(int n, int *returnSize) {
        char state[MAX_SIZE][MAX_SIZE];
        // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                state[i][j] = '#';
            }
            state[i][n] = '\0';
        }
        bool cols[MAX_SIZE] = {false};           // 记录列是否有皇后
        bool diags1[2 * MAX_SIZE - 1] = {false}; // 记录主对角线上是否有皇后
        bool diags2[2 * MAX_SIZE - 1] = {false}; // 记录次对角线上是否有皇后

        char ***res = (char ***)malloc(sizeof(char **) * MAX_SIZE);
        *returnSize = 0;
        backtrack(0, n, state, res, returnSize, cols, diags1, diags2);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="n_queens.kt"
    /* 回溯算法：n 皇后 */
    fun backtrack(
        row: Int,
        n: Int,
        state: MutableList<MutableList<String>>,
        res: MutableList<MutableList<MutableList<String>>?>,
        cols: BooleanArray,
        diags1: BooleanArray,
        diags2: BooleanArray
    ) {
        // 当放置完所有行时，记录解
        if (row == n) {
            val copyState = mutableListOf<MutableList<String>>()
            for (sRow in state) {
                copyState.add(sRow.toMutableList())
            }
            res.add(copyState)
            return
        }
        // 遍历所有列
        for (col in 0..<n) {
            // 计算该格子对应的主对角线和次对角线
            val diag1 = row - col + n - 1
            val diag2 = row + col
            // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // 尝试：将皇后放置在该格子
                state[row][col] = "Q"
                diags2[diag2] = true
                diags1[diag1] = diags2[diag2]
                cols[col] = diags1[diag1]
                // 放置下一行
                backtrack(row + 1, n, state, res, cols, diags1, diags2)
                // 回退：将该格子恢复为空位
                state[row][col] = "#"
                diags2[diag2] = false
                diags1[diag1] = diags2[diag2]
                cols[col] = diags1[diag1]
            }
        }
    }

    /* 求解 n 皇后 */
    fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
        // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
        val state = mutableListOf<MutableList<String>>()
        for (i in 0..<n) {
            val row = mutableListOf<String>()
            for (j in 0..<n) {
                row.add("#")
            }
            state.add(row)
        }
        val cols = BooleanArray(n) // 记录列是否有皇后
        val diags1 = BooleanArray(2 * n - 1) // 记录主对角线上是否有皇后
        val diags2 = BooleanArray(2 * n - 1) // 记录次对角线上是否有皇后
        val res = mutableListOf<MutableList<MutableList<String>>?>()

        backtrack(0, n, state, res, cols, diags1, diags2)

        return res
    }
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

??? pythontutor "Code Visualization"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20row%3A%20int,%0A%20%20%20%20n%3A%20int,%0A%20%20%20%20state%3A%20list%5Blist%5Bstr%5D%5D,%0A%20%20%20%20res%3A%20list%5Blist%5Blist%5Bstr%5D%5D%5D,%0A%20%20%20%20cols%3A%20list%5Bbool%5D,%0A%20%20%20%20diags1%3A%20list%5Bbool%5D,%0A%20%20%20%20diags2%3A%20list%5Bbool%5D,%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E7%AE%97%E6%B3%95%EF%BC%9AN%20%E7%9A%87%E5%90%8E%22%22%22%0A%20%20%20%20%23%20%E5%BD%93%E6%94%BE%E7%BD%AE%E5%AE%8C%E6%89%80%E6%9C%89%E8%A1%8C%E6%97%B6%EF%BC%8C%E8%AE%B0%E5%BD%95%E8%A7%A3%0A%20%20%20%20if%20row%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res.append%28%5Blist%28row%29%20for%20row%20in%20state%5D%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E5%88%97%0A%20%20%20%20for%20col%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%AE%A1%E7%AE%97%E8%AF%A5%E6%A0%BC%E5%AD%90%E5%AF%B9%E5%BA%94%E7%9A%84%E4%B8%BB%E5%AF%B9%E8%A7%92%E7%BA%BF%E5%92%8C%E6%AC%A1%E5%AF%B9%E8%A7%92%E7%BA%BF%0A%20%20%20%20%20%20%20%20diag1%20%3D%20row%20-%20col%20%2B%20n%20-%201%0A%20%20%20%20%20%20%20%20diag2%20%3D%20row%20%2B%20col%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E4%B8%8D%E5%85%81%E8%AE%B8%E8%AF%A5%E6%A0%BC%E5%AD%90%E6%89%80%E5%9C%A8%E5%88%97%E3%80%81%E4%B8%BB%E5%AF%B9%E8%A7%92%E7%BA%BF%E3%80%81%E6%AC%A1%E5%AF%B9%E8%A7%92%E7%BA%BF%E4%B8%8A%E5%AD%98%E5%9C%A8%E7%9A%87%E5%90%8E%0A%20%20%20%20%20%20%20%20if%20not%20cols%5Bcol%5D%20and%20not%20diags1%5Bdiag1%5D%20and%20not%20diags2%5Bdiag2%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%B0%86%E7%9A%87%E5%90%8E%E6%94%BE%E7%BD%AE%E5%9C%A8%E8%AF%A5%E6%A0%BC%E5%AD%90%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%22Q%22%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%94%BE%E7%BD%AE%E4%B8%8B%E4%B8%80%E8%A1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28row%20%2B%201,%20n,%20state,%20res,%20cols,%20diags1,%20diags2%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E5%B0%86%E8%AF%A5%E6%A0%BC%E5%AD%90%E6%81%A2%E5%A4%8D%E4%B8%BA%E7%A9%BA%E4%BD%8D%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%22%23%22%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20False%0A%0A%0Adef%20n_queens%28n%3A%20int%29%20-%3E%20list%5Blist%5Blist%5Bstr%5D%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%20N%20%E7%9A%87%E5%90%8E%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20n*n%20%E5%A4%A7%E5%B0%8F%E7%9A%84%E6%A3%8B%E7%9B%98%EF%BC%8C%E5%85%B6%E4%B8%AD%20'Q'%20%E4%BB%A3%E8%A1%A8%E7%9A%87%E5%90%8E%EF%BC%8C'%23'%20%E4%BB%A3%E8%A1%A8%E7%A9%BA%E4%BD%8D%0A%20%20%20%20state%20%3D%20%5B%5B%22%23%22%20for%20_%20in%20range%28n%29%5D%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20cols%20%3D%20%5BFalse%5D%20*%20n%20%20%23%20%E8%AE%B0%E5%BD%95%E5%88%97%E6%98%AF%E5%90%A6%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20diags1%20%3D%20%5BFalse%5D%20*%20%282%20*%20n%20-%201%29%20%20%23%20%E8%AE%B0%E5%BD%95%E4%B8%BB%E5%AF%B9%E8%A7%92%E7%BA%BF%E4%B8%8A%E6%98%AF%E5%90%A6%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20diags2%20%3D%20%5BFalse%5D%20*%20%282%20*%20n%20-%201%29%20%20%23%20%E8%AE%B0%E5%BD%95%E6%AC%A1%E5%AF%B9%E8%A7%92%E7%BA%BF%E4%B8%8A%E6%98%AF%E5%90%A6%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%280,%20n,%20state,%20res,%20cols,%20diags1,%20diags2%29%0A%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20res%20%3D%20n_queens%28n%29%0A%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%A3%8B%E7%9B%98%E9%95%BF%E5%AE%BD%E4%B8%BA%20%7Bn%7D%22%29%0A%20%20%20%20print%28f%22%E7%9A%87%E5%90%8E%E6%94%BE%E7%BD%AE%E6%96%B9%E6%A1%88%E5%85%B1%E6%9C%89%20%7Blen%28res%29%7D%20%E7%A7%8D%22%29%0A%20%20%20%20for%20state%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%22--------------------%22%29%0A%20%20%20%20%20%20%20%20for%20row%20in%20state%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28row%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=61&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20row%3A%20int,%0A%20%20%20%20n%3A%20int,%0A%20%20%20%20state%3A%20list%5Blist%5Bstr%5D%5D,%0A%20%20%20%20res%3A%20list%5Blist%5Blist%5Bstr%5D%5D%5D,%0A%20%20%20%20cols%3A%20list%5Bbool%5D,%0A%20%20%20%20diags1%3A%20list%5Bbool%5D,%0A%20%20%20%20diags2%3A%20list%5Bbool%5D,%0A%29%3A%0A%20%20%20%20%22%22%22%E5%9B%9E%E6%BA%AF%E7%AE%97%E6%B3%95%EF%BC%9AN%20%E7%9A%87%E5%90%8E%22%22%22%0A%20%20%20%20%23%20%E5%BD%93%E6%94%BE%E7%BD%AE%E5%AE%8C%E6%89%80%E6%9C%89%E8%A1%8C%E6%97%B6%EF%BC%8C%E8%AE%B0%E5%BD%95%E8%A7%A3%0A%20%20%20%20if%20row%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res.append%28%5Blist%28row%29%20for%20row%20in%20state%5D%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20%E9%81%8D%E5%8E%86%E6%89%80%E6%9C%89%E5%88%97%0A%20%20%20%20for%20col%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%23%20%E8%AE%A1%E7%AE%97%E8%AF%A5%E6%A0%BC%E5%AD%90%E5%AF%B9%E5%BA%94%E7%9A%84%E4%B8%BB%E5%AF%B9%E8%A7%92%E7%BA%BF%E5%92%8C%E6%AC%A1%E5%AF%B9%E8%A7%92%E7%BA%BF%0A%20%20%20%20%20%20%20%20diag1%20%3D%20row%20-%20col%20%2B%20n%20-%201%0A%20%20%20%20%20%20%20%20diag2%20%3D%20row%20%2B%20col%0A%20%20%20%20%20%20%20%20%23%20%E5%89%AA%E6%9E%9D%EF%BC%9A%E4%B8%8D%E5%85%81%E8%AE%B8%E8%AF%A5%E6%A0%BC%E5%AD%90%E6%89%80%E5%9C%A8%E5%88%97%E3%80%81%E4%B8%BB%E5%AF%B9%E8%A7%92%E7%BA%BF%E3%80%81%E6%AC%A1%E5%AF%B9%E8%A7%92%E7%BA%BF%E4%B8%8A%E5%AD%98%E5%9C%A8%E7%9A%87%E5%90%8E%0A%20%20%20%20%20%20%20%20if%20not%20cols%5Bcol%5D%20and%20not%20diags1%5Bdiag1%5D%20and%20not%20diags2%5Bdiag2%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%B0%9D%E8%AF%95%EF%BC%9A%E5%B0%86%E7%9A%87%E5%90%8E%E6%94%BE%E7%BD%AE%E5%9C%A8%E8%AF%A5%E6%A0%BC%E5%AD%90%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%22Q%22%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E6%94%BE%E7%BD%AE%E4%B8%8B%E4%B8%80%E8%A1%8C%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28row%20%2B%201,%20n,%20state,%20res,%20cols,%20diags1,%20diags2%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20%E5%9B%9E%E9%80%80%EF%BC%9A%E5%B0%86%E8%AF%A5%E6%A0%BC%E5%AD%90%E6%81%A2%E5%A4%8D%E4%B8%BA%E7%A9%BA%E4%BD%8D%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%22%23%22%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20False%0A%0A%0Adef%20n_queens%28n%3A%20int%29%20-%3E%20list%5Blist%5Blist%5Bstr%5D%5D%5D%3A%0A%20%20%20%20%22%22%22%E6%B1%82%E8%A7%A3%20N%20%E7%9A%87%E5%90%8E%22%22%22%0A%20%20%20%20%23%20%E5%88%9D%E5%A7%8B%E5%8C%96%20n*n%20%E5%A4%A7%E5%B0%8F%E7%9A%84%E6%A3%8B%E7%9B%98%EF%BC%8C%E5%85%B6%E4%B8%AD%20'Q'%20%E4%BB%A3%E8%A1%A8%E7%9A%87%E5%90%8E%EF%BC%8C'%23'%20%E4%BB%A3%E8%A1%A8%E7%A9%BA%E4%BD%8D%0A%20%20%20%20state%20%3D%20%5B%5B%22%23%22%20for%20_%20in%20range%28n%29%5D%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20cols%20%3D%20%5BFalse%5D%20*%20n%20%20%23%20%E8%AE%B0%E5%BD%95%E5%88%97%E6%98%AF%E5%90%A6%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20diags1%20%3D%20%5BFalse%5D%20*%20%282%20*%20n%20-%201%29%20%20%23%20%E8%AE%B0%E5%BD%95%E4%B8%BB%E5%AF%B9%E8%A7%92%E7%BA%BF%E4%B8%8A%E6%98%AF%E5%90%A6%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20diags2%20%3D%20%5BFalse%5D%20*%20%282%20*%20n%20-%201%29%20%20%23%20%E8%AE%B0%E5%BD%95%E6%AC%A1%E5%AF%B9%E8%A7%92%E7%BA%BF%E4%B8%8A%E6%98%AF%E5%90%A6%E6%9C%89%E7%9A%87%E5%90%8E%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%280,%20n,%20state,%20res,%20cols,%20diags1,%20diags2%29%0A%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20Code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20res%20%3D%20n_queens%28n%29%0A%0A%20%20%20%20print%28f%22%E8%BE%93%E5%85%A5%E6%A3%8B%E7%9B%98%E9%95%BF%E5%AE%BD%E4%B8%BA%20%7Bn%7D%22%29%0A%20%20%20%20print%28f%22%E7%9A%87%E5%90%8E%E6%94%BE%E7%BD%AE%E6%96%B9%E6%A1%88%E5%85%B1%E6%9C%89%20%7Blen%28res%29%7D%20%E7%A7%8D%22%29%0A%20%20%20%20for%20state%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%22--------------------%22%29%0A%20%20%20%20%20%20%20%20for%20row%20in%20state%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28row%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=61&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">Full Screen ></a></div>

Placing $n$ queens row-by-row, considering column constraints, from the first row to the last row there are $n$, $n-1$, $\dots$, $2$, $1$ choices, using $O(n!)$ time. When recording a solution, it is necessary to copy the matrix `state` and add it to `res`, with the copying operation using $O(n^2)$ time. Therefore, **the overall time complexity is $O(n! \cdot n^2)$**. In practice, pruning based on diagonal constraints can significantly reduce the search space, thus often the search efficiency is better than the above time complexity.

Array `state` uses $O(n^2)$ space, and arrays `cols`, `diags1`, and `diags2` each use $O(n)$ space. The maximum recursion depth is $n$, using $O(n)$ stack space. Therefore, **the space complexity is $O(n^2)$**.
