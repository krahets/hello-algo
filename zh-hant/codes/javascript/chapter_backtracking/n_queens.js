/**
 * File: n_queens.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* 回溯演算法：n 皇后 */
function backtrack(row, n, state, res, cols, diags1, diags2) {
    // 每一列都放好皇后後，記錄此解
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // 逐一檢查各欄
    for (let col = 0; col < n; col++) {
        // 計算這一格對應的主對角線與副對角線索引
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // 剪枝：這一格所在的欄、主對角線及副對角線都不能已有皇后
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 嘗試：將皇后放在這一格
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 在下一列放置皇后
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 回溯：將這一格還原為空位
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* 求解 n 皇后問題 */
function nQueens(n) {
    // 初始化 n*n 棋盤，'Q' 代表皇后，'#' 代表空位
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // 記錄各欄是否已有皇后
    const diags1 = Array(2 * n - 1).fill(false); // 記錄各主對角線上是否已有皇后
    const diags2 = Array(2 * n - 1).fill(false); // 記錄各副對角線上是否已有皇后
    const res = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// 主程式
const n = 4;
const res = nQueens(n);

console.log(`輸入棋盤的邊長為 ${n}`);
console.log(`皇后共有 ${res.length} 種擺法`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});
