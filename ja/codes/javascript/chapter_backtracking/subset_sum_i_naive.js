/**
 * File: subset_sum_i_naive.js
 * Created Time: 2023-07-30
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* バックトラッキングによる部分和問題 I */
function backtrack(state, target, total, choices, res) {
    // 部分集合の要素の和が target に等しくなったら解を記録する
    if (total === target) {
        res.push([...state]);
        return;
    }
    // すべての選択肢を調べる
    for (let i = 0; i < choices.length; i++) {
        // 枝刈り：部分集合の要素の和が target を超えるなら、その選択を飛ばす
        if (total + choices[i] > target) {
            continue;
        }
        // 試行：選択して要素の和 total を更新する
        state.push(choices[i]);
        // 次の選択に進む
        backtrack(state, target, total + choices[i], choices, res);
        // 後戻り：選択を取り消し、元の状態に戻す
        state.pop();
    }
}

/* 部分和問題 I を解く（重複する部分集合を含む） */
function subsetSumINaive(nums, target) {
    const state = []; // 状態（部分集合）
    const total = 0; // 部分和
    const res = []; // 結果のリスト（部分集合のリスト）
    backtrack(state, target, total, nums, res);
    return res;
}

/* 実行例 */
const nums = [3, 4, 5];
const target = 9;
const res = subsetSumINaive(nums, target);
console.log(`入力配列 nums = ${JSON.stringify(nums)}, target = ${target}`);
console.log(`要素の和が ${target} となるすべての部分集合 res = ${JSON.stringify(res)}`);
console.log('この方法の出力には重複する集合が含まれる点に注意');
