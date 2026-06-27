/**
 * File: n_queens.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Backtracking algorithm: N queens */
function backtrack(row, n, state, res, cols, diags1, diags2) {
    // When all rows are placed, record the solution
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // Traverse all columns
    for (let col = 0; col < n; col++) {
        // Calculate the main diagonal and anti-diagonal corresponding to this cell
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // Pruning: do not allow queens to exist in the column, main diagonal, and anti-diagonal of this cell
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Attempt: place the queen in this cell
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Place the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Backtrack: restore this cell to an empty cell
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Solve N queens */
function nQueens(n) {
    // Initialize an n*n chessboard, where 'Q' represents a queen and '#' represents an empty cell
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // Record whether there is a queen in the column
    const diags1 = Array(2 * n - 1).fill(false); // Record whether there is a queen on the main diagonal
    const diags2 = Array(2 * n - 1).fill(false); // Record whether there is a queen on the anti-diagonal
    const res = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// Driver Code
const n = 4;
const res = nQueens(n);

console.log(`Input board size is ${n}`);
console.log(`Total queen placement solutions: ${res.length}`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});
