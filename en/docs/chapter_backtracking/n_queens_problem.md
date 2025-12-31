---
comments: true
---

# 13.4 &nbsp; N-Queens Problem

!!! question

    According to the rules of chess, a queen can attack pieces that share the same row, column, or diagonal line. Given $n$ queens and an $n \times n$ chessboard, find a placement scheme such that no two queens can attack each other.

As shown in Figure 13-15, when $n = 4$, there are two solutions that can be found. From the perspective of the backtracking algorithm, an $n \times n$ chessboard has $n^2$ squares, which provide all the choices `choices`. During the process of placing queens one by one, the chessboard state changes continuously, and the chessboard at each moment represents the state `state`.

![Solution to the 4-queens problem](n_queens_problem.assets/solution_4_queens.png){ class="animation-figure" }

<p align="center"> Figure 13-15 &nbsp; Solution to the 4-queens problem </p>

Figure 13-16 illustrates the three constraints of this problem: **multiple queens cannot be in the same row, the same column, or on the same diagonal**. It is worth noting that diagonals are divided into two types: the main diagonal `\` and the anti-diagonal `/`.

![Constraints of the n-queens problem](n_queens_problem.assets/n_queens_constraints.png){ class="animation-figure" }

<p align="center"> Figure 13-16 &nbsp; Constraints of the n-queens problem </p>

### 1. &nbsp; Row-By-Row Placement Strategy

Since both the number of queens and the number of rows on the chessboard are $n$, we can easily derive a conclusion: **each row of the chessboard allows and only allows exactly one queen to be placed**.

This means we can adopt a row-by-row placement strategy: starting from the first row, place one queen in each row until the last row is completed.

Figure 13-17 shows the row-by-row placement process for the 4-queens problem. Due to space limitations, the figure only expands one search branch of the first row, and all schemes that do not satisfy the column constraint and diagonal constraints are pruned.

![Row-by-row placement strategy](n_queens_problem.assets/n_queens_placing.png){ class="animation-figure" }

<p align="center"> Figure 13-17 &nbsp; Row-by-row placement strategy </p>

Essentially, **the row-by-row placement strategy serves a pruning function**, as it avoids all search branches where multiple queens appear in the same row.

### 2. &nbsp; Column and Diagonal Pruning

To satisfy the column constraint, we can use a boolean array `cols` of length $n$ to record whether each column has a queen. Before each placement decision, we use `cols` to prune columns that already have queens, and dynamically update the state of `cols` during backtracking.

!!! tip

    Please note that the origin of the matrix is located in the upper-left corner, where the row index increases from top to bottom, and the column index increases from left to right.

So how do we handle diagonal constraints? Consider a square on the chessboard with row and column indices $(row, col)$. If we select a specific main diagonal in the matrix, we find that all squares on that diagonal have the same difference between their row and column indices, **meaning that $row - col$ is a constant value for all squares on the main diagonal**.

In other words, if two squares satisfy $row_1 - col_1 = row_2 - col_2$, they must be on the same main diagonal. Using this pattern, we can use the array `diags1` shown in Figure 13-18 to record whether there is a queen on each main diagonal.

Similarly, **for all squares on an anti-diagonal, the sum $row + col$ is a constant value**. We can likewise use the array `diags2` to handle anti-diagonal constraints.

![Handling column and diagonal constraints](n_queens_problem.assets/n_queens_cols_diagonals.png){ class="animation-figure" }

<p align="center"> Figure 13-18 &nbsp; Handling column and diagonal constraints </p>

### 3. &nbsp; Code Implementation

Please note that in an $n$-dimensional square matrix, the range of $row - col$ is $[-n + 1, n - 1]$, and the range of $row + col$ is $[0, 2n - 2]$. Therefore, the number of both main diagonals and anti-diagonals is $2n - 1$, meaning the length of both arrays `diags1` and `diags2` is $2n - 1$.

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
        """Backtracking algorithm: N queens"""
        # When all rows are placed, record the solution
        if row == n:
            res.append([list(row) for row in state])
            return
        # Traverse all columns
        for col in range(n):
            # Calculate the main diagonal and anti-diagonal corresponding to this cell
            diag1 = row - col + n - 1
            diag2 = row + col
            # Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
            if not cols[col] and not diags1[diag1] and not diags2[diag2]:
                # Attempt: place the queen in this cell
                state[row][col] = "Q"
                cols[col] = diags1[diag1] = diags2[diag2] = True
                # Place the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2)
                # Backtrack: restore this cell to an empty cell
                state[row][col] = "#"
                cols[col] = diags1[diag1] = diags2[diag2] = False

    def n_queens(n: int) -> list[list[list[str]]]:
        """Solve N queens"""
        # Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
        state = [["#" for _ in range(n)] for _ in range(n)]
        cols = [False] * n  # Record whether there is a queen in the column
        diags1 = [False] * (2 * n - 1)  # Record whether there is a queen on the main diagonal
        diags2 = [False] * (2 * n - 1)  # Record whether there is a queen on the anti-diagonal
        res = []
        backtrack(0, n, state, res, cols, diags1, diags2)

        return res
    ```

=== "C++"

    ```cpp title="n_queens.cpp"
    /* Backtracking algorithm: N queens */
    void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
                   vector<bool> &diags1, vector<bool> &diags2) {
        // When all rows are placed, record the solution
        if (row == n) {
            res.push_back(state);
            return;
        }
        // Traverse all columns
        for (int col = 0; col < n; col++) {
            // Calculate the main diagonal and anti-diagonal corresponding to this cell
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Attempt: place the queen in this cell
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this cell to an empty cell
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve N queens */
    vector<vector<vector<string>>> nQueens(int n) {
        // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
        vector<vector<string>> state(n, vector<string>(n, "#"));
        vector<bool> cols(n, false);           // Record whether there is a queen in the column
        vector<bool> diags1(2 * n - 1, false); // Record whether there is a queen on the main diagonal
        vector<bool> diags2(2 * n - 1, false); // Record whether there is a queen on the anti-diagonal
        vector<vector<vector<string>>> res;

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "Java"

    ```java title="n_queens.java"
    /* Backtracking algorithm: N queens */
    void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // When all rows are placed, record the solution
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
            return;
        }
        // Traverse all columns
        for (int col = 0; col < n; col++) {
            // Calculate the main diagonal and anti-diagonal corresponding to this cell
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Attempt: place the queen in this cell
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this cell to an empty cell
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve N queens */
    List<List<List<String>>> nQueens(int n) {
        // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // Record whether there is a queen in the column
        boolean[] diags1 = new boolean[2 * n - 1]; // Record whether there is a queen on the main diagonal
        boolean[] diags2 = new boolean[2 * n - 1]; // Record whether there is a queen on the anti-diagonal
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "C#"

    ```csharp title="n_queens.cs"
    /* Backtracking algorithm: N queens */
    void Backtrack(int row, int n, List<List<string>> state, List<List<List<string>>> res,
            bool[] cols, bool[] diags1, bool[] diags2) {
        // When all rows are placed, record the solution
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
            return;
        }
        // Traverse all columns
        for (int col = 0; col < n; col++) {
            // Calculate the main diagonal and anti-diagonal corresponding to this cell
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Attempt: place the queen in this cell
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place the next row
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this cell to an empty cell
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve N queens */
    List<List<List<string>>> NQueens(int n) {
        // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // Record whether there is a queen in the column
        bool[] diags1 = new bool[2 * n - 1]; // Record whether there is a queen on the main diagonal
        bool[] diags2 = new bool[2 * n - 1]; // Record whether there is a queen on the anti-diagonal
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "Go"

    ```go title="n_queens.go"
    /* Backtracking algorithm: N queens */
    func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
        // When all rows are placed, record the solution
        if row == n {
            newState := make([][]string, len(*state))
            for i, _ := range newState {
                newState[i] = make([]string, len((*state)[0]))
                copy(newState[i], (*state)[i])

            }
            *res = append(*res, newState)
            return
        }
        // Traverse all columns
        for col := 0; col < n; col++ {
            // Calculate the main diagonal and anti-diagonal corresponding to this cell
            diag1 := row - col + n - 1
            diag2 := row + col
            // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
            if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
                // Attempt: place the queen in this cell
                (*state)[row][col] = "Q"
                (*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
                // Place the next row
                backtrack(row+1, n, state, res, cols, diags1, diags2)
                // Backtrack: restore this cell to an empty cell
                (*state)[row][col] = "#"
                (*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
            }
        }
    }

    /* Solve N queens */
    func nQueens(n int) [][][]string {
        // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
        state := make([][]string, n)
        for i := 0; i < n; i++ {
            row := make([]string, n)
            for i := 0; i < n; i++ {
                row[i] = "#"
            }
            state[i] = row
        }
        // Record whether there is a queen in the column
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
    /* Backtracking algorithm: N queens */
    func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
        // When all rows are placed, record the solution
        if row == n {
            res.append(state)
            return
        }
        // Traverse all columns
        for col in 0 ..< n {
            // Calculate the main diagonal and anti-diagonal corresponding to this cell
            let diag1 = row - col + n - 1
            let diag2 = row + col
            // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
            if !cols[col] && !diags1[diag1] && !diags2[diag2] {
                // Attempt: place the queen in this cell
                state[row][col] = "Q"
                cols[col] = true
                diags1[diag1] = true
                diags2[diag2] = true
                // Place the next row
                backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
                // Backtrack: restore this cell to an empty cell
                state[row][col] = "#"
                cols[col] = false
                diags1[diag1] = false
                diags2[diag2] = false
            }
        }
    }

    /* Solve N queens */
    func nQueens(n: Int) -> [[[String]]] {
        // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
        var state = Array(repeating: Array(repeating: "#", count: n), count: n)
        var cols = Array(repeating: false, count: n) // Record whether there is a queen in the column
        var diags1 = Array(repeating: false, count: 2 * n - 1) // Record whether there is a queen on the main diagonal
        var diags2 = Array(repeating: false, count: 2 * n - 1) // Record whether there is a queen on the anti-diagonal
        var res: [[[String]]] = []

        backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

        return res
    }
    ```

=== "JS"

    ```javascript title="n_queens.js"
    /* Backtracking algorithm: N queens */
    function backtrack(row, n, state, res, cols, diags1, diags2) {
        // When all rows are placed, record the solution
        if (row === n) {
            res.push(state.map((row) => row.slice()));
            return;
        }
        // Traverse all columns
        for (let col = 0; col < n; col++) {
            // Calculate the main diagonal and anti-diagonal corresponding to this cell
            const diag1 = row - col + n - 1;
            const diag2 = row + col;
            // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Attempt: place the queen in this cell
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this cell to an empty cell
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve N queens */
    function nQueens(n) {
        // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
        const state = Array.from({ length: n }, () => Array(n).fill('#'));
        const cols = Array(n).fill(false); // Record whether there is a queen in the column
        const diags1 = Array(2 * n - 1).fill(false); // Record whether there is a queen on the main diagonal
        const diags2 = Array(2 * n - 1).fill(false); // Record whether there is a queen on the anti-diagonal
        const res = [];

        backtrack(0, n, state, res, cols, diags1, diags2);
        return res;
    }
    ```

=== "TS"

    ```typescript title="n_queens.ts"
    /* Backtracking algorithm: N queens */
    function backtrack(
        row: number,
        n: number,
        state: string[][],
        res: string[][][],
        cols: boolean[],
        diags1: boolean[],
        diags2: boolean[]
    ): void {
        // When all rows are placed, record the solution
        if (row === n) {
            res.push(state.map((row) => row.slice()));
            return;
        }
        // Traverse all columns
        for (let col = 0; col < n; col++) {
            // Calculate the main diagonal and anti-diagonal corresponding to this cell
            const diag1 = row - col + n - 1;
            const diag2 = row + col;
            // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Attempt: place the queen in this cell
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this cell to an empty cell
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve N queens */
    function nQueens(n: number): string[][][] {
        // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
        const state = Array.from({ length: n }, () => Array(n).fill('#'));
        const cols = Array(n).fill(false); // Record whether there is a queen in the column
        const diags1 = Array(2 * n - 1).fill(false); // Record whether there is a queen on the main diagonal
        const diags2 = Array(2 * n - 1).fill(false); // Record whether there is a queen on the anti-diagonal
        const res: string[][][] = [];

        backtrack(0, n, state, res, cols, diags1, diags2);
        return res;
    }
    ```

=== "Dart"

    ```dart title="n_queens.dart"
    /* Backtracking algorithm: N queens */
    void backtrack(
      int row,
      int n,
      List<List<String>> state,
      List<List<List<String>>> res,
      List<bool> cols,
      List<bool> diags1,
      List<bool> diags2,
    ) {
      // When all rows are placed, record the solution
      if (row == n) {
        List<List<String>> copyState = [];
        for (List<String> sRow in state) {
          copyState.add(List.from(sRow));
        }
        res.add(copyState);
        return;
      }
      // Traverse all columns
      for (int col = 0; col < n; col++) {
        // Calculate the main diagonal and anti-diagonal corresponding to this cell
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
          // Attempt: place the queen in this cell
          state[row][col] = "Q";
          cols[col] = true;
          diags1[diag1] = true;
          diags2[diag2] = true;
          // Place the next row
          backtrack(row + 1, n, state, res, cols, diags1, diags2);
          // Backtrack: restore this cell to an empty cell
          state[row][col] = "#";
          cols[col] = false;
          diags1[diag1] = false;
          diags2[diag2] = false;
        }
      }
    }

    /* Solve N queens */
    List<List<List<String>>> nQueens(int n) {
      // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
      List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
      List<bool> cols = List.filled(n, false); // Record whether there is a queen in the column
      List<bool> diags1 = List.filled(2 * n - 1, false); // Record whether there is a queen on the main diagonal
      List<bool> diags2 = List.filled(2 * n - 1, false); // Record whether there is a queen on the anti-diagonal
      List<List<List<String>>> res = [];

      backtrack(0, n, state, res, cols, diags1, diags2);

      return res;
    }
    ```

=== "Rust"

    ```rust title="n_queens.rs"
    /* Backtracking algorithm: N queens */
    fn backtrack(
        row: usize,
        n: usize,
        state: &mut Vec<Vec<String>>,
        res: &mut Vec<Vec<Vec<String>>>,
        cols: &mut [bool],
        diags1: &mut [bool],
        diags2: &mut [bool],
    ) {
        // When all rows are placed, record the solution
        if row == n {
            res.push(state.clone());
            return;
        }
        // Traverse all columns
        for col in 0..n {
            // Calculate the main diagonal and anti-diagonal corresponding to this cell
            let diag1 = row + n - 1 - col;
            let diag2 = row + col;
            // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
            if !cols[col] && !diags1[diag1] && !diags2[diag2] {
                // Attempt: place the queen in this cell
                state[row][col] = "Q".into();
                (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
                // Place the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this cell to an empty cell
                state[row][col] = "#".into();
                (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
            }
        }
    }

    /* Solve N queens */
    fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
        // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
        let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
        let mut cols = vec![false; n]; // Record whether there is a queen in the column
        let mut diags1 = vec![false; 2 * n - 1]; // Record whether there is a queen on the main diagonal
        let mut diags2 = vec![false; 2 * n - 1]; // Record whether there is a queen on the anti-diagonal
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
    /* Backtracking algorithm: N queens */
    void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
                   bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
        // When all rows are placed, record the solution
        if (row == n) {
            res[*resSize] = (char **)malloc(sizeof(char *) * n);
            for (int i = 0; i < n; ++i) {
                res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
                strcpy(res[*resSize][i], state[i]);
            }
            (*resSize)++;
            return;
        }
        // Traverse all columns
        for (int col = 0; col < n; col++) {
            // Calculate the main diagonal and anti-diagonal corresponding to this cell
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Attempt: place the queen in this cell
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place the next row
                backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
                // Backtrack: restore this cell to an empty cell
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve N queens */
    char ***nQueens(int n, int *returnSize) {
        char state[MAX_SIZE][MAX_SIZE];
        // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                state[i][j] = '#';
            }
            state[i][n] = '\0';
        }
        bool cols[MAX_SIZE] = {false};           // Record whether there is a queen in the column
        bool diags1[2 * MAX_SIZE - 1] = {false}; // Record whether there is a queen on the main diagonal
        bool diags2[2 * MAX_SIZE - 1] = {false}; // Record whether there is a queen on the anti-diagonal

        char ***res = (char ***)malloc(sizeof(char **) * MAX_SIZE);
        *returnSize = 0;
        backtrack(0, n, state, res, returnSize, cols, diags1, diags2);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="n_queens.kt"
    /* Backtracking algorithm: N queens */
    fun backtrack(
        row: Int,
        n: Int,
        state: MutableList<MutableList<String>>,
        res: MutableList<MutableList<MutableList<String>>?>,
        cols: BooleanArray,
        diags1: BooleanArray,
        diags2: BooleanArray
    ) {
        // When all rows are placed, record the solution
        if (row == n) {
            val copyState = mutableListOf<MutableList<String>>()
            for (sRow in state) {
                copyState.add(sRow.toMutableList())
            }
            res.add(copyState)
            return
        }
        // Traverse all columns
        for (col in 0..<n) {
            // Calculate the main diagonal and anti-diagonal corresponding to this cell
            val diag1 = row - col + n - 1
            val diag2 = row + col
            // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Attempt: place the queen in this cell
                state[row][col] = "Q"
                diags2[diag2] = true
                diags1[diag1] = diags2[diag2]
                cols[col] = diags1[diag1]
                // Place the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2)
                // Backtrack: restore this cell to an empty cell
                state[row][col] = "#"
                diags2[diag2] = false
                diags1[diag1] = diags2[diag2]
                cols[col] = diags1[diag1]
            }
        }
    }

    /* Solve N queens */
    fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
        // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
        val state = mutableListOf<MutableList<String>>()
        for (i in 0..<n) {
            val row = mutableListOf<String>()
            for (j in 0..<n) {
                row.add("#")
            }
            state.add(row)
        }
        val cols = BooleanArray(n) // Record whether there is a queen in the column
        val diags1 = BooleanArray(2 * n - 1) // Record whether there is a queen on the main diagonal
        val diags2 = BooleanArray(2 * n - 1) // Record whether there is a queen on the anti-diagonal
        val res = mutableListOf<MutableList<MutableList<String>>?>()

        backtrack(0, n, state, res, cols, diags1, diags2)

        return res
    }
    ```

=== "Ruby"

    ```ruby title="n_queens.rb"
    ### Backtracking: n queens ###
    def backtrack(row, n, state, res, cols, diags1, diags2)
      # When all rows are placed, record the solution
      if row == n
        res << state.map { |row| row.dup }
        return
      end

      # Traverse all columns
      for col in 0...n
        # Calculate the main diagonal and anti-diagonal corresponding to this cell
        diag1 = row - col + n - 1
        diag2 = row + col
        # Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
        if !cols[col] && !diags1[diag1] && !diags2[diag2]
          # Attempt: place the queen in this cell
          state[row][col] = "Q"
          cols[col] = diags1[diag1] = diags2[diag2] = true
          # Place the next row
          backtrack(row + 1, n, state, res, cols, diags1, diags2)
          # Backtrack: restore this cell to an empty cell
          state[row][col] = "#"
          cols[col] = diags1[diag1] = diags2[diag2] = false
        end
      end
    end

    ### Solve n queens ###
    def n_queens(n)
      # Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
      state = Array.new(n) { Array.new(n, "#") }
      cols = Array.new(n, false) # Record whether there is a queen in the column
      diags1 = Array.new(2 * n - 1, false) # Record whether there is a queen on the main diagonal
      diags2 = Array.new(2 * n - 1, false) # Record whether there is a queen on the anti-diagonal
      res = []
      backtrack(0, n, state, res, cols, diags1, diags2)

      res
    end
    ```

Placing $n$ queens row by row, considering the column constraint, from the first row to the last row there are $n$, $n-1$, $\dots$, $2$, $1$ choices, using $O(n!)$ time. When recording a solution, it is necessary to copy the matrix `state` and add it to `res`, and the copy operation uses $O(n^2)$ time. Therefore, **the overall time complexity is $O(n! \cdot n^2)$**. In practice, pruning based on diagonal constraints can also significantly reduce the search space, so the search efficiency is often better than the time complexity mentioned above.

The array `state` uses $O(n^2)$ space, and the arrays `cols`, `diags1`, and `diags2` each use $O(n)$ space. The maximum recursion depth is $n$, using $O(n)$ stack frame space. Therefore, **the space complexity is $O(n^2)$**.
