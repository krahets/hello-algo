/**
 * File: permutations_ii.js
 * Created Time: 2023-05-13
 * Author: Justin (xiefahit@gmail.com)
 */

/* バックトラッキングによる全順列 II */
function backtrack(state, choices, selected, res) {
    // 状態の長さが要素数に達したら解を記録する
    if (state.length === choices.length) {
        res.push([...state]);
        return;
    }
    // すべての選択肢を調べる
    const duplicated = new Set();
    choices.forEach((choice, i) => {
        // 枝刈り：同じ要素は二度選ばず、この段階で同じ値の要素も繰り返し試さない
        if (!selected[i] && !duplicated.has(choice)) {
            // 試行：選択して状態を更新する
            duplicated.add(choice); // 選んだ要素の値を記録する
            selected[i] = true;
            state.push(choice);
            // 次の選択に進む
            backtrack(state, choices, selected, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            selected[i] = false;
            state.pop();
        }
    });
}

/* 全順列 II */
function permutationsII(nums) {
    const res = [];
    backtrack([], nums, Array(nums.length).fill(false), res);
    return res;
}

// 実行例
const nums = [1, 2, 2];
const res = permutationsII(nums);

console.log(`入力配列 nums = ${JSON.stringify(nums)}`);
console.log(`すべての順列 res = ${JSON.stringify(res)}`);
