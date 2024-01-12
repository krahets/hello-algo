/**
 * File: n_queens.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* 回溯算法：n 皇后 */
function backtrack(
    row: number,
    n: number,
    state: string[][],
    res: string[][][],
    cols: boolean[],
    diags1: boolean[],
    diags2: boolean[]
): void {
    // 当放置完所有行时，记录解
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // 遍历所有列
    for (let col = 0; col < n; col++) {
        // 计算该格子对应的主对角线和次对角线
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // 剪枝：不允许该格子所在列、主对角线、次对角线上存在皇后
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 尝试：将皇后放置在该格子
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 放置下一行
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 回退：将该格子恢复为空位
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* 求解 n 皇后 */
function nQueens(n: number): string[][][] {
    // 初始化 n*n 大小的棋盘，其中 'Q' 代表皇后，'#' 代表空位
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // 记录列是否有皇后
    const diags1 = Array(2 * n - 1).fill(false); // 记录主对角线上是否有皇后
    const diags2 = Array(2 * n - 1).fill(false); // 记录次对角线上是否有皇后
    const res: string[][][] = [];

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

export {};
