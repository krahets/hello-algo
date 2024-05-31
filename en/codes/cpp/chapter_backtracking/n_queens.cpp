/**
 * File: n_queens.cpp
 * Created Time: 2023-05-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking algorithm: n queens */
void backtrack(int row, int n, vector<vector<string>> &state, vector<vector<vector<string>>> &res, vector<bool> &cols,
               vector<bool> &diags1, vector<bool> &diags2) {
    // When all rows are placed, record the solution
    if (row == n) {
        res.push_back(state);
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
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Retract: restore the cell to an empty spot
            state[row][col] = "#";
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Solve n queens */
vector<vector<vector<string>>> nQueens(int n) {
    // Initialize an n*n size chessboard, where 'Q' represents the queen and '#' represents an empty spot
    vector<vector<string>> state(n, vector<string>(n, "#"));
    vector<bool> cols(n, false);           // Record columns with queens
    vector<bool> diags1(2 * n - 1, false); // Record main diagonals with queens
    vector<bool> diags2(2 * n - 1, false); // Record minor diagonals with queens
    vector<vector<vector<string>>> res;

    backtrack(0, n, state, res, cols, diags1, diags2);

    return res;
}

/* Driver Code */
int main() {
    int n = 4;
    vector<vector<vector<string>>> res = nQueens(n);

    cout << "Input the dimensions of the chessboard as " << n << endl;
    cout << "Total number of queen placement solutions = " << res.size() << endl;
    for (const vector<vector<string>> &state : res) {
        cout << "--------------------" << endl;
        for (const vector<string> &row : state) {
            printVector(row);
        }
    }

    return 0;
}
