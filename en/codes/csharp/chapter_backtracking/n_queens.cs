/**
 * File: n_queens.cs
 * Created Time: 2023-05-04
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class n_queens {
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

    [Test]
    public void Test() {
        int n = 4;
        List<List<List<string>>> res = NQueens(n);

        Console.WriteLine("Input board size is " + n);
        Console.WriteLine("Total queen placement solutions: " + res.Count + " solutions");
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
