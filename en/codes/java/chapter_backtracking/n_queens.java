/**
 * File: n_queens.java
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

package chapter_backtracking;

import java.util.*;

public class n_queens {
    /* Backtracking: n-queens */
    public static void backtrack(int row, int n, List<List<String>> state, List<List<List<String>>> res,
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
    public static List<List<List<String>>> nQueens(int n) {
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

    public static void main(String[] args) {
        int n = 4;
        List<List<List<String>>> res = nQueens(n);

        System.out.println("Input board side length: " + n);
        System.out.println("There are " + res.size() + " queen placements");
        for (List<List<String>> state : res) {
            System.out.println("--------------------");
            for (List<String> row : state) {
                System.out.println(row);
            }
        }
    }
}
