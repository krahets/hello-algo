/**
 * File: n_queens.cs
 * Created Time: 2023-05-04
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class n_queens {
    /* Backtracking algorithm: n queens */
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
            // Calculate the main and minor diagonals corresponding to the cell
            int diag1 = row - col + n - 1;
            int diag2 = row + col;
            // Pruning: do not allow queens on the column, main diagonal, or minor diagonal of the cell
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Attempt: place the queen in the cell
                state[row][col] = "Q";
                cols[col] = diags1[diag1] = diags2[diag2] = true;
                // Place the next row
                Backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Retract: restore the cell to an empty spot
                state[row][col] = "#";
                cols[col] = diags1[diag1] = diags2[diag2] = false;
            }
        }
    }

    /* Solve n queens */
    List<List<List<string>>> NQueens(int n) {
        // Initialize an n*n size chessboard, where 'Q' represents the queen and '#' represents an empty spot
        List<List<string>> state = [];
        for (int i = 0; i < n; i++) {
            List<string> row = [];
            for (int j = 0; j < n; j++) {
                row.Add("#");
            }
            state.Add(row);
        }
        bool[] cols = new bool[n]; // Record columns with queens
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

        Console.WriteLine("Input the dimensions of the chessboard as" + n);
        Console.WriteLine("There are " + res.Count + " solutions to place the queens");
        foreach (List<List<string>> state in res) {
            Console.WriteLine("--------------------");
            foreach (List<string> row in state) {
                PrintUtil.PrintList(row);
            }
        }
    }
}
