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
        // Record the solution once every row has a queen
        if (row == n) {
            List<List<string>> copyState = [];
            foreach (List<string> sRow in state) {
                copyState.Add(new List<string>(sRow));
            }
            res.Add(copyState);
            return;
        }
        // Try each column
        for (int col = 0; col < n; col++) {
            // Find the two diagonals through this square
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Prune if the column or either diagonal already has a queen
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Try placing a queen on this square
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place a queen in the next row
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: clear this square
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve the n-queens problem */
    List<List<List<string>>> NQueens(int n) {
        // Set up an n-by-n board with 'Q' for a queen and '#' for an empty square
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // Track occupied columns
        bool[] diags1 = new bool[2 * n - 1]; // Track occupied main diagonals
        bool[] diags2 = new bool[2 * n - 1]; // Track occupied secondary diagonals
        List<List<List<string>>> res = [];

        Backtrack(0, n, state, res, cols, diags1, diags2);

        return res;
    }

    [Test]
    public void Test() {
        int n = 4;
        List<List<List<string>>> res = NQueens(n);

        Console.WriteLine("Board side length:  " + n);
        Console.WriteLine("Found  " + res.Count + "  queen arrangements");
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
