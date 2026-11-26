/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking: n-queens */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // Record the solution once every row has a queen
    if (row == n) {
        res.push_back(state);
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
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Backtrack: clear this square
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Solve the n-queens problem */
vector<vector<vector<string>>> nQueens(int n) {
    // Set up an n-by-n board with 'Q' for a queen and '#' for an empty square
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);           // Track occupied columns
    vector<bool> diags1(2 * n - 1, false); // Track occupied main diagonals
    vector<bool> diags2(2 * n - 1, false); // Track occupied secondary diagonals
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);

    return res;
}

/* Driver code */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "Board side length: " << n << endl;
    cout << "Found " << res.size() << " queen arrangements" << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}
