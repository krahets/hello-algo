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
    // Record the solution once every row has a queen
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // Try each column
    for (let col = 0; col < n; col++) {
        // Find the two diagonals through this square
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // Prune if the column or either diagonal already has a queen
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // Try placing a queen on this square
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // Place a queen in the next row
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // Backtrack: clear this square
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* Solve the n-queens problem */
function nQueens(n: number): string[][][] {
    // Set up an n-by-n board with 'Q' for a queen and '#' for an empty square
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // Track occupied columns
    const diags1 = Array(2 * n - 1).fill(false); // Track occupied main diagonals
    const diags2 = Array(2 * n - 1).fill(false); // Track occupied secondary diagonals
    const res: string[][][] = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// Driver code
const n = 4;
const res = nQueens(n);

console.log(`Board side length: ${n}`);
console.log(`Found ${res.length} queen arrangements`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});

export {};
