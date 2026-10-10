/**
 * File: subset_sum_i_naive.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* バックトラッキング：部分和 I */
function backtrack(state, target, total, choices, res) {
    // 部分集合の和が target に等しければ、解を記録
    if (total === target) {
        res.push([...state]);
        return;
    }
    // すべての選択肢を走査
    for (let i = 0; i < choices.length; i++) {
        // 枝刈り：部分和が target を超える場合はその選択をスキップする
        if (total + choices[i] > target) {
            continue;
        }
        // 試行：選択を行い、要素と total を更新する
        state.push(choices[i]);
        // 次の選択へ進む
        backtrack(state, target, total + choices[i], choices, res);
        // バックトラック：選択を取り消し、前の状態に戻す
        state.pop();
    }
}

/* 部分和 I を解く（重複部分集合を含む） */
function subsetSumINaive(nums, target) {
    const state = []; // 状態（部分集合）
    const total = 0; // 部分和
    const res = []; // 結果リスト（部分集合のリスト）
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver Code */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`入力配列 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`和が ${target} に等しいすべての部分集合 res = ${JSON.stringify(res)}`);
console.log('注意してください。この方法の出力結果には重複した集合が含まれます');
