---
comments: true
---

# 13.4 &nbsp; N-queens problem

!!! question

    In chess, a queen can attack any piece in the same row, column, or diagonal. Given $n$ queens and an $n \times n$ chessboard, find all arrangements in which no two queens can attack each other.

As shown in Figure 13-15, there are two solutions when $n = 4$. From a backtracking perspective, the $n \times n$ board has $n^2$ squares, which provide all possible `choices`. As we place queens one by one, the board changes; its arrangement at any moment is the current `state`.

![Solutions to the 4-queens problem](n_queens_problem.assets/solution_4_queens.png){ class="animation-figure" }

<p align="center"> Figure 13-15 &nbsp; Solutions to the 4-queens problem </p>

Figure 13-16 shows the three constraints: **no two queens may share a row, column, or diagonal**. Diagonals run in two directions: the main-diagonal direction `\` and the antidiagonal direction `/`.

![Constraints of the n-queens problem](n_queens_problem.assets/n_queens_constraints.png){ class="animation-figure" }

<p align="center"> Figure 13-16 &nbsp; Constraints of the n-queens problem </p>

### 1. &nbsp; Placing queens row by row

There are as many queens as rows, namely $n$, so we can immediately conclude that **each row must contain exactly one queen**.

We can therefore place queens row by row: start at the first row and place one queen in each row through the last.

Figure 13-17 illustrates this process for 4 queens. To fit the illustration, only one branch from the first row is expanded, and all arrangements violating the column or diagonal constraints are pruned.

![Placing queens row by row](n_queens_problem.assets/n_queens_placing.png){ class="animation-figure" }

<p align="center"> Figure 13-17 &nbsp; Placing queens row by row </p>

In essence, **placing queens row by row is itself a form of pruning**: it eliminates every search branch that places multiple queens in the same row.

### 2. &nbsp; Pruning by columns and diagonals

To enforce the column constraint, use a Boolean array `cols` of length $n$ to record whether each column contains a queen. Before placing a queen, consult `cols` to prune columns already occupied, and update `cols` as the search proceeds and backtracks.

!!! tip

    The matrix starts at its top-left corner. Row indices increase downward, and column indices increase to the right.

How do we enforce the diagonal constraints? Let $(row, col)$ be the row and column indices of a square. Along any diagonal in the main-diagonal direction, the row index minus the column index is the same: **$row - col$ is constant along that diagonal**.

Thus, if two squares satisfy $row_1 - col_1 = row_2 - col_2$, they lie on the same main-direction diagonal. Using this property, the array `diags1` in Figure 13-18 records whether each such diagonal contains a queen.

Similarly, **$row + col$ is constant along each antidiagonal**. We can use an array `diags2` to enforce the antidiagonal constraint.

![Enforcing column and diagonal constraints](n_queens_problem.assets/n_queens_cols_diagonals.png){ class="animation-figure" }

<p align="center"> Figure 13-18 &nbsp; Enforcing column and diagonal constraints </p>

### 3. &nbsp; Code implementation

In a square matrix of order $n$, $row - col$ ranges over $[-n + 1, n - 1]$, and $row + col$ ranges over $[0, 2n - 2]$. There are therefore $2n - 1$ diagonals in each direction, so both `diags1` and `diags2` have length $2n - 1$.

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
        """Backtracking: n-queens"""
        # Record a solution when a queen has been placed in every row
        if row == n:
            res.append([list(row) for row in state])
            return
        # Iterate over all columns
        for col in range(n):
            # Calculate the main-diagonal and anti-diagonal indices for this square
            diag1 = row - col + n - 1
            diag2 = row + col
            # Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
            if not cols[col] and not diags1[diag1] and not diags2[diag2]:
                # Try: place a queen on this square
                state[row][col] = "Q"
                cols[col] = diags1[diag1] = diags2[diag2] = True
                # Place a queen in the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2)
                # Backtrack: restore this square to empty
                state[row][col] = "#"
                cols[col] = diags1[diag1] = diags2[diag2] = False

    def n_queens(n: int) -> list[list[list[str]]]:
        """Solve the n-queens problem"""
        # Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
        state = [["#" for _ in range(n)] for _ in range(n)]
        cols = [False] * n  # Track whether a column contains a queen
        diags1 = [False] * (2 * n - 1)  # Track whether a main diagonal contains a queen
        diags2 = [False] * (2 * n - 1)  # Track whether an anti-diagonal contains a queen
        res = []
        backtrack(0, n, state, res, cols, diags1, diags2)

        return res
    ```

=== "C++"

    ```cpp title="n_queens.cpp"
    /* Backtracking: n-queens */
    void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
                   vector<bool> &diags1, vector<bool> &diags2) {
        // Record a solution when a queen has been placed in every row
        if (row == n) {
            res.push_back(state);
            return;
        }
        // Iterate over all columns
        for (int col = 0; col < n; col++) {
            // Calculate the main-diagonal and anti-diagonal indices for this square
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Try: place a queen on this square
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place a queen in the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this square to empty
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve the n-queens problem */
    vector<vector<vector<string>>> nQueens(int n) {
        // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
        vector<vector<string>> state(n, vector<string>(n, "#"));
        vector<bool> cols(n, false);           // Track whether a column contains a queen
        vector<bool> diags1(2 * n - 1, false); // Track whether a main diagonal contains a queen
        vector<bool> diags2(2 * n - 1, false); // Track whether an anti-diagonal contains a queen
        vector<vector<vector<string>>> res;

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "Java"

    ```java title="n_queens.java"
    /* Backtracking: n-queens */
    void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
            boolean[] cols, boolean[] diags1, boolean[] diags2) {
        // Record a solution when a queen has been placed in every row
        if (row == n) {
            List<List<String>> copyState = new ArrayList<>();
            for (List<String> sRow : state) {
                copyState.add(new ArrayList<>(sRow));
            }
            res.add(copyState);
            return;
        }
        // Iterate over all columns
        for (int col = 0; col < n; col++) {
            // Calculate the main-diagonal and anti-diagonal indices for this square
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Try: place a queen on this square
                state.get(row).set(col, "Q");
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place a queen in the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this square to empty
                state.get(row).set(col, "#");
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve the n-queens problem */
    List<List<List<String>>> nQueens(int n) {
        // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
        List<List<String>> state = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            List<String> row = new ArrayList<>();
            for (int j = 0; j < n; j++) {
                row.add("#");
            }
            state.add(row);
        }
        boolean[] cols = new boolean[n]; // Track whether a column contains a queen
        boolean[] diags1 = new boolean[2 * n - 1]; // Track whether a main diagonal contains a queen
        boolean[] diags2 = new boolean[2 * n - 1]; // Track whether an anti-diagonal contains a queen
        List<List<List<String>>> res = new ArrayList<>();

        backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "C#"

    ```csharp title="n_queens.cs"
    /* Backtracking: n-queens */
    void Backtrack(int row, int n, List<List<string>> state, List<List<List<string>>> res,
            bool[] cols, bool[] diags1, bool[] diags2) {
        // Record a solution when a queen has been placed in every row
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
            return;
        }
        // Iterate over all columns
        for (int col = 0; col < n; col++) {
            // Calculate the main-diagonal and anti-diagonal indices for this square
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Try: place a queen on this square
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place a queen in the next row
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this square to empty
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve the n-queens problem */
    List<List<List<string>>> NQueens(int n) {
        // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // Track whether a column contains a queen
        bool[] diags1 = new bool[2 * n - 1]; // Track whether a main diagonal contains a queen
        bool[] diags2 = new bool[2 * n - 1]; // Track whether an anti-diagonal contains a queen
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }
    ```

=== "Go"

    ```go title="n_queens.go"
    /* Backtracking: n-queens */
    func backtrack(row, n int, state *[][]string, res *[][][]string, cols, diags1, diags2 *[]bool) {
        // Record a solution when a queen has been placed in every row
        if row == n {
            newState := make([][]string, len(*state))
            for i, _ := range newState {
                newState[i] = make([]string, len((*state)[0]))
                copy(newState[i], (*state)[i])

            }
            *res = append(*res, newState)
            return
        }
        // Iterate over all columns
        for col := 0; col < n; col++ {
            // Calculate the main-diagonal and anti-diagonal indices for this square
            diag1 := row - col + n - 1
            diag2 := row + col
            // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
            if !(*cols)[col] && !(*diags1)[diag1] && !(*diags2)[diag2] {
                // Try: place a queen on this square
                (*state)[row][col] = "Q"
                (*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = true, true, true
                // Place a queen in the next row
                backtrack(row+1, n, state, res, cols, diags1, diags2)
                // Backtrack: restore this square to empty
                (*state)[row][col] = "#"
                (*cols)[col], (*diags1)[diag1], (*diags2)[diag2] = false, false, false
            }
        }
    }

    /* Solve the n-queens problem */
    func nQueens(n int) [][][]string {
        // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
        state := make([][]string, n)
        for i := 0; i < n; i++ {
            row := make([]string, n)
            for i := 0; i < n; i++ {
                row[i] = "#"
            }
            state[i] = row
        }
        // Track whether a column contains a queen
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
    /* Backtracking: n-queens */
    func backtrack(row: Int, n: Int, state: inout [[String]], res: inout [[[String]]], cols: inout [Bool], diags1: inout [Bool], diags2: inout [Bool]) {
        // Record a solution when a queen has been placed in every row
        if row == n {
            res.append(state)
            return
        }
        // Iterate over all columns
        for col in 0 ..< n {
            // Calculate the main-diagonal and anti-diagonal indices for this square
            let diag1 = row - col + n - 1
            let diag2 = row + col
            // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
            if !cols[col] && !diags1[diag1] && !diags2[diag2] {
                // Try: place a queen on this square
                state[row][col] = "Q"
                cols[col] = true
                diags1[diag1] = true
                diags2[diag2] = true
                // Place a queen in the next row
                backtrack(row: row + 1, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)
                // Backtrack: restore this square to empty
                state[row][col] = "#"
                cols[col] = false
                diags1[diag1] = false
                diags2[diag2] = false
            }
        }
    }

    /* Solve the n-queens problem */
    func nQueens(n: Int) -> [[[String]]] {
        // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
        var state = Array(repeating: Array(repeating: "#", count: n), count: n)
        var cols = Array(repeating: false, count: n) // Track whether a column contains a queen
        var diags1 = Array(repeating: false, count: 2 * n - 1) // Track whether a main diagonal contains a queen
        var diags2 = Array(repeating: false, count: 2 * n - 1) // Track whether an anti-diagonal contains a queen
        var res: [[[String]]] = []

        backtrack(row: 0, n: n, state: &state, res: &res, cols: &cols, diags1: &diags1, diags2: &diags2)

        return res
    }
    ```

=== "JS"

    ```javascript title="n_queens.js"
    /* Backtracking: n-queens */
    function backtrack(row, n, state, res, cols, diags1, diags2) {
        // Record a solution when a queen has been placed in every row
        if (row === n) {
            res.push(state.map((row) => row.slice()));
            return;
        }
        // Iterate over all columns
        for (let col = 0; col < n; col++) {
            // Calculate the main-diagonal and anti-diagonal indices for this square
            const diag1 = row - col + n - 1;
            const diag2 = row + col;
            // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Try: place a queen on this square
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place a queen in the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this square to empty
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve the n-queens problem */
    function nQueens(n) {
        // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
        const state = Array.from({ length: n }, () => Array(n).fill('#'));
        const cols = Array(n).fill(false); // Track whether a column contains a queen
        const diags1 = Array(2 * n - 1).fill(false); // Track whether a main diagonal contains a queen
        const diags2 = Array(2 * n - 1).fill(false); // Track whether an anti-diagonal contains a queen
        const res = [];

        backtrack(0, n, state, res, cols, diags1, diags2);
        return res;
    }
    ```

=== "TS"

    ```typescript title="n_queens.ts"
    /* Backtracking: n-queens */
    function backtrack(
        row: number,
        n: number,
        state: string[][],
        res: string[][][],
        cols: boolean[],
        diags1: boolean[],
        diags2: boolean[]
    ): void {
        // Record a solution when a queen has been placed in every row
        if (row === n) {
            res.push(state.map((row) => row.slice()));
            return;
        }
        // Iterate over all columns
        for (let col = 0; col < n; col++) {
            // Calculate the main-diagonal and anti-diagonal indices for this square
            const diag1 = row - col + n - 1;
            const diag2 = row + col;
            // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Try: place a queen on this square
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place a queen in the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this square to empty
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve the n-queens problem */
    function nQueens(n: number): string[][][] {
        // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
        const state = Array.from({ length: n }, () => Array(n).fill('#'));
        const cols = Array(n).fill(false); // Track whether a column contains a queen
        const diags1 = Array(2 * n - 1).fill(false); // Track whether a main diagonal contains a queen
        const diags2 = Array(2 * n - 1).fill(false); // Track whether an anti-diagonal contains a queen
        const res: string[][][] = [];

        backtrack(0, n, state, res, cols, diags1, diags2);
        return res;
    }
    ```

=== "Dart"

    ```dart title="n_queens.dart"
    /* Backtracking: n-queens */
    void backtrack(
      int row,
      int n,
      List<List<String>> state,
      List<List<List<String>>> res,
      List<bool> cols,
      List<bool> diags1,
      List<bool> diags2,
    ) {
      // Record a solution when a queen has been placed in every row
      if (row == n) {
        List<List<String>> copyState = [];
        for (List<String> sRow in state) {
          copyState.add(List.from(sRow));
        }
        res.add(copyState);
        return;
      }
      // Iterate over all columns
      for (int col = 0; col < n; col++) {
        // Calculate the main-diagonal and anti-diagonal indices for this square
        int diag1 = row - col + n - 1;
        int diag2 = row + col;
        // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
          // Try: place a queen on this square
          state[row][col] = "Q";
          cols[col] = true;
          diags1[diag1] = true;
          diags2[diag2] = true;
          // Place a queen in the next row
          backtrack(row + 1, n, state, res, cols, diags1, diags2);
          // Backtrack: restore this square to empty
          state[row][col] = "#";
          cols[col] = false;
          diags1[diag1] = false;
          diags2[diag2] = false;
        }
      }
    }

    /* Solve the n-queens problem */
    List<List<List<String>>> nQueens(int n) {
      // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
      List<List<String>> state = List.generate(n, (index) => List.filled(n, "#"));
      List<bool> cols = List.filled(n, false); // Track whether a column contains a queen
      List<bool> diags1 = List.filled(2 * n - 1, false); // Track whether a main diagonal contains a queen
      List<bool> diags2 = List.filled(2 * n - 1, false); // Track whether an anti-diagonal contains a queen
      List<List<List<String>>> res = [];

      backtrack(0, n, state, res, cols, diags1, diags2);

      return res;
    }
    ```

=== "Rust"

    ```rust title="n_queens.rs"
    /* Backtracking: n-queens */
    fn backtrack(
        row: usize,
        n: usize,
        state: &mut Vec<Vec<String>>,
        res: &mut Vec<Vec<Vec<String>>>,
        cols: &mut [bool],
        diags1: &mut [bool],
        diags2: &mut [bool],
    ) {
        // Record a solution when a queen has been placed in every row
        if row == n {
            res.push(state.clone());
            return;
        }
        // Iterate over all columns
        for col in 0..n {
            // Calculate the main-diagonal and anti-diagonal indices for this square
            let diag1 = row + n - 1 - col;
            let diag2 = row + col;
            // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
            if !cols[col] && !diags1[diag1] && !diags2[diag2] {
                // Try: place a queen on this square
                state[row][col] = "Q".into();
                (cols[col], diags1[diag1], diags2[diag2]) = (true, true, true);
                // Place a queen in the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this square to empty
                state[row][col] = "#".into();
                (cols[col], diags1[diag1], diags2[diag2]) = (false, false, false);
            }
        }
    }

    /* Solve the n-queens problem */
    fn n_queens(n: usize) -> Vec<Vec<Vec<String>>> {
        // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
        let mut state: Vec<Vec<String>> = vec![vec!["#".to_string(); n]; n];
        let mut cols = vec![false; n]; // Track whether a column contains a queen
        let mut diags1 = vec![false; 2 * n - 1]; // Track whether a main diagonal contains a queen
        let mut diags2 = vec![false; 2 * n - 1]; // Track whether an anti-diagonal contains a queen
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
    /* Backtracking: n-queens */
    void backtrack(int row, int n, char state[MAX_SIZE][MAX_SIZE], char ***res, int *resSize, bool cols[MAX_SIZE],
                   bool diags1[2 * MAX_SIZE - 1], bool diags2[2 * MAX_SIZE - 1]) {
        // Record a solution when a queen has been placed in every row
        if (row == n) {
            res[*resSize] = (char **)malloc(sizeof(char *) * n);
            for (int i = 0; i < n; ++i) {
                res[*resSize][i] = (char *)malloc(sizeof(char) * (n + 1));
                strcpy(res[*resSize][i], state[i]);
            }
            (*resSize)++;
            return;
        }
        // Iterate over all columns
        for (int col = 0; col < n; col++) {
            // Calculate the main-diagonal and anti-diagonal indices for this square
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Try: place a queen on this square
                state[row][col] = 'Q';
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place a queen in the next row
                backtrack(row + 1, n, state, res, resSize, cols, diags1, diags2);
                // Backtrack: restore this square to empty
                state[row][col] = '#';
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve the n-queens problem */
    char ***nQueens(int n, int *returnSize) {
        char state[MAX_SIZE][MAX_SIZE];
        // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
        for (int i = 0; i < n; ++i) {
            for (int j = 0; j < n; ++j) {
                state[i][j] = '#';
            }
            state[i][n] = '\0';
        }
        bool cols[MAX_SIZE] = {false};           // Track whether a column contains a queen
        bool diags1[2 * MAX_SIZE - 1] = {false}; // Track whether a main diagonal contains a queen
        bool diags2[2 * MAX_SIZE - 1] = {false}; // Track whether an anti-diagonal contains a queen

        char ***res = (char ***)malloc(sizeof(char **) * MAX_SIZE);
        *returnSize = 0;
        backtrack(0, n, state, res, returnSize, cols, diags1, diags2);
        return res;
    }
    ```

=== "Kotlin"

    ```kotlin title="n_queens.kt"
    /* Backtracking: n-queens */
    fun backtrack(
        row: Int,
        n: Int,
        state: MutableList<MutableList<String>>,
        res: MutableList<MutableList<MutableList<String>>?>,
        cols: BooleanArray,
        diags1: BooleanArray,
        diags2: BooleanArray
    ) {
        // Record a solution when a queen has been placed in every row
        if (row == n) {
            val copyState = mutableListOf<MutableList<String>>()
            for (sRow in state) {
                copyState.add(sRow.toMutableList())
            }
            res.add(copyState)
            return
        }
        // Iterate over all columns
        for (col in 0..<n) {
            // Calculate the main-diagonal and anti-diagonal indices for this square
            val diag1 = row - col + n - 1
            val diag2 = row + col
            // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Try: place a queen on this square
                state[row][col] = "Q"
                diags2[diag2] = true
                diags1[diag1] = diags2[diag2]
                cols[col] = diags1[diag1]
                // Place a queen in the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2)
                // Backtrack: restore this square to empty
                state[row][col] = "#"
                diags2[diag2] = false
                diags1[diag1] = diags2[diag2]
                cols[col] = diags1[diag1]
            }
        }
    }

    /* Solve the n-queens problem */
    fun nQueens(n: Int): MutableList<MutableList<MutableList<String>>?> {
        // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
        val state = mutableListOf<MutableList<String>>()
        for (i in 0..<n) {
            val row = mutableListOf<String>()
            for (j in 0..<n) {
                row.add("#")
            }
            state.add(row)
        }
        val cols = BooleanArray(n) // Track whether a column contains a queen
        val diags1 = BooleanArray(2 * n - 1) // Track whether a main diagonal contains a queen
        val diags2 = BooleanArray(2 * n - 1) // Track whether an anti-diagonal contains a queen
        val res = mutableListOf<MutableList<MutableList<String>>?>()

        backtrack(0, n, state, res, cols, diags1, diags2)

        return res
    }
    ```

=== "Ruby"

    ```ruby title="n_queens.rb"
    ### Backtracking: n-queens ###
    def backtrack(row, n, state, res, cols, diags1, diags2)
      # Record a solution when a queen has been placed in every row
      if row == n
        res << state.map { |row| row.dup }
        return
      end

      # Iterate over all columns
      for col in 0...n
        # Calculate the main-diagonal and anti-diagonal indices for this square
        diag1 = row - col + n - 1
        diag2 = row + col
        # Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
        if !cols[col] && !diags1[diag1] && !diags2[diag2]
          # Try: place a queen on this square
          state[row][col] = "Q"
          cols[col] = diags1[diag1] = diags2[diag2] = true
          # Place a queen in the next row
          backtrack(row + 1, n, state, res, cols, diags1, diags2)
          # Backtrack: restore this square to empty
          state[row][col] = "#"
          cols[col] = diags1[diag1] = diags2[diag2] = false
        end
      end
    end

    ### Solve the n-queens problem ###
    def n_queens(n)
      # Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
      state = Array.new(n) { Array.new(n, "#") }
      cols = Array.new(n, false) # Track whether a column contains a queen
      diags1 = Array.new(2 * n - 1, false) # Track whether a main diagonal contains a queen
      diags2 = Array.new(2 * n - 1, false) # Track whether an anti-diagonal contains a queen
      res = []
      backtrack(0, n, state, res, cols, diags1, diags2)

      res
    end
    ```

??? pythontutor "Visualize execution"

    <div style="height: 549px; width: 100%;"><iframe class="pythontutor-iframe" title="Visualize execution" src="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20row%3A%20int,%0A%20%20%20%20n%3A%20int,%0A%20%20%20%20state%3A%20list%5Blist%5Bstr%5D%5D,%0A%20%20%20%20res%3A%20list%5Blist%5Blist%5Bstr%5D%5D%5D,%0A%20%20%20%20cols%3A%20list%5Bbool%5D,%0A%20%20%20%20diags1%3A%20list%5Bbool%5D,%0A%20%20%20%20diags2%3A%20list%5Bbool%5D,%0A%29%3A%0A%20%20%20%20%22%22%22Backtracking%3A%20N-queens%22%22%22%0A%20%20%20%20%23%20Record%20a%20solution%20when%20a%20queen%20has%20been%20placed%20in%20every%20row%0A%20%20%20%20if%20row%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res.append%28%5Blist%28row%29%20for%20row%20in%20state%5D%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20Iterate%20over%20all%20columns%0A%20%20%20%20for%20col%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%23%20Calculate%20the%20main-diagonal%20and%20anti-diagonal%20indices%20for%20this%20square%0A%20%20%20%20%20%20%20%20diag1%20%3D%20row%20-%20col%20%2B%20n%20-%201%0A%20%20%20%20%20%20%20%20diag2%20%3D%20row%20%2B%20col%0A%20%20%20%20%20%20%20%20%23%20Prune%3A%20the%20square%20must%20have%20no%20queen%20in%20its%20column,%20main%20diagonal,%20or%20anti-diagonal%0A%20%20%20%20%20%20%20%20if%20not%20cols%5Bcol%5D%20and%20not%20diags1%5Bdiag1%5D%20and%20not%20diags2%5Bdiag2%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Try%3A%20place%20a%20queen%20on%20this%20square%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%22Q%22%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Place%20a%20queen%20in%20the%20next%20row%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28row%20%2B%201,%20n,%20state,%20res,%20cols,%20diags1,%20diags2%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Backtrack%3A%20restore%20this%20square%20to%20empty%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%22%23%22%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20False%0A%0A%0Adef%20n_queens%28n%3A%20int%29%20-%3E%20list%5Blist%5Blist%5Bstr%5D%5D%5D%3A%0A%20%20%20%20%22%22%22Solve%20the%20N-queens%20problem%22%22%22%0A%20%20%20%20%23%20Initialize%20an%20n%2An%20board,%20where%20%27Q%27%20represents%20a%20queen%20and%20%27%23%27%20represents%20an%20empty%20square%0A%20%20%20%20state%20%3D%20%5B%5B%22%23%22%20for%20_%20in%20range%28n%29%5D%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20cols%20%3D%20%5BFalse%5D%20%2A%20n%20%20%23%20Track%20whether%20a%20column%20contains%20a%20queen%0A%20%20%20%20diags1%20%3D%20%5BFalse%5D%20%2A%20%282%20%2A%20n%20-%201%29%20%20%23%20Track%20whether%20a%20main%20diagonal%20contains%20a%20queen%0A%20%20%20%20diags2%20%3D%20%5BFalse%5D%20%2A%20%282%20%2A%20n%20-%201%29%20%20%23%20Track%20whether%20an%20anti-diagonal%20contains%20a%20queen%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%280,%20n,%20state,%20res,%20cols,%20diags1,%20diags2%29%0A%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20res%20%3D%20n_queens%28n%29%0A%0A%20%20%20%20print%28f%22The%20input%20board%20has%20width%20and%20height%20%7Bn%7D%22%29%0A%20%20%20%20print%28f%22Number%20of%20ways%20to%20place%20the%20queens%3A%20%7Blen%28res%29%7D%22%29%0A%20%20%20%20for%20state%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%22--------------------%22%29%0A%20%20%20%20%20%20%20%20for%20row%20in%20state%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28row%29&codeDivHeight=472&codeDivWidth=350&cumulative=false&curInstr=61&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false"> </iframe></div>
    <div style="margin-top: 5px;"><a href="https://pythontutor.com/iframe-embed.html#code=def%20backtrack%28%0A%20%20%20%20row%3A%20int,%0A%20%20%20%20n%3A%20int,%0A%20%20%20%20state%3A%20list%5Blist%5Bstr%5D%5D,%0A%20%20%20%20res%3A%20list%5Blist%5Blist%5Bstr%5D%5D%5D,%0A%20%20%20%20cols%3A%20list%5Bbool%5D,%0A%20%20%20%20diags1%3A%20list%5Bbool%5D,%0A%20%20%20%20diags2%3A%20list%5Bbool%5D,%0A%29%3A%0A%20%20%20%20%22%22%22Backtracking%3A%20N-queens%22%22%22%0A%20%20%20%20%23%20Record%20a%20solution%20when%20a%20queen%20has%20been%20placed%20in%20every%20row%0A%20%20%20%20if%20row%20%3D%3D%20n%3A%0A%20%20%20%20%20%20%20%20res.append%28%5Blist%28row%29%20for%20row%20in%20state%5D%29%0A%20%20%20%20%20%20%20%20return%0A%20%20%20%20%23%20Iterate%20over%20all%20columns%0A%20%20%20%20for%20col%20in%20range%28n%29%3A%0A%20%20%20%20%20%20%20%20%23%20Calculate%20the%20main-diagonal%20and%20anti-diagonal%20indices%20for%20this%20square%0A%20%20%20%20%20%20%20%20diag1%20%3D%20row%20-%20col%20%2B%20n%20-%201%0A%20%20%20%20%20%20%20%20diag2%20%3D%20row%20%2B%20col%0A%20%20%20%20%20%20%20%20%23%20Prune%3A%20the%20square%20must%20have%20no%20queen%20in%20its%20column,%20main%20diagonal,%20or%20anti-diagonal%0A%20%20%20%20%20%20%20%20if%20not%20cols%5Bcol%5D%20and%20not%20diags1%5Bdiag1%5D%20and%20not%20diags2%5Bdiag2%5D%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Try%3A%20place%20a%20queen%20on%20this%20square%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%22Q%22%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20True%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Place%20a%20queen%20in%20the%20next%20row%0A%20%20%20%20%20%20%20%20%20%20%20%20backtrack%28row%20%2B%201,%20n,%20state,%20res,%20cols,%20diags1,%20diags2%29%0A%20%20%20%20%20%20%20%20%20%20%20%20%23%20Backtrack%3A%20restore%20this%20square%20to%20empty%0A%20%20%20%20%20%20%20%20%20%20%20%20state%5Brow%5D%5Bcol%5D%20%3D%20%22%23%22%0A%20%20%20%20%20%20%20%20%20%20%20%20cols%5Bcol%5D%20%3D%20diags1%5Bdiag1%5D%20%3D%20diags2%5Bdiag2%5D%20%3D%20False%0A%0A%0Adef%20n_queens%28n%3A%20int%29%20-%3E%20list%5Blist%5Blist%5Bstr%5D%5D%5D%3A%0A%20%20%20%20%22%22%22Solve%20the%20N-queens%20problem%22%22%22%0A%20%20%20%20%23%20Initialize%20an%20n%2An%20board,%20where%20%27Q%27%20represents%20a%20queen%20and%20%27%23%27%20represents%20an%20empty%20square%0A%20%20%20%20state%20%3D%20%5B%5B%22%23%22%20for%20_%20in%20range%28n%29%5D%20for%20_%20in%20range%28n%29%5D%0A%20%20%20%20cols%20%3D%20%5BFalse%5D%20%2A%20n%20%20%23%20Track%20whether%20a%20column%20contains%20a%20queen%0A%20%20%20%20diags1%20%3D%20%5BFalse%5D%20%2A%20%282%20%2A%20n%20-%201%29%20%20%23%20Track%20whether%20a%20main%20diagonal%20contains%20a%20queen%0A%20%20%20%20diags2%20%3D%20%5BFalse%5D%20%2A%20%282%20%2A%20n%20-%201%29%20%20%23%20Track%20whether%20an%20anti-diagonal%20contains%20a%20queen%0A%20%20%20%20res%20%3D%20%5B%5D%0A%20%20%20%20backtrack%280,%20n,%20state,%20res,%20cols,%20diags1,%20diags2%29%0A%0A%20%20%20%20return%20res%0A%0A%0A%22%22%22Driver%20code%22%22%22%0Aif%20__name__%20%3D%3D%20%22__main__%22%3A%0A%20%20%20%20n%20%3D%204%0A%20%20%20%20res%20%3D%20n_queens%28n%29%0A%0A%20%20%20%20print%28f%22The%20input%20board%20has%20width%20and%20height%20%7Bn%7D%22%29%0A%20%20%20%20print%28f%22Number%20of%20ways%20to%20place%20the%20queens%3A%20%7Blen%28res%29%7D%22%29%0A%20%20%20%20for%20state%20in%20res%3A%0A%20%20%20%20%20%20%20%20print%28%22--------------------%22%29%0A%20%20%20%20%20%20%20%20for%20row%20in%20state%3A%0A%20%20%20%20%20%20%20%20%20%20%20%20print%28row%29&codeDivHeight=800&codeDivWidth=600&cumulative=false&curInstr=61&heapPrimitives=nevernest&origin=opt-frontend.js&py=311&rawInputLstJSON=%5B%5D&textReferences=false" target="_blank" rel="noopener noreferrer">View full screen ></a></div>

We place a queen in each of $n$ rows. Considering the column constraint, the successive rows have $n$, $n-1$, $\dots$, $2$, and $1$ choices, giving $O(n!)$ time. Recording a solution requires copying the matrix `state` and appending the copy to `res`, which takes $O(n^2)$ time. **The overall time complexity is therefore $O(n! \cdot n^2)$**. In practice, diagonal pruning greatly reduces the search space, so the search is often faster than this bound suggests.

The array `state` uses $O(n^2)$ space, while `cols`, `diags1`, and `diags2` each use $O(n)$ space. The maximum recursion depth is $n$, requiring $O(n)$ space for stack frames. **The space complexity is therefore $O(n^2)$**.
