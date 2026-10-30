/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

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

/* Driver code */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "Board width and height: " << n << endl;
    cout << "Queen placements: " << res.size() << " solutions" << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}
