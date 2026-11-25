/**
 * File: n_queens.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* バックトラッキングによる n クイーン問題 */
function backtrack(row, n, state, res, cols, diags1, diags2) {
    // すべての行に置いたら解を記録する
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // すべての列を調べる
    for (let col = 0; col < n; col++) {
        // このマスを通る主対角線と副対角線を求める
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // 枝刈り：このマスと同じ列、主対角線、副対角線にクイーンがあってはならない
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 試行：このマスにクイーンを置く
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 次の行に置く
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 後戻り：このマスを空きに戻す
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* n クイーン問題を解く */
function nQueens(n) {
    // n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // 各列にクイーンがあるか記録する
    const diags1 = Array(2 * n - 1).fill(false); // 各主対角線にクイーンがあるか記録する
    const diags2 = Array(2 * n - 1).fill(false); // 各副対角線にクイーンがあるか記録する
    const res = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// 実行例
const n = 4;
const res = nQueens(n);

console.log(`盤面の一辺の長さ：${n}`);
console.log(`クイーンの配置は全部で ${res.length} 通り`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});
