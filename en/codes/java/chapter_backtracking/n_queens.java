/**
 * File: n_queens.java
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class n_queens {
    /* Backtracking algorithm: N queens */
    public static void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
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
    public static List<List<List<String>>> nQueens(int n) {
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

    public static void main(String[] args) {
        int n = 4;
        List<List<List<String>>> res = nQueens(n);

        System.out.println("Input board size is " + n);
        System.out.println("Total queen placement solutions: " + res.size() + "");
        for (List<List<String>> state : res) {
            System.out.println("--------------------");
            for (List<String> row : state) {
                System.out.println(row);
            }
        }
    }
}
