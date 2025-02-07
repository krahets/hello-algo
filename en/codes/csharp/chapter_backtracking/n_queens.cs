// File: n_queens.cs
// Created Time: 2025-02-07
// Author: Xylphy (github.com/Xylphy)

namespace hello_algo.chapter_backtracking;

public class n_queens {
    /* Backtracking algorithm: n-queens */
    void Backtrack(int row, int n, List<List<string>> state, List<List<List<string>>> res,
            bool[] cols, bool[] diags1, bool[] diags2) {
        // When all rows are placed, record the solution
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add([.. sRow]);
            }
            res.Add(copyState);
            return;
        }
        // Traverse all columns
        for (int col = 0; col < n; col++) {
            // Calculate the main and minor diagonals corresponding to the cell
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Pruning: do not allow queens on the same column, main diagonal, or minor diagonal
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Try: place the queen on this cell
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place the next row
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: restore this cell to empty
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve n-queens */
    List<List<List<string>>> NQueens(int n) {
        // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty spot
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // Record if there is a queen in the column
        bool[] diags1 = new bool[2 * n - 1]; // Record main diagonals with queens
        bool[] diags2 = new bool[2 * n - 1]; // Record minor diagonals with queens
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    [Test]
    public void Test() {
        int n = 4;
        List<List<List<string>>> res = NQueens(n);

        Console.WriteLine("Input chessboard size is " + n);
        Console.WriteLine("There are " + res.Count + " solutions for placing the queens");
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
