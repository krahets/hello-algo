/**
 * File: climbing_stairs_backtrack.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 回溯 */
function backtrack(
    choices: number[],
    state: number,
    n: number,
    res: Map<0, any>
): void {
    // 爬到第 n 階時，將走法數加 1
    if (state === n) res.set(0, res.get(0) + 1);
    // 走訪所有選項
    for (const choice of choices) {
        // 剪枝：不能越過第 n 階
        if (state + choice > n) continue;
        // 嘗試：做出選擇，更新狀態
        backtrack(choices, state + choice, n, res);
        // 撤銷選擇
    }
}

/* 爬樓梯：回溯法 */
function climbingStairsBacktrack(n: number): number {
    const choices = [1, 2]; // 每次可以往上爬 1 階或 2 階
    const state = 0; // 從第 0 階開始爬
    const res = new Map();
    res.set(0, 0); // 用 res[0] 記錄走法數
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* 主程式 */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`爬 ${n} 階樓梯共有 ${res} 種走法`);

export {};
