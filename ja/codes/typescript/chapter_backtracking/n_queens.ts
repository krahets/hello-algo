/**
 * File: n_queens.ts
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* バックトラッキング：N クイーン */
function backtrack(
    row: number,
    n: number,
    state: string[][],
    res: string[][][],
    cols: boolean[],
    diags1: boolean[],
    diags2: boolean[]
): void {
    // すべての行への配置が完了したら、解を記録する
    if (row === n) {
        res.push(state.map((row) => row.slice()));
        return;
    }
    // すべての列を走査
    for (let col = 0; col < n; col++) {
        // このマスに対応する主対角線と副対角線を計算
        const diag1 = row - col + n - 1;
        const diag2 = row + col;
        // 枝刈り：そのマスの列、主対角線、副対角線にクイーンがあってはならない
        if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
            // 試行：そのマスにクイーンを置く
            state[row][col] = 'Q';
            cols[col] = diags1[diag1] = diags2[diag2] = true;
            // 次の行に配置する
            backtrack(row + 1, n, state, res, cols, diags1, diags2);
            // 戻す：そのマスを空きマスに戻す
            state[row][col] = '#';
            cols[col] = diags1[diag1] = diags2[diag2] = false;
        }
    }
}

/* N クイーンを解く */
function nQueens(n: number): string[][][] {
    // n*n の盤面を初期化する。'Q' はクイーン、'#' は空きマスを表す
    const state = Array.from({ length: n }, () => Array(n).fill('#'));
    const cols = Array(n).fill(false); // 列にクイーンがあるか記録
    const diags1 = Array(2 * n - 1).fill(false); // 主対角線にクイーンがあるかを記録
    const diags2 = Array(2 * n - 1).fill(false); // 副対角線にクイーンがあるかを記録
    const res: string[][][] = [];

    backtrack(0, n, state, res, cols, diags1, diags2);
    return res;
}

// Driver Code
const n = 4;
const res = nQueens(n);

console.log(`入力する盤面の縦横は ${n}`);
console.log(`クイーンの配置方法は全部で ${res.length} 種`);
res.forEach((state) => {
    console.log('--------------------');
    state.forEach((row) => console.log(row));
});

export {};
