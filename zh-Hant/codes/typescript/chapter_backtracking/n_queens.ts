/**
 * File: n_queens.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* 回溯演算法：n 皇后 */
function backtrack(
    row: number,
    n: number,
    state: string[][],
    res: string[][][],
    cols: boolean[],
    diags1: boolean[],
    diags2: boolean[]
): void {
    // 當放置完所有行時，記錄解
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // 走訪所有列
    for (let col = 0; col < n; col++) {
        // 計算該格子對應的主對角線和次對角線
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // 剪枝：不允許該格子所在列、主對角線、次對角線上存在皇后
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 嘗試：將皇后放置在該格子
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 放置下一行
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 回退：將該格子恢復為空位
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* 求解 n 皇后 */
function nQueens(n: number): string[][][] {
    // 初始化 n*n 大小的棋盤，其中 'Q' 代表皇后，'#' 代表空位
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // 記錄列是否有皇后
    const diags1 = Array(2 * n - 1).fill(false); // 記錄主對角線上是否有皇后
    const diags2 = Array(2 * n - 1).fill(false); // 記錄次對角線上是否有皇后
    const res: string[][][] = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// Driver Code
const n = 4;
const res = nQueens(n);

console.log(`輸入棋盤長寬為 ${n}`);
console.log(`皇后放置方案共有 ${res.length} 種`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});

export {};
