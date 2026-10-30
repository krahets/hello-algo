/**
 * File: n_queens.cs
 * Created Time: 2023-05-04
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class n_queens {
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

    [Test]
    public void Test() {
        int n = 4;
        List<List<List<string>>> res = NQueens(n);

        Console.WriteLine("Input board side length: " + n);
        Console.WriteLine("There are " + res.Count + " queen placements");
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
