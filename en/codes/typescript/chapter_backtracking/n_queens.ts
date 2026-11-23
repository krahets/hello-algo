/**
 * File: n_queens.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* Backtracking: n-queens */
function backtrack(
    row: number,
    n: number,
    state: string[][],
    res: string[][][],
    cols: boolean[],
    diags1: boolean[],
    diags2: boolean[]
): void {
    // Record a solution when a queen has been placed in every row
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // Iterate over all columns
    for (let col = 0; col < n; col++) {
        // Calculate the main-diagonal and anti-diagonal indices for this square
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // Prune: the square must have no queen in its column, main diagonal, or anti-diagonal
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Try: place a queen on this square
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Place a queen in the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Backtrack: restore this square to empty
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Solve the n-queens problem */
function nQueens(n: number): string[][][] {
    // Initialize an n*n board, where 'Q' represents a queen and '#' represents an empty square
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // Track whether a column contains a queen
    const diags1 = Array(2 * n - 1).fill(false); // Track whether a main diagonal contains a queen
    const diags2 = Array(2 * n - 1).fill(false); // Track whether an anti-diagonal contains a queen
    const res: string[][][] = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// Driver code
const n = 4;
const res = nQueens(n);

console.log(`Input board side length: ${n}`);
console.log(`Number of queen arrangements: ${res.length}`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});

export {};
