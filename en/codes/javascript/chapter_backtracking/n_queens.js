/**
 * File: n_queens.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Backtracking algorithm: n queens */
function backtrack(row, n, state, res, cols, diags1, diags2) {
    // When all rows are placed, record the solution
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // Traverse all columns
    for (let col = 0; col < n; col++) {
        // Calculate the main and minor diagonals corresponding to the cell
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // Pruning: do not allow queens on the column, main diagonal, or minor diagonal of the cell
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Attempt: place the queen in the cell
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Place the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Retract: restore the cell to an empty spot
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Solve n queens */
function nQueens(n) {
    // Initialize an n*n size chessboard, where 'Q' represents the queen and '#' represents an empty spot
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // Record columns with queens
    const diags1 = Array(2 * n - 1).fill(false); // Record main diagonals with queens
    const diags2 = Array(2 * n - 1).fill(false); // Record minor diagonals with queens
    const res = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// Driver Code
const n = 4;
const res = nQueens(n);

console.log(`输入棋盘长宽为 ${n}`);
console.log(`皇后放置方案共有 ${res.length} 种`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});
