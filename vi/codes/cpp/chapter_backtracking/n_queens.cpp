/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking algorithm: N queens */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // When all rows are placed, record the solution
    if (row == n) {
        res.push_back(state);
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
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Backtrack: restore this cell to an empty cell
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Solve N queens */
vector<vector<vector<string>>> nQueens(int n) {
    // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);           // Record whether there is a queen in the column
    vector<bool> diags1(2 * n - 1, false); // Record whether there is a queen on the main diagonal
    vector<bool> diags2(2 * n - 1, false); // Record whether there is a queen on the anti-diagonal
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);

    return res;
}

/* Driver Code */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "Input board size is " << n << endl;
    cout << "Total queen placement solutions: " << res.size() << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}
