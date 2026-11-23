/**
 * File: climbing_stairs_backtrack.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* バックトラッキング */
function backtrack(
    choices: number[],
    state: number,
    n: number,
    res: Map<0, any>
): void {
    // n 段目に到達したら、方法の数を 1 増やす
    if (state === n) res.set(0, res.get(0) + 1);
    // すべての選択肢を走査する
    for (const choice of choices) {
        // 枝刈り：n 段目を越えてはならない
        if (state + choice > n) continue;
        // 試行：選択を行い、状態を更新する
        backtrack(choices, state + choice, n, res);
        // 復元
    }
}

/* 階段の上り方：バックトラッキング */
function climbingStairsBacktrack(n: number): number {
    const choices = [1, 2]; // 1 段または 2 段上ることを選択できる
    const state = 0; // 0 段目から上り始める
    const res = new Map();
    res.set(0, 0); // res[0] に方法の数を記録する
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* 実行用コード */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`${n} 段の階段を上る方法は全部で ${res} 通り`);

export {};
