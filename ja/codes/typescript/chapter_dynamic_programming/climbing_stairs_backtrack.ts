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
    // 第 n 段に到達したら、方法数を 1 増やす
    if (state === n) res.set(0, res.get(0) + 1);
    // すべての選択肢を走査
    for (const choice of choices) {
        // 枝刈り: 第 n 段を超えないようにする
        if (state + choice > n) continue;
        // 試行: 選択を行い、状態を更新
        backtrack(choices, state + choice, n, res);
        // バックトラック
    }
}

/* 階段登り：バックトラッキング */
function climbingStairsBacktrack(n: number): number {
    const choices = [1, 2]; // 1 段または 2 段上ることを選べる
    const state = 0; // 第 0 段から上り始める
    const res = new Map();
    res.set(0, 0); // res[0] を使って方法数を記録する
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* Driver Code */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`${n} 段の階段を登る方法は ${res} 通り`);

export {};
