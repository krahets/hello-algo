/**
 * File: climbing_stairs_backtrack.js
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* バックトラック */
function backtrack(choices, state, n, res) {
    // n 段目に着いたら、登り方の数を 1 増やす
    if (state === n) res.set(0, res.get(0) + 1);
    // すべての選択肢を調べる
    for (const choice of choices) {
        // 枝刈り：n 段目を越えないようにする
        if (state + choice > n) continue;
        // 選択肢を試し、状態を更新する
        backtrack(choices, state + choice, n, res);
        // 選択を取り消す
    }
}

/* 階段の登り方：バックトラック */
function climbingStairsBacktrack(n) {
    const choices = [1, 2]; // 1 段または 2 段登れる
    const state = 0; // 0 段目から登り始める
    const res = new Map();
    res.set(0, 0); // res[0] に登り方の数を記録する
    backtrack(choices, state, n, res);
    return res.get(0);
}

/* 実行例 */
const n = 9;
const res = climbingStairsBacktrack(n);
console.log(`全 ${n} 段の階段の登り方は ${res} 通り`);
